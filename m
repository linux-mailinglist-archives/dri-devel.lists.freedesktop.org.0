Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHD+L9SwnmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:20:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E01941CE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034E10E6E4;
	Wed, 25 Feb 2026 08:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RWiLOW6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5814210E6E1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:20:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a1046f62d0so114824e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 00:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772007631; cv=none;
 d=google.com; s=arc-20240605;
 b=DzK/+3kHlxawRJONFmZO2yEpF7W4Fh2tAYLZ0/D2RLlPvj6FAiapnpetH1Pb+4Uqet
 unp+5pEe4td5sSgjnmWIhQVJ17fTE26p/v18czo20y+ezeJIT5XlcLVBveClze5cX8ty
 fHckbl3IivhIm8Mds4Z+jlJf4sz5rj0TiCXg/R8gXjhBfIwhZt4P7h6f8J4WoRUQAdUs
 rQnqry17dGagMkCWvXiAlCjqXRs97BHD5lFIrHkEkP3Rp7X7zhRdRn7ctrwGkdDq5P2t
 icia3Wt8teb02lzHKi8CUzeg1A9fMWUSYDTsAo50vlgkDVchrdN29EEBRkusKiGwHAJN
 QNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
 fh=xUMOlQy/T9x0h3KC5YJ+sa55eAARrlN8FR21A0odfrE=;
 b=BJct3BDNVasfrpEX53n+ono9/1KLrIql8oVaOM6FDfAWw3byYqELliYryEVKGeVRIj
 W6kozSR1alD0Rbaj+jm8vMPF+/zwN20Zrp4oLRBssp19zX9oXgJbF8d4vpx3UXRd/pwv
 XfVuFxETm/zPwqXqA5YLBECcd3x+kfEAYmh/C9eDZ0xwkE4N+HdtgCM7iLBM4kkFcWbO
 eflquI/h65bVUTTFaZjznoia1cxdPxdtk+94V9dAuxGowkJqoA8t/m2Cp3ChkHi20xh8
 7luOMr7BLPF/QBNyglgX1SJ/Th5+FTPKsizeNF7LB68xiF35w9tSeq1EMMG0hH8KKuPN
 f7Sw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772007631; x=1772612431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
 b=RWiLOW6/fvtBljL3hrQGyeGkfuNHEVYxn7PPazYzkFrLU/Z2eq13bF0Wl4hJds0RLG
 fZWpNuDtgcQp/w3rUP4y/inbAMAvZf7vABZf/Ouu9Q8VQHpjJP7Xlb2qWOn95qHvrUZI
 f+Xm+iyYJ7kwRxOBhPOGS0Ai8Gv2lKS1tYN2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772007631; x=1772612431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
 b=eeSBRpPF/en1Gev8TOXP7hG0t0Qz3RqCkELCrneBDWlcANK+VwSP59fgzlyM6q7B6H
 PHXjAXOmZW8OjsgcfUWKBYV2GP2L6rfZZPZdiqETTFxVMSMl03DZq8dApDdR5sVywXPx
 0bmPDTHzVEkv6ItXrYOLxgpUilerbVGuEhyu4W63Sde4jd3NBzYlTcDq5Mqr0N6UKRfI
 Oa2rSKAcW25Rpe9k28Mqi+wQcalEF4yqtCNW3ZnKqBvKLvdl/FTCx2YYWVAoAHQhahhc
 IvbT+8rS35MNNW7JeM6uP/a90d/nRrk/BjwXgxWqn1GBrJ72kebI8jI6NhPXSRazPVu7
 KwAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx+8rUzJufmXvkchpbAmVNk/F+UBBeqGQSJe1lUxqAiz/UmfaJxL44NR9SznvPOQ+rsDl0a3HqNJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDM3/iIAwRmQ6/O9e15jj3Y8LXvKHUIXd2I2xuEIq8kIkpt8R1
 4sokOcTuUCQ/UUWgNp1vxNBjME16vc1kCNcftrTOYZvUAKe3vubYBIzEYfMp+PfIA5v6SJ1c9qV
 LwSax0lKvzU8YL64lMYpJUvUXIkzjOnlJ1Px+SFwd
X-Gm-Gg: ATEYQzymdOY7Q//xh4Js1Huh0aHqr4TJT9DHSnyeStTER9TSPwuBloc23RXPxO9+pZt
 2TZcdZ97N/wvJ/hIvjfHdbucoURuxjH+HWURc7ldSKGJLePfYgdvXmt5lfmRUjHFsovHjs9g2lg
 d0FqA2Frx4QwoJbhglSKeSDkSdf8fVp5NBdAJRzPgc3Yo1zP4MEzpv0OrbdejMYEfuDBhOwWAOx
 +JpsaeWKTjY/mpzzuAVcoTLT8KOu2Qy8m/wHOeETXcNzc1GINKi3lGlxyQ+xNT5JpCg1VbZBOWE
 Y5EkDKKbZCX3d5EiigcLglPywi6yHo8oz3s=
