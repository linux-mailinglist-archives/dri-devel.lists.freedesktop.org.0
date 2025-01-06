Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F8A021B2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD6110E15D;
	Mon,  6 Jan 2025 09:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="C6PgRuat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AA10E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBnkfPPwd/0z0UzRp7pSBtfbNp5mlwbhbYUinjn7t6s=; b=C6PgRuatqaL/JCQeSBgq90fYbR
 cgS9RBnuNFoNmBPp82CGyMEIE98ptU4gncieb/wDBgYHeNrMAgDiOfjWNR4H1pvLRbqz16DhI6ziZ
 lVH+IdsGn+z4Q0WMmKaGPekvYreupbWXQl3ZVKd70kqq+j6yRCSOu0o9zU40Oc/HSOgVMHzTOf0Hn
 j1gcFw88ylpQUZAEAwnUNLm0S5dc4OhH03UcUE97EJ7B0azFCG7qamRBaX/M0HyBrGZS86vcR/5bS
 WSpJP1Vs8zHOkuB3WK1+/UXhMv16JmpmJYBexATgN45dORXy7Yb/Dm1c+t0O7Vj/kmKo1umLIM82a
 MoPAvHJA==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tUjKx-0003r1-RV; Mon, 06 Jan 2025 10:23:51 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org, 
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Mon, 06 Jan 2025 10:23:50 +0100
Message-ID: <2263586.72vocr9iq0@diego>
In-Reply-To: <2f23fa41.82d9.1943ac12d62.Coremail.andyshrk@163.com>
References: <20241225103741.364597-1-andyshrk@163.com>
 <2175680.OBFZWjSADL@diego>
 <2f23fa41.82d9.1943ac12d62.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Montag, 6. Januar 2025, 09:35:26 CET schrieb Andy Yan:
>=20
> Hi Heiko,
>=20
> At 2025-01-02 19:51:58, "Heiko St=FCbner" <heiko@sntech.de> wrote:
> >Hi Andy,
> >
> >Am Mittwoch, 25. Dezember 2024, 11:37:29 CET schrieb Andy Yan:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >>=20
> >> There are some control bits for IO and interrupts status scattered
> >> across different GRF on differt SOC.
> >> Add platform callback for this IO setting and interrupts status
> >> handling.
> >>=20
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >>=20
> >> ---
> >>=20
> >>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 81 ++++++++++++-------
> >>  1 file changed, 54 insertions(+), 27 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/=
gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> index c36fc130b734..b21e868e7c16 100644
> >> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> @@ -62,6 +62,12 @@ struct rockchip_hdmi_qp {
> >>  	int port_id;
> >>  };
> >> =20
> >> +struct rockchip_hdmi_qp_ctrl_ops {
> >> +	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
> >> +	irqreturn_t (*irq_callback)(int irq, void *dev_id);
> >> +	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
> >> +};
> >> +
> >>  static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encode=
r *encoder)
> >>  {
> >>  	struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> >> @@ -226,9 +232,47 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq,=
 void *dev_id)
> >>  	return IRQ_HANDLED;
> >>  }
> >> =20
> >> +static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
> >> +{
> >> +	u32 val;
> >> +
> >> +	val =3D HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
> >> +
> >
> >nit: below val =3D ... and regmap_write don't have a blank line between =
them
> >which makes sense to show that they belong together. So the blank above
> >can probably also go away.
>=20
> Okay, it will be removed in V2.

just realized that I commented on the "wrong" version :-)

https://lore.kernel.org/r/20241231094425.253398-1-andyshrk@163.com
seems to be the most recent one.

Heiko


