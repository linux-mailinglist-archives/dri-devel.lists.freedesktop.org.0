Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E589584D4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A32E10E70A;
	Tue, 20 Aug 2024 10:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lhHZx2FI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A7F10E711
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:39:48 +0000 (UTC)
Message-ID: <59e832ae-dd0e-4746-ad9c-327b997e992b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724150386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J6AUM5BA0XHMhLLUg9xC6LMZgDMWJLm3dx3v9LVjJE=;
 b=lhHZx2FIP/RCUXZs8p29eG005r9RJMGyeMBgQ8ovBQAz2f8rtIT0wFDvnjR2Flagaf9ZGa
 s29BHqCl/tgoW2VpLdAJfG418mIvnaeszKp4LYCtGHunZrtwlZqsm68QT+G2wpDRaNp9Kx
 Y282my+JYqtSdE0sex8AwzrnZs2qxl8=
Date: Tue, 20 Aug 2024 18:39:29 +0800
MIME-Version: 1.0
Subject: Re: [82/86] drm/i915: Move custom hotplug code into separate callback
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240816125408.310253-83-tzimmermann@suse.de>
 <86a55d3c-930d-4b30-9f05-82dd2966df85@linux.dev>
 <a48a5538-b4a9-4e01-9930-b1538325b9e3@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <a48a5538-b4a9-4e01-9930-b1538325b9e3@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/8/20 15:39, Thomas Zimmermann wrote:
> Hi
>
> Am 19.08.24 um 10:52 schrieb Sui Jingfeng:
>> Hi, Thomas
>>
>>
>> I love your patch, yet ...
>>
>>
>> On 2024/8/16 20:23, Thomas Zimmermann wrote:
>>> i915's fbdev contains additional code for hotplugging a display that
>>> cannot be ported to the common fbdev client. Introduce the callback
>>> struct drm_fb_helper.fb_hotplug and implement it for i915. The fbdev
>>> helpers invoke the callback before handing the hotplug event.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_fb_helper.c            |  6 +++
>>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 43 
>>> ++++++++++++----------
>>>   include/drm/drm_fb_helper.h                | 13 +++++++
>>>   3 files changed, 42 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>>> b/drivers/gpu/drm/drm_fb_helper.c
>>> index d9e539b0fd1a..92926cb02dfb 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -1938,6 +1938,12 @@ int drm_fb_helper_hotplug_event(struct 
>>> drm_fb_helper *fb_helper)
>>>       if (!drm_fbdev_emulation || !fb_helper)
>>>           return 0;
>>>   +    if (fb_helper->funcs->fb_hotplug) {
>>
>> We seems need to check the existence on the 'fb_helper->funcs' here,
>>
>> For example:
>>
>>
>> if (fb_helper->funcs && fb_helper->funcs->fb_hotplug) {
>>
>> Otherwise, it will de-reference NULL pointer.
>> Can be observed on a trivial driver though,
>> with no monitor(display) connected.
>
> Indeed. That needs to be fixed. Thank you for noting.
>

Thanks for you efforts then.


> To give some context:  I was hoping to remove drm_fb_helper_funcs at 
> some point. 


Yeah, too many helper functions may make peoples daze.


> fb_probe is now gone with these patches and fb_dirty can certainly be 
> replaced as well. (I once had prototype patches to do that). 


Well, the grammar of "ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);" looks strange, 
It's lengthy and I observed you have cleaned it up at the last patch. 
Which also eliminates one pair "if and else" clause, the codes looks 
more fluent now.


> This leaves the new callbacks for 915, for which I don't have a good 
> alternative solution. So it seems that drm_fb_helper_funcs will only 
> be used by i915/xe in the long term.
>

Well, since it is a DRM client now, maybe we could try to drop it into struct drm_driver.
Just like the '.fbdev_probe' callback, this may help to achieve a 100% DRM-based console/logger IMO.

Besides, a lot of DRM driver instances has the DMA/2D acceleration hardware, promote it
into drm_driver structure may has the potential to utilize hardware acceleration. Drivers
will more easily to have custom implementation. I'm not 100% sure if it will only be used
by i915 in the future.

Best regards,
Sui

