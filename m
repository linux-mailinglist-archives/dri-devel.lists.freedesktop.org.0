Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E6874107
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46309113501;
	Wed,  6 Mar 2024 20:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PG/UncUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772F01134FF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6e6568e169aso145235b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755438; x=1710360238;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JCkj6GVRUNO967KT3bkL0DjQ/CoTjKrWRf8htMUslg=;
 b=PG/UncUeAM1ikSHjNZr8a92qRwwDa6pEMH3hzDJoVnr5t37OT2WSpWm1UXXOfTvrcj
 HSDFeXyb8ne9gXS5HzZ8qg9tfZCv1e57e4P8NEL2gkoVXrvr8w1CCMPsWpyNmqLPAoS6
 58rVRSMMm0C8Qebaz1vLYntibNj60q7yW1j3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755438; x=1710360238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4JCkj6GVRUNO967KT3bkL0DjQ/CoTjKrWRf8htMUslg=;
 b=s0McooYF9o3qYmoyaa/nkiuShZITUIBaoKdn0QL+gofVI6ABjpvY2LrFl2FLD4ubTx
 zhAdM7oKUqc4yV4JCushLTLP14kaiOmR4q4H2qgYD45gp2cAwpU+oD/TEpd2mXVeDYWo
 9Zh5YJGFQof4WBmBS0vUME0sA99r1UhU2gaFRdl1RsCZ85tJTeH36aqZGH7PNlScFUPD
 fc3cmOztRt24qa65aiYPz9ay0Oi6AlTjONRTj8x/kdyiFzIaBVVRqT7PokL2hgL3EFnM
 2dYxadCeb8FgvTTr2dg9edTIMyaSBUAZMssQ11gUEoU+fJZU5AwiMbTh2/nKXAQswfKQ
 JxyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLj9fZTA9GEISeFT2aa+4VhqmLL/VxrrC50XKbL1+L0wahg8QW/9NlnMzxthwyEB1E3C9KOS81g7XynjFCagASeV92FSpd+jhU2P3/DtYQ
X-Gm-Message-State: AOJu0YxxYcejMUF/7FbTTvSQHMVBN59+s+pSYLgRoM5uEgQKPS4IUb+v
 njg+RLnE24qif2O++2SVSr8A0/7S/ercxau7OoCuNszLfhWEG8NX68WOAokErg==
X-Google-Smtp-Source: AGHT+IHUlhDXpMflxQ7aiaCnsIh19pRSvBvh8iAGRXwrLu9WFPh0MIGQKicT8WXJgg+viWcZikJTdQ==
X-Received: by 2002:a05:6a00:4f8d:b0:6e6:16b5:2eac with SMTP id
 ld13-20020a056a004f8d00b006e616b52eacmr13189150pfb.29.1709755437897; 
 Wed, 06 Mar 2024 12:03:57 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:03:57 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] drm/edid: Clean up drm_edid_get_panel_id()
Date: Wed,  6 Mar 2024 11:55:52 -0800
Message-ID: <20240306200353.1436198-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306200353.1436198-1-hsinyi@chromium.org>
References: <20240306200353.1436198-1-hsinyi@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_edid_get_panel_id() now just directly call edid_extract_panel_id().

Merge them into one function.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v4->v5: new
---
 drivers/gpu/drm/drm_edid.c | 39 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8c7e871eff58..febe374fa969 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2743,8 +2743,24 @@ const struct drm_edid *drm_edid_read(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_read);
 
-static u32 edid_extract_panel_id(const struct edid *edid)
+/**
+ * drm_edid_get_panel_id - Get a panel's ID from EDID
+ * @drm_edid: EDID that contains panel ID.
+ *
+ * This function uses the first block of the EDID of a panel and (assuming
+ * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
+ * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
+ * supposed to be different for each different modem of panel.
+ *
+ * Return: A 32-bit ID that should be different for each make/model of panel.
+ *         See the functions drm_edid_encode_panel_id() and
+ *         drm_edid_decode_panel_id() for some details on the structure of this
+ *         ID.
+ */
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
 {
+	const struct edid *edid = drm_edid->edid;
+
 	/*
 	 * We represent the ID as a 32-bit number so it can easily be compared
 	 * with "==".
@@ -2762,25 +2778,6 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 	       (u32)edid->mfg_id[1] << 16   |
 	       (u32)EDID_PRODUCT_ID(edid);
 }
-
-/**
- * drm_edid_get_panel_id - Get a panel's ID from EDID
- * @drm_edid: EDID that contains panel ID.
- *
- * This function uses the first block of the EDID of a panel and (assuming
- * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
- * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
- * supposed to be different for each different modem of panel.
- *
- * Return: A 32-bit ID that should be different for each make/model of panel.
- *         See the functions drm_edid_encode_panel_id() and
- *         drm_edid_decode_panel_id() for some details on the structure of this
- *         ID.
- */
-u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
-{
-	return edid_extract_panel_id(drm_edid->edid);
-}
 EXPORT_SYMBOL(drm_edid_get_panel_id);
 
 /**
@@ -2881,7 +2878,7 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  */
 static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 {
-	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
+	u32 panel_id = drm_edid_get_panel_id(drm_edid);
 	const struct edid_quirk *quirk;
 	int i;
 
-- 
2.44.0.278.ge034bb2e1d-goog

