Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAYzFxgXi2ljPgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:31:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A134611A23D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58DE10E105;
	Tue, 10 Feb 2026 11:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Nfihc0kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2D110E105
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770723090;
 bh=Dda5EyfS/mUf58NECP6/RPGWDX/572xH+xh6MoBCJCY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nfihc0kHazcC50eVR4FMsM5nDqivuBoghIHrKvFJlSyifQ9YeM7ucf+rvIV2C2FKu
 FQ1+3Z8I+yLDhq1xyBwUbdBKCjk+LKytHEJP9HgXjCVyNi6Pa8dZcJhn40Isaez+IY
 Z+GIFXQGo22NdkhgmeLGKYAbAcpot8ejF/0oZ+dFZx5VsDVgz2ffXTdJTpj15C1bXq
 UaMydpBX+gXDk8SADeSMBktGYbjo77dmu3GPTZkpeDo7ReJnUPVrfA8BaEk+V8sllu
 39aWwAyyEEgdNQcqXSIiVwMN/nhmEDxyDfFBZaFEUA4/MJcr9M5Op/idvTDY+wAoIt
 2YIEq66cNiPHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C845117E12C5;
 Tue, 10 Feb 2026 12:31:29 +0100 (CET)
Message-ID: <0960ece8-02e6-468f-9ee6-38e529939d35@collabora.com>
Date: Tue, 10 Feb 2026 12:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260209090516.14369-1-l.scorcia@gmail.com>
 <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
 <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pasteboard.co:url,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: A134611A23D
X-Rspamd-Action: no action

Il 09/02/26 19:46, Luca Leonardo Scorcia ha scritto:
> Il giorno lun 9 feb 2026 alle ore 12:40 AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> ha scritto:
>>
>> Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
>>> The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
>>> which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
>>> structure needs to be stored inside the driver data before invoking it.
>>>
>>> As drvdata is currently uninitialized it leads to a crash when
>>> registering the DSI DRM encoder right after acquiring
>>> the mode_config.idr_mutex, blocking all subsequent DRM operations.
>>>
>>> Fixes the following crash during mediatek-drm probe (tested on Xiaomi
>>> Smart Clock x04g):
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>    0000000000000040
>>> [...]
>>> ---[ end trace 0000000000000000 ]---
>>>
>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> ... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?
>>
>> Are you running upstream on this device?
>> If so, why don't you also contribute a nice devicetree to get this device finally
>> upstream?!?! :-)
> 
> That's correct! Most of the work had already been done by the
> wonderful people at postmarketOS, I just had to connect the dots. Some
> crucial patches (mt6392 regulator, mt8167 display nodes) were
> submitted in the past but weren't merged for various reasons.
> 
> Just rebased on v6.19: https://pasteboard.co/6bXQeWlwUqmz.jpg

Oh that's so cool!

> 
> I am trying to get it working as much as I can, then cleanup and
> submit. At the moment storage, usb networking, rtc, buttons, screen,
> touch, backlight, light/presence sensors, drm and gce are all working;
> still missing wifi/bt, audio and cpuidle.
> 

You got an astonishingly big amount of features working fine then.
That is practically almost everything.

I do encourage you to send all this good stuff upstream, as I'd anyway not really
expect your v1 to be perfect (however, I'm ready to get pleasantly surprised, so
please do?!).

Getting your current state correctly upstreamed makes you able to avoid refactors
during development and to actually get all the rest here upstream in relatively
less time.

After all, while it would be nice to have something complete and 100% working in
the first-ever iteration, you got really a lot of nice stuff there - and from an
upstream point of view, a device with this percentage of completion would be
perfectly acceptable.

Sending patches to add up more features later, even one by one, is just a regular
workflow, so that'd be perfectly acceptable as well.

What is not acceptable is non-functional placeholders that get deleted entirely
with subsequent patches (like adding a UART node with fake pinctrl because the
bootloader leaves that configured, but then deleting everything and refactoring
to make it proper ... bar exceptional cases, of course, everything is always
relative to specific situations).

Ultimately, it's your choice though, of course.

Keep up the good work!

Cheers,
Angelo

>> Cheers,
>> Angelo
>>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 4c2983852596..2358407b8a6b 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>>
>>>        dsi->host.ops = &mtk_dsi_ops;
>>>        dsi->host.dev = dev;
>>> +     platform_set_drvdata(pdev, dsi);
>>> +
>>>        ret = mipi_dsi_host_register(&dsi->host);
>>>        if (ret < 0)
>>>                return dev_err_probe(dev, ret, "Failed to register DSI host\n");
>>> @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>>
>>>        init_waitqueue_head(&dsi->irq_wait_queue);
>>>
>>> -     platform_set_drvdata(pdev, dsi);
>>> -
>>>        dsi->bridge.of_node = dev->of_node;
>>>        dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>>
>>
>>
> 
> 
