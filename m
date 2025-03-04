Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE772A4DB98
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28210E467;
	Tue,  4 Mar 2025 10:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="AE6MV5R4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59510E467
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741085958; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JgfciHxqZYyFSSfuhuv5vjVyq//D99mHx5wTVSy9RmDJQHUdgiW35c7twCWqZwXHJg5n6De5YA97iavK7rHFe4ZhbZrbqOVRu/MIFqxTAl3i8Ek8/V8XpRONF2QR1vml1jp/0laKIYlgLGG3QbMSkM3f3s5kXuhHBZoeS38vm3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741085958;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Dbsr2DzMdYZQ4tGo8UWZqeyiKrIzRaj9gxDPB5xSI+M=; 
 b=ctwWrTWsqBfu/EzXaZS6O/bRL5u2s6IExQLG1qbNHnvSx8k8iZ9bK0sE/9ULBOFKRSJTUDAon6fCTw/HUDAvSeHwoTkpAt7BNLXRQiubBqCUxdcGNrLUVG7DuzWQ8fUweLmWJVQDDXKwcBylXbhxF5UqpwIeqAY79vC5LK9HvtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741085958; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Dbsr2DzMdYZQ4tGo8UWZqeyiKrIzRaj9gxDPB5xSI+M=;
 b=AE6MV5R4+ndvbYnirTlQbXoIphSwJhAjOCrPYHODCALnoq6TCaJFUpwnUQgu8B7B
 GoVR7tT2Yh2PDT2PxyUJotLWTUnWda1TM2n6wQzgI2GQAy8Ml7LBrxMm159NK0pzL7j
 Xn8UXuv45TdXfxx1lLGgOpgsOVxmEW8NByqxB3NI=
Received: by mx.zohomail.com with SMTPS id 174108595555814.859596015899456;
 Tue, 4 Mar 2025 02:59:15 -0800 (PST)
Message-ID: <6b7d95b7-a9dd-43c9-b1db-8a636b85ad51@collabora.com>
Date: Tue, 4 Mar 2025 13:59:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <d1f856c7-47dd-4f1d-a124-973064dcd1f0@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <d1f856c7-47dd-4f1d-a124-973064dcd1f0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/4/25 13:29, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.01.24 um 19:46 schrieb Dmitry Osipenko:
>> Introduce common drm-shmem shrinker for DRM drivers.
> 
> What's the status of this patch?

It was de-prioritized on my list a year ago as I had to move to a higher
priority problems. Rebasing and re-testing these patches takes much
time, it either has to be split up in a smaller parts or applied in one go.

The current status is that I started to work on v20 rather long time ago
and the patches need to be rebased and re-tested again. Heard that
Panthor driver may want shmem shrinker more than others today.

-- 
Best regards,
Dmitry
