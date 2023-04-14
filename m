Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78346E40AC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C410E382;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BEA10E002
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 18:16:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 hg14-20020a17090b300e00b002471efa7a8fso5833281pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 11:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681496210; x=1684088210;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSk6ionqfrU5CLTl6BqdAdf0dV6Mmjb2FiO2eL1N9k8=;
 b=b0iRTBUHbxl8xMgh8WKfYNrw4d/4GYpUQtx+gg4gawqts2pstj3E0e2O2pHmEIYxyS
 vaDMaqavb7Nse8+DYL/jpo5cRYYyJsENdlhzqNAHrcL0pUt3xm+NoPXAzNqPlCLM19qy
 LtMjhSh7UJRLrZF0BzRAJxbfHYFXyaHEZL5PiLlXl3pRz9WUyPMn+LPdaPa0AutRFWw3
 yQlwqyS+UIVNmkxMQ7gNEjCoRsh+utqsNKQu5SSEB/GSMyeUPPhshvjUZcWFp4bAUhHW
 0LHYmVDynpC68Bf/l7EcgypUMPZ87UkBP3OOgurvEDhCRtiI9wPXpqXtScGERwmheuRz
 0fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681496210; x=1684088210;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jSk6ionqfrU5CLTl6BqdAdf0dV6Mmjb2FiO2eL1N9k8=;
 b=NC/IwhdHzfX22pq+Q35vcilHC6MwMtU++pif0oqWB6X41gsqiYqyFYilzAjgadncgi
 H4gUsT9X98Ny96XGiJGqliRGixdtgLgN3HWhXEtNItaU5gacfK6QvB8nGtdAjBtIM10y
 1Zl8j9shlyKdUBwRdL6cwMjXtKy0ZCOKzes+Pj9O1gqSdIf6hTj0VQgAvzwSfE8tOK8X
 nwW1NtAvbN4rff1oN/Ef9XdirGucSCEy+EkOIZdx0RqYJCKpL2j4xK8P59/4PVipN5jJ
 NI8+8updyzr43ZPjV+y/joFd8rESJDdx4rb6MwozV2D90F47/dnrZgHekug4AcQiB43X
 /RdA==
X-Gm-Message-State: AAQBX9cTFQ5J/HfZf8GTTo7i6osXYP8tXKSNOezFE/xZDjINd2nm5k0k
 PkQirfmk7nFzzWqtjjRzExU=
X-Google-Smtp-Source: AKy350YreQbqIhS32VZoE3UjmRT9PGZ6GWKeuA2KcP1DGcZnIyQmV+sqY1dFyZOpLKZT82BSERfYrw==
X-Received: by 2002:a17:903:294d:b0:1a5:2377:c7e7 with SMTP id
 li13-20020a170903294d00b001a52377c7e7mr3330469plb.44.1681496209798; 
 Fri, 14 Apr 2023 11:16:49 -0700 (PDT)
Received: from localhost.localdomain ([117.172.46.6])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170902b20300b001a66fd54dd4sm3322706plr.258.2023.04.14.11.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 11:16:49 -0700 (PDT)
From: "logic.yu" <hymmsx.yu@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/bridge:Fix the panic problem caused by
 bridge->funcs->attach
Date: Fri, 14 Apr 2023 11:16:41 -0700
Message-Id: <20230414181641.8868-1-hymmsx.yu@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the code is executed to bridge->funcs->attach,bridge->funcs is NULL.
Although the function entry checks whether the bridge pointer is NULL,it
does not detect whether the bridge->funcs is NULL, so a panic error
occurs.

Signed-off-by: logic.yu <hymmsx.yu@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..f3dd67fb3f1d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -302,7 +302,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 {
 	int ret;
 
-	if (!encoder || !bridge)
+	if (!encoder || !bridge || !bridge->funcs)
 		return -EINVAL;
 
 	if (previous && (!previous->dev || previous->encoder != encoder))
-- 
2.17.1

