Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E483C19E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 13:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DCB10E9D6;
	Thu, 25 Jan 2024 12:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B8610F551
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706184288;
 bh=8sTLlfRLG1bLpm/xwyAPsioSxNa/NVfF9kum8TH3Cnk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dSTgrFVZ9Mgn6xrnSplLE02RSuySI6ta/n6N5lSsDjUqu8PCR05/4WwDn+SSX54PR
 ZJgpm5bqzcKILySJzL62P7ZSqdsqvvifoqfRTdV3cUWNLuGvmYwnE1EAzy7yZiI8DM
 P7uJrhzg7fE2E/TqqrvleB4TY2Dz/8TWYPBEsqnmWvfsWAO/3utjsWpcBR3absxtp1
 bEJmcRs8tKkYfGmdjm/OQtplxKA8pmSpfcf0g4KuzZW3cMmoP5Q00Vq0GuG73vzYwV
 pSHir30+r5Pzo1xFslRlF/4dwsL1SjaUOmkSd5pOutZiWPIOw8qPeCxyf9Pn9maKki
 OpAB+HS6B7Kvw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F26E637820AF;
 Thu, 25 Jan 2024 12:04:44 +0000 (UTC)
Message-ID: <1cf2b45f-d41b-4b2c-80c8-0b78203f4467@collabora.com>
Date: Thu, 25 Jan 2024 15:04:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 30/30] drm/panfrost: Switch to generic memory shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-31-dmitry.osipenko@collabora.com>
 <20240125104932.478fa5bd@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240125104932.478fa5bd@collabora.com>
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

On 1/25/24 12:49, Boris Brezillon wrote:
> On Fri,  5 Jan 2024 21:46:24 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -328,6 +328,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>>  	struct sg_table *sgt;
>>  	int prot = IOMMU_READ | IOMMU_WRITE;
>> +	int ret = 0;
>>  
>>  	if (WARN_ON(mapping->active))
>>  		return 0;
>> @@ -335,15 +336,32 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>>  	if (bo->noexec)
>>  		prot |= IOMMU_NOEXEC;
>>  
>> +	if (!obj->import_attach) {
>> +		/*
>> +		 * Don't allow shrinker to move pages while pages are mapped.
>> +		 * It's fine to move pages afterwards because shrinker will
>> +		 * take care of unmapping pages during eviction.
>> +		 */
> 
> That's not exactly what this shmem_pin() is about, is it? I think it's
> here to meet the drm_gem_shmem_get_pages_sgt() rule stating that pages
> must be pinned while the sgt returned by drm_gem_shmem_get_pages_sgt()
> is manipulated. You actually unpin the GEM just after the mmu_map_sg()
> call, which means pages could very well be reclaimed while the MMU
> still has a mapping referencing those physical pages. And that's fine,
> because what's supposed to protect against that is the fence we
> register to the GEM resv at job submission time.

The comment indeed needs to be improved, thanks.

s/are mapped/in process of mapping creation/

-- 
Best regards,
Dmitry

