Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58870872BDB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9377A112DBB;
	Wed,  6 Mar 2024 00:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A+Kf81BE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562DE112DB5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:54 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3c1f55ba3ecso1336000b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685833; x=1710290633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmN32yDBtw8o7MT20mOBDUzK3nXP1eK8tU0sZE85v7Q=;
 b=A+Kf81BE8eKnfjNwupFX67z9nbGqtS99BrWV7y4kI6IeBmCkrJdbbt5C77uO3K2+18
 GXIErd9zO8baCH5Ur/3S1IdlAcRHmU2c5D1wOxyMkMmLQcms9csnMbx0xajks1OB88Ah
 Z1A+C9uw2GilREONy+thv+6M/Qv3q+Yz2vDAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685833; x=1710290633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EmN32yDBtw8o7MT20mOBDUzK3nXP1eK8tU0sZE85v7Q=;
 b=BGgOMmxS260caQhFKBfvWeRqHmfS+wxWoS1wE9/0PIcSJgxEq5WjSUumsRRCPkZL59
 4QFTkHHC5MLHxfKCGzGJYyDWcjumFaY06AmvTmq0s9v56ohz8RP+XYZOt3gJKpRSRzdM
 5m48BENHCIKfWgATDhnhcYMbP4YSW0Um2h+ir9981zQcmyCIk9E7DrQBExN0DZ8zazry
 DYQUwCjX2IBcGk30ggicUr+lfbGo1Fso6mvvB+D4VKO+E/IURjesnm7XAv8aebCXRqRF
 I6dEAix/hmWC6fa92I7NucGLxBQvfq1oiMRvQb7KEFH4BUG/sAWGG5HN9kOXZ7kPwwtA
 iRSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXri/yuFs7vOCL9KT6UEkfkk3OO2VP/hgfSW0q3CJwq7cyOqKLGr0ptGvpYGU/tBeJ2jNYbhQPHR99WuaKQYItvSQR4G5hTIivYWn7QsPHh
X-Gm-Message-State: AOJu0YwryebU0lewkPw6U4mNbztUobFq8nH8TJpFwnoXpRy8Ug7vkjQ/
 HBfO6aOjnIH62oZRoO4NwLSi7IoTqwUN2B1vYwmxTMF34Md8+vhuAJCgvs+LHg==
X-Google-Smtp-Source: AGHT+IF9JDWMnbkfo7qAITIq4vU3d+C8vqidkBtNkEVN4h5JsUh1v6Vd9HjSE/5hv0doQQPhuxukSg==
X-Received: by 2002:a05:6808:610:b0:3c2:1ab4:3323 with SMTP id
 y16-20020a056808061000b003c21ab43323mr472567oih.51.1709685833369; 
 Tue, 05 Mar 2024 16:43:53 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:53 -0800 (PST)
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
Subject: [PATCH v4 3/5] drm/edid: Match edid quirks with identity
Date: Tue,  5 Mar 2024 16:34:03 -0800
Message-ID: <20240306004347.974304-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306004347.974304-1-hsinyi@chromium.org>
References: <20240306004347.974304-1-hsinyi@chromium.org>
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

Currently edid quirks are matched by panel id only.

Modify it to match with identity so it's easier to be extended
for more complex matching if required.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v4: new
Per discussion https://lore.kernel.org/lkml/87a5nd4tsg.fsf@intel.com/
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5e7e69e0e345..93a49b262dbe 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -114,13 +114,15 @@ struct drm_edid_ident_closure {
 
 #define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
 { \
-	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
-					     product_id), \
+	.ident = { \
+		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
+						     vend_chr_2, product_id), \
+	}, \
 	.quirks = _quirks \
 }
 
 static const struct edid_quirk {
-	u32 panel_id;
+	const struct drm_edid_ident ident;
 	u32 quirks;
 } edid_quirk_list[] = {
 	/* Acer AL1706 */
@@ -2921,16 +2923,17 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  * @drm_edid: EDID to process
  *
  * This tells subsequent routines what fixes they need to apply.
+ *
+ * Return: A u32 represents the quirks to apply.
  */
 static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 {
-	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
 	const struct edid_quirk *quirk;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
 		quirk = &edid_quirk_list[i];
-		if (quirk->panel_id == panel_id)
+		if (drm_edid_match_identity(drm_edid, &quirk->ident))
 			return quirk->quirks;
 	}
 
-- 
2.44.0.278.ge034bb2e1d-goog

