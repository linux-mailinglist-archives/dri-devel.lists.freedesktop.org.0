Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C5232DA0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 10:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B476E894;
	Thu, 30 Jul 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94E96E894
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 08:13:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t23so4396530ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 01:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWJRHZ1ZuaSX3iNfV25S/VOHlfOESHtRVBg0I8TPzUw=;
 b=cANn2wRUPVKWJuI9G6aYy8rgZx8aO7NV1kLe/4J5F5CAC6CUcf/2cbiVetS+62V6i/
 jsDvNUzaIRK885Fyu7YP1sSYoCTazThhkSjqPkzqPKD4TKtq27OOHNtIaLg/McdH/b2W
 Isi1KQaznweqRBKe86fUQ/LvSAQYXVGMBsTJZsLnHqPP+HDRgybPUsjd96ewYHcYafVf
 SwVRJfEjtZjS217nwR7AdJPQ+45RgCncZA1zhkVWdSdtss2O6BTtCpAqBSLhi8Z0A3Nv
 x5YGEApi1xRfwJJEO0tMPLCj9fcgRIqNoYDqzPx5WHfsKvGC239ECKrGcmKndwWvS1fs
 B5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWJRHZ1ZuaSX3iNfV25S/VOHlfOESHtRVBg0I8TPzUw=;
 b=RmnVGGYBnISARPdu2Yfgqd2UFjS9jgodeyIr4JfluxkF2/QWNIWAsob59nXATfYEGk
 vEeG3nScF3BUULt0xmmtkescUqYF+82G2h41uEQy093VBIcSHwDqNiankwRtJ5qQ0MeH
 PRx9l0EmjgKNhd8cnWlqXaAAD+OrwH0olONE1vV+iXPadJ8IwJ7xVb9Qa1rk7M/lFBqH
 iOk7yj15mJIezHuc2V9rCIfEjYeu9Ln+W6Cu9Qi1T1mZe93oMbK701g9gY7kMS1OoPFl
 RdVSvSO7cmeK0ZnJwzlJELS2zPrrNdnU3VupnpvqeHYg8lSoIzNXITEt4lT55sg/g5wJ
 5IBQ==
X-Gm-Message-State: AOAM531mrPQrqluxLEnwXFRYBzr2RpERXRP1OQtpa8eCU9q5KYbuRg4W
 ZhN5j+Dxe9HXwGShGAtHNZCNk82mxHuj+w==
X-Google-Smtp-Source: ABdhPJzKZg/UXw12STP712u9tGhyTgIpfolQi9JWx7nN61izSi/1xgactqExZJ3LmpxW08WTiTvJtw==
X-Received: by 2002:a2e:b0e9:: with SMTP id h9mr964976ljl.3.1596096788855;
 Thu, 30 Jul 2020 01:13:08 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id z186sm1015860lfa.6.2020.07.30.01.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 01:13:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Retry DSI read/write transactions
Date: Thu, 30 Jul 2020 10:13:06 +0200
Message-Id: <20200730081306.34783-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vendor driver makes a few retries on read DSI
transactions, something that is needed especially in
case of read (such as reading the panel MTP ID) while
the panel is running in video mode. This happens on
the Samsung s6e63m0 panel on the Golden device.

Retry reads and writes alike two times.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 337c4c5e3947..76fecd7ab658 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -207,8 +207,8 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
 	 (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
 	 (type == MIPI_DSI_DCS_READ))
 
-static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
-				      const struct mipi_dsi_msg *msg)
+static ssize_t mcde_dsi_host_transfer_commit(struct mipi_dsi_host *host,
+					     const struct mipi_dsi_msg *msg)
 {
 	struct mcde_dsi *d = host_to_mcde_dsi(host);
 	const u32 loop_delay_us = 10; /* us */
@@ -353,6 +353,23 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
+static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
+				      const struct mipi_dsi_msg *msg)
+{
+	struct mcde_dsi *d = host_to_mcde_dsi(host);
+	int retries = 2;
+	ssize_t ret;
+
+	while (retries--) {
+		ret = mcde_dsi_host_transfer_commit(host, msg);
+		if (ret >= 0)
+			return ret;
+	}
+
+	dev_err(d->dev, "gave up transfer after retrying\n");
+	return ret;
+}
+
 static const struct mipi_dsi_host_ops mcde_dsi_host_ops = {
 	.attach = mcde_dsi_host_attach,
 	.detach = mcde_dsi_host_detach,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
