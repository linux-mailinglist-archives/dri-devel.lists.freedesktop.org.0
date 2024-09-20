Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6C97D717
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 16:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F9E10E121;
	Fri, 20 Sep 2024 14:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6784A10E843
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 14:53:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1srf0f-0002Ol-7i; Fri, 20 Sep 2024 16:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1srf0Z-000H55-Qp; Fri, 20 Sep 2024 16:53:19 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1srf0Z-000BDt-2K;
 Fri, 20 Sep 2024 16:53:19 +0200
Message-ID: <13010c194e4674f6bdef84bcf748030a1d46b814.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>, laurentiu.palcu@oss.nxp.com, 
 l.stach@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, shawnguo@kernel.org,  s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,  robdclark@gmail.com,
 sean@poorly.run, konradybcio@kernel.org,  quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org,  marijn.suijten@somainline.org,
 thierry.reding@gmail.com, mperttunen@nvidia.com,  jonathanh@nvidia.com,
 agx@sigxcpu.org, gregkh@linuxfoundation.org,  jordan@cosmicpenguin.net,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
Date: Fri, 20 Sep 2024 16:53:19 +0200
In-Reply-To: <20240912083020.3720233-4-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
 <20240912083020.3720233-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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

On Do, 2024-09-12 at 16:30 +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
>=20
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the=
 crtc")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
