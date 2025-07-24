Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94738B1020A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B710E8AA;
	Thu, 24 Jul 2025 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iSmpZvav";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z4rbEGUw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iSmpZvav";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z4rbEGUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE16A10E8AA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:37:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AB781F394;
 Thu, 24 Jul 2025 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753342630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
 b=iSmpZvav8lnYGFgYWT9RAL6mampmVxsQdOjORxZQmpl2iwQ5NuepLPirg2axvQMywNZgsg
 sM/0rzB57rZzEH02wqXjW5wz+pcC37QvGMCoeNz+fEKMCHQtyI/iIz9EuMlZaSg5Zjlh9u
 Cqykg5TDSqTxG//PZUt1z2wPWxaauJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753342630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
 b=z4rbEGUwD7bCn2kBeVEXY5/AYO2k2An2G2PY3o03wE+J5eEo0PlaGSqS80GqXeQKv6Rpds
 ExwDAG9wh3tpu4BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753342630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
 b=iSmpZvav8lnYGFgYWT9RAL6mampmVxsQdOjORxZQmpl2iwQ5NuepLPirg2axvQMywNZgsg
 sM/0rzB57rZzEH02wqXjW5wz+pcC37QvGMCoeNz+fEKMCHQtyI/iIz9EuMlZaSg5Zjlh9u
 Cqykg5TDSqTxG//PZUt1z2wPWxaauJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753342630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
 b=z4rbEGUwD7bCn2kBeVEXY5/AYO2k2An2G2PY3o03wE+J5eEo0PlaGSqS80GqXeQKv6Rpds
 ExwDAG9wh3tpu4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A643D13302;
 Thu, 24 Jul 2025 07:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7gjAJqXigWjKMgAAD6G6ig
 (envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 07:37:09 +0000
Date: Thu, 24 Jul 2025 09:37:09 +0200
Message-ID: <87jz3ykpju.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
In-Reply-To: <20250724072248.1517569-3-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[35];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,chromium.org,collabora.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,nxp.com,pengutronix.de,lists.linux.dev,lists.infradead.org,perex.cz,suse.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[dt];
 R_RATELIMIT(0.00)[to_ip_from(RL8m7tqgwaqu97o1bbfnn6ewdz)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email, suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
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

On Thu, 24 Jul 2025 09:22:44 +0200,
Shengjiu Wang wrote:
> 
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..7efd61568636 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xf)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xf<<4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffff<<4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffff<<8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1<<28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1<<29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1<<30)
> +#define IEC958_SUBFRAME_PARITY		(0x1<<31)

I'd use "U" suffix as it can reach to the MSB.
Also, you can put spaces around the operators to align with the
standard format, too.  I guess you followed to the other code there,
but following to the standard coding style would be better.

With those addressed, feel free to take my ack for this patch:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
