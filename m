Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FA3ED0B0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 10:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8B988810;
	Mon, 16 Aug 2021 08:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF18B88810
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 08:56:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276851627"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="276851627"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 01:56:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="519483621"
Received: from ifridman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.210.77])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 01:56:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jackie Liu <liu.yun@linux.dev>, daniel@ffwll.ch, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, liuyun01@kylinos.cn
Subject: Re: [PATCH] drm/fb: Fix randconfig builds
In-Reply-To: <87eeatkbuv.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210816064835.332785-1-liu.yun@linux.dev>
 <87y291kh4c.fsf@intel.com> <9dd92929-24e9-e9e4-b78a-31da3c3ed77d@linux.dev>
 <87mtphkcv5.fsf@intel.com> <6fd6b18a-332b-a573-ecd2-51b6a5dd042f@linux.dev>
 <87eeatkbuv.fsf@intel.com>
Date: Mon, 16 Aug 2021 11:56:34 +0300
Message-ID: <87bl5xkbst.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 16 Aug 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>> Hi Jani.
>>
>> Your suggestion is that?
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 7ff89690a976..ba179a539497 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -77,6 +77,7 @@ config DRM_DEBUG_SELFTEST
>>   config DRM_KMS_HELPER
>>          tristate
>>          depends on DRM
>> +       depends on FB if DRM_FBDEV_EMULATION
>>          help
>>            CRTC helpers for KMS drivers.
>>
>>
>> But it has a syntax error.
>
> Ah, try this then:
>
> 	depends on FB || FB=3Dn

Or this monster:

	depends on FB || DRM_FBDEV_EMULATION=3Dn


>
>>
>> --
>> Thanks, BR, Jackie Liu
>>
>> =E5=9C=A8 2021/8/16 =E4=B8=8B=E5=8D=884:33, Jani Nikula =E5=86=99=E9=81=
=93:
>>> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>>>> Hi Jani.
>>>>
>>>> My CI report an randconfigs build failed. there are:
>>>>
>>>> drm_fb_helper.c:(.text+0x302): undefined reference to `fb_set_suspend'
>>>> drm_fb_helper.c:(.text+0xaea): undefined reference to `register_frameb=
uffer'
>>>> drm_fb_helper.c:(.text+0x1dcc): undefined reference to `framebuffer_al=
loc'
>>>> ld: drm_fb_helper.c:(.text+0x1dea): undefined reference to `fb_alloc_c=
map'
>>>> ld: drm_fb_helper.c:(.text+0x1e2f): undefined reference to `fb_dealloc=
_cmap'
>>>> ld: drm_fb_helper.c:(.text+0x1e5b): undefined reference to
>>>> `framebuffer_release'
>>>> drm_fb_helper.c:(.text+0x1e85): undefined reference to
>>>> `unregister_framebuffer'
>>>> drm_fb_helper.c:(.text+0x1ee9): undefined reference to `fb_dealloc_cma=
p'
>>>> ld: drm_fb_helper.c:(.text+0x1ef0): undefined reference to
>>>> `framebuffer_release'
>>>> drm_fb_helper.c:(.text+0x1f96): undefined reference to
>>>> `fb_deferred_io_cleanup'
>>>> drm_fb_helper.c:(.text+0x203b): undefined reference to `fb_sys_read'
>>>> drm_fb_helper.c:(.text+0x2051): undefined reference to `fb_sys_write'
>>>> drm_fb_helper.c:(.text+0x208d): undefined reference to `sys_fillrect'
>>>> drm_fb_helper.c:(.text+0x20bb): undefined reference to `sys_copyarea'
>>>> drm_fb_helper.c:(.text+0x20e9): undefined reference to `sys_imageblit'
>>>> drm_fb_helper.c:(.text+0x2117): undefined reference to `cfb_fillrect'
>>>> drm_fb_helper.c:(.text+0x2172): undefined reference to `cfb_copyarea'
>>>> drm_fb_helper.c:(.text+0x21cd): undefined reference to `cfb_imageblit'
>>>> drm_fb_helper.c:(.text+0x2233): undefined reference to `fb_set_suspend'
>>>> drm_fb_helper.c:(.text+0x22b0): undefined reference to `fb_set_suspend'
>>>> drm_fb_helper.c:(.text+0x250f): undefined reference to `fb_deferred_io=
_init'
>>>>
>>>> The main reason is because DRM_FBDEV_EMULATION is built-in, and
>>>> CONFIG_FB is compiled as a module.
>>>=20
>>> DRM_FBDEV_EMULATION is not a module, it's just a config
>>> knob. drm_fb_helper.ko is the module, enabled via DRM_KMS_HELPER, and it
>>> has an implicit dependency on FB, and DRM_FBDEV_EMULATION selects
>>> DRM_KMS_HELPER. Select just breaks dependencies in all kinds of ways.
>>>=20
>>> This might help in config DRM_KMS_HELPER, and it might help the reader
>>> because it's factual:
>>>=20
>>> 	depends on FB if DRM_FBDEV_EMULATION
>>>=20
>>>=20
>>> BR,
>>> Jani.
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>>>
>>>> --
>>>> Jackie Liu
>>>>
>>>> =E5=9C=A8 2021/8/16 =E4=B8=8B=E5=8D=883:01, Jani Nikula =E5=86=99=E9=
=81=93:
>>>>> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>>>>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>>>>
>>>>>> When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m,=
 the
>>>>>> compilation will fail. we need make that dependency explicit.
>>>>>
>>>>> What's the failure mode? Using select here is a bad idea.
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>>
>>>>>> Reported-by: k2ci <kernel-bot@kylinos.cn>
>>>>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>>>>> ---
>>>>>>    drivers/gpu/drm/Kconfig | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>>> index 7ff89690a976..346a518b5119 100644
>>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>>> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>>>>>    config DRM_FBDEV_EMULATION
>>>>>>    	bool "Enable legacy fbdev support for your modesetting driver"
>>>>>>    	depends on DRM
>>>>>> -	depends on FB
>>>>>> +	select FB
>>>>>>    	select DRM_KMS_HELPER
>>>>>>    	select FB_CFB_FILLRECT
>>>>>>    	select FB_CFB_COPYAREA
>>>>>
>>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
