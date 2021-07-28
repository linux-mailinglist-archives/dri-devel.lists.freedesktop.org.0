Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467153D9050
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7D6E044;
	Wed, 28 Jul 2021 14:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 12:20:18 UTC
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEC96EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 12:20:18 +0000 (UTC)
Subject: Re: [PATCH] drm: rcar-du: crtc: force depends on cmm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1627474454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKkWGRn5d1I88o4j2grO+VhIUSK1twf7vn2minKUrrU=;
 b=nm+IsA1f0acP2T89ebtc9px4kHyw3ppM5jrxgozXjPL5fiuJUWTr2eAKiRiWrmoAqb+YMF
 dgltaodwNM8dTwIDKqimKAtibWU1p29m1l12z5pFWwChBktRN33/yPxR3Cv6tv19Z69u/9
 c/8MHaGVmhUwGGNKIlmwSTkn9+SI42s=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210728084240.566677-1-liu.yun@linux.dev>
 <ca54fd2a-0436-d12a-5d90-bc3ff0b691b7@ideasonboard.com>
 <1dd90e70-c2d3-e13f-832a-505c91e1898e@linux.dev>
 <4abb3023-87c4-ffc4-bdfa-8fc9671b45e4@ideasonboard.com>
 <YQE/0X7IsCaR2/py@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <bdd2d678-04b3-a40e-72fd-8d48cca67165@linux.dev>
Date: Wed, 28 Jul 2021 20:14:06 +0800
MIME-Version: 1.0
In-Reply-To: <YQE/0X7IsCaR2/py@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
X-Mailman-Approved-At: Wed, 28 Jul 2021 14:22:24 +0000
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
Cc: airlied@linux.ie, liuyun01@kylinos.cn,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2021/7/28 下午7:30, Laurent Pinchart 写道:
> On Wed, Jul 28, 2021 at 12:09:34PM +0100, Kieran Bingham wrote:
>> Hi Jackie,
>>
>> On 28/07/2021 10:57, Jackie Liu wrote:
>>> Hi Kieran.
>>>
>>> How about this.
>>>
>>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig
>>> b/drivers/gpu/drm/rcar-du/Kconfig
>>> index b47e74421e34..14cf3e6415d7 100644
>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>> @@ -1,7 +1,7 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>   config DRM_RCAR_DU
>>>          tristate "DRM Support for R-Car Display Unit"
>>> -       depends on DRM && OF
>>> +       depends on DRM && OF && m
>>>          depends on ARM || ARM64
>>>          depends on ARCH_RENESAS || COMPILE_TEST
>>>          imply DRM_RCAR_CMM
>>>
>>>
>>> Of course, this is not a good way, in fact, as long as rcar-du built-in,
>>> cmm must also be built-in, otherwise an error will be reported.
>>
>> Correct, ideally we should enforce that if the RCAR_DU is built in (y),
>> then the CMM can only be y/n and not m.
>>
>> I thought that the depends on DRM_RCAR_DU should do that, but it appears
>> it doesn't enforce the built-in rule to match...
>>
>>> Do you have a good way?
>>
>> Kconfig-language.rst says:
>>
>>    Note: If the combination of FOO=y and BAR=m causes a link error,
>>    you can guard the function call with IS_REACHABLE()::
>>
>>          foo_init()
>>          {
>>                  if (IS_REACHABLE(CONFIG_BAZ))
>>                          baz_register(&foo);
>>                  ...
>>          }
>>
>>
>> But that seems redundant, so I suspect we could/should change the
>> drivers/gpu/drm/rcar-du/rcar_cmm.h from:
>>
>>
>> #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
>> to
>> #if IS_REACHABLE(CONFIG_DRM_RCAR_CMM)
>>
>> ...
>>
>>
>> Seems odd that we might allow the module to be compiled at all if it
>> won't be reachable and that we can't enforce that at the KConfig level -
>> but at least IS_REACHABLE would prevent the linker error..
> 
> This has been discussed before:
> 
> https://lore.kernel.org/dri-devel/20200408202711.1198966-6-arnd@arndb.de/

Hi Laurent.

Thanks for tell me this.

-- 
Jackie Liu

