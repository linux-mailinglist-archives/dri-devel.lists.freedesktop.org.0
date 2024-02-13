Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C715F852AB7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F78110E410;
	Tue, 13 Feb 2024 08:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nujxj16x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2F10E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:17:14 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5678515C2;
 Tue, 13 Feb 2024 09:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707812225;
 bh=9m5KGOCuoxEboIm7ISn1H7ymbfhZyzGAdsVPUFGEUFs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Nujxj16x/71Mipo+7k7H6Vb52scs2D3vAx3kUESeoecn1+92JHEmcALH3XF+93qYm
 5ygRBB6ivJ3U0qQrK0VrkyCCZ7WGYXgofo0Zn4Tu0kLwP76BQt1+lQBbJftyqLIlw9
 H4fRLItjWH+lJE8LQgNuu6+An5CqbaGbl0fBhZFw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 13 Feb 2024 10:16:37 +0200
Subject: [PATCH 2/2] drm/tidss: Fix sync-lost issue with two displays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-tidss-fixes-v1-2-d709e8dfa505@ideasonboard.com>
References: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
In-Reply-To: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9m5KGOCuoxEboIm7ISn1H7ymbfhZyzGAdsVPUFGEUFs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlyyV/PKaDqj8BU7nZv3kGkUVewpGZevzHN23SW
 21DZri8+PGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZcslfwAKCRD6PaqMvJYe
 9URzEACrf0IrNFIbW2TM83jy0NHz052ksxO6HTVcgqRmRkG+cetyU72kmxhmeabSNtJ4ApQCT6L
 9RC+qRxx+as4n/sbvTGHLzQhmcwvcZQoM3H6aGJRIijiDNAjg/EMS0oYoZuVDDgrBjrr4fm7aS3
 XyK5qR8skhHz4WVi+iBXOhiWEgsXWUbyhyNxfUYFIHBvvglS0GgY6a8gBKSsWjvpN2k/+XWGkDH
 JypW3RqRa91dFbhMCDy1ButhP9eE4RUrhRI7lEAj0RUAZxXMp6bDj1cSUlPs3ZIlWMhQtgK2b/e
 vLncLDjlX4kfx00JHVHLHPenMq0yyMiz5XY5NDQdKD32af/2TLL44/V/xwRLogg6RN9jEZt8Cpn
 3ZkaDFd8xDhk58bRA327qg2e5p3OPE2ipr5PETUMZ1QnN4wI8Lsq1Rhc/O6xIUoQOJldUNycGUz
 a7CFjKUKiQ21YA5y9kJ1j6w/dBNXAsq9LzmjtO82oRz5tHxXkRn3+tcsfyqVUXp99fs/x7ICpKh
 FMi//zkTr4MYqpWJw5Th2xqA8oXI21C85c6fu/JNUEU3m07r/8ClGL625lnIkSbtMSFJXKSpxHE
 7HV9FCzJNQVIAInytwvwLgq76aj/d1wW9UtvWN4HX/4/EZtYOGVtp5BW1+QfRzIzdIkhqHyTQyA
 Bgr+FC6Vr1c+BOg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

A sync lost issue can be observed with two displays, when moving a plane
from one disabled display to an another disabled display, and then
enabling the display to which the plane was moved to. The exact
requirements for this to trigger are not clear.

It looks like the issue is that the layers are left enabled in the first
display's OVR registers. Even if the corresponding VP is disabled, it
still causes an issue, as if the disabled VP and its OVR would still be
in use, leading to the same VID being used by two OVRs. However, this is
just speculation based on testing the DSS behavior.

Experimentation shows that as a workaround, we can disable all the
layers in the OVR when disabling a VP. There should be no downside to
this, as the OVR is anyway effectively disabled if its VP is disabled,
and it seems to solve the sync lost issue.

However, there may be a bigger issue in play here, related to J721e
erratum i2097 ("DSS: Disabling a Layer Connected to Overlay May Result
in Synclost During the Next Frame"). Experimentation also shows that the
OVR's CHANNELIN field has similar issue. So we may need to revisit this
when we find out more about the core issue.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5f838980c7a1..94f8e3178df5 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -265,6 +265,16 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	reinit_completion(&tcrtc->framedone_completion);
 
+	/*
+	 * If a layer is left enabled when the videoport is disabled, and the
+	 * vid pipeline that was used for the layer is taken into use on
+	 * another videoport, the DSS will report sync lost issues. Disable all
+	 * the layers here as a work-around.
+	 */
+	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++)
+		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, layer,
+				       false);
+
 	dispc_vp_disable(tidss->dispc, tcrtc->hw_videoport);
 
 	if (!wait_for_completion_timeout(&tcrtc->framedone_completion,

-- 
2.34.1

