Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AER3DX2cgmlgWwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:10:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C837E0534
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37CB10E067;
	Wed,  4 Feb 2026 01:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PdtvcqXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49244.qiye.163.com (mail-m49244.qiye.163.com
 [45.254.49.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CD810E067
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 01:10:11 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 330509a94;
 Wed, 4 Feb 2026 09:10:05 +0800 (GMT+08:00)
Message-ID: <8c305f74-7fa7-4798-b1b3-e96544d962a1@rock-chips.com>
Date: Wed, 4 Feb 2026 09:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
 <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Content-Language: en-US
In-Reply-To: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c26330b5c03a3kunme492eb66731d02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1KQlYdTB0aGRgfSRlIHU1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=PdtvcqXrIboBxzk6mrQxMh8OFknDSWkG8VsQx3P2oelUvZoMue4STcE+QfhITy/PiSZqtgQYee4sBfRWs14gKK0t47AQ3BXE7Nr3wCtaOHKY9WaYy5G//B0ZE4uGhgQl/TKkSj0hcrsxCsAcdXg1gNWy7TRdCUVD4w3MwfbcuEU=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=ro6VqhMxsjofyYNi+p5gticfSsMMFPfjQqGDTGdq+b8=;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rock-chips.com:email,rock-chips.com:dkim,rock-chips.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 0C837E0534
X-Rspamd-Action: no action

Hi Luca,

On 2/3/2026 6:11 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
>> Hi,
>>
>> On 2/2/2026 10:54 AM, Damon Ding wrote:
>>> Hi Luca,
>>>
>>> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>>>> Hello Damon, Dmitry,
>>>>
>>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>>>> to make it more generic and suitable for platforms other than i.MX.
>>>>>
>>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v7:
>>>>> - Rename legacy-bridge to of-display-mode-bridge.
>>>>> - Remove unnecessary API drm_bridge_is_legacy().
>>>>
>>>> ...
>>>>
>>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>>>        help
>>>>>          NXP PTN3460 eDP-LVDS bridge chip driver.
>>>>>
>>>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>>>> +    tristate
>>>>> +    depends on DRM_BRIDGE && OF
>>>>> +    help
>>>>> +      This is a DRM bridge implementation that uses
>>>>> of_get_drm_display_mode
>>>>> +      to acquire display mode.
>>>>> +
>>>>> +      Newer designs should not use this bridge and should use proper
>>>>> panel
>>>>> +      driver instead.
>>>>
>>>> "Newer designs should not use this bridge", but in patch 8 you are
>>>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
>>>> instead "use proper panel driver instead" in patch 8?
>>>>
>>>> Can you point to the conversation where the converstaion where Dmitry
>>>> suggested this change? Maybe it already contains the answer to my
>>>> qustion. Also adding a link to that conversation in the commit message
>>>> woule be useful.
>>>>
>>>
>>> First of all, thanks for your reviews on this patch series.
>>>
>>> link: https://lore.kernel.org/all/
>>> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
>>>
>>> I think it may be a misleading issue caused by directly copying the
>>> previous Kconfig description. Now that the new
>>> devm_drm_of_display_mode_bridge() helper has been added, drivers using
>>> the panel-bridge framework can rely on it to maintain compatibility with
>>> legacy display mode parsing.
> 
> Ah, I think I got the point: the mode description in device tree is legacy,
> but the driver itself is not legacy and will be current until we need to
> support legacy device tree. Correct?
> 
> If that's correct, this patch looks OK to me with a new Kconfig help text.

Right. I want to apply the advanced panel-bridge framework for Exynos DP 
driver, and this newly added API helps handle the legacy device tree 
that it supports.

The v9 will come soon.

> 
>>> It would be better to update the comment as follows:
>>>
>>> This is a DRM bridge implementation that uses of_get_drm_display_mode to
>>> acquire display mode.
>>>
>>> It exists for compatibility with legacy display mode parsing, in order
>>> to conform to the panel-bridge framework.
>>>
>>
>> Dmitry, what's you take on this?
> 
> Dmitry's opinion would be much more relevant than mine. I don't know much
> myself about this driver.
> 

Best regards,
Damon


