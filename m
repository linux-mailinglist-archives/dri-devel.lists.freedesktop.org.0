Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F05444C6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2855B10FAF1;
	Thu,  9 Jun 2022 07:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152CF10F960
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:55 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y196so20361738pfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQhOn/YiixyOJw4v/o8WRfr7u50AUleNhUdb032jkoc=;
 b=L7jS/0Ul8GyfGFjRHSjlC/3V1YgWm5fckAx4cb0ozB4CuNwCbDePiYLy99VKkO4eYR
 vsIEwXCARojXs6cMBuEgOpj5milTERUvgpkWcuL7Sfsn8AInOOdQvfSoVcc334NhuGZ4
 7TUKV91TAvpAbsMABW8YLDZN6I2yI6bugPIPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQhOn/YiixyOJw4v/o8WRfr7u50AUleNhUdb032jkoc=;
 b=v/IA3shppwk0NcGGSVzZF8B5cBJ0Yag7HmCwJLjyMYR9Db/fdz0vQ3biI/Nmq78yab
 55jhrYFInjd1lclOfzR4B+/KFqQjshcQ51jbYUTLdsQbraRsIrK/tlzXEG1qUIJu71TJ
 mKt5R/kLcmxrwxaZxCCR835WlhyW8H7EMTwdsCl9fCdXZ8QoUT+ofFQiSDwWZhJxwH11
 hVA3MC9dTI9iWp/umEaKdp9r60aGr0ueVCJZ8v8CKzKjHQeI8NoZaMSlfXS8rF7ZzAww
 pKTx/b7VrYJRyk/T7JU5DU6m6ma/2G6kWobAnBiAKz449sZmkYVxgyfrF+lfLXOtkt1I
 dapw==
X-Gm-Message-State: AOAM531TsjaRVK1BoX2Hv+bbk1YHrhD++WdrIsMzu4ctTG+UhU5DzGWK
 P+aHlWy77DFquqr6ZDQ6XTI2PQ==
X-Google-Smtp-Source: ABdhPJwaokvXUJTqJoAx08HJzYQQnKmSiU3Qu9ykQ3bFrg5pAH7mwkib4XyJbC+tUSapAx+aGXawRQ==
X-Received: by 2002:a05:6a00:1805:b0:51c:3a7:54dc with SMTP id
 y5-20020a056a00180500b0051c03a754dcmr23846453pfa.15.1654759674657; 
 Thu, 09 Jun 2022 00:27:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Thu,  9 Jun 2022 15:27:19 +0800
Message-Id: <20220609072722.3488207-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b7..b4b9195251891 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,10 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,12 +437,21 @@ static int panel_simple_get_timings(struct drm_panel *panel,
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
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
+	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-- 
2.36.1.255.ge46751e96f-goog

