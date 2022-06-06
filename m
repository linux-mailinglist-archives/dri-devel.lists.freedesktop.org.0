Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA953E568
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEAD11233B;
	Mon,  6 Jun 2022 15:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC68112323
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:55 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id o6so7285959plg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a1lnjY8i/+WS666XDlnuCv9IyvqUonnUraywvJyMjlI=;
 b=Yg7NCIfTyeYWU95xPrJ7gstR8zKeMvxvOcu6rI98w5bCid2+Yxt48QhFQi3SGE0wBW
 eV+CFEsv3wJ7eJHTzBRHd8LxWfOnVWesx12yf+tMymjIcOzkVwUTHC0xtQQnDerV8Sry
 YMcSV4DVWPXO4rBZt5BDf6zsZlk09roWCNyRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a1lnjY8i/+WS666XDlnuCv9IyvqUonnUraywvJyMjlI=;
 b=H4qURcCuZ7cLpNDTseqXxRIOK2MtMUfW2e0+tcdsX2F+W5+yczkiqPTwifk6b5lrK+
 FJ3VXKTycQ6t55KkMMj0XOXYEnxR07X80+wx0Rxilcrb5I0xqHyFBxKzfBmFA4yriq3F
 oHhT9mDVdCC7v6U/94n7IIgi6dGAMRmdcmh2GOW1wnGca/nmuRLpP1XfzXxdNQnw0gjZ
 AN7ZyjWAkqxWX3luj/4kiytqIHWicRmOrUtgLn3gnna3oDHIAhT4ZKbPCSAsAd9EK7Yg
 ybM9vxac3gDKb8+hZi099CleD8a0oYhOdb8JpHOVtYxE7drg4IkVkaTUVhPo/W0iwn6I
 /dGQ==
X-Gm-Message-State: AOAM531kXUua4Rdd8/q/vXOYjimwm7HykAJYeCiNeVXC9YUaZ6gBePcu
 qCBy4VugVyXgn1xq7oPg1sNZlw==
X-Google-Smtp-Source: ABdhPJywwp7pRhhliSH9owLMvrc3WOxzZZGXiapJ20kmflDYyQShHfCrO6yi2UNKEJawzzwv33KgGQ==
X-Received: by 2002:a17:902:b581:b0:161:5f37:6688 with SMTP id
 a1-20020a170902b58100b001615f376688mr24315575pls.145.1654529094611; 
 Mon, 06 Jun 2022 08:24:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 23:24:28 +0800
Message-Id: <20220606152431.1889185-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..f232b8cf4075 100644
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

