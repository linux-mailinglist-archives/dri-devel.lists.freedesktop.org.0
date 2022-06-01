Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4D53A11E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B78E10EB54;
	Wed,  1 Jun 2022 09:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B4A10EB53
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:47:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c196so1501267pfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/72CEn/8tEBsrCbwpSKpFCIgi9sYAXiNEhikH0IRpA=;
 b=OS+nvMctRYsuTwiXTJRqbgZKnlvrlKjvQu63bS3tE+z2ocwPpH+8Be8ETuIRFu1Bpm
 lzFSCn4cLpLN4zoriukqzBwgN/EobgeDfPFSG3Zm2uEEqlCB8YTCxRZ92yS+SNWZeqPD
 ZWiz7cFBMmKJ8XT1LNNfAPpMY17jnT59h3r1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/72CEn/8tEBsrCbwpSKpFCIgi9sYAXiNEhikH0IRpA=;
 b=G7VP/1m7NZAsrV+3rXBNVzMJT8e+FQTXC0VkEqjlH8TxxrDbvlDcSO3u+OlGUdJYph
 9UdjGNDICzKRALBJCcdePbdSS7F09Q44wjYS6vR0Ij/uFtMkP2njEkKW7YbUE48nzMqA
 giS/izMnVUHOayGVwwWULv7qYOEI3attkfnPCPrjya1AFwxywdVVgHYzBH8jmDOMdoiT
 ySXN4zXYs+2HjRb6e7qdfcctSRlofjF/Oht07BaxJJHcA6r2dq9hrpUAu1l3pbZhdtyU
 t0GB5Bj/bo33IiOwOD9HnjyZ8PVcacvN/KqGRZQBRlLR8QLJVn4L74GvvIAuPP8qHB/X
 RNkg==
X-Gm-Message-State: AOAM531aSPfN4S0s4fvlLFtw12GP2OU6r0NmpwFLw7z8rMGwXQ9QlT+5
 kTEITVDHv/JbmSWkiu+LNFAICg==
X-Google-Smtp-Source: ABdhPJyQ5pLVueYfHXGuwinz70Ri9IG7lJaHjQY79NIVs7H7BxNtxvVzpvSC7OIOWWsYFbqCZuKYlw==
X-Received: by 2002:a63:341:0:b0:3fc:824e:86bf with SMTP id
 62-20020a630341000000b003fc824e86bfmr4498754pgd.140.1654076824594; 
 Wed, 01 Jun 2022 02:47:04 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:47:04 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 17:46:35 +0800
Message-Id: <20220601094637.1200634-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..238b6a75d2ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -858,12 +858,20 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

