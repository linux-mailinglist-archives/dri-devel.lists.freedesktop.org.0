Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252933ED085
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486CF89C55;
	Mon, 16 Aug 2021 08:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A7D89C55
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 08:49:00 +0000 (UTC)
Subject: Re: [PATCH] drm/fb: Fix randconfig builds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1629103738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbdQWzfYvLNzrZ33mixUpKGb+ecTdn9kJiVbVoTnASA=;
 b=inu1Q8cnrHSFLRjcfSYSwGlUcUEFmd1/G8D5VDwEunqVBPML4TYS9puNbS/I61EB+HHAW7
 GRdhfOsl78O9fllmNaw8057yeNuL3c5ACkaFBEqKc/1B0ZbiiBh455obkEVqr49N6aKQK/
 NuQvwaQe8sFaMsfF0XJbiDug8QfaZn0=
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, liuyun01@kylinos.cn
References: <20210816064835.332785-1-liu.yun@linux.dev>
 <87y291kh4c.fsf@intel.com> <9dd92929-24e9-e9e4-b78a-31da3c3ed77d@linux.dev>
 <87mtphkcv5.fsf@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <6fd6b18a-332b-a573-ecd2-51b6a5dd042f@linux.dev>
Date: Mon, 16 Aug 2021 16:48:51 +0800
MIME-Version: 1.0
In-Reply-To: <87mtphkcv5.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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

Hi Jani.

Your suggestion is that?

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..ba179a539497 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -77,6 +77,7 @@ config DRM_DEBUG_SELFTEST
  config DRM_KMS_HELPER
         tristate
         depends on DRM
+       depends on FB if DRM_FBDEV_EMULATION
         help
           CRTC helpers for KMS drivers.


But it has a syntax error.

--
Thanks, BR, Jackie Liu

在 2021/8/16 下午4:33, Jani Nikula 写道:
> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>> Hi Jani.
>>
>> My CI report an randconfigs build failed. there are:
>>
>> drm_fb_helper.c:(.text+0x302): undefined reference to `fb_set_suspend'
>> drm_fb_helper.c:(.text+0xaea): undefined reference to `register_framebuffer'
>> drm_fb_helper.c:(.text+0x1dcc): undefined reference to `framebuffer_alloc'
>> ld: drm_fb_helper.c:(.text+0x1dea): undefined reference to `fb_alloc_cmap'
>> ld: drm_fb_helper.c:(.text+0x1e2f): undefined reference to `fb_dealloc_cmap'
>> ld: drm_fb_helper.c:(.text+0x1e5b): undefined reference to
>> `framebuffer_release'
>> drm_fb_helper.c:(.text+0x1e85): undefined reference to
>> `unregister_framebuffer'
>> drm_fb_helper.c:(.text+0x1ee9): undefined reference to `fb_dealloc_cmap'
>> ld: drm_fb_helper.c:(.text+0x1ef0): undefined reference to
>> `framebuffer_release'
>> drm_fb_helper.c:(.text+0x1f96): undefined reference to
>> `fb_deferred_io_cleanup'
>> drm_fb_helper.c:(.text+0x203b): undefined reference to `fb_sys_read'
>> drm_fb_helper.c:(.text+0x2051): undefined reference to `fb_sys_write'
>> drm_fb_helper.c:(.text+0x208d): undefined reference to `sys_fillrect'
>> drm_fb_helper.c:(.text+0x20bb): undefined reference to `sys_copyarea'
>> drm_fb_helper.c:(.text+0x20e9): undefined reference to `sys_imageblit'
>> drm_fb_helper.c:(.text+0x2117): undefined reference to `cfb_fillrect'
>> drm_fb_helper.c:(.text+0x2172): undefined reference to `cfb_copyarea'
>> drm_fb_helper.c:(.text+0x21cd): undefined reference to `cfb_imageblit'
>> drm_fb_helper.c:(.text+0x2233): undefined reference to `fb_set_suspend'
>> drm_fb_helper.c:(.text+0x22b0): undefined reference to `fb_set_suspend'
>> drm_fb_helper.c:(.text+0x250f): undefined reference to `fb_deferred_io_init'
>>
>> The main reason is because DRM_FBDEV_EMULATION is built-in, and
>> CONFIG_FB is compiled as a module.
> 
> DRM_FBDEV_EMULATION is not a module, it's just a config
> knob. drm_fb_helper.ko is the module, enabled via DRM_KMS_HELPER, and it
> has an implicit dependency on FB, and DRM_FBDEV_EMULATION selects
> DRM_KMS_HELPER. Select just breaks dependencies in all kinds of ways.
> 
> This might help in config DRM_KMS_HELPER, and it might help the reader
> because it's factual:
> 
> 	depends on FB if DRM_FBDEV_EMULATION
> 
> 
> BR,
> Jani.
> 
> 
> 
> 
> 
>>
>> --
>> Jackie Liu
>>
>> 在 2021/8/16 下午3:01, Jani Nikula 写道:
>>> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>>
>>>> When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m, the
>>>> compilation will fail. we need make that dependency explicit.
>>>
>>> What's the failure mode? Using select here is a bad idea.
>>>
>>> BR,
>>> Jani.
>>>
>>>>
>>>> Reported-by: k2ci <kernel-bot@kylinos.cn>
>>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>>> ---
>>>>    drivers/gpu/drm/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 7ff89690a976..346a518b5119 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>>>    config DRM_FBDEV_EMULATION
>>>>    	bool "Enable legacy fbdev support for your modesetting driver"
>>>>    	depends on DRM
>>>> -	depends on FB
>>>> +	select FB
>>>>    	select DRM_KMS_HELPER
>>>>    	select FB_CFB_FILLRECT
>>>>    	select FB_CFB_COPYAREA
>>>
> 
