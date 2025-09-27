Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77148BA5D07
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 11:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32410E01F;
	Sat, 27 Sep 2025 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nHWDrUGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wqsgagUJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nHWDrUGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wqsgagUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E210E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 09:50:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA119267D8;
 Sat, 27 Sep 2025 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758966633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWSLsp5Q+OBEvCxaJhtiJufQYs9Iqj0DaWEu/Y3fjh0=;
 b=nHWDrUGhPhsS4p6nX3rWYGg+1HBuJNgbyLnB8Zx67wt351CSM6U2jtPpS22tqTFVve1dGL
 QrPV8stgpN18MtwtXeHqBUVKGzqnlsVT8c+7Sn8zumsasPYPeASUDqZEEMf8W/j2ToHV2E
 1khQEQk16pM68hT4R1/Dm3Eor4vYVF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758966633;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWSLsp5Q+OBEvCxaJhtiJufQYs9Iqj0DaWEu/Y3fjh0=;
 b=wqsgagUJ5zJ5eFRWpqC0GJSO5pLrcPx9OEehVtsKIdyrFz0sVh8NE5e6qpDE1/QjoSOAJN
 BPM9/DIzPQHwr9CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758966633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWSLsp5Q+OBEvCxaJhtiJufQYs9Iqj0DaWEu/Y3fjh0=;
 b=nHWDrUGhPhsS4p6nX3rWYGg+1HBuJNgbyLnB8Zx67wt351CSM6U2jtPpS22tqTFVve1dGL
 QrPV8stgpN18MtwtXeHqBUVKGzqnlsVT8c+7Sn8zumsasPYPeASUDqZEEMf8W/j2ToHV2E
 1khQEQk16pM68hT4R1/Dm3Eor4vYVF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758966633;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWSLsp5Q+OBEvCxaJhtiJufQYs9Iqj0DaWEu/Y3fjh0=;
 b=wqsgagUJ5zJ5eFRWpqC0GJSO5pLrcPx9OEehVtsKIdyrFz0sVh8NE5e6qpDE1/QjoSOAJN
 BPM9/DIzPQHwr9CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4B3A13782;
 Sat, 27 Sep 2025 09:50:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0xVUMmiz12i8UAAAD6G6ig
 (envelope-from <tiwai@suse.de>); Sat, 27 Sep 2025 09:50:32 +0000
Date: Sat, 27 Sep 2025 11:50:32 +0200
Message-ID: <87y0q09qc7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
In-Reply-To: <d39bc215-5b67-4cf5-b9d5-6e1e9ab20159@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <b411c188-b564-4ae8-9186-d0877880fa99@nxp.com>
 <d39bc215-5b67-4cf5-b9d5-6e1e9ab20159@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[35]; TAGGED_RCPT(0.00)[dt];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,chromium.org,collabora.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,pengutronix.de,lists.linux.dev,lists.infradead.org,perex.cz,suse.com];
 R_RATELIMIT(0.00)[to_ip_from(RL8m7tqgwaqu97o1bbfnn6ewdz)];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
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

On Fri, 26 Sep 2025 08:03:15 +0200,
Liu Ying wrote:
> 
> Hi Jaroslav, Takashi,
> 
> On 09/23/2025, Liu Ying wrote:
> > On 09/23/2025, Shengjiu Wang wrote:
> >> Shengjiu Wang (7):
> >>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
> >>   ALSA: Add definitions for the bits in IEC958 subframe
> >>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
> >>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
> >>     format
> >>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
> >>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
> >>   arm64: dts: imx8mp-evk: enable hdmi_pai device
> > 
> > Jaroslav, Takashi, do you think it's ok to land patch 2 through drm-misc,
> > as that patch touches include/sound/asoundef.h?
> 
> Can you please comment?

Sorry, I've been off in this week (and am catching backlogs).

And, yes, feel free to take the change via drm tree.  I already gave
my Reviewed-by tag for that.


thanks,

Takashi
