Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2D2237AD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969E56ED6A;
	Fri, 17 Jul 2020 09:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E8C6ED6F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a6so10213047wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8b5fVu/k5TLlf+36lHMvWs7MDKThz1c6LCWkolzeR8=;
 b=FgzDsA3QYkleTg7CX3mtGxL02kFU2ARb2viz2T9KB2fRmKwgKjaGAOTfRy0Xi8/Nwx
 2AjNpuOUMrmBJu76I8VjtD4NkLNxQPD5MGDDiDhKhRl8v9JJ7woeYif22rDIAgneSK6h
 Fv6nuz51OdNCTwHcfeVMhArQxNCTn9nr8W1H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8b5fVu/k5TLlf+36lHMvWs7MDKThz1c6LCWkolzeR8=;
 b=iyrHo0VAyTTb3oLaq/jKs49a5y2ChJzHxMvNAGCC3ye6phgNaV3wvKjTe4xfpgqKai
 HBqI05zDZUFtr9oGdyR6+0Y5JXwt+pZ9rPVP4ollEpJAenOqxKmIB5I6ELZahgzYZ2ok
 u7dAq6+mjTywYC/qidLNFfzfT3wAIiAV7ZLmKHwUUSuEKwfaFnED1L6B/ZffgsDsJgNN
 3mUnmltOihMIbHkSAw4lLZZ+NJASbbVasdhenjG5U19sccoLX2jjh19JNl9JF+UzQOtx
 MM4uqm3wye0TAJMLobqTWLWO5nxF+qdRGJcx1rU4TmIAUQMzwZ7EXI8W2POUwufGOuE8
 Fksg==
X-Gm-Message-State: AOAM5335vZW2gtiJ+MQAzrYaZ22B/nnaoQ6vVVdYKSNq3mLkGU8FHGt1
 YPMlXsH4oj8RG3KJkW5li1h3SzL3RHE=
X-Google-Smtp-Source: ABdhPJwgo0vP3eFSMb9J9ENXepuXC2RUnaZNJ5UMigc+qA0wfuJpRIZ0IycKTJiqiwXjzBf9kz8ypQ==
X-Received: by 2002:adf:c142:: with SMTP id w2mr8754946wre.337.1594976682838; 
 Fri, 17 Jul 2020 02:04:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/18] drm/arc: Drop surplus connector registration
Date: Fri, 17 Jul 2020 11:04:20 +0200
Message-Id: <20200717090430.1146256-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_register does nothing before drm_dev_register(), it
is meant for hotpluggable connectors only. Same for the unregister side.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/arc/arcpgu_sim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index e42fe5d05a3d..3772df1647aa 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -29,7 +29,6 @@ static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
 
 static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
 
@@ -80,7 +79,6 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(drm->dev, "could not attach connector to encoder\n");
-		drm_connector_unregister(connector);
 		goto error_connector_cleanup;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
