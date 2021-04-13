Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C284D35DB9C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA01D6E190;
	Tue, 13 Apr 2021 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B939589BFE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso8386742wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGUka0sVW6wFNgc+ztoFeb2OUOiG/y4ojkNNplTLBt0=;
 b=fTO0Jx2vcmvQdLCXa8mhtAyXJVZEw/1VEXCGgr6kv8NHXjtswWDbLwl6sGbwuihz5L
 R9Fmq4p4wiuGl6SHTg0UW14WvKyh4/kLpXFh6bBAW6fUG50BX+Q8Fe9UT7PVdn2Dt8pc
 3KhNvwFs40NEccqchivj/VRWro8cT6y+TYwOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGUka0sVW6wFNgc+ztoFeb2OUOiG/y4ojkNNplTLBt0=;
 b=YDvc73srt0TJA0vfzPGDz5w2OZP159GSPGtTvyCxHoY4lIZ2GI+mMbpB/T4+ch73BI
 1o9qPQS7oxElRJVQ9/SKvKBS2qxNzt2m27c5hkCOcDjVL0XKu8sUvqDJdzChXkQyCVMj
 /1qMz8Sd5oYOBRdcH1lM6Fx0aA9/GyiWnJJ+gBfOW0LrDwUacfovvV1oDKzgLEsj+4dP
 FvNyIDd1/LSMBjH2MYaUMrAcXFKus/Se8p9M9Vn6Xy3bUJkz9Ms6uAoEQfFKoU1Srgpd
 02LoHLs6aLQ4p2BL3qp/QpZnuiocb1ODALrnqG2fJXavs8d6b2RHf31A2wCjyseLx7YO
 TIOg==
X-Gm-Message-State: AOAM531Eu0eEjsrYdzW82gIRIzWBh13AvJE77WPThEyzZSUqtxGsE6n6
 BFPXE2CPinRShzVkrkKgBD0qZmfkUtapTA==
X-Google-Smtp-Source: ABdhPJyDTagvp8Qr2MQeGN0Zbd+8hK2Pfwgv5a7NUG9u4fFQRmiEsT/K2Z4xwD3MJUyxJxiLf6KpmQ==
X-Received: by 2002:a1c:5454:: with SMTP id p20mr3305623wmi.187.1618307351369; 
 Tue, 13 Apr 2021 02:49:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/12] drm/arm/malidp: Always list modifiers
Date: Tue, 13 Apr 2021 11:48:53 +0200
Message-Id: <20210413094904.3736372-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even when all we support is linear, make that explicit. Otherwise the
uapi is rather confusing.

Cc: stable@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index ddbba67f0283..8c2ab3d653b7 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -927,6 +927,11 @@ static const struct drm_plane_helper_funcs malidp_de_plane_helper_funcs = {
 	.atomic_disable = malidp_de_plane_disable,
 };
 
+static const uint64_t linear_only_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 int malidp_de_planes_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm->dev_private;
@@ -990,8 +995,8 @@ int malidp_de_planes_init(struct drm_device *drm)
 		 */
 		ret = drm_universal_plane_init(drm, &plane->base, crtcs,
 				&malidp_de_plane_funcs, formats, n,
-				(id == DE_SMART) ? NULL : modifiers, plane_type,
-				NULL);
+				(id == DE_SMART) ? linear_only_modifiers : modifiers,
+				plane_type, NULL);
 
 		if (ret < 0)
 			goto cleanup;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
