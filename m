Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D9840166
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2A1127B9;
	Mon, 29 Jan 2024 09:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC6D1127B9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706520330;
 bh=ZeASRK9OQU0zk9iDytgg8kPkaNP8KWri+NPgrypJ/KY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3dWWHEruMWT62ux6ztq3I+1FA3TnZsmeUjbKb2HiRI0njatR9x1yAbwn/KxQWFt7k
 /AeGxYmbZrVqoJiIe1vjWJsqLE/JlGMVOFYf/OSHvPss28vYYzXZnZolLhO9FvOcMB
 KBXvUakaOBVZrsKRDNOwnEdLuparFW0i/sY/VunFzjieWBUS2yYeCo+uJRDH+wDi1l
 FiK5M/UfeAPPF9xxbZSbdLfzq8Lh8PcePRQzUA52HHrpyxOGlmj/0eB09+0IDod8tl
 bY0hZJ11+DMmefPVR1vuuh/iBfz6iFtvkUrGDUx2u8gdJBrYl+e8dK9zK2upo24F+P
 yUJ5U4Oll2QOA==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C647F37814B0;
 Mon, 29 Jan 2024 09:25:28 +0000 (UTC)
Message-ID: <e062b0dc-6630-42f9-b3ca-ac4bc0597190@collabora.com>
Date: Mon, 29 Jan 2024 12:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <20240129100112.35c73f18@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240129100112.35c73f18@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/24 12:01, Boris Brezillon wrote:
> On Fri,  5 Jan 2024 21:46:16 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> +/**
>> + * drm_gem_shmem_swapin_locked() - Moves shmem GEM back to memory and enables
>> + *                                 hardware access to the memory.
>> + * @shmem: shmem GEM object
>> + *
>> + * This function moves shmem GEM back to memory if it was previously evicted
>> + * by the memory shrinker. The GEM is ready to use on success.
>> + *
>> + * Returns:
>> + * 0 on success or a negative error code on failure.
>> + */
>> +int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem)
>> +{
>> +	int err;
>> +
>> +	dma_resv_assert_held(shmem->base.resv);
>> +
>> +	if (!shmem->evicted)
>> +		return 0;
> 
> Shouldn't we have a drm_gem_shmem_shrinker_update_lru_locked() even if
> the object wasn't evicted, such that idle->busy transition moves the BO
> to the list tail?

Seems so, good catch. I'll double-check and remove it in the next version.

-- 
Best regards,
Dmitry

