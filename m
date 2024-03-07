Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC1875AD7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851C10F24B;
	Thu,  7 Mar 2024 23:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M82COFF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8203210F243
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:07:00 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dc13fb0133so1576385ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852820; x=1710457620;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhMzn7mAql0qeAQCBndfDWvU8yMf9cLlH/SFDDXTa5Q=;
 b=M82COFF05/Oc35O+Ux+3bXtC440XUD4qStqAoWqNviPPV2KHR5i6mqkBxW8JTa+rva
 BqTSbx4gyE0riahD8yiVGD2sNl95UpAcM9mnY1Ld/5Ed9ZWBTSfzsdyn0P/OyNzIxSav
 R+N72+JSNy8zY8QZqeRcw78rtr0nVlcgOB2/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852820; x=1710457620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DhMzn7mAql0qeAQCBndfDWvU8yMf9cLlH/SFDDXTa5Q=;
 b=kkumXv17G4G0bb4ra4T6QqqzYRXy7rGJ8jWR+IbQEBPzN5bLHvu9ojvjaDqnZRF/OD
 koiO0enKOEfIQI64DHtTlfKKjpFmONNASXEDyNtXv6K2Ww8l5G21+Fc8tnRfIzgHvqK6
 Bmt5YE862f6GEL0tKeJdOebUDuq9DXPVECcyPNoJF6hDv04oJi/35SKvCYXPnTmDdQpO
 IDd04f94y9c8k6NRK+K14dtXtmuJtx8ENr83NR8Cs67yhKLwkNq8Nz6MAw3DRORA5Q8x
 xQ9GIvVNgxsxANrFRTFZJ/XvY963s34yKMzBcsek7bO9XKZ3JgbGZyFqpXfOWLIn6XAA
 KMOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULwlZ9r8Zb7m2GzlObq73IejFHPXs9NPDM+DHGXrEvkZC2vPFeYe/WoCdEjMpdWc5L3WXty9OpsmdHkiwKZiRW/vjJXuXJW9cONlNl3s0d
X-Gm-Message-State: AOJu0Yzl7WSQoc/3br8ovGAOKysz2bteCqfadfMcj5e0uVvLy650+2wv
 vHqATJa9F1ciF9yLy0dt72vDCG+fv9TTkvLHgWQ9/XM+w2WYLewizQIpGLChcw==
X-Google-Smtp-Source: AGHT+IGM8Dqm/6+6/lxZ8pSJg338UR6F0X81KWVG5uRhl9oNBtnBdU4y50jzsgc9NatZRGXMVzuApQ==
X-Received: by 2002:a17:902:e806:b0:1dc:b063:34ac with SMTP id
 u6-20020a170902e80600b001dcb06334acmr11901220plg.21.1709852820139; 
 Thu, 07 Mar 2024 15:07:00 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:06:59 -0800 (PST)
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
Subject: [PATCH v6 3/5] drm/edid: Match edid quirks with identity
Date: Thu,  7 Mar 2024 14:57:43 -0800
Message-ID: <20240307230653.1807557-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240307230653.1807557-1-hsinyi@chromium.org>
References: <20240307230653.1807557-1-hsinyi@chromium.org>
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 58fe35058181..4abc50516cda 100644
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
@@ -2883,16 +2885,17 @@ EXPORT_SYMBOL(drm_edid_duplicate);
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

