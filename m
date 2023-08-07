Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9D771DAA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1310E1E9;
	Mon,  7 Aug 2023 09:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F7510E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691401438; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DrcXtOlHiv7tF1YYHfgEgX+JAzhcRionNlBC5cTu27huRpHrwyqx2RlPcr2mztm9YxKh9QYjhUfyI0UpXYEaIGeYmmjl0vx05T6/gclPvC5K0WHBj4Zfojzd8MNX6tSJF5TcJwHi51X365N0PXPpQ3OtZ2zsDijp6xGIegMJROI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1691401438;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=y+e4rnVYYzToRTQ5TF1TQKumnxwW/5+TKoJwzWVlWCA=; 
 b=FTX++eaH2BcAs7wjaDApd5gwenvh3wrCMm/uY0QLrbqQQH7e4H5muZlPNA7JVHicT+b2lYb38fQrX+x0hK1X8q6MsnZbCxB9T3xdeTnOTPt4rxzc5n1QBac5G/y09/9AvhTmAi+i4GI25JbGehxXhXrGMriHqG2hCYxLVkOQtzQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691401438; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=y+e4rnVYYzToRTQ5TF1TQKumnxwW/5+TKoJwzWVlWCA=;
 b=GBF8bk1QZHShaahpBSGNVkuUHCkbaRFEkKw/EDkA4osc6n+ocyvjyq9dufWrguMx
 oBQse9JvS1CRDT/zWA8TNb0z+lR06pHq6XtuC3Kftw8IE033VP8kxR1x9NvE0efYsl+
 Hf3/1voPeCJ7i42a6i3H0FJdA//TH1SYTqVQsNIHjqrmrGkYq+H7Ij7Y+tRcKi3N1Fe
 oAKTgzPGru2QXURl+vRhesqlP+D4dDcNxsn54HxGO+5PAmb4RdEWQ+qJjoDInbRc9ur
 nRP0838p4Su7U+LgSdUxgPkSeH5HASZ9kKCDtq7lyfTkboak5UHjZ2lXtp9JbXdYUwK
 1MdCBK9Q4Q==
Received: from edelgard.fodlan.icenowy.me (120.85.97.93 [120.85.97.93]) by
 mx.zohomail.com with SMTPS id 1691401435472530.645901173641;
 Mon, 7 Aug 2023 02:43:55 -0700 (PDT)
Message-ID: <16a690b357f34db0ba852a63d86ba13b9ded5924.camel@icenowy.me>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: a64: keep tcon0 clock rate when
 pll-video0's rate changes
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 17:43:52 +0800
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
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
 =?gb2312?Q?Ond=810=940ej?= Jirman <x@xnux.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:36 +0200=EF=BC=
=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> Notify TCON0 clock (and in consequence PLL-MIPI by
> CLK_SET_RATE_PARENT)
> to reset when PLL-Video0 changes (because of HDMI PHY clk which is a
> child of PLL-Video0 and has CLK_SET_RATE_PARENT set). In this way we
> can
> get clock tree to satisfy both pipelines.

Well for fixing one's patch that contains SoB, use the following
format:

Signed-off-by: A <a@a.local>
[B: fixed something]
Signed-off-by: B <b@b.local>

> ---
> =C2=A0drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index ef567775fc95..93beedb0428e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -943,6 +943,17 @@ static struct ccu_mux_nb sun50i_a64_cpu_nb =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.bypass_index=C2=A0=C2=A0=
=C2=A0=3D 1, /* index of 24 MHz oscillator */
> =C2=A0};
> =C2=A0
> +/*
> + * Since PLL-Video0 is an ancestor of both tcon0 and HDMI PYH, tcon0
> clock will
> + * conflict with HDMI PHY clock which is on another display
> pipeline.
> + *
> + * Therefore, a notifier is required to restore the rate of TCON0
> when the rate
> + * of PLL-Video0 changed.
> + */
> +static struct ccu_rate_reset_nb sun50i_a64_pll_video0_reset_tcon0_nb
> =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.common=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &pll_video0_clk.common,
> +};
> +
> =C2=A0static int sun50i_a64_ccu_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *reg;
> @@ -978,6 +989,10 @@ static int sun50i_a64_ccu_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_mux_notifier_register=
(pll_cpux_clk.common.hw.clk,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sun50i_a64_cpu_nb);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the rate of TCON0 clo=
ck when PLL-VIDEO0 is changed
> */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_a64_pll_video0_reset_tc=
on0_nb.target_clk =3D
> tcon0_clk.common.hw.clk;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_rate_reset_notifier_regist=
er(&sun50i_a64_pll_video0_reset
> _tcon0_nb);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
>=20

