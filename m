Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA40J/nJgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:12:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713AD75FA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B3A10E5B4;
	Tue,  3 Feb 2026 10:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="soDBBG2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6310E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 10:12:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 39F90C211C9;
 Tue,  3 Feb 2026 10:12:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0765E60728;
 Tue,  3 Feb 2026 10:12:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C634119A8888; Tue,  3 Feb 2026 11:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770113521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kaxurYH+pSZiT55rBegAYaKI+3y+ZBTAe+5LlaGS5Qc=;
 b=soDBBG2bgMR8f2LbgIrwrYZOZzYJcpbUWVYRItBu2O1PQqna30rioLkNHxmoqkhNvMoty+
 if15F8cH7NZWu28bObiIMmjSXkf/cYBNUhfuBPoO76QtFqb1UQUMLfLDYevJwW/p1Kl7Lu
 +I3G0dxG+J6RhTJVOFeRfdIz+h/B9NG/cjr+thEijncqEHuyHKZUwYUANoWLQg294fKT8y
 TDLWlGQamhmukciHP6cONfNmeBtpmJaloA59+nUyzJxHvdVhD6JznC5KaF3u+dPqNNeDk7
 seesqobwi6ZjgtZhhsyn/aWw21kF+XuG5pXLFvYh5MYavI/tXRZlfn3DYpa2Fg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 11:11:50 +0100
Message-Id: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
In-Reply-To: <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:damon.ding@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:email,i.mx:url,rock-chips.com:email,x5rxm53w5e22:email]
X-Rspamd-Queue-Id: 0713AD75FA
X-Rspamd-Action: no action

Hello Damon,

On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
> Hi,
>
> On 2/2/2026 10:54 AM, Damon Ding wrote:
>> Hi Luca,
>>
>> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>>> Hello Damon, Dmitry,
>>>
>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>>> to make it more generic and suitable for platforms other than i.MX.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v7:
>>>> - Rename legacy-bridge to of-display-mode-bridge.
>>>> - Remove unnecessary API drm_bridge_is_legacy().
>>>
>>> ...
>>>
>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NXP PTN3460 eDP-LVDS bridge=
 chip driver.
>>>>
>>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>>> +=C2=A0=C2=A0=C2=A0 tristate
>>>> +=C2=A0=C2=A0=C2=A0 depends on DRM_BRIDGE && OF
>>>> +=C2=A0=C2=A0=C2=A0 help
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a DRM bridge implementation th=
at uses
>>>> of_get_drm_display_mode
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to acquire display mode.
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Newer designs should not use this brid=
ge and should use proper
>>>> panel
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead.
>>>
>>> "Newer designs should not use this bridge", but in patch 8 you are
>>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't y=
ou
>>> instead "use proper panel driver instead" in patch 8?
>>>
>>> Can you point to the conversation where the converstaion where Dmitry
>>> suggested this change? Maybe it already contains the answer to my
>>> qustion. Also adding a link to that conversation in the commit message
>>> woule be useful.
>>>
>>
>> First of all, thanks for your reviews on this patch series.
>>
>> link: https://lore.kernel.org/all/
>> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
>>
>> I think it may be a misleading issue caused by directly copying the
>> previous Kconfig description. Now that the new
>> devm_drm_of_display_mode_bridge() helper has been added, drivers using
>> the panel-bridge framework can rely on it to maintain compatibility with
>> legacy display mode parsing.

Ah, I think I got the point: the mode description in device tree is legacy,
but the driver itself is not legacy and will be current until we need to
support legacy device tree. Correct?

If that's correct, this patch looks OK to me with a new Kconfig help text.

>> It would be better to update the comment as follows:
>>
>> This is a DRM bridge implementation that uses of_get_drm_display_mode to
>> acquire display mode.
>>
>> It exists for compatibility with legacy display mode parsing, in order
>> to conform to the panel-bridge framework.
>>
>
> Dmitry, what's you take on this?

Dmitry's opinion would be much more relevant than mine. I don't know much
myself about this driver.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
