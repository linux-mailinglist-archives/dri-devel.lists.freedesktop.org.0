Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FAA4B0F4
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 11:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE910E10D;
	Sun,  2 Mar 2025 10:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="kZPZ5ZGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731114.qiye.163.com (mail-m19731114.qiye.163.com
 [220.197.31.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AF810E10D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 10:36:42 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id ca2fcbb2;
 Sun, 2 Mar 2025 18:36:37 +0800 (GMT+08:00)
Message-ID: <1d066210-3d24-4d17-a51c-115f305c5de9@rock-chips.com>
Date: Sun, 2 Mar 2025 18:36:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 09/15] drm/bridge: analogix_dp: Add support to get
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
 <20250224081325.96724-10-damon.ding@rock-chips.com>
 <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KQ1YdQk9LH0tNSB9OT0pWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95566de61f03a3kunmca2fcbb2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohw6Iio6LTINI0sWTxgtPSJL
 PCswCwNVSlVKTE9LQkpKTEJCTUtIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITU9CNwY+
DKIM-Signature: a=rsa-sha256;
 b=kZPZ5ZGSqT9O0E2P1zhbCBACC65/xnByw/wawoT8NmV3MJGsm5Vz/EmaIjjh31vQRVM1tvBiEyj3p3KLGQgzMaS6gwrwRnMh7yLnL3f5XjBUBSwCEZ6Oc1659x4UvaUdCJY3VcYjO8WO8bKPkSI2atxfzX5FRoenqvW6jNTmd2k=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=gwJBmCRtBPr279bswslshLIRoVTVjLdcj1Wo5iFAM3w=;
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

On 2025/2/25 9:41, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 24, 2025 at 12:14 AM Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> The main modification is moving the DP AUX initialization from function
>> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
>> eDP panel during probing, it is also needed to advance PM operations to
>> ensure that eDP controller and phy are prepared for AUX transmission.
>>
>> Additionally, add support for &drm_dp_aux.wait_hpd_asserted() to help
>> confirm the HPD state before doing AUX transfers.
> 
> Maybe move the addition of the analogix_dpaux_wait_hpd_asserted() to a
> separate patch?
> 

It would be a good idea.

> 
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>>    component_add() when getting panel from the DP AUX bus
>>
>> Changes in v5:
>> - Advance PM operations to make eDP AUX work well
>>
>> Changes in v6:
>> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
>> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>>    operations
>>
>> Changes in v7:
>> - Fix the misspelling of word 'operations' in commit message
>> - Remove the check related to CONFIG_PM
>> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>>    devm_pm_runtime_enable() fails
>> - Remove unnecessary function analogix_dp_remove()
>> - Add new function analogix_dpaux_wait_hpd_asserted()
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 37 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index a57e06d303a1..ff81c37dbe1d 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1548,6 +1548,22 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>>          return ret;
>>   }
>>
>> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us)
>> +{
>> +       struct analogix_dp_device *dp = to_dp(aux);
>> +       int val;
>> +       int ret;
>> +
>> +       pm_runtime_get_sync(dp->dev);
>> +
>> +       ret = readx_poll_timeout(analogix_dp_detect_hpd, dp, val, !val, wait_us / 100, wait_us);
> 
> More than happy if someone else wants to overrule me, but it seems
> weird that you're looping over a function that already has a loop.
> Shouldn't you be calling analogix_dp_get_plug_in_status() directly?
> ...and if "dp->force_hpd" you probably shouldn't be polling at all. If
> HPD is not hooked up I think we decided in sn65dsi86 that we should
> just sleep for the maximum time (choosing a conservative value if told
> to wait forever).
> 

Yes, I think there is no need to use analogix_dp_detect_hpd(), and the 
code as you recommended is better:

static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, 
unsigned long wait_us)
{
	struct analogix_dp_device *dp = to_dp(aux);
	int val;
	int ret;

	if (dp->force_hpd)
		return 0;

	pm_runtime_get_sync(dp->dev);

	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
				 wait_us / 100, wait_us);

	pm_runtime_mark_last_busy(dp->dev);
	pm_runtime_put_autosuspend(dp->dev);

	return ret;
}

> 
> Aside from that and the idea of moving
> analogix_dpaux_wait_hpd_asserted() to a separate patch this looks good
> to me.
> 

Best regards
Damon

