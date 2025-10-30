Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD813C2112C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAF10EA01;
	Thu, 30 Oct 2025 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BABF10E9FC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:00:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1vEV4A-0004VY-QL; Thu, 30 Oct 2025 16:59:58 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1vEV49-006Egv-2T;
 Thu, 30 Oct 2025 16:59:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1vEV49-00000000DJV-2o09;
 Thu, 30 Oct 2025 16:59:57 +0100
Message-ID: <b8b2ae426c8f79664f5b54c5ddb4511a086d3c86.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm/imx: parallel-display: fix
 drm/panel/panel-simple v6.17 WARNING regression
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Ernest Van Hoecke	
 <ernestvanhoecke@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 16:59:57 +0100
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Di, 2025-10-14 at 13:30 +0200, Luca Ceresoli wrote:
> This series fixes the WARNING regressions reported by Ernest [0] and due =
to
> the missing conversion of the DRM_IMX driver to the new
> devm_drm_bridge_alloc() API.
>=20
> The second patch also adds drm_bridge_add(), which is a good practice and
> proposed to become mandatory [1].
>=20
> [0] https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r2=
23ar3txri@3ik53xw5idyh/
> [1] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-=
attach-v1-0-92fb40d27704@bootlin.com/
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to drm-misc-fixes, thanks!

regards
Philipp
