Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A7D25B9C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A8C10E7A1;
	Thu, 15 Jan 2026 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lPB2L/bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615F10E188
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768494305;
 bh=/CCrYh7W0suAYtv3OX70FqKaBFbQbCECSAbjQPVaNzE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lPB2L/bnwttiLDcMPaDdYqjIwP+58KHPNjI1HKQSw23LRmbm3+sdU9mUdJCyYMvvu
 8Uz8Who5NCISaIEIJREP1cuV4hLZ9gHkDAle58yEc4whGF7ZRwW8FMzEnWgXMvZDXG
 wAb0XOetcMxGFh5WKNwnoXFdJQP5gDtuq4BDji50ujakd7BGvIdEaqqcl3TnW0ztGZ
 z2HoX47znIOcu90MWsVk0bHpwFTYR2ej92wZZ6CREzx6vJJO3wy99vWNq45b+rUNF1
 DyTAgh+OypfCB2k3fMFyEeR2DKOH4Ls+Pq79SH7ZP9uj9yjHfsmGFR0LkVXMnqPcMU
 tKmUahKaZGqnw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1441917E0CF3;
 Thu, 15 Jan 2026 17:25:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 15 Jan 2026 18:24:44 +0200
Subject: [PATCH 2/2] drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD
 interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dw-hdmi-qp-hpd-v1-2-e59c166eaa65@collabora.com>
References: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
In-Reply-To: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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

The threaded interrupt handler on RK3588 checks HPD IRQ status before
deciding to continue with interrupt clearing and unmasking.  However,
this is not really necessary, since the hard interrupt handler already
performs the very same verification before waking the handler thread.

Get rid of the redundant verification of the HPD interrupt status in the
threaded interrupt handler.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 33b0f032258a..1a09bcc96c3e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -315,11 +315,7 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 intr_stat, val;
-
-	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
-	if (!intr_stat)
-		return IRQ_NONE;
+	u32 val;
 
 	if (hdmi->port_id)
 		val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_CLR, 1);

-- 
2.52.0

