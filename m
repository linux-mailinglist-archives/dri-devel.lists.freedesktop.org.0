Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCC0NAKub2k7GgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8BF47996
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E3C10E5E2;
	Tue, 20 Jan 2026 12:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W4lFgX8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826D010E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768913556;
 bh=1F3bjTrJAQV98e6Ofv6AzI2gvnZHsJNREWk0J7ithrk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=W4lFgX8oLJwt8MA28As+uKkp4IwR2+8J3KRNCcWUzkJTn/ofvLq18HdALvqxgGJb+
 gGC/S3JjnjK7lKE+FvVyFZn/EeIq5Ibj2diCrni9ddtzGMU/TDR9Uxwj5Ctquci+JF
 lKZkPEB/TGYgEjIFBdzmR1xhZKJQ9+71RlyIW7dV+D6PvPG6eMLmsK5vMZqrxdMbdd
 5cFGurW0MyA05GFdgw7XDrQvrDGF7+eAUvizlGbMGYLsuqyKEJV3Dh0FOe4fytX9Z3
 8wW9uKXr6bjqvAluhYUC51As3OBDQN14CvAuZr/V5NlGEN5F0TNRum3ARAucL3uXfd
 nPQCiMqfFQ8nQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 303A517E1355;
 Tue, 20 Jan 2026 13:52:36 +0100 (CET)
Message-ID: <13d33158-b814-4ac1-b8de-ec30ff16c783@collabora.com>
Date: Tue, 20 Jan 2026 14:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: fix multi-channel audio output
To: Christian Hewitt <christianshewitt@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>, Andy Yan
 <andy.yan@rock-chips.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251206072718.2039874-1-christianshewitt@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251206072718.2039874-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christianshewitt@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:detlev.casanova@collabora.com,m:dianders@chromium.org,m:andy.yan@rock-chips.com,m:sugar.zhang@rock-chips.com,m:luca.ceresoli@bootlin.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,collabora.com,chromium.org,rock-chips.com,bootlin.com,sntech.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 1C8BF47996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

On 12/6/25 9:27 AM, Christian Hewitt wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Channel Allocation (PB4) and Level Shift Information (PB5) are
> configured with values from PB1 and PB2 due to the wrong offset
> being used. This results in missing audio channels or incorrect
> speaker placement when playing multi-channel audio.
> 
> Use the correct offset to fix multi-channel audio output.
> 
> Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> ---
> buffer is a pointer to u8 while data written to PKT_AUDI_CONTENTS
> is u32, so buffer contains audio infoframe header (buffer[0:2]) +
> checksum (buffer[3]) + payload byte 1-10 (buffer[4:13]), e.g.
> 
> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1)
> .. will write PB0-PB3 to AUDI_CONTENTS1
> 
> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1)
> .. will write PB1-PB4 to AUDI_CONTENTS2, but should be PB4-PB7
> 
> &buffer[4] will point to payload byte 4 not payload byte 1, due
> to u8/u32 and not considering the size of header+checksum (3+1).
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index f3a13da488e6..7b8a69383dc4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -845,7 +845,7 @@ static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
>  
>  	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
>  	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
> -	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
> +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[7], 1);

Since making use of regmap_bulk_write(), this could be further optimized as:

-       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
-       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
+       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 2);

Regardless,

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Please note you also need to provide your SoB, check "Sign your work ..."
section in [1].

Regards,
Cristian

[1] https://www.kernel.org/doc/Documentation/process/submitting-patches.rst

