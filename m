Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B783D587
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 10:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E310F2F7;
	Fri, 26 Jan 2024 09:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (unknown [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8CE10F2F7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706260083;
 bh=A4Bu9DBeMohqV6ojHawhAsegNEGOWtq+rjrBZb62rOc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XFtnuKH/yy0vN6U0GKaSbQxuJRJwi85TPpZapfqm0zNj09H+H4pLbdif9YOjKAnbT
 CgizO/+3tdmOPxrRavCPLOlJCFuGYEYYdptJv8nPKIFrr3z0z7v+89JZT9IHRdi8Aq
 EmUYTkVdUZB2KLS79O3RoZYS1SGtwUPbL/pUH78Oi8TFkqRnybZAUw1HWvhIIh4Ek0
 24FuFvw6t9ZVSpLk45qkCVubxoy/KPHvtndztHwN3YawPuWFt9dIJ9H/lfrE4nsNHH
 K0c5aH13HPg7sBHJYyPExioM128Qnu694FvZmbY3aH2oKWH27f++Im5eIIz55bie+7
 2D8kWg8FKzGxA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25188378107C;
 Fri, 26 Jan 2024 09:08:02 +0000 (UTC)
Message-ID: <cda2af2e-15d5-4e60-af5c-dcb5f4e87f14@collabora.com>
Date: Fri, 26 Jan 2024 10:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 17/30] drm/panfrost: Fix the error path in
 panfrost_mmu_map_fault_addr()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-18-dmitry.osipenko@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240105184624.508603-18-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 05/01/24 19:46, Dmitry Osipenko ha scritto:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> If some the pages or sgt allocation failed, we shouldn't release the
> pages ref we got earlier, otherwise we will end up with unbalanced
> get/put_pages() calls. We should instead leave everything in place
> and let the BO release function deal with extra cleanup when the object
> is destroyed, or let the fault handler try again next time it's called.
> 
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


