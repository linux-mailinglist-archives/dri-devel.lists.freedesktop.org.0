Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1003ED061
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 10:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5D289C93;
	Mon, 16 Aug 2021 08:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F7289C93
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 08:35:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276848593"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="276848593"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 01:35:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="519478502"
Received: from ifridman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.210.77])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 01:35:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jackie Liu <liu.yun@linux.dev>, daniel@ffwll.ch, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, liuyun01@kylinos.cn
Subject: Re: [PATCH] drm/fb: Fix randconfig builds
In-Reply-To: <bd79d67c-137d-6c24-f192-c6fc33218228@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210816064835.332785-1-liu.yun@linux.dev>
 <87y291kh4c.fsf@intel.com> <bd79d67c-137d-6c24-f192-c6fc33218228@linux.dev>
Date: Mon, 16 Aug 2021 11:35:09 +0300
Message-ID: <87k0klkcsi.fsf@intel.com>
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

On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
> After commit f611b1e7624c, we change select FB
> to depends on FB.

And obviously you should cite the commit in the original patch and Cc
the author!

BR,
Jani.

>
> How about this=EF=BC=9A
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7ff89690a976..cd129d96e649 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>   config DRM_FBDEV_EMULATION
>          bool "Enable legacy fbdev support for your modesetting driver"
>          depends on DRM
> -       depends on FB
> +       depends on FB && FB !=3D m
>          select DRM_KMS_HELPER
>          select FB_CFB_FILLRECT
>          select FB_CFB_COPYAREA
>
> --
> Jackie Liu
>
> =E5=9C=A8 2021/8/16 =E4=B8=8B=E5=8D=883:01, Jani Nikula =E5=86=99=E9=81=
=93:
>> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>
>>> When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m, the
>>> compilation will fail. we need make that dependency explicit.
>>=20
>> What's the failure mode? Using select here is a bad idea.
>>=20
>> BR,
>> Jani.
>>=20
>>>
>>> Reported-by: k2ci <kernel-bot@kylinos.cn>
>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 7ff89690a976..346a518b5119 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>>   config DRM_FBDEV_EMULATION
>>>   	bool "Enable legacy fbdev support for your modesetting driver"
>>>   	depends on DRM
>>> -	depends on FB
>>> +	select FB
>>>   	select DRM_KMS_HELPER
>>>   	select FB_CFB_FILLRECT
>>>   	select FB_CFB_COPYAREA
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
