Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A434B82DB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319810E8E1;
	Wed, 16 Feb 2022 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB9110E539
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 3ABF71F449B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644954463;
 bh=+wF39v+i9uxNDfcWDhypRIJ638tyJz2rqw6HQGEMdlQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d3zn21eufiv2dWW4/zfxwV3et55Zy0Hdl5er4draQrp9tYcMKEmp7DJwOUM524+48
 mBWMq1rflGWirNr/0VaAEkK1rWaaxQWAo6plZcUOdk0527vp9Xus39ypxCTCMV3TFu
 YEMLg33T4FTWV0+RvlQiWq4W3ywruzN+9dpGOPjLCffuICXcjjZUopehbyhdYhwKdl
 UPPHWlpcoWwaKFHdAOFCP3IWD+ylbYl7TugczKA8EpPWeP4zWJfbmQAZV27UM1w6uG
 fXbS6U2JrEbQ2tvFk3zQDwcT2nKZcphvCGUmU3iZDySC4Gjk43oZn6IKmzc35EppMK
 BCAedlwL6vjFg==
Message-ID: <09ed17be-5780-011b-6801-87a5afd4e907@collabora.com>
Date: Tue, 15 Feb 2022 22:47:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220209095350.2104049-23-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 08:23:45 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


09.02.2022 12:53, Sascha Hauer пишет:
> +static irqreturn_t vop2_isr(int irq, void *data)
> +{
> +	struct vop2 *vop2 = data;
> +	const struct vop2_data *vop2_data = vop2->data;
> +	uint32_t axi_irqs[VOP2_SYS_AXI_BUS_NUM];
> +	int ret = IRQ_NONE;
> +	int i;
> +
> +	/*
> +	 * The irq is shared with the iommu. If the runtime-pm state of the
> +	 * vop2-device is disabled the irq has to be targeted at the iommu.
> +	 */
> +	if (!pm_runtime_get_if_in_use(vop2->dev))
> +		return IRQ_NONE;
> +
> +	for (i = 0; i < vop2_data->nr_vps; i++) {
> +		struct vop2_video_port *vp = &vop2->vps[i];
> +		struct drm_crtc *crtc = &vp->crtc;
> +		uint32_t irqs;
> +
> +		irqs = vop2_readl(vop2, RK3568_VP_INT_STATUS(vp->id));
> +		vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irqs << 16 | irqs);
> +
> +		if (irqs & VP_INT_DSP_HOLD_VALID) {
> +			complete(&vp->dsp_hold_completion);
> +			ret = IRQ_HANDLED;
> +		}
> +
> +		if (irqs & VP_INT_FS_FIELD) {
> +			unsigned long flags;
> +
> +			drm_crtc_handle_vblank(crtc);
> +			spin_lock_irqsave(&crtc->dev->event_lock, flags);

IRQ is disabled inside of ISR(), no need to save/restore the flags.
