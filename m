Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5C87410A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27C1113504;
	Wed,  6 Mar 2024 20:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CGI+ZszW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59649113502
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:04:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e61851dbaeso73126b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755440; x=1710360240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jcV5LiM2kdZ7H9iL9vZSs1WtOpfzFcM+Wcf+rllNpWo=;
 b=CGI+ZszWWHp+5uu8PJA4ZLMfEqBbdElQuiD4vRTAXsAk36IEqgxgtJit2tLKVk4xJ2
 ZQnlVHJRpDXrJKIZ3gtt/BydVsgozC673EaSMJExDF542LL8ZagQrrnj4wXM1DjDfRIw
 WLYfj5xBHvrTEuEFbtSkklWMak19UWv2tN9OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755440; x=1710360240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jcV5LiM2kdZ7H9iL9vZSs1WtOpfzFcM+Wcf+rllNpWo=;
 b=YhJAjbkvuY9es80Yh/M7dMywwdLw/A2+2IyAvu6EM1WVxZVd5ZkuOMQYg6EoJR2tE3
 N1eTpkbZGUTxnWDE+BWmkDHK1t8eziIIPzLcggCYNZeuuRfAFWU0uNSM5mccDZHfRPbE
 LgmZnq5lCrfyLoGX9jHEKJFNeUCQNn6MgXAsG/wg+j6DcOrgF/T4AqAlCK/oFw3Mjn5f
 oMGrpNmNmAKi96fJFAgo5/yS180wgrlZzaIl5AcGIEj+6YUpCgGVkgLDMnivsIO8lcbw
 ffLB7XTQKJC1mnLi2C4xeLDITz0O49gkBn+hntdZeHbjgx0oyu2mOo77NbqHiTyX5cTg
 +N+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzcraiLReZ3GgZ77Eb8pFXl01pt6aF90vFxpf6titxeF9UXcmWYzjI8rIC46b6G+k7YMoUkjKJG7viVTaLq41u0uX1NY2Tv2oMkULerncA
X-Gm-Message-State: AOJu0Ywz/uAoOMCn41xx/CzVGT8AuSEcyqsPv0rYs7f23N39kh+Z8LKL
 gt6B5Yus+aTJEh/JlasXQS/ovCZ72Cnu9F/rfT2eZfJe0APwpL6/yXizzQd+Cw==
X-Google-Smtp-Source: AGHT+IFCgN8qo4pn/qojFIdZBRNxtgY9xf1gMLK7jbuggLu5VWKkK+6qu1VlMtZ+ebGWkZKHlSr2Cw==
X-Received: by 2002:a05:6a20:5489:b0:1a1:6d2c:45da with SMTP id
 i9-20020a056a20548900b001a16d2c45damr971620pzk.14.1709755439863; 
 Wed, 06 Mar 2024 12:03:59 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:03:59 -0800 (PST)
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
Subject: [PATCH v5 4/6] drm/edid: Match edid quirks with identity
Date: Wed,  6 Mar 2024 11:55:54 -0800
Message-ID: <20240306200353.1436198-5-hsinyi@chromium.org>
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

Currently edid quirks are matched by panel id only.

Modify it to match with identity so it's easier to be extended
for more complex matching if required.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
v5: no change
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 29ef35ebee32..f9e4dacd7255 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -112,13 +112,15 @@ struct drm_edid_match_closure {
 
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
@@ -2880,16 +2882,17 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  * @drm_edid: EDID to process
  *
  * This tells subsequent routines what fixes they need to apply.
+ *
+ * Return: A u32 represents the quirks to apply.
  */
 static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 {
-	u32 panel_id = drm_edid_get_panel_id(drm_edid);
 	const struct edid_quirk *quirk;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
 		quirk = &edid_quirk_list[i];
-		if (quirk->panel_id == panel_id)
+		if (drm_edid_match(drm_edid, &quirk->ident))
 			return quirk->quirks;
 	}
 
-- 
2.44.0.278.ge034bb2e1d-goog

