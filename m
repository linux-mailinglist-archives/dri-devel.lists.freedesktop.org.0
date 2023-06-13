Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F172E69C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BCB10E396;
	Tue, 13 Jun 2023 15:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638710E392;
 Tue, 13 Jun 2023 15:04:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34B4A1FDC1;
 Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686668688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrVTJ1PaefJMEwJtykBHJvvlyCd4uUwlo5aZ/cTyKVg=;
 b=YzeKXQVmMtk/Ctcl4+SU9FliAsX2M908VrkrP/97SkWGh/Zgi+oLtClYc0yVaPb2oYT7rU
 JPeKrwHEs+oQzCjbQ6R03Sii96qgfUrIEWLn6siaXCodNJIAAcVPENcZFrNxzcdjDKUvjq
 rHEqcgOuervp/sHOUjNSP2mhFrA4OC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686668688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrVTJ1PaefJMEwJtykBHJvvlyCd4uUwlo5aZ/cTyKVg=;
 b=GpbkiiEM3d1/KPG8NOk260QLgbZy4HY+egGnwFvYzCuF36SzKHX9FhI7hDvbxn0QeK0r62
 C2LaAo8OJKlmpxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06EC613483;
 Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OIfbAJCFiGSGFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 15:04:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run
Subject: [PATCH 1/2] drm/msm: Initialize mmap offset after constructing the
 buffer object
Date: Tue, 13 Jun 2023 16:51:32 +0200
Message-ID: <20230613150441.17720-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613150441.17720-1-tzimmermann@suse.de>
References: <20230613150441.17720-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only the msm driver provides its own implementation of gem_prime_mmap
from struct drm_driver. All other drivers use the drm_gem_prime_mmap()
helper.

Initialize the mmap offset when constructing the buffer object in msm
and reduce the gem_prime_mmap code to the generic helper. Prepares
msm for the removal of struct drm_driver.gem_prime_mmap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem.c       |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 10 ----------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 20cfd86d2b324..635744bc4765f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1234,6 +1234,10 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	list_add_tail(&msm_obj->node, &priv->objects);
 	mutex_unlock(&priv->obj_lock);
 
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto fail;
+
 	return obj;
 
 fail:
@@ -1290,6 +1294,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	list_add_tail(&msm_obj->node, &priv->objects);
 	mutex_unlock(&priv->obj_lock);
 
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto fail;
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c1d91863df055..2c846afe049e4 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -13,16 +13,6 @@
 
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	int ret;
-
-	/* Ensure the mmap offset is initialized.  We lazily initialize it,
-	 * so if it has not been first mmap'd directly as a GEM object, the
-	 * mmap offset will not be already initialized.
-	 */
-	ret = drm_gem_create_mmap_offset(obj);
-	if (ret)
-		return ret;
-
 	return drm_gem_prime_mmap(obj, vma);
 }
 
-- 
2.41.0

