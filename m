Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27761489A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEAE10E37B;
	Tue,  1 Nov 2022 11:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4610E37B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 11:28:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71590615D5;
 Tue,  1 Nov 2022 11:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226E6C433B5;
 Tue,  1 Nov 2022 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667302105;
 bh=7r1QOHV06h+9wzOcTmWBQcgWcXag41HhBfVH04SzsOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=doCpQkVEkrCtyIEp6fXWy5cc8w+s4OPCSdGLPiwU9wNq8/mJ8KVFyRlueJwsAVsRO
 5cNz7UkqW+Vxu6wTM6sVqITv9DbwBLBjXjKw1eZ6uwDwyfcykxaHs5GxP1taNJXyd+
 Ohp0YDJIpBZL1g1FrFTcHm6Aab0IPW5jEpwt5OWCC/+D7XGGuFnbEcxKOr4ZlgNLq3
 jt3GZ+jtGzbDvni3FujWG9P1sw/+jIAQ3kmSrSOf9jGqqJPJbrbMQTLZr9K84T+ga3
 fxZH0RNfGkb1OQn3/1ORuKUBXX5t7nHSbo/qrWx8NLcz/vx24t2Pc+uH4EkRxdVMvd
 iF+bUxlcjw+RQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 20/34] drm/vc4: hdmi: Check the HSM rate at
 runtime_resume
Date: Tue,  1 Nov 2022 07:27:12 -0400
Message-Id: <20221101112726.799368-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Sasha Levin <sashal@kernel.org>,
 emma@anholt.net, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit 4190e8bbcbc77a9c36724681801cedc5229e7fc2 ]

If our HSM clock has not been properly initialized, any register access
will silently lock up the system.

Let's check that this can't happen by adding a check for the rate before
any register access, and error out otherwise.

Link: https://lore.kernel.org/dri-devel/20220922145448.w3xfywkn5ecak2et@pengutronix.de/
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20220929-rpi-pi3-unplugged-fixes-v1-2-cd22e962296c@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e5f68704d7d..3d8fc32b4d08 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2869,12 +2869,28 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	unsigned long __maybe_unused flags;
 	u32 __maybe_unused value;
+	unsigned long rate;
 	int ret;
 
 	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
 	if (ret)
 		return ret;
 
+	/*
+	 * Whenever the RaspberryPi boots without an HDMI monitor
+	 * plugged in, the firmware won't have initialized the HSM clock
+	 * rate and it will be reported as 0.
+	 *
+	 * If we try to access a register of the controller in such a
+	 * case, it will lead to a silent CPU stall. Let's make sure we
+	 * prevent such a case.
+	 */
+	rate = clk_get_rate(vc4_hdmi->hsm_clock);
+	if (!rate) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
@@ -2896,6 +2912,10 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 #endif
 
 	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
+	return ret;
 }
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
-- 
2.35.1

