Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965F53F907
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3BF10ED4B;
	Tue,  7 Jun 2022 09:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234A10ED4B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so14866153pjt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
 b=KkdhkZR0WaPbNGFjnV5JiCzsW/4Td/Y1uAFcoXb7bs6qedkwYqr4useNkOhECnjn51
 Aq3h7Q9o6cOxgUZHsiYDmtF1268mVFmhpOCB/F3QQ8y02faY5NkR3KYqvXQzUO7cqmiO
 2nqtwa7AfOlK/1DOFkxqwBsRQTuz59g/WYL28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
 b=ThivkroJldWVepQi+8F10GAZ3IYvjwcE+2VxAiDvj2DaSrLnMH8e6Im3fLJ4aDtDSu
 6nQJHdM2Rvqi+mRZIkDO/qbUoeg4GQnu1OwRdRzzp32ESe/GyXGdmrjl+R8f8QoQjarH
 fDsPSEdatgTJJubUs7d47k/l0sjVM+htNsg7ICtHIt71yB6UmcV7t1DtOzqUMUzObUIz
 FRNVLjmrS05nWmUzWAs5cfRX1k2nL0moVxEDmslmZzQJ1BbFNYHRxVDX2p+o3ep13Rdj
 uEPR4TISB8k9Amm6K6E+5JFySaw2+gA0dkaCwv7xtuS4H1KPTmIUDBBCkSPuouxNqCob
 K7kw==
X-Gm-Message-State: AOAM530Ji4FRlGDYyP1zIntzWJVKUvIuC1Bn8OBCAZJq0sL5EmNyPm0w
 7O+CdA8zEgbFDHe4zuynJdaN6Q==
X-Google-Smtp-Source: ABdhPJxUb/prMt/A7sRaNQTJtn9oWDj3rVo1IOvfLfcAgTaDday8s3jr1NXmj+cqqrwS88WfrUyMFA==
X-Received: by 2002:a17:90a:8b93:b0:1e2:728b:1fa9 with SMTP id
 z19-20020a17090a8b9300b001e2728b1fa9mr31329972pjn.167.1654592769235; 
 Tue, 07 Jun 2022 02:06:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:08 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:45 +0800
Message-Id: <20220607090549.2345795-5-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-lvds.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fe..7a4fedc63e8e 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,28 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog

