Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62140666214
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338010E7B4;
	Wed, 11 Jan 2023 17:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215DF10E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bVN4C+QvCyfJZLYLAtmaPjkYIhxXDdYFgXmF4PxfhFs=; b=NV7nkTrbvBrJbp5vxtNs3PBH09
 R1baDQQB15+P1syZUQPJGUXBLeeIzieHFmBf7WmGeoN2jl+DWEPqWrEDeOwkaIcuzqSKnULnOm/XV
 IDagx1Ipz2SxJ+3aIh/Ms6fqsQ5/wNRGUvq/aDbBNoRdxQ9DP1YjCPxEc746Ce8ca9O3QZx06cKVO
 1Y4UKvor6rgeU4KxPfPSu/penDnnTC0KRud8J9KnwQ7OErs16WPy5zFDlkicKXm6An6wWevlwEVw7
 aGT98wGohRSZNcxnbdZ4bUaH36sEKjxEUBE/J5LUnbOSxBA1QieNHjxJ6ewAzhZjlHSKjjt1TX17e
 DqExdL5A==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3q-005Sku-Bk; Wed, 11 Jan 2023 18:38:50 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 06/13] drm/vc4: Split variable instantiation of
 vc4_debugfs_regset32()
Date: Wed, 11 Jan 2023 14:37:41 -0300
Message-Id: <20230111173748.752659-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering that there are multiple ways to instantiate a
drm_debugfs_entry, as kms object's debugfs entries were introduced,
split vc4_debugfs_regset32() into two functions: one to deal with the
drm_printer and the other to instantiate the proper variables.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index fac624a663ea..80afc69200f0 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -32,27 +32,34 @@ vc4_debugfs_init(struct drm_minor *minor)
 	}
 }
 
-static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
+static int vc4_debugfs_regset32(struct drm_device *drm, struct debugfs_regset32 *regset,
+				struct drm_printer *p)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
-	struct debugfs_regset32 *regset = entry->file.data;
-	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
-	drm_print_regset32(&p, regset);
+	drm_print_regset32(p, regset);
 
 	drm_dev_exit(idx);
 
 	return 0;
 }
 
+static int vc4_debugfs_dev_regset32(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
+	struct debugfs_regset32 *regset = entry->file.data;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	return vc4_debugfs_regset32(drm, regset, &p);
+}
+
 void vc4_debugfs_add_regset32(struct drm_device *drm,
 			      const char *name,
 			      struct debugfs_regset32 *regset)
 {
-	drm_debugfs_add_file(drm, name, vc4_debugfs_regset32, regset);
+	drm_debugfs_add_file(drm, name, vc4_debugfs_dev_regset32, regset);
 }
-- 
2.39.0

