Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3D3D9053
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5636E900;
	Wed, 28 Jul 2021 14:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 10:06:17 UTC
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8A6E204
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:06:17 +0000 (UTC)
Subject: Re: [PATCH] drm: rcar-du: crtc: force depends on cmm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1627466254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+KqqtNyUfzj8wBwUwjvxjy9cXKjQPDRFe7BHNJ4nHg=;
 b=Jv9ioWKzv1BGCQDL8tTOk+NYN8KVvA/ioYKD3m+qcfcqcjazMqF+9aYB/NJsRDtC716CKe
 CwN3Ir49De56wpByMJmOOopE88penrHzlGuw+7xYrD8X5SdW6v9jI1/RnxjtdzhCiqXO9w
 +J/ScG2wXFLAoGdgew3uryqVfnOkdRA=
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
References: <20210728084240.566677-1-liu.yun@linux.dev>
 <ca54fd2a-0436-d12a-5d90-bc3ff0b691b7@ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <1dd90e70-c2d3-e13f-832a-505c91e1898e@linux.dev>
Date: Wed, 28 Jul 2021 17:57:26 +0800
MIME-Version: 1.0
In-Reply-To: <ca54fd2a-0436-d12a-5d90-bc3ff0b691b7@ideasonboard.com>
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
 kieran.bingham+renesas@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran.

How about this.

diff --git a/drivers/gpu/drm/rcar-du/Kconfig 
b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..14cf3e6415d7 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -1,7 +1,7 @@
  # SPDX-License-Identifier: GPL-2.0
  config DRM_RCAR_DU
         tristate "DRM Support for R-Car Display Unit"
-       depends on DRM && OF
+       depends on DRM && OF && m
         depends on ARM || ARM64
         depends on ARCH_RENESAS || COMPILE_TEST
         imply DRM_RCAR_CMM


Of course, this is not a good way, in fact, as long as rcar-du built-in, 
cmm must also be built-in, otherwise an error will be reported.

Do you have a good way?

Thanks, Jackie.

在 2021/7/28 下午4:58, Kieran Bingham 写道:
> Hi Jackie,
> 
> On 28/07/2021 09:42, Jackie Liu wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> After the patch 78b6bb1d24db ("drm: rcar-du: crtc: Control CMM operations"),
>> the cmm module must be included in the crtc. We cannot remove this
>> configuration option separately. Therefore, simply linking them together
>> is the best solution, otherwise some errors will be reported.
>>
> 
> Yikes, I'm sure we've had plenty of problems with the config options on
> this module. The churn alone makes me wonder if it should just be part
> of the overall module to simplify things... but...
> 
>>   rcar_du_crtc.c:(.text+0x194): undefined reference to `rcar_cmm_setup'
>>   rcar_du_crtc.c:(.text+0x11bc): undefined reference to `rcar_cmm_enable'
>>   rcar_du_crtc.c:(.text+0x1604): undefined reference to `rcar_cmm_disable'
>>   rcar_du_kms.c:(.text+0x768): undefined reference to `rcar_cmm_init'
> 
> Those are guarded by #if IS_ENABLED in the header.
> 
> So from that - perhaps we can assume that the config attempted here was
> a built-in DU - but a module CMM which wouldn't be supported?
> 
> 
> 
>> Fixes: 78b6bb1d24db ("rm: rcar-du: crtc: Control CMM operations")
> 
> That fixes tag is missing a 'd', but that's trivial.
> 
> 
>> Reported-by: kernel-bot <k2ci@kylinos.cn>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>> ---
>>   drivers/gpu/drm/rcar-du/Kconfig  | 8 --------
>>   drivers/gpu/drm/rcar-du/Makefile | 2 +-
>>   2 files changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>> index b47e74421e34..bc71ad2a472f 100644
>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>> @@ -4,7 +4,6 @@ config DRM_RCAR_DU
>>   	depends on DRM && OF
>>   	depends on ARM || ARM64
>>   	depends on ARCH_RENESAS || COMPILE_TEST
>> -	imply DRM_RCAR_CMM
>>   	imply DRM_RCAR_LVDS
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_CMA_HELPER
>> @@ -14,13 +13,6 @@ config DRM_RCAR_DU
>>   	  Choose this option if you have an R-Car chipset.
>>   	  If M is selected the module will be called rcar-du-drm.
>>   
>> -config DRM_RCAR_CMM
>> -	tristate "R-Car DU Color Management Module (CMM) Support"
>> -	depends on DRM && OF
>> -	depends on DRM_RCAR_DU
>> -	help
>> -	  Enable support for R-Car Color Management Module (CMM).
>> -
> 
> I suspect the issue lies somewhere in this config that the CMM is not
> being enforced to be a built in when the DU is built in ?
> 
> 
>>   config DRM_RCAR_DW_HDMI
>>   	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>>   	depends on DRM && OF
>> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
>> index 4d1187ccc3e5..76ff2e15bc2d 100644
>> --- a/drivers/gpu/drm/rcar-du/Makefile
>> +++ b/drivers/gpu/drm/rcar-du/Makefile
>> @@ -5,6 +5,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
>>   		 rcar_du_group.o \
>>   		 rcar_du_kms.o \
>>   		 rcar_du_plane.o \
>> +		 rcar_cmm.o
>>   
>>   rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>>   					   rcar_du_of_lvds_r8a7790.dtb.o \
>> @@ -15,7 +16,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>>   rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>>   rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
>>   
>> -obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
>>   obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>>   obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>>   obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
>>
