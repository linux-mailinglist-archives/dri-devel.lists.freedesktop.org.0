Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC5A7A4B8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C610E147;
	Thu,  3 Apr 2025 14:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JV3g9s1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D2310E147
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 14:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743689419; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W4Jl61VITKe2snRKwvixdBP82oOjlVbLaDdhqYDyuFka0qKLRX9KD22vf5pM4iPvZckmdD9udSvj4CCrw3hR/oFBY/sbh49/dHN5NRg6pLWF1qpAdPkFGikCyeAeubUfMHC36TwG15EDmbgUBdq8q2Kjm3rRmRw8T66ONvEDDvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743689419;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lZNR571p4d0dkBSZZRoh4rrvXydvQNaOwh94Ox5SVgo=; 
 b=c5q+lMxj5lwxUqgoFTynziOd3jwmiMfdCjeOcFaep69JLBrot4mJ2UhFEXnVVjMKoGNVXU1McGZ5YrgAUqq2LvncCz9tpSvKDxE84Dze2McG07QuYYy5/PACfpvfrQO4GY4XrmcLZf+/U/3YTwt1OzXYK1WuVEdimVD3y2JTmE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743689419; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lZNR571p4d0dkBSZZRoh4rrvXydvQNaOwh94Ox5SVgo=;
 b=JV3g9s1HTX1JqOopmwty0g5Qv76J1FQefHy8W4pbKyaMHIxflrvKo+6mESt9CPp5
 3eSjPi16RLOCxw5BGNX0QP87q1/gHRbMY2IitIpaLc9ZjlZnH9zVR0S1fbwaycfUQyK
 w23O1diPkG7brPe8dYdjVq434pQj2WOKU/0Ddj6M=
Received: by mx.zohomail.com with SMTPS id 1743689416979885.2257717900272;
 Thu, 3 Apr 2025 07:10:16 -0700 (PDT)
Message-ID: <91ae764f-d82c-4918-9ce9-0ebbc302c03c@collabora.com>
Date: Thu, 3 Apr 2025 17:10:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, chaitanya.kumar.borah@intel.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <yt2vhw5pkhivn27johxyskpmcobika6ze3undthzdxfcy6yaac@t5u72u4auisi>
 <4a32a492-0ff7-49fc-b208-0ae8b4d2369d@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <4a32a492-0ff7-49fc-b208-0ae8b4d2369d@suse.de>
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

On 4/3/25 10:03, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.04.25 um 02:37 schrieb Lucas De Marchi:
>> On Sun, Mar 23, 2025 at 12:25:58AM +0300, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> This a continuation of a year-old series that adds generic DRM-shmem
>>> shrinker [1]. The old series became too big with too many patches, more
>>> reasonable to split it up into multiple smaller patchsets. Here is
>>> the firtst part that makes preparatory DRM changes.
>>>
>>> [1] https://lore.kernel.org/dri-devel/20240105184624.508603-1-
>>> dmitry.osipenko@collabora.com/
>>
>> After these patches got merged I started seeing this on ast driver
>> and a similar one qemu-cirrus:
> 
> Same here with simpledrm. I wanted to bisect today.

I've reproduced using bochs drv, it's the last patch "drm/shmem-helper:
Use refcount_t for vmap_use_count" causing the issue. Thanks for the report!

This change fixes it, let me send a proper patch:

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 2d924d547a51..554f1d4c1a76 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -416,10 +416,10 @@ void drm_gem_shmem_vunmap_locked(struct
drm_gem_shmem_object *shmem,
                if (refcount_dec_and_test(&shmem->vmap_use_count)) {
                        vunmap(shmem->vaddr);
                        drm_gem_shmem_unpin_locked(shmem);
+
+                       shmem->vaddr = NULL;
                }
        }
-
-       shmem->vaddr = NULL;
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);

-- 
Best regards,
Dmitry
