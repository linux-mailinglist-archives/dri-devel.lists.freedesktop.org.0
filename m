Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58E394994
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9889F6F649;
	Sat, 29 May 2021 00:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4E16E9CA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b26so7739693lfq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujjur94zszGgIhhu9wx//Xlms3XKvAxvzmVcVMJ/zy4=;
 b=kqM2+p0Hguv891RcBKK0suV1ELzSRc50qqYqXHAiq9GH/rzuq1PfNvWq0EFPKnO0PO
 JJEJcMZuC+LnG+4d2Sd0MeibaW5rDCn2rsjM2wDAVv1dYxmV7QaFs09Qoivv+YeWY/ZD
 MD+md4q+IlvBICE4RkgYu5MFD0A8WEwtvrze0gm8vH76OyrYi6OfsiAbDMEobCaaZvmH
 sl8uOoik0F8XI7uEqDwLci6Ari+XW0wCaJre0AmTfXG6Fh5rTMQRa0RU+vQI5IpXOo6q
 n8wUnSeSJT+UtJpPVpHVSDIBkIDttOZN75HpcdEQA631ek0nzhjvc6ll9kB6mqNbvWSx
 FmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujjur94zszGgIhhu9wx//Xlms3XKvAxvzmVcVMJ/zy4=;
 b=a8qld1bY+W5MiIMIEj2DOScUu644ClnNwxM7OE7rbb+XrnqASp1aaXikcfaakXv/Io
 w2Ek5Inm0gCxqOtNOL0hPVKJO6XQ8XEt2xpXsPHiD9UQcMUS56j/xy3haBoNhlW0tIS+
 PXBuVa0o6KjU5AvduQT8HMleXgQQ4fPHTlTfb7HYDA2bdlOU/U+L1w956t3hqwxkB7vE
 ge0/w+LChZBR1iM+UEB4jEXaA0qZNlaHNQk3M4YYObiDVqMfe5RDmDso0ApvNsbGriV/
 snz9d5YPtS53h8hiASMV5+uDJHFtylv5lnwTUdgFTyWVnPWzNHqkkC2nolFSNgxvkBWL
 ZF8Q==
X-Gm-Message-State: AOAM531XQ/fa7NhJQ+/y3woNxiHr1Vd17gMK6NUW3LRYjBvZ6cJNxyaK
 cX4uSFTx/7Roi0f/X77E9anC0Q==
X-Google-Smtp-Source: ABdhPJy4vki0x8J55Lt2zXRGTVAP6ADiL0zjMXA+P3NPR7z06Dx1JEQdqCubmZPaDnhppFqoX5WvPg==
X-Received: by 2002:a19:f012:: with SMTP id p18mr7440299lfc.493.1622247917410; 
 Fri, 28 May 2021 17:25:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 2/8] drm/msm/dsi: save PLL registers across first PHY reset
Date: Sat, 29 May 2021 03:25:02 +0300
Message-Id: <20210529002508.3839467-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Benjamin Li <benl@squareup.com>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benjamin Li <benl@squareup.com>

Take advantage of previously-added support for persisting PLL
registers across DSI PHY disable/enable cycles (see 328e1a6
'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
support persisting across the very first DSI PHY enable at
boot.

The bootloader may have left the PLL registers in a non-default
state. For example, for dsi_pll_28nm.c on 8x16/8x39, the byte
clock mux's power-on reset configuration is to bypass DIV1, but
depending on bandwidth requirements[1] the bootloader may have
set the DIV1 path.

When the byte clock mux is registered with the generic clock
framework at probe time, the framework reads & caches the value
of the mux bit field (the initial clock parent). After PHY enable,
when clk_set_rate is called on the byte clock, the framework
assumes there is no need to reparent, and doesn't re-write the
mux bit field. But PHY enable resets PLL registers, so the mux
bit field actually silently reverted to the DIV1 bypass path.
This causes the byte clock to be off by a factor of e.g. 2 for
our tested WXGA panel.

The above issue manifests as the display not working and a
constant stream of FIFO/LP0 contention errors.

[1] The specific requirement for triggering the DIV1 path (and
thus this issue) on 28nm is a panel with pixel clock <116.7MHz
(one-third the minimum VCO setting). FHD/1080p (~145MHz) is fine,
WXGA/1280x800 (~75MHz) is not.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 36878504bbb8..e5d25b44f8cb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -738,6 +738,22 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	/*
+	 * As explained in msm_dsi_phy_enable, resetting the DSI PHY (as done
+	 * in dsi_mgr_phy_enable) silently changes its PLL registers to power-on
+	 * defaults, but the generic clock framework manages and caches several
+	 * of the PLL registers. It initializes these caches at registration
+	 * time via register read.
+	 *
+	 * As a result, we need to save DSI PLL registers once at probe in order
+	 * for the first call to msm_dsi_phy_enable to successfully bring PLL
+	 * registers back in line with what the generic clock framework expects.
+	 *
+	 * Subsequent PLL restores during msm_dsi_phy_enable will always be
+	 * paired with PLL saves in msm_dsi_phy_disable.
+	 */
+	msm_dsi_phy_pll_save_state(phy);
+
 	dsi_phy_disable_resource(phy);
 
 	platform_set_drvdata(pdev, phy);
-- 
2.30.2

