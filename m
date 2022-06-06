Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64353E094
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4CB1123B4;
	Mon,  6 Jun 2022 04:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7878211238E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:55 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-f314077115so17928454fac.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQSi4k5+DH2NNzeThmAR4iQ0/H0TraV3Wr+JMjHmwJQ=;
 b=FAtsRXTGQSRmHF3KZa8qcRDi7ZgeV0IHUdd6bGueBBcGZLOnTBmR2RxZuazS+y9q7o
 OjsxgIujdZ2ZNgJQ78+1g6rHMvJ+klHfBwJQ4oMAZXFks8cmh/P7/ooETatdAdTB3Byg
 4eII/roHshTB7nk8UYbDpl+zs1uOsVrtysWCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQSi4k5+DH2NNzeThmAR4iQ0/H0TraV3Wr+JMjHmwJQ=;
 b=WR318HKAlfgtCNBAujo1krKh0aKRWW+oVV0KWVWLzkpfxVsfD8ig5ofUOTcTSwW1Et
 UzEeDkF7jO9bwpey+jyO582LArszuEwSJ4ODt4XqPJY5ilzm4OeyqBccJx440+spOWSe
 Xo3tQngAR7Djx/goOxDxAPwyBa/QFUAFdnuXp0scAyah1WkO4gZ1kjrDzk1d7M2787+R
 KaFDKHCbwHyCDTy4KvHT7aGrQQOAQTAM6BF6QISijiIhGcR+TOpIPkVJ6R4J0/JFwaj6
 BmWJg2egR//WlDTgkMHrDEH8FaH/bcxjVarz5ULZ/OHD+lKLdq7MQahTasm++NIONrO9
 Yb2g==
X-Gm-Message-State: AOAM53324B/yx1p1aVvTGcP0yxxDD+/giMpJoZj2UbXNkDoxmMCWbf8f
 3QV4bUl7GeEJboczYvN0XsOTix4ZL5z59Q==
X-Google-Smtp-Source: ABdhPJw+hjmyVd5Y3lxE71x0n/iIpqeWNV6iXQ9+/Kki/UAwcLC1/X8EJwlXese7X56/wWt85lzakA==
X-Received: by 2002:a17:90a:4282:b0:1de:c783:4e79 with SMTP id
 p2-20020a17090a428200b001dec7834e79mr24215753pjg.235.1654490864436; 
 Sun, 05 Jun 2022 21:47:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 12:47:17 +0800
Message-Id: <20220606044720.945964-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
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
v2->v3: add comments for notice.
---
 drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..82041cdb5478 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog

