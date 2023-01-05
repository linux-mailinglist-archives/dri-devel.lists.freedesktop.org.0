Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CB65F3B1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC18A10E1B9;
	Thu,  5 Jan 2023 18:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A951710E1B9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qIqF4zMMRNygEifE7Rgs21FYVPybUlbvI1duKKY2SeU=; b=CH64ny/weCFB5YAjhEGHzimFai
 tKQ+cOGleHCUA6j7tmCQmCz8woeFU+S8KPu4OpCFDK8QV7RVEsALp7Ko+UmZIlLYTACW8MGTmGwhg
 I19cblR71kGoR/M33z5T05LJ9OvGC4Y6P3nM4IjTn/ASHrvEm4VtG0r5ZAD2CCaeOmmlMai785Tn9
 fboPotrVQxOpYx3cusAzUTV/E4MpHlV8ND7BLA5BZvOujjrm3/PMQCy3FKfmuBFJ/CTd8J8dTQQFY
 bgBSzwJ8SIdtqemruDvolZdUojGdJC2OnPB5jbzBbO7/vHPL8BWPwrYsDY/9GdH3zxfRavi11tY+y
 uG9xaMig==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDV0n-000HxP-23; Thu, 05 Jan 2023 19:30:45 +0100
Message-ID: <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
Date: Thu, 5 Jan 2023 15:30:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/gem: Check for valid formats
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 15:22, Daniel Vetter wrote:
> On Thu, 5 Jan 2023 at 18:48, Maíra Canal <mcanal@igalia.com> wrote:
>>
>> On 1/5/23 12:26, Daniel Vetter wrote:
>>> On Tue, Jan 03, 2023 at 09:53:23AM -0300, Maíra Canal wrote:
>>>> Currently, drm_gem_fb_create() doesn't check if the pixel format is
>>>> supported, which can lead to the acceptance of invalid pixel formats
>>>> e.g. the acceptance of invalid modifiers. Therefore, add a check for
>>>> valid formats on drm_gem_fb_create().
>>>>
>>>> Moreover, note that this check is only valid for atomic drivers,
>>>> because, for non-atomic drivers, checking drm_any_plane_has_format() is
>>>> not possible since the format list for the primary plane is fake, and
>>>> we'd therefor reject valid formats.
>>>>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> I think to really make sure we have consensus it'd be good to extend this
>>> to a series which removes all the callers to drm_any_plane_has_format()
>>> from the various drivers, and then unexports that helper. That way your
>>> series here will have more eyes on it :-)
>>
>> I took a look at the callers to drm_any_plane_has_format() and there are only
>> 3 callers (amdgpu, i915 and vmwgfx). They all use drm_any_plane_has_format()
>> before calling drm_framebuffer_init(). So, I'm not sure I could remove
>> drm_any_plane_has_format() from those drivers. Maybe adding this same check
>> to drm_gem_fb_init() and refactor the drivers to make them use drm_gem_fb_init(),
>> but I guess this would be part of a different series.
> 
> Well vmwgfx still not yet using gem afaik, so that doesn't work.
> 
> But why can't we move the modifier check int drm_framebuffer_init()?
> That's kinda where it probably should be anyway, there's nothing gem
> bo specific in the code you're adding.

I'm not sure if this would correct the problem that I was trying to fix initially.
I was trying to make sure that the drivers pass on the
igt@kms_addfb_basic@addfb25-bad-modifier IGT test by making sure that the addfb
ioctl returns the error.

By moving the modifier check to the drm_framebuffer_init(), the test would still
fail.

Best Regards,
- Maíra Canal

> -Daniel
