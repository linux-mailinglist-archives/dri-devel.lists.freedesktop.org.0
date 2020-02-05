Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFEA15256A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4863B6F46B;
	Wed,  5 Feb 2020 03:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559326F465;
 Wed,  5 Feb 2020 03:49:19 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ep11so362865pjb.2;
 Tue, 04 Feb 2020 19:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NrDPCoOEGpz0oG/Pf98BK1LffHnuo/Wjgd35wlGcuy4=;
 b=QzqWgKw0JmUcrXCwJcD121saAxq1nl3TZMTvxJwuK2C/siItB/TEwoAeS2R/597t/C
 rdbqx939AYt9TVfrtNzllWbDsc/PUay1qmo/Ogq7TPk0KrypZY5CByoCyTQwNUrfgjtX
 TR8O8fZMCh3UJvLwpT1802mvLyb+yvFeTRmVmUlpkVHDqrHmO6+gCNM86qTA9FtxjTq5
 gRF7919c0oPFzVaofMn7qGjnSnxAapugvEYjdIydA9bskRWU5CZh0VxQZyIiT4utciRD
 b0Df0mNaSymVgUi1KLGAU6aIkBCqC9EoSGaxLB/QFKzUr4xdb/Eko/BGgjmCjoS7D4WR
 o6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrDPCoOEGpz0oG/Pf98BK1LffHnuo/Wjgd35wlGcuy4=;
 b=IQyez3BMss/w5cX2JOg9vx/YxHMN2IuDrmvW7YzvKdKeot0BniX0kv4QfdqliKG/mE
 GmNqWwbUwcDt2Hbs2tAGWRapWzlc96DZv30vD8ga7/4C7AqO3zY60dOd6zV9zZJ+sA8d
 tQyjgY84Umbo5XCke8xC7BNGmja4aw48OPWKZ4HOH98z6c7l/1AHGhMBgQp4zmm+v4lX
 wUQ0DiL+Xr5ZPdnyw1W5E6bMQJm/zQMSCqUTe9z830+l/Y4uPtnPmxzN7mszxJ6THu6o
 S2oM63gYC/ApbAw/xfY8ldPetukg+dWxTaVa/BmGX6nQy64/RD6NyEZklMsQh2gaD5jm
 CDgA==
X-Gm-Message-State: APjAAAUF7i4Kt2N/BtTUmeCIZB9tZiYb3ekSAYzi+CauqbkwLA/4GfhM
 8kPBXsyfLFx2OJJZxJE2USzjyflp
X-Google-Smtp-Source: APXvYqwxWksIXlwp8DFSu/hUe3TKWc+ndZD7PQAVx8RyTCJhsoTYD5SPQpiNGlOcGdKD2YVmK9nxEg==
X-Received: by 2002:a17:90a:d804:: with SMTP id
 a4mr3134207pjv.11.1580874558539; 
 Tue, 04 Feb 2020 19:49:18 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:18 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] drm/amd/display: move dpcd debugfs members setup
Date: Tue,  4 Feb 2020 22:48:49 -0500
Message-Id: <20200205034852.4157-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Into the function that creates the debugfs files rather
than setting them explicitly in the callers.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c   | 3 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index efe74a8a8ace..5b9154ecc690 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5836,8 +5836,6 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 
 #if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(aconnector);
-	aconnector->debugfs_dpcd_address = 0;
-	aconnector->debugfs_dpcd_size = 0;
 #endif
 
 	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index f81d3439ee8c..3cafbba37aef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1008,6 +1008,9 @@ void connector_debugfs_init(struct amdgpu_dm_connector *connector)
 	debugfs_create_file_unsafe("force_yuv420_output", 0644, dir, connector,
 				   &force_yuv420_output_fops);
 
+	connector->debugfs_dpcd_address = 0;
+	connector->debugfs_dpcd_size = 0;
+
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5672f7765919..3959c942c88b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -158,8 +158,6 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
 
 #if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(amdgpu_dm_connector);
-	amdgpu_dm_connector->debugfs_dpcd_address = 0;
-	amdgpu_dm_connector->debugfs_dpcd_size = 0;
 #endif
 
 	return drm_dp_mst_connector_late_register(connector, port);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
