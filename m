Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2187A5A54
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACDE10E364;
	Tue, 19 Sep 2023 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-225.mta0.migadu.com (out-225.mta0.migadu.com
 [91.218.175.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612610E272
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:59:42 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695041980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEybRG/z/QiYL8x5ls+wYPU1myIjvupP8IAsRIKh5xg=;
 b=FEW+MOpwp9cGHz48fZOCAK7zxLfyFA4CUAFrB6PZomcNlEIGsGhUu9YN+yjVZsm6WpQWNR
 DPyIrvPVPIkHZ81tGtQ/L+knTLJ0LPoF3thlOez1lfZ4zx3z+WQ4PcwvprhmkX53U9r4cG
 6vdfCR8dAmEptpSNt3V8vFaaFd+cZ5a1V4F6+kbDS0g902b/8m4+nbiuqCDroZnmo0v5CC
 tfdFZMV3a9qM49QY0+4lEVVLCdfPdtpB/51bKPdu41g9mUNL1HsxBfMsh+XxcNE4/jKYhv
 yf4uBAXssBeKi2GcMBz7NmP8jEwSMPLU4ZX6qa8aOI+KkH5YTrkjAZXuPSlAuw==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
Date: Mon, 18 Sep 2023 22:58:47 +1000
Message-ID: <20230918125853.2249187-4-contact@jookia.org>
In-Reply-To: <20230918125853.2249187-1-contact@jookia.org>
References: <20230918125853.2249187-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code waits after resets for 5 to 20 milliseconds.
This is appropriate when resetting a sleeping panel, but an awake panel
requires at least 120ms of waiting.

Sleep for 150ms so the panel always completes it reset properly.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 90dea21f9856..2526b123b1f5 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -258,7 +258,7 @@ static int nv3052c_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	usleep_range(10, 1000);
 	gpiod_set_value_cansleep(priv->reset_gpio, 0);
-	usleep_range(5000, 20000);
+	msleep(150);
 
 	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
 		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
-- 
2.42.0