X-Received: by 2002:a05:6512:b9b:b0:5a1:430:6222 with SMTP id
 2adb3069b0e04-5a10430638emr227734e87.7.1772007630593; Wed, 25 Feb 2026
 00:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
In-Reply-To: <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Feb 2026 16:20:19 +0800
X-Gm-Features: AaiRm53aktJkvWRSs_OtrFpEUnAjkj1Xocp5KjXoLsN4g3Olmuw0jfNPNr4TOdc
Message-ID: <CAGXv+5H1=7O36txmf+m08w1fg3kZKjpqnSOuOAOfiPPcCjtMvA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "airlied@gmail.com" <airlied@gmail.com>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:ck.hu@mediatek.com,m:p.zabel@pengutronix.de,m:chunkuang.hu@kernel.org,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:bisson.gary@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:bissongary@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:email,chromium.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0D6E01941CE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 2:20=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> On Tue, 2026-01-20 at 12:36 +0100, Gary Bisson wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > running in order to lock its PLL during its own pre-enable function.
> >
> > Without this change, the bridge gives the following error:
> > sn65dsi83 14-002c: failed to lock PLL, ret=3D-110
> > sn65dsi83 14-002c: Unexpected link status 0x01
> > sn65dsi83 14-002c: reset the pipe
> >
> > Move the necessary functions from enable to pre-enable.
>
> Looks good to me, but this change the flow for all SoC and panel,
> so I would wait for more SoC and more panel test.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # Chromebooks

Tested on:
- MT8173 Hana (Telesu) w/ PS8640 bridge
- MT8183 Krane w/ DSI panel
- MT8183 Juniper w/ ANX7625 bridge
- MT8186 Tentacruel w/ PS8640 bridge
- MT8186 Steelix w/ PS8640 bridge

No regressions observed.

> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
> >
> > Left mtk_dsi_set_mode() as part of the enable function to mimic what is
> > done in the Samsung DSIM driver which is known to be working the TI
> > bridge.
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++-------------=
-----
> >  1 file changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/media=
tek/mtk_dsi.c
> > index 0e2bcd5f67b7..b560245d1be9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_d=
si *dsi, u8 irq_flag, u32 t)
> >         }
> >  }
> >
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +       if (!dsi->lanes_ready) {
> > +               dsi->lanes_ready =3D true;
> > +               mtk_dsi_rxtx_control(dsi);
> > +               usleep_range(30, 100);
> > +               mtk_dsi_reset_dphy(dsi);
> > +               mtk_dsi_clk_ulp_mode_leave(dsi);
> > +               mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +               mtk_dsi_clk_hs_mode(dsi, 0);
> > +               usleep_range(1000, 3000);
> > +               /* The reaction time after pulling up the mipi signal f=
or dsi_rx */
> > +       }
> > +}
> > +
> >  static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >  {
> >         struct device *dev =3D dsi->host.dev;
> > @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >         mtk_dsi_set_vm_cmd(dsi);
> >         mtk_dsi_config_vdo_timing(dsi);
> >         mtk_dsi_set_interrupt_enable(dsi);
> > +       mtk_dsi_lane_ready(dsi);
> > +       mtk_dsi_clk_hs_mode(dsi, 1);
> >
> >         return 0;
> >  err_disable_engine_clk:
> > @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
> >         dsi->lanes_ready =3D false;
> >  }
> >
> > -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > -{
> > -       if (!dsi->lanes_ready) {
> > -               dsi->lanes_ready =3D true;
> > -               mtk_dsi_rxtx_control(dsi);
> > -               usleep_range(30, 100);
> > -               mtk_dsi_reset_dphy(dsi);
> > -               mtk_dsi_clk_ulp_mode_leave(dsi);
> > -               mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -               mtk_dsi_clk_hs_mode(dsi, 0);
> > -               usleep_range(1000, 3000);
> > -               /* The reaction time after pulling up the mipi signal f=
or dsi_rx */
> > -       }
> > -}
> > -
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >  {
> >         if (dsi->enabled)
> >                 return;
> >
> > -       mtk_dsi_lane_ready(dsi);
> >         mtk_dsi_set_mode(dsi);
> > -       mtk_dsi_clk_hs_mode(dsi, 1);
> > -
> >         mtk_dsi_start(dsi);
> >
> >         dsi->enabled =3D true;
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20260120-mtkdsi-29e4c84e7b38
> >
> > Best regards,
> > --
> > Gary Bisson <bisson.gary@gmail.com>
> >
> >
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
