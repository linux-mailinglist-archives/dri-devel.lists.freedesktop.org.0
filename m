Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3D83CEC7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCCA10E468;
	Thu, 25 Jan 2024 21:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B7510E45F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706218920;
 bh=6qkcZYWngfmRTvoOwp5UnpiufJBrssnD1F59vptg1wY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=I5KffNlJy4qUnAehVXlDMpPEWTV7OGsIeSJlAox5l7zB9E2csGaYrZXUiTt9xEjRu
 1wSHngLecv9nUrZZn4lK8E3BaQyzHkupXZ+00Y9dp2nxCDeYOlM2bxcNKNl1v50hKl
 vbw2F9hUDKfA51s87p4ygh9gU02b6CINPP2ILYS9lAYc+gG8dCnqpEFQqSKq9FGiT7
 hH4JAu0etmynZD1NexRS/bBPKzSMpU+qNoYBO5CjfYxTK/XtVlTCwvqwMpd1nCNvFu
 mmmESnUNfoNGGwGFyIrYq2t3Ko4TX+LE7pYVe8mcLAEoMGpy7Lm5aZKCYu5VFr2M4J
 evd9vc0KwWfRA==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C1A037813DA;
 Thu, 25 Jan 2024 21:41:59 +0000 (UTC)
Message-ID: <f5d94271-9b6a-4a8d-9cb7-dac055dda92c@collabora.com>
Date: Fri, 26 Jan 2024 00:41:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 17/30] drm/panfrost: Fix the error path in
 panfrost_mmu_map_fault_addr()
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-18-dmitry.osipenko@collabora.com>
In-Reply-To: <20240105184624.508603-18-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Melissa Wen <mwen@igalia.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, David Airlie <airlied@gmail.com>,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/24 21:46, Dmitry Osipenko wrote:
>  	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> +		/* Can happen if the last fault only partially filled this
> +		 * section of the pages array before failing. In that case
> +		 * we skip already filled pages.
> +		 */
> +		if (pages[i])
> +			continue;
> +
>  		pages[i] = shmem_read_mapping_page(mapping, i);

Although, the shmem_read_mapping_page() should return same page if it
was already allocated, isn't it? I.e. there was no bug here and the
fixes/stable tags not needed.

-- 
Best regards,
Dmitry

