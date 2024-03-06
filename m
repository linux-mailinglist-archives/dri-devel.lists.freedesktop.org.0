Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71B873957
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604E2113239;
	Wed,  6 Mar 2024 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HXigjSWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E5113239
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:38:22 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1dc3b4b9b62so7881245ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709735901; x=1710340701;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pLyuD/CIq7Kcq2J+mXAcpPtUiY8V5eDIIqZPqq8Wh04=;
 b=HXigjSWYjDEzGsZTECTEiUIV4BBIgPl5nLdB//KgW9TEqVL2PDJUVgqLUasDiMk1GX
 djuzwCnsMInOQ14Rt48n7nRdElwgPs9+8l/lvS+kRWoiiNyurncgBBRQR2Wooz5zwV0w
 JX3ws1Q2/EHHHbePmj96Z0K8Z2TwW2/rgrlsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709735901; x=1710340701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLyuD/CIq7Kcq2J+mXAcpPtUiY8V5eDIIqZPqq8Wh04=;
 b=FT27zjjSG/TF1rxHJK2rxYpE+LeeyMjXhWc3GmrLnCN2i3OcPkwJhbQZ2AHH6vqPNi
 gobMVn7xgxIgNZYDHAFh1ymJUsB+nOkQqAXDbdDtu2ppUmribaK05QsB8egIiPGOf562
 K6CjGV9HSXERLBP5SJbl2VLdXVK5GHQL+VQ0CvSr8nXFxbgsSUSEgwe0kCLDMrcvsVD4
 CUOemhkq4qb9qQxZF2EqAkCupJs6faZyaYQphJLQJb3FSYJjBU0Gdbd+398iMx9OwHoP
 fME48SiRGyWACw2+86RpiopsVbh0kgY+gfUN/N6sRzGcGHUe2M2CZp7V8TKbWa0MnwGq
 jfvQ==
X-Gm-Message-State: AOJu0YwVz9zNIId+40OGH8q0AFbq4KMxkFjNtnECz3JyAOlugQRuohIF
 pVEOtmpAD3rofkgamD/zf//zS9Zs0/xeNctWDt8kkFhNiQVm6s1+QTMOB2bvS4Gds9jKOcwUKcN
 DUTRt
X-Google-Smtp-Source: AGHT+IHZhsekI2nK6sFkLJTOQ3qMI60iZPbvn0ydMSpr9wbA4qAouFyjXAj8VD/Xwrbaf9QKuboxEQ==
X-Received: by 2002:a17:902:f7cc:b0:1dc:a605:53fd with SMTP id
 h12-20020a170902f7cc00b001dca60553fdmr252901plw.10.1709735901343; 
 Wed, 06 Mar 2024 06:38:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:bc24:1849:151f:5509])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a17090301c700b001db9e12cd62sm12667178plh.10.2024.03.06.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:38:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/udl: Add ARGB8888 as a format"
Date: Wed,  6 Mar 2024 06:37:22 -0800
Message-ID: <20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
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

This reverts commit 95bf25bb9ed5dedb7fb39f76489f7d6843ab0475.

Apparently there was a previous discussion about emulation of formats
and it was decided XRGB8888 was the only format to support for legacy
userspace [1]. Remove ARGB8888. Userspace needs to be fixed to accept
XRGB8888.

[1] https://lore.kernel.org/r/60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/udl/udl_modeset.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 0f8d3678770e..7702359c90c2 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -253,7 +253,6 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 static const uint32_t udl_primary_plane_formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
 };
 
 static const uint64_t udl_primary_plane_fmtmods[] = {
-- 
2.44.0.278.ge034bb2e1d-goog

