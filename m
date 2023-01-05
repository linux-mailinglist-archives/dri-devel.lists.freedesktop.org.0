Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5165F408
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1646E10E494;
	Thu,  5 Jan 2023 19:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4210E494
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9c80eksIaXbSn5wbI7wec66FVcW2JMV0FYKRNTKkGIA=; b=cup7VvEs5f23Rhzq3PuwMdyI+D
 doBIsg0W9srO15cG2Wyrrnu5nfX0J1Wyvf5GCIqbuGa/eQOHV/FGVkLnPrdiVfcDQUiRmGGLzUzCB
 wgUKrSBNAGej/WdQ5y6LGnJIn+cThnT8EmWURVMbj/SAsv0JiAxXsADIlODIev+iqWMwHEAZwixPP
 8oLfvdkoSgHksWtEC//GPTBXmwZjtEKKlZoIhP+lL3dKsSXVQZHA9XXPv05NavhdPgbdLt6Pj8VDM
 b/hbVFHM9M96goYOgLKFycoLBAAcroN4vVfnLqjBBetv6h9Exa0t25ZQ4AfQLVNYOVBVd2n8QXb+p
 x244KW9w==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDVTj-000JB0-RP; Thu, 05 Jan 2023 20:00:40 +0100
Message-ID: <a958c1c9-680e-a85d-d373-57c7546c7fbe@igalia.com>
Date: Thu, 5 Jan 2023 16:00:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/gem: Check for valid formats
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
 <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
 <UBhD-Gmig3Df3ErqWGXZZ1hWkfdkPBywcckHxoKwwoc3N33Uf8rQumRw-nlsyrk9r8-KINUU8Evudytuu3lLcFnNZijSV3LbA0K8UVagpHc=@emersion.fr>
 <ccc74a8e-a7f9-7eb1-22b6-9bce60bdcdc7@igalia.com>
 <ukOECyKlhRh1kJyKRS31jhyXsjawb6urSVNYuLkOjRC15BbVEif1wANfPtHAjzLAirubEc8oGt56k6GsUjSSQYeDSbwq2uwYBFsvAAFMwXQ=@emersion.fr>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <ukOECyKlhRh1kJyKRS31jhyXsjawb6urSVNYuLkOjRC15BbVEif1wANfPtHAjzLAirubEc8oGt56k6GsUjSSQYeDSbwq2uwYBFsvAAFMwXQ=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/23 15:54, Simon Ser wrote:
> On Thursday, January 5th, 2023 at 19:48, Maíra Canal <mcanal@igalia.com> wrote:
> 
>> On 1/5/23 15:36, Simon Ser wrote:
>>
>>> On Thursday, January 5th, 2023 at 19:30, Maíra Canal mcanal@igalia.com wrote:
>>>
>>>>>>> I think to really make sure we have consensus it'd be good to extend this
>>>>>>> to a series which removes all the callers to drm_any_plane_has_format()
>>>>>>> from the various drivers, and then unexports that helper. That way your
>>>>>>> series here will have more eyes on it :-)
>>>>>>
>>>>>> I took a look at the callers to drm_any_plane_has_format() and there are only
>>>>>> 3 callers (amdgpu, i915 and vmwgfx). They all use drm_any_plane_has_format()
>>>>>> before calling drm_framebuffer_init(). So, I'm not sure I could remove
>>>>>> drm_any_plane_has_format() from those drivers. Maybe adding this same check
>>>>>> to drm_gem_fb_init() and refactor the drivers to make them use drm_gem_fb_init(),
>>>>>> but I guess this would be part of a different series.
>>>>>
>>>>> Well vmwgfx still not yet using gem afaik, so that doesn't work.
>>>>>
>>>>> But why can't we move the modifier check int drm_framebuffer_init()?
>>>>> That's kinda where it probably should be anyway, there's nothing gem
>>>>> bo specific in the code you're adding.
>>>>
>>>> I'm not sure if this would correct the problem that I was trying to fix initially.
>>>> I was trying to make sure that the drivers pass on the
>>>> igt@kms_addfb_basic@addfb25-bad-modifier IGT test by making sure that the addfb
>>>> ioctl returns the error.
>>>>
>>>> By moving the modifier check to the drm_framebuffer_init(), the test would still
>>>> fail.
>>>
>>> Hm, why is that? The ADDFB2 IOCTL impl calls drm_framebuffer_init().
>>
>>
>>  From what I can see, ADDFB2 IOCTL calls drm_internal_framebuffer_create() [1],
>> then drm_internal_framebuffer_create() calls the fb_create hook [2]. I'm not sure
>> here ADDFB2 implicitly calls drm_framebuffer_init(), but I'm probably missing
>> something.
> 
> Right, but then all drivers will call drm_framebuffer_init() somewhere
> in their fb_create hook. For instance amdgpu calls it in
> amdgpu_display_gem_fb_verify_and_init().

I see. Thanks for explaining me the relation between the functions. I will send a v3
of this patch, introducing the check on drm_framebuffer_init().

Best Regards,
- Maíra Canal
