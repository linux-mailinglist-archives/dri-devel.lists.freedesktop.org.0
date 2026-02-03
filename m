Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CMSCuhPgWmLFgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:31:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A9D3626
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7310E45D;
	Tue,  3 Feb 2026 01:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PNeLKk6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com
 [220.197.31.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DCA10E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 01:31:12 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 32e1603b0;
 Tue, 3 Feb 2026 09:31:06 +0800 (GMT+08:00)
Message-ID: <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
Date: Tue, 3 Feb 2026 09:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
From: Damon Ding <damon.ding@rock-chips.com>
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
Content-Language: en-US
In-Reply-To: <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c211febb503a3kunmdf9f046968496a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0waTVYaHxlIHUhDGEJNGEJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=PNeLKk6IXR55KNlke+4USCf5fom3f/N3+2kARL8pH0JwEPUlW60pXl+rtEoTZiX5O8yGuHc/m5vU/SaCJ1Gp07bJlpVKV7LVXgo8PO9QLI5HrJU160XWWzJRmQP51/j2tw/tfdjC+39EH3iKM0kT7IBxukZVeDjGby7EtvavdRI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=80iknK13Kq+wx2P2fwBcvk34JAYKQJmD7fJDTp2xaOU=;
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,i.mx:url,samsung.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 0D8A9D3626
X-Rspamd-Action: no action

Hi,

On 2/2/2026 10:54 AM, Damon Ding wrote:
> Hi Luca,
> 
> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>> Hello Damon, Dmitry,
>>
>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>> to make it more generic and suitable for platforms other than i.MX.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> ---
>>>
>>> Changes in v7:
>>> - Rename legacy-bridge to of-display-mode-bridge.
>>> - Remove unnecessary API drm_bridge_is_legacy().
>>
>> ...
>>
>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>       help
>>>         NXP PTN3460 eDP-LVDS bridge chip driver.
>>>
>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>> +    tristate
>>> +    depends on DRM_BRIDGE && OF
>>> +    help
>>> +      This is a DRM bridge implementation that uses 
>>> of_get_drm_display_mode
>>> +      to acquire display mode.
>>> +
>>> +      Newer designs should not use this bridge and should use proper 
>>> panel
>>> +      driver instead.
>>
>> "Newer designs should not use this bridge", but in patch 8 you are
>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
>> instead "use proper panel driver instead" in patch 8?
>>
>> Can you point to the conversation where the converstaion where Dmitry
>> suggested this change? Maybe it already contains the answer to my
>> qustion. Also adding a link to that conversation in the commit message
>> woule be useful.
>>
> 
> First of all, thanks for your reviews on this patch series.
> 
> link: https://lore.kernel.org/all/ 
> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
> 
> I think it may be a misleading issue caused by directly copying the 
> previous Kconfig description. Now that the new 
> devm_drm_of_display_mode_bridge() helper has been added, drivers using 
> the panel-bridge framework can rely on it to maintain compatibility with 
> legacy display mode parsing.
> 
> It would be better to update the comment as follows:
> 
> This is a DRM bridge implementation that uses of_get_drm_display_mode to 
> acquire display mode.
> 
> It exists for compatibility with legacy display mode parsing, in order 
> to conform to the panel-bridge framework.
> 

Dmitry, what's you take on this?

Best regards,
Damon

