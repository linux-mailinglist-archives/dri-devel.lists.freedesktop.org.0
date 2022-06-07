Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7953F90C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73711A702;
	Tue,  7 Jun 2022 09:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E60112DF1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:20 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 187so14978457pfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
 b=oSqdlpz/+1EVr71yB5JJSZiahSwMJDpQSfi0wg1oZhrGuVUcVGy+jjbo99bnZ670g4
 YuHEr+1VVs1fkdFx3qoAXUrtK4owpH0jzwPZtKVMjcUqYFTRSKP1dszaqK07o7LDBheh
 UmjUb4CHeVsjZ4zgrxSOiVJT9dGJ/kSflLBM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
 b=6aHnRZkp13HCnaHsR23mo7sBFW0apRAqH0ZLsSkOI7CojdiTACC6g7y46Jwq7xT1o2
 lC5O0if0e5emZtBj9qscLZgF+X8MDKK6t+Cb6rY7b9X3yvkCnPlR/Lgt6yrr380DOnem
 8WeBOTgbWyq8k4jZm+mzKyC58RvfRB3h40Xo0Jbg3FexzFOoh/ieOIfD938RnsK9kmMr
 M97efTGZjTXv/7h5PicfHGiSNv72ubTfdif/J6ZwwAiotEXk7/r+MqZXuisbTY5rPCLL
 Gg/FGsdJ/ackUgQUU5z17JgtWiwtCYmB3HLaL5dl0BsLN0jUuV8pMM4IHPXGCVYY4Brf
 KB2w==
X-Gm-Message-State: AOAM532XHl2wcDXE9/rXKu9vt3nQoXvIH2JgWn9Q+Dmz+llmhjwbbUvh
 4YIyU0+n31kXNK7fpiCTuarW6g==
X-Google-Smtp-Source: ABdhPJx4/R3wgiPjf10Tc6Ix6ehs1YFuhLKxv4LZf8DhLrSrjuaQEmxY4+09E9Xrn4CO2l/wwZLFbQ==
X-Received: by 2002:a62:ce4f:0:b0:51b:ac5c:4e49 with SMTP id
 y76-20020a62ce4f000000b0051bac5c4e49mr28557254pfg.81.1654592780106; 
 Tue, 07 Jun 2022 02:06:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:19 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Tue,  7 Jun 2022 17:05:48 +0800
Message-Id: <20220607090549.2345795-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..fa613d1d7a8f 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,27 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

