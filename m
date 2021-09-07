Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11D402564
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F67289DB8;
	Tue,  7 Sep 2021 08:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F189DB8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:47:46 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNWla-00021I-Tr; Tue, 07 Sep 2021 10:47:42 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNWlZ-0006Tc-Ea; Tue, 07 Sep 2021 10:47:41 +0200
Message-ID: <116f1a0283f43f97fdcfc4949e8b3c9cccc08d34.camel@pengutronix.de>
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 07 Sep 2021 10:47:41 +0200
In-Reply-To: <20210906193529.718845-7-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Markus,

On Mon, 2021-09-06 at 21:35 +0200, Markus Schneider-Pargmann wrote:
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
>=20
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
>=20
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
[...]
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> new file mode 100644
> index 000000000000..1bd07c8d2f69
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -0,0 +1,2881 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +
[...]
> +#include <linux/component.h>
[...]
> +#include <linux/extcon.h>
> +#include <linux/extcon-provider.h>
[...]
> +#include <linux/kthread.h>
> +#include <linux/mfd/syscon.h>
[...]
> +#include <linux/of_gpio.h>
> +#include <linux/of_graph.h>
[...]
> +#include <linux/phy/phy.h>

The list of included headers could be pruned a bit, from a quick look it
seems like neither of these are actually used.

[...]
> +static void mtk_dp_ssc_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> +			   DP_PWR_STATE_MASK);
> +	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_PLL_CTL_1,
> +			   enable ? TPLL_SSC_EN : 0, TPLL_SSC_EN);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
> +
> +	udelay(50);

Can usleep_range() be used here? Same for the other delays.

[...]
> +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
[...]
> +
> +	if (DP_GET_SINK_COUNT(sink_count) &&
> +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> +		mtk_dp->train_info.check_cap_count =3D 0;
> +		kfree(mtk_dp->edid);
> +		mtk_dp->edid =3D NULL;

Should this be protect by a lock? This looks like it could race with the
access in mtk_dp_edid_parse_audio_capabilities() or mtk_dp_get_edid()

[...]
> +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D mtk_dp_train_hpd_handle(mtk_dp);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in)
> +		return -ENODEV;
> +
> +	if (mtk_dp->train_state =3D=3D MTK_DP_TRAIN_STATE_NORMAL)
> +		return ret;
> +
> +	switch (mtk_dp->train_state) {
[...]
> +	case MTK_DP_TRAIN_STATE_TRAINING:
> +		ret =3D mtk_dp_train_start(mtk_dp);
> +		if (!ret) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp_audio_mute(mtk_dp, true);
> +			mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_CHECKTIMING;
> +			mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> +		}  else if (ret !=3D -EAGAIN)
> +			mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_DPIDLE;

A small whitespace issue and missing braces.

Consider running this through checkpatch.pl --strict once for style
issues.

[...]
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp =3D dev;
> +	uint32_t irq_status;
> +
> +	irq_status =3D mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;

This check seems superfluous given that only the
RGS_IRQ_STATUS_TRANSMITTER bit is checked right below:

> +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> +		return mtk_dp_hpd_isr_handler(mtk_dp);
> +
> +	return IRQ_HANDLED;
> +}
[...]
> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +				    struct drm_connector *connector)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +	bool pre_enabled =3D mtk_dp->pre_enabled;
> +
> +	if (mtk_dp->edid)
> +		kfree(mtk_dp->edid);

Unnecessary check, kfree() accepts NULL.

regards
Philipp
