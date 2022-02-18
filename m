Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB2C4BB5DD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B410F04F;
	Fri, 18 Feb 2022 09:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1A210F04F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:44:42 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l73so7346975pge.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A05PdbAAT5RslfaLGjSbZiT8ptnvoIwXk5E/3L39Ufg=;
 b=T0KmbCAcbHo6p3GrUSCrkagNNqE2crxXfZSeqk+5honbSzuhtAE9KEz5/lmcQ/sU9R
 NZW/3hlrs+2l2sgwdeX+mMx4VP5uALRlgzmL7S5+S4o4vI1YqV37sXdc9+5y83KePNt0
 mPh5HvxoMVlgrY9vUd8HAevxii2MA64VEUia/zTnhKiTwpjY1ONo50Z1on+J8PHNCBCZ
 8HuH8fHKDKL/VvS9QboVlXx7xJpk6J56My0pVXew+3RkpaGaNGeBJ2LOP9HpGmf3HgCx
 fKy9wv7je5/yCcpnHpFi+KTbtafD/zw3YllaW9DuBW0iS2fW/JrmBsmDN2X8jPYixDMR
 0Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A05PdbAAT5RslfaLGjSbZiT8ptnvoIwXk5E/3L39Ufg=;
 b=2hX1sOQzm8hRC2uhjIC/l4ib0WGugo5+CKHodjwiNaWcyZAb3Js302XYpFO/Z5rlHU
 VhyKA1T/Ed8YLG8CbWPzgEFXlnE//+H4n+3jqM+K/1Kd3JlXkwSvSoRErbr+B+FSQu16
 alP8gEVtV3bdkOfz7id1RMVJoqM//4hBlwIaMPs+gcj7y1gX9oGCdcRKUiv2t48akOW0
 psELZX8/pDIPqv7rJNQ8vPwFQMVmoKfTyLRZkydIbL7tvY7cPmVCB7EuvHrwJeo42/ZO
 BHoNMCJReCyqGvzMBUDqoC6TK4n6D01q1hpiOg6dgDEoG/nW+XMSI7oZNud5LqSKWppc
 hTvQ==
X-Gm-Message-State: AOAM531/kh+kGUUr0Jtwb9sZctnkLK9UBdBzG3L7jMxcvCHWFvpHoF9F
 ONAVW7NuWtIbQdcHqUUbDvE=
X-Google-Smtp-Source: ABdhPJzgkWXMlWqPifpwnUsfJUPZqinF4EGSp9R2f9iaH57jBs4n1/LQLaP+/O0MtcT0WDTDneU4yg==
X-Received: by 2002:aa7:88cb:0:b0:4df:7b9e:1cc3 with SMTP id
 k11-20020aa788cb000000b004df7b9e1cc3mr7265229pff.82.1645177482532; 
 Fri, 18 Feb 2022 01:44:42 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id j14sm2284741pfa.81.2022.02.18.01.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 01:44:41 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
Date: Fri, 18 Feb 2022 17:44:17 +0800
Message-Id: <20220218094417.1631559-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org,
 Daocai Nie <niedaocai@huaqin.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>

Add support for the 14" innolux,n140hca-eac eDP panel.

Signed-off-by: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7bfcf63d48e..f5f9c9cb26ba 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct display_timing innolux_n140hca_eac_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 80, 80 },
+	.hback_porch = { 190, 190, 190 },
+	.hsync_len = { 60, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 38, 38, 38 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n140hca_eac = {
+	.timings = &innolux_n140hca_eac_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+};
+
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
 	.clock = 206016,
 	.hdisplay = 2160,
@@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,n140hca-eac",
+		.data = &innolux_n140hca_eac,
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-- 
2.25.1

