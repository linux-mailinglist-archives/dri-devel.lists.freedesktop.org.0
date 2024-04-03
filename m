Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CF8969DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776A01128FD;
	Wed,  3 Apr 2024 09:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="j0t9FMP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F191128F7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:01:12 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4V8dyV45Zdz9sqC;
 Wed,  3 Apr 2024 11:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1712134866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sok+9GKGZbvSag8owbKV25XMZuOKTvT/QdEZ1W0IYM=;
 b=j0t9FMP0BeoBXYRs7mS8RXDrj9ygb7LpWCrWqeGYcsTvBL7ZawSdz0Lpk8hwb48Uspqo5T
 y392sgI/Ft5HVXlghjmR1gGnhYJIIi18P5LcMc+g5jGc9eXn68oWj6i1s3TsxtZGAeijKA
 9AUp5JWnAQREnpUpatIO6PrgFG0bjIXIoheQzjh33ldHVWtFM3Akpu5Mff6iX7yfD9Jolz
 plr9G/WhyxHPPFJ6vqZ+3Adt9u8BMISfop2kzpMfSg4z0FMymJ9ko2FTBDl02xXu9DLBaf
 qzVBbjBHypllgU8x2nh6LZLmmtGYZ1oXdK3iJCcTKMLB1aJQKjKkbspyE2umzQ==
Message-ID: <715a00e7-f266-4af5-b7e2-b9a1d4275078@mailbox.org>
Date: Wed, 3 Apr 2024 11:01:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
 <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
 <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
 <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
 <38790fd5-afd3-4b56-ad14-7bd5897f6f9a@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <38790fd5-afd3-4b56-ad14-7bd5897f6f9a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b0786d524127bba030a
X-MBO-RS-META: tzfz8b57gbajjy33x7uk8p3ygjqtrbte
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

On 2024-04-02 10:17, Christian König wrote:
> Am 26.03.24 um 15:53 schrieb Alex Deucher:
>> On Tue, Mar 26, 2024 at 10:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Tue, Mar 26, 2024 at 9:59 AM Paneer Selvam, Arunpravin
>>>>>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>>           if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>>>                   vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>>>>>
>>>>>> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>>>>>> +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>>>> Is there any reason to not always do this?
>>>> Here we are trying to keep a pool of cleared memory which are cleared on
>>>> free path and that can given
>>>> to the application which requires a zeroed memory. I think here if we
>>>> set always clear the memory,
>>>> we would go over the limit of cleared memory in that particular instance
>>>> and the application should wait until
>>>> the hardware clears the memory and this might impact the overall
>>>> performance.
>>> I'd like to have the driver always deliver cleared memory.
>> Actually, I think we can just always set the flag in the allocation IOCTLs.
> 
> We have use cases where that hurts as. Especially during boot when the backing VRAM isn't cleared yet.
> 
> That's one of the reasons why we never always cleared the memory.

Any such performance gain was only valid in the first place if the kernel delivering non-cleared memory to user space was considered acceptable, which it quite clearly isn't.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

