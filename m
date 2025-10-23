Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD5C01016
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C89E10E3EC;
	Thu, 23 Oct 2025 12:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="biNjzk7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com
 [220.197.32.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3810E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:29 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26f2c95f7;
 Thu, 23 Oct 2025 20:10:21 +0800 (GMT+08:00)
Message-ID: <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
Date: Thu, 23 Oct 2025 20:10:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com> <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
 <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10fa2ad903abkunm63b0b3181a1121
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hCTlZDT0xDTk4ZSUgdHRhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=biNjzk7LSVRSGV1ZBRFm2pqDrcSqN6X6pQT3v+20RIGWpgAkjhtuaHxj6ZVvF/acb202inF411z7yGIUoF/7CHQ2Pg/L6wLybWl0rz+LjhvsgHqysLYlVIWIXUgVF/qQOrfHbm3hQOkvKYsFtMh9rTdxx3ulZty1nhOw2ruKgYk=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=+tppR1r2GR2aHsAGWh+r4F7VMu3ZGa0gIoTITM9UMtU=;
 h=date:mime-version:subject:message-id:from;
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

Hi Heikki,

On 10/23/2025 8:03 PM, Heikki Krogerus wrote:
>>>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>>>> index 245e8a27e3fc..e91736829167 100644
>>>> --- a/drivers/gpu/drm/bridge/Makefile
>>>> +++ b/drivers/gpu/drm/bridge/Makefile
>>>> @@ -1,6 +1,7 @@
>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>    obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>>>>    obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>>>> +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
>>> Instead, why not just make that a part of aux-hpd-bridge
>>> conditionally:
>>>
>>> ifneq ($(CONFIG_TYPEC),)
>>>           aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
>>> endif
>> Oh, I did consider that! But I noticed that aux-hpd-bridge.c contains the
>> following statement module_auxiliary_driver(drm_aux_hpd_bridge_drv), which
>> already includes a module_init. In the newly added file, in order to call the
>> register function, another module_init was also added. If the two files are
>> each made into a module separately, would there be a problem?
> You would not call module_init() from the new file. Instead you would
> call drm_aux_hpd_typec_dp_bridge_init() and what ever directly from
> aux-hpd-bridge.c:
>
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.h b/drivers/gpu/drm/bridge/aux-bridge.h
> new file mode 100644
> index 000000000000..ae689a7778fa
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef AUX_HPD_BRIDGE_H
> +#define AUX_HPD_BRIDGE_H
> +
> +#if IS_ENABLED(CONFIG_TYPEC)
> +int drm_aux_hpd_typec_dp_bridge_init(void);
> +void drm_aux_hpd_typec_dp_bridge_exit(void);
> +#else
> +static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
> +static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
> +#endif /* IS_ENABLED(CONFIG_TYPEC) */
> +
> +#endif /* AUX_HPD_BRIDGE_H */
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 2e9c702c7087..3578df1df78a 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -12,6 +12,8 @@
>   #include <drm/drm_bridge.h>
>   #include <drm/bridge/aux-bridge.h>
>   
> +#include "aux-hpd-bridge.h"
> +
>   static DEFINE_IDA(drm_aux_hpd_bridge_ida);
>   
>   struct drm_aux_hpd_bridge_data {
> @@ -190,9 +192,16 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
>   
>          auxiliary_set_drvdata(auxdev, data);
>   
> +       drm_aux_hpd_typec_dp_bridge_init();
> +
>          return devm_drm_bridge_add(data->dev, &data->bridge);
>   }
>   
> +static void drm_aux_hpd_bridge_remove(struct auxiliary_device *auxdev)
> +{
> +       drm_aux_hpd_typec_dp_bridge_exit();
> +}
> +
>   static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
>          { .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
>          {},
> @@ -203,6 +212,7 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
>          .name = "aux_hpd_bridge",
>          .id_table = drm_aux_hpd_bridge_table,
>          .probe = drm_aux_hpd_bridge_probe,
> +       .remove = drm_aux_hpd_bridge_remove,
>   };
>   module_auxiliary_driver(drm_aux_hpd_bridge_drv);

Yes, if we don't distinguish them through Kconfig, we need to use the IS_ENABLED macro in the code. Thanks again for you code.


Another thing is that CONFIG_DRM_AUX_HPD_BRIDGE originally needed to be selected by other modules. With this change, we also need to expose it in Kconfig.


>
>
-- 
Best,
Chaoyi

