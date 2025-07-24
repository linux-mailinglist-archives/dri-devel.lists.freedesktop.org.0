Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9CB10839
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7922A10E920;
	Thu, 24 Jul 2025 10:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Irk0T0BT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W1G/olrr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Irk0T0BT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W1G/olrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C2110E920
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:55:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFD3218A4;
 Thu, 24 Jul 2025 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753354516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
 b=Irk0T0BTMDiOehJsNZYsUqvPQkE28G5mYq67WDVRnADUO2SlqQ1iAG/HRoKdAOlqPoMNxF
 bVUVrnn3wpT9a9krtG+QyYPNdnpKJEdcbZcP1U/FWzIPMmllwwQCACRJuOSerI3o9k1YLJ
 zP2GDIptAZMRVHJJRnEu4GzJ1moxcKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753354516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
 b=W1G/olrrwVV6urQwmohdFY8FPuoSfHOl2QKmAYECVdXg3gT2o1zBK9/iUSazDKncDkffH3
 DAy91lm0+5z1rdAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753354516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
 b=Irk0T0BTMDiOehJsNZYsUqvPQkE28G5mYq67WDVRnADUO2SlqQ1iAG/HRoKdAOlqPoMNxF
 bVUVrnn3wpT9a9krtG+QyYPNdnpKJEdcbZcP1U/FWzIPMmllwwQCACRJuOSerI3o9k1YLJ
 zP2GDIptAZMRVHJJRnEu4GzJ1moxcKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753354516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
 b=W1G/olrrwVV6urQwmohdFY8FPuoSfHOl2QKmAYECVdXg3gT2o1zBK9/iUSazDKncDkffH3
 DAy91lm0+5z1rdAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AF8F136DC;
 Thu, 24 Jul 2025 10:55:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I3ATERMRgmjDbgAAD6G6ig
 (envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 10:55:15 +0000
Date: Thu, 24 Jul 2025 12:55:14 +0200
Message-ID: <874iv1luy5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Takashi Iwai <tiwai@suse.de>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org,
 airlied@gmail.com, tiwai@suse.com, jernej.skrabec@gmail.com,
 p.zabel@pengutronix.de, luca.ceresoli@bootlin.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, victor.liu@nxp.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 lumag@kernel.org, dianders@chromium.org, kernel@pengutronix.de,
 cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 l.stach@pengutronix.de
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
In-Reply-To: <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com>
 <87jz3ykpju.wl-tiwai@suse.de>
 <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
 <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[37]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL8m7tqgwaqu97o1bbfnn6ewdz)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[pengutronix.de,suse.de,nxp.com,lists.linux.dev,lists.freedesktop.org,vger.kernel.org,ideasonboard.com,intel.com,gmail.com,ffwll.ch,kernel.org,suse.com,bootlin.com,kwiboo.se,linux.intel.com,perex.cz,lists.infradead.org,linaro.org,chromium.org,collabora.com];
 TAGGED_RCPT(0.00)[dt]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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

On Thu, 24 Jul 2025 12:14:10 +0200,
Shengjiu Wang wrote:
> 
> On Thu, Jul 24, 2025 at 3:40 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> >
> > On 24.07.2025 09:37:09, Takashi Iwai wrote:
> > > On Thu, 24 Jul 2025 09:22:44 +0200,
> > > Shengjiu Wang wrote:
> > > >
> > > > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > > > in HDMI and DisplayPort to describe the audio stream, but hardware device
> > > > may need to reorder the IEC958 bits for internal transmission, so need
> > > > these standard bits definitions for IEC958 subframe format.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  include/sound/asoundef.h | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > > > index 09b2c3dffb30..7efd61568636 100644
> > > > --- a/include/sound/asoundef.h
> > > > +++ b/include/sound/asoundef.h
> > > > @@ -12,6 +12,15 @@
> > > >   *        Digital audio interface                                      *
> > > >   *                                                                          *
> > > >   ****************************************************************************/
> > > > +/* IEC958 subframe format */
> > > > +#define IEC958_SUBFRAME_PREAMBLE_MASK      (0xf)
> > > > +#define IEC958_SUBFRAME_AUXILIARY_MASK     (0xf<<4)
> > > > +#define IEC958_SUBFRAME_SAMPLE_24_MASK     (0xffffff<<4)
> > > > +#define IEC958_SUBFRAME_SAMPLE_20_MASK     (0xfffff<<8)
> > > > +#define IEC958_SUBFRAME_VALIDITY   (0x1<<28)
> > > > +#define IEC958_SUBFRAME_USER_DATA  (0x1<<29)
> > > > +#define IEC958_SUBFRAME_CHANNEL_STATUS     (0x1<<30)
> > > > +#define IEC958_SUBFRAME_PARITY             (0x1<<31)
> > >
> > > I'd use "U" suffix as it can reach to the MSB.
> > > Also, you can put spaces around the operators to align with the
> > > standard format, too.  I guess you followed to the other code there,
> > > but following to the standard coding style would be better.
> > >
> > > With those addressed, feel free to take my ack for this patch:
> >
> > Or make use of the BIT() and GEN_MASK() helpers.
> 
> Is it acceptable to include the headers in this file?

It's no UAPI, so should be fine (although I'm no big fan of
GEN_MASK()).

Other definitions can be converted with the macros, but it should be a
different patch.


thanks,

Takashi
