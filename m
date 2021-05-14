Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D824038191D
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CAC6E40C;
	Sat, 15 May 2021 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E9C6E243
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 08:40:45 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c13so10738432pfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQD5W//6qmU+fiOo2Heku1L5eiqC6QuwAWjwU59qtmI=;
 b=fOmKA+Y0CyFV2ByMsQ3u0D996/to6XI1BcFSpDr0UsQIsX3fmKDEBwaSV+PeIUcUjk
 rU4c0g2xt8Jo40by7Z8SRvYqcPBjZOPSeuNvfsVjwix0y5QWF1Eslqvj8AhpFn3bsKmA
 Ufhf6E902r6/q4gF2nIbxy+OA+yYVQ9bub0dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQD5W//6qmU+fiOo2Heku1L5eiqC6QuwAWjwU59qtmI=;
 b=A8Kam1QxTMZQVg3FnG03Bx55VBo/M6ukoTlNcQthjIFDZWne/IvvbgC1ymqlFXCd97
 2I1RrHGtUElnILvuWibxuoKdcFGLAUtvy8jeAwZCAq3XopjgsGCvHshAo0azf2mGWMCc
 UKqWyi4bbz/PLXBC4j3aoPmRggA0k97U0BTrpLqAoNsX80+q2BedfkDLp3v7qtguaOX+
 9bAhsUKn11KwAp8KvB7ZQz2VZLZlzispbZULbGV6ACaahiZNLJsi+IlAH0vgL/dPMhf+
 4CrEXtrCVRDa+x2pA5NCd+DCkqiCeHuVCJng0QJvJ5yJTHXiceGDzbNZ/zsv4M3WhlFu
 gqYQ==
X-Gm-Message-State: AOAM531Xu1XWxMDDPAFre9xR6bGhyswPQrA6ZAguiSXrOmabXceq9B6s
 uDlVODgNm+EkDMHWuZxIkBXPDQ==
X-Google-Smtp-Source: ABdhPJw/f6yVtndqEXsRSCqmitdwfa9LxhD1IuosqXYqYMkyP9uKMU7QK5ejWV4YqZzKdofZPuWOBQ==
X-Received: by 2002:a62:4e96:0:b029:2c5:3067:90ab with SMTP id
 c144-20020a624e960000b02902c5306790abmr21762308pfb.38.1620981644891; 
 Fri, 14 May 2021 01:40:44 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id oa3sm6811843pjb.1.2021.05.14.01.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 01:40:44 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v4 2/2] drm/bridge: anx7625: add suspend / resume hooks
Date: Fri, 14 May 2021 16:37:43 +0800
Message-Id: <20210514083804.3594748-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210514083804.3594748-1-pihsun@chromium.org>
References: <20210514083804.3594748-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 May 2021 13:35:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add suspend / resume hooks for anx7625 driver, that power off the device
on suspend and power on the device on resume if it was previously
powered.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---

Changes from v2, v3:
* No change.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0a53d6a2343..4f5537c9b3d4 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1707,7 +1707,34 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused anx7625_resume(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->pdata.intp_irq)
+		return 0;
+
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
+		anx7625_runtime_pm_resume(dev);
+
+	return 0;
+}
+
+static int __maybe_unused anx7625_suspend(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->pdata.intp_irq)
+		return 0;
+
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
+		anx7625_runtime_pm_suspend(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops anx7625_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
 			   anx7625_runtime_pm_resume, NULL)
 };
-- 
2.31.1.751.gd2f1c929bd-goog

