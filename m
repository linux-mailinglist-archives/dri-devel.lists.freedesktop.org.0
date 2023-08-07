Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEA771DE0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 12:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D88810E1ED;
	Mon,  7 Aug 2023 10:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292A610E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 10:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691403750; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SFCyBGpP8kPZ8DRF0cnCGKJFf0pjODXJqKklH9yn6KbfeoUmI1C/tRS5NLjXDsupA3wpIn8a+s5tKW/ZSGt3iAWXvmNzUxKj6zpVjeNDKg+2hs/pytmxOaPwkudT/d9MwstfVourNAzfgt0NpVoLCULTEN7/xlJSvUXJ8deXYjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1691403750;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=luzbRksMIiyme56TbxJHhWxt3rRM/XaEELgahYWK/dU=; 
 b=D+o1XWxSX2B1aE9Z5cKz5gY9uiSr+OWqjBizJw9thSkib8WVP+2HUWX52M6x+DgNCxTY1ZDVPMjaMyPxTpjtxO/hnrbptWPzEXtMvmSHXz9EMitJExSdaIujNp6nDiKhsjUa4Iw3296MNW4weJydhw6iQ/OmhmibkKHWYtmPVtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691403750; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=luzbRksMIiyme56TbxJHhWxt3rRM/XaEELgahYWK/dU=;
 b=p8VWyPt6ULrbXhKZhM/846FHNbbmSBAfRaWcJbn9WKgH1Bk6edHOsru7ES3Faf3J
 MfAvRc9ERTODz1rre3qIT2rqGNqxnTrwntR4/f7AK6V/zL8sW/2H52QoEJM7qRaqBiM
 m5YM47LS8l58LiXW2OQqSwZYk5wB342T9nFjCTiNLT/gV8hTfw4W8uZp+634uDqVxOS
 vUHewFlz/IeBriIm+J5gdkiQCcAr8D3WsAPbMNAy7LgD2aaBGw54ReIPWYoZV4nJYz8
 4fr/tcwRV662iminyNxICDDvDNx+15YpLtXMxidwNAYG4XprIz5IhUGig09BPSTRGrE
 W1khqH4RCg==
Received: from edelgard.fodlan.icenowy.me (120.85.97.93 [120.85.97.93]) by
 mx.zohomail.com with SMTPS id 1691403749376287.8844149228238;
 Mon, 7 Aug 2023 03:22:29 -0700 (PDT)
Message-ID: <af2fc72a8206ababe7f4ec7af0667ba39c6df2d4.camel@icenowy.me>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: a64: keep tcon0 clock rate when
 pll-video0's rate changes
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 18:22:26 +0800
In-Reply-To: <87il9rtc7y.fsf@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
 <16a690b357f34db0ba852a63d86ba13b9ded5924.camel@icenowy.me>
 <87il9rtc7y.fsf@oltmanns.dev>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Ond?0?0ej Jirman <x@xnux.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:48 +0200=EF=BC=
=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 2023-08-07 at 17:43:52 +0800, Icenowy Zheng <uwu@icenowy.me>
> wrote:
> > =E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:36 +0200=EF=
=BC=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Icenowy Zheng <icenowy@aosc.io>
> > >=20
> > > Notify TCON0 clock (and in consequence PLL-MIPI by
> > > CLK_SET_RATE_PARENT)
> > > to reset when PLL-Video0 changes (because of HDMI PHY clk which
> > > is a
> > > child of PLL-Video0 and has CLK_SET_RATE_PARENT set). In this way
> > > we
> > > can
> > > get clock tree to satisfy both pipelines.
> >=20
> > Well for fixing one's patch that contains SoB, use the following
> > format:
> >=20
> > Signed-off-by: A <a@a.local>
> > [B: fixed something]
> > Signed-off-by: B <b@b.local>
>=20
> Ah, okay. Will do. But I keep A in the "From: " line, correct?

Yes.

>=20
> Thanks,
> =C2=A0 Frank
>=20
> > > ---
> > > =C2=A0drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
> > > =C2=A01 file changed, 15 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > index ef567775fc95..93beedb0428e 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > @@ -943,6 +943,17 @@ static struct ccu_mux_nb sun50i_a64_cpu_nb =3D
> > > {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.bypass_index=C2=A0=
=C2=A0=C2=A0=3D 1, /* index of 24 MHz oscillator */
> > > =C2=A0};
> > > =C2=A0
> > > +/*
> > > + * Since PLL-Video0 is an ancestor of both tcon0 and HDMI PYH,
> > > tcon0
> > > clock will
> > > + * conflict with HDMI PHY clock which is on another display
> > > pipeline.
> > > + *
> > > + * Therefore, a notifier is required to restore the rate of
> > > TCON0
> > > when the rate
> > > + * of PLL-Video0 changed.
> > > + */
> > > +static struct ccu_rate_reset_nb
> > > sun50i_a64_pll_video0_reset_tcon0_nb
> > > =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.common=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &pll_video0_clk.common,
> > > +};
> > > +
> > > =C2=A0static int sun50i_a64_ccu_probe(struct platform_device *pdev)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *reg;
> > > @@ -978,6 +989,10 @@ static int sun50i_a64_ccu_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_mux_notifier_regi=
ster(pll_cpux_clk.common.hw.clk,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sun50i_a64_cpu_nb);
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the rate of TCON0=
 clock when PLL-VIDEO0 is
> > > changed
> > > */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_a64_pll_video0_rese=
t_tcon0_nb.target_clk =3D
> > > tcon0_clk.common.hw.clk;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_rate_reset_notifier_re=
gister(&sun50i_a64_pll_video0_r
> > > eset
> > > _tcon0_nb);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > =C2=A0}
> > > =C2=A0
> > >=20

