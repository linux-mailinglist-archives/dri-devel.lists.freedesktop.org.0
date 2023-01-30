Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E397680DBF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5410E234;
	Mon, 30 Jan 2023 12:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739E210E234
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XZjrLCUy+Y+GPUw3s6ky4Y/Ag/gUMPF9eB2/jZzeMjk=; b=GlVhdVcxepwHoXOvJ+2BCzduBx
 4dYxDnIPus1XIzEAizKu0N5FacfzdrEcHlbJBH3Ah8C8EKLFuV9ByjERIehmonY7qqOK3W59DHVOU
 BuHwFASeObFAvQ0o9+bwe50YfM8GAPw2mRckuXCC5H5sKuLb2VYFfYywBndQe1E3XGi9TXlI3AzzN
 O817MGOY5GfmpLknqMjd/lYTSuJcEjXjnVA59Q5K9bB5QDYNK12TQabNYzjfWLvX712STIxWtGsun
 Arck4K6FyjY8eV5xMGdWnGUBrBjAGmbcopB/fogXoKu+B0diAG0EgKbaI80vHJjxg14VtTWwB0BOA
 pFJ6C4gw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMTLh-004TG3-K5; Mon, 30 Jan 2023 13:33:26 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 3/6] drm/debugfs: Create wrapper to add files to debugfs
 list
Date: Mon, 30 Jan 2023 09:30:09 -0300
Message-Id: <20230130123008.287141-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130123008.287141-1-mcanal@igalia.com>
References: <20230130123008.287141-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a helper to encapsulate the code that adds a new debugfs file to
a linked list related to a object. Moreover, the helper also provides
more flexibily, as the parameter is a struct drm_debugfs_files.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index aa83f230c402..0e3f3ffa9f88 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -236,6 +236,13 @@ void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
 	kfree(debugfs_files);
 }
 
+static void drm_debugfs_files_add(struct drm_debugfs_files *debugfs_files, struct list_head *entry)
+{
+	mutex_lock(&debugfs_files->mutex);
+	list_add(entry, &debugfs_files->list);
+	mutex_unlock(&debugfs_files->mutex);
+}
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
@@ -357,9 +364,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_files->mutex);
-	list_add(&entry->list, &dev->debugfs_files->list);
-	mutex_unlock(&dev->debugfs_files->mutex);
+	drm_debugfs_files_add(dev->debugfs_files, &entry->list);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
-- 
2.39.1