> 
>>> 在 2021/7/28 下午4:58, Kieran Bingham 写道:
>>>> On 28/07/2021 09:42, Jackie Liu wrote:
>>>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>>>
>>>>> After the patch 78b6bb1d24db ("drm: rcar-du: crtc: Control CMM
>>>>> operations"),
>>>>> the cmm module must be included in the crtc. We cannot remove this
>>>>> configuration option separately. Therefore, simply linking them together
>>>>> is the best solution, otherwise some errors will be reported.
>>>>>
>>>>
>>>> Yikes, I'm sure we've had plenty of problems with the config options on
>>>> this module. The churn alone makes me wonder if it should just be part
>>>> of the overall module to simplify things... but...
>>>>
>>>>>    rcar_du_crtc.c:(.text+0x194): undefined reference to `rcar_cmm_setup'
>>>>>    rcar_du_crtc.c:(.text+0x11bc): undefined reference to
>>>>> `rcar_cmm_enable'
>>>>>    rcar_du_crtc.c:(.text+0x1604): undefined reference to
>>>>> `rcar_cmm_disable'
>>>>>    rcar_du_kms.c:(.text+0x768): undefined reference to `rcar_cmm_init'
>>>>
>>>> Those are guarded by #if IS_ENABLED in the header.
>>>>
>>>> So from that - perhaps we can assume that the config attempted here was
>>>> a built-in DU - but a module CMM which wouldn't be supported?
>>>>
>>>>
>>>>
>>>>> Fixes: 78b6bb1d24db ("rm: rcar-du: crtc: Control CMM operations")
>>>>
>>>> That fixes tag is missing a 'd', but that's trivial.
>>>>
>>>>
>>>>> Reported-by: kernel-bot <k2ci@kylinos.cn>
>>>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>>>> ---
>>>>>    drivers/gpu/drm/rcar-du/Kconfig  | 8 --------
>>>>>    drivers/gpu/drm/rcar-du/Makefile | 2 +-
>>>>>    2 files changed, 1 insertion(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig
>>>>> b/drivers/gpu/drm/rcar-du/Kconfig
>>>>> index b47e74421e34..bc71ad2a472f 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>>>> @@ -4,7 +4,6 @@ config DRM_RCAR_DU
>>>>>        depends on DRM && OF
>>>>>        depends on ARM || ARM64
>>>>>        depends on ARCH_RENESAS || COMPILE_TEST
>>>>> -    imply DRM_RCAR_CMM
>>>>>        imply DRM_RCAR_LVDS
>>>>>        select DRM_KMS_HELPER
>>>>>        select DRM_KMS_CMA_HELPER
>>>>> @@ -14,13 +13,6 @@ config DRM_RCAR_DU
>>>>>          Choose this option if you have an R-Car chipset.
>>>>>          If M is selected the module will be called rcar-du-drm.
>>>>>    -config DRM_RCAR_CMM
>>>>> -    tristate "R-Car DU Color Management Module (CMM) Support"
>>>>> -    depends on DRM && OF
>>>>> -    depends on DRM_RCAR_DU
>>>>> -    help
>>>>> -      Enable support for R-Car Color Management Module (CMM).
>>>>> -
>>>>
>>>> I suspect the issue lies somewhere in this config that the CMM is not
>>>> being enforced to be a built in when the DU is built in ?
>>>>
>>>>
>>>>>    config DRM_RCAR_DW_HDMI
>>>>>        tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>>>>>        depends on DRM && OF
>>>>> diff --git a/drivers/gpu/drm/rcar-du/Makefile
>>>>> b/drivers/gpu/drm/rcar-du/Makefile
>>>>> index 4d1187ccc3e5..76ff2e15bc2d 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/Makefile
>>>>> +++ b/drivers/gpu/drm/rcar-du/Makefile
>>>>> @@ -5,6 +5,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
>>>>>             rcar_du_group.o \
>>>>>             rcar_du_kms.o \
>>>>>             rcar_du_plane.o \
>>>>> +         rcar_cmm.o
>>>>>      rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    += rcar_du_of.o \
>>>>>                           rcar_du_of_lvds_r8a7790.dtb.o \
>>>>> @@ -15,7 +16,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    +=
>>>>> rcar_du_of.o \
>>>>>    rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)    += rcar_du_vsp.o
>>>>>    rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
>>>>>    -obj-$(CONFIG_DRM_RCAR_CMM)        += rcar_cmm.o
>>>>>    obj-$(CONFIG_DRM_RCAR_DU)        += rcar-du-drm.o
>>>>>    obj-$(CONFIG_DRM_RCAR_DW_HDMI)        += rcar_dw_hdmi.o
>>>>>    obj-$(CONFIG_DRM_RCAR_LVDS)        += rcar_lvds.o
> 
