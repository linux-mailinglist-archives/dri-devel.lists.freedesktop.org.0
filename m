Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483FA590C9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7CE10E3E1;
	Mon, 10 Mar 2025 10:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="D7E3vw1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155116.qiye.163.com (mail-m155116.qiye.163.com
 [101.71.155.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C64B10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:09:25 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id dc09eef1;
 Mon, 10 Mar 2025 18:09:19 +0800 (GMT+08:00)
Message-ID: <5dc47134-fabb-4f9c-acc3-8bf37d2cc733@rock-chips.com>
Date: Mon, 10 Mar 2025 18:09:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 10/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Doug Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 boris.brezillon@collabora.com, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-11-damon.ding@rock-chips.com>
 <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNOTFZDTUsfGh1NGkgaH09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a957f87c7c203a3kunmdc09eef1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Ghw*MDIMNiM5Vjk6LzNK
 A0IKCg1VSlVKTE9KTUtKSE1KTk5DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ01DNwY+
DKIM-Signature: a=rsa-sha256;
 b=D7E3vw1XXB1XCYg4ojtoHQqelLn3tRxuF/YnJiS7eKtAHcAJmK6eZVh8POr/PKSys+Oh0rYtPLotv2Gp8EdLwkFeVgjH1md2nhhGOO5PUuohiFVFMSqdP7tYsL4Cg+HhG6fnpIVHcx0r3/pX2DKi4Tz3OBEz6CkZfH4o1zPqTlU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=8oDl0bBs3tCfqgA77qPG8Vr+30J/oYlSYqhSGqmt52Q=;
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

Hi Doug,

On 2025/2/25 9:42, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 24, 2025 at 12:14 AM Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> @@ -392,11 +393,27 @@ static const struct component_ops rockchip_dp_component_ops = {
>>          .unbind = rockchip_dp_unbind,
>>   };
>>
>> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
>> +{
>> +       struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
>> +       struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>> +       int ret;
>> +
>> +       ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
>> +       if (ret && ret != -ENODEV)
>> +               return ret;
> 
> Can you explain why you treat -ENODEV as a non-error case here? Maybe
> this is for the non-eDP case (AKA the DP case) where there's no
> further panels or bridges? Maybe a comment would be helpful to remind
> us?
> 

I think the commit 86caee745e45 ("drm/rockchip: analogix_dp: allow to 
work without panel") can help the Analogix DP driver work when the 
bridge is driver-free or when the user uses the eDP IP as a DP.

And I will add some comments in the next version.

> 
>> +       ret = component_add(dp->dev, &rockchip_dp_component_ops);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return ret;
> 
> nit: the above could just be:
> 
> return component_add(dp->dev, &rockchip_dp_component_ops);
> 

Yeah, it is a good idea.

> 
>> @@ -448,9 +460,16 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>          if (IS_ERR(dp->adp))
>>                  return PTR_ERR(dp->adp);
>>
>> -       ret = component_add(dev, &rockchip_dp_component_ops);
>> -       if (ret)
>> -               return ret;
>> +       ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
>> +       if (ret) {
>> +               if (ret != -ENODEV)
>> +                       return dev_err_probe(dp->dev, ret,
>> +                                            "failed to populate aux bus : %d\n", ret);
> 
> IIRC this -ENODEV case is for old legacy panels that aren't listed
> under the aux bus in the device tree. Maybe a comment would be helpful
> to remind us?

I will add a comment here if devm_of_dp_aux_populate_bus() returns -ENODEV.

> 
> nit: don't need the %d in your error message. dev_err_probe() already
> prints the error code.
> 

I will remove it in the next version.

> 
>> +               ret = rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
>> +               if (ret)
>> +                       return ret;
>> +       }
>>
>>          return 0;
> 
> You can get rid of a few of your return cases by just returning "ret" here.
> 

Yeah, it is better.

> 
> -Doug
> 
> 

Best regards
Damon
