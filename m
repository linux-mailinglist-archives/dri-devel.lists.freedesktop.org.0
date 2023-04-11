Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E26DE7B1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C09610E6B9;
	Tue, 11 Apr 2023 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBCC10E6B3;
 Tue, 11 Apr 2023 22:57:58 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-634b28df952so849563b3a.2; 
 Tue, 11 Apr 2023 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61YxJCuswj9xA83srgCQq+LpDU/NdlnFqvUJ2L68W28=;
 b=fzBJIokAts+RXDDaUaHyBMUmEWyCEpqt/q5M5m29gvFIePVvslMTBmgeaXIIOR2Ac0
 IKD4FDATQxWMrcXusMnMszqhH+ZFJUzNugl40qN33DRbhpmqVksqUaVRyb3TKcBlO3ob
 vrFgnK/cyair5Bpw1M73oVX/HdIR7gu5m1gkXUM+LiCHGrgYoRPJtmhIVyBoEJFdH50m
 D/b1pQ5vvmQELw83iKDaFVd4MtyXH2KRsKoLKutQ+Sjsq7U2J3b1JT7ekBAiDG927SoX
 y9LdBEnPpvAfHEYj+KBiACoG7fYWcLUqxCYeqUa/lu67QCaTVBR+SBy2ukeZ7NGv9x9f
 pwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61YxJCuswj9xA83srgCQq+LpDU/NdlnFqvUJ2L68W28=;
 b=TTQE7ptN5QJXZlwK7Kpa1iXb6GTVJctBID3yxC8vK+Nud5zicRg61rhR7Msw+h2j+p
 GxXMqZQxU9vHJIhd9dE2HTm04yg/dZF2EcSFPcEC1SXnO4NU5sPDr/ayPpxh1VlopE7v
 Kvi8cXRscTvf+rUSZDcKiXLZ3qkPYhGHnJHigxcebj74jRIil6t0ejUzUchHT7ZdZkB0
 06Fg7gL4Iy9GTw7xCeyZ66Zx15Yh1jMm4pMixa6aksmLZfZwGJt4/Y/y4Oh1ipKe05vO
 /wMRqJfoC/FySwtfXBhh6igDRWg6EvnPIIbTo+A1NCm26D8e4iD+c4/txKuE3AaO3wiT
 PWmQ==
X-Gm-Message-State: AAQBX9fJNf87MX0bOUac0b3yXzNP4TwpeprP13cKzxsVnv9yTvm4Ya7D
 epDF16HUvC9/4WKr9Li4+pWU+uiPjOU=
X-Google-Smtp-Source: AKy350arI+CyPmWu3SVA1SipRhUdpjuMh/HgAyHw47YA/h5KMXGlVoWtJo9Ttap9MbvO0vk1YV7H6g==
X-Received: by 2002:a62:3815:0:b0:63a:b1ab:79a5 with SMTP id
 f21-20020a623815000000b0063ab1ab79a5mr5543199pfa.18.1681253877854; 
 Tue, 11 Apr 2023 15:57:57 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a056a001bcc00b005d866d184b5sm10225457pfw.46.2023.04.11.15.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/etnaviv: Switch to fdinfo helper
Date: Tue, 11 Apr 2023 15:56:10 -0700
Message-Id: <20230411225725.2032862-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 44ca803237a5..170000d6af94 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -476,9 +476,8 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
+static void etnaviv_fop_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_file_private *ctx = file->driver_priv;
@@ -487,8 +486,6 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
 	 * For a description of the text output format used here, see
 	 * Documentation/gpu/drm-usage-stats.rst.
 	 */
-	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
-	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
 
 	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
 		struct etnaviv_gpu *gpu = priv->gpu[i];
@@ -507,7 +504,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
 			cur = snprintf(engine + cur, sizeof(engine) - cur,
 				       "%sNN", cur ? "/" : "");
 
-		seq_printf(m, "drm-engine-%s:\t%llu ns\n", engine,
+		drm_printf(p, "drm-engine-%s:\t%llu ns\n", engine,
 			   ctx->sched_entity[i].elapsed_ns);
 	}
 }
@@ -515,7 +512,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	DRM_GEM_FOPS,
-	.show_fdinfo = etnaviv_fop_show_fdinfo,
+	.show_fdinfo = drm_fop_show_fdinfo,
 };
 
 static const struct drm_driver etnaviv_drm_driver = {
@@ -529,6 +526,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
+	.show_fdinfo        = etnaviv_fop_show_fdinfo,
 	.ioctls             = etnaviv_ioctls,
 	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
 	.fops               = &fops,
-- 
2.39.2

