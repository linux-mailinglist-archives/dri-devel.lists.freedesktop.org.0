Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63C908FAD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D6410EDC5;
	Fri, 14 Jun 2024 16:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mfApwInj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FC510EDC4;
 Fri, 14 Jun 2024 16:08:40 +0000 (UTC)
Received: from fedora.home ([86.243.222.230]) by smtp.orange.fr with ESMTPA
 id I9TgsKvp3tf3yI9TgsiObM; Fri, 14 Jun 2024 18:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1718381317;
 bh=iew86RGc22LJ+Q/8TMphmmkcMzmxkXz0kaXfqIW+KKw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=mfApwInjnFPbwpLRxOXdkb6DU8ITDBwhgC7xAdU65yUWLf8jt/8jrF4FFTIDcY2th
 iEaahGn2BBaAUi/aQs9YoQcdVURdTzssWNlwOQsZ+ipTuXHMZYiNHEb5C5tkqoaWaI
 Kp0acai4IiMym0K99Bb3/Zv/wzE0Bfy2lMIZQDHfms6thq48feafrfAdrW6X97VQRS
 U/ax0jsUoBKM34bKWSzTa59xi8UwuCHepVD8jIWgHGUwv1mevIKc2Q44ByIpls246K
 ZV9sqMX5tPORVxcb5p50B94POU8T37Dr+8N5tzNd3sf3ouUswuh6JahE3M891WLWus
 dcnOmDTWS+flA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 14 Jun 2024 18:08:37 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Constify struct nouveau_job_ops
Date: Fri, 14 Jun 2024 18:08:30 +0200
Message-ID: <860e9753d7867aa46b003bb3d0497f1b04065b24.1718381285.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
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

"struct nouveau_job_ops" is not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

In order to do it, "struct nouveau_job" and "struct nouveau_job_args" also
need to be adjusted to this new const qualifier.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   5570	    152	      0	   5722	   165a	drivers/gpu/drm/nouveau/nouveau_exec.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   5630	    112	      0	   5742	   166e	drivers/gpu/drm/nouveau/nouveau_exec.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index e65c0ef23bc7..a0b5f1b16e8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -188,7 +188,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-static struct nouveau_job_ops nouveau_exec_job_ops = {
+static const struct nouveau_job_ops nouveau_exec_job_ops = {
 	.submit = nouveau_exec_job_submit,
 	.armed_submit = nouveau_exec_job_armed_submit,
 	.run = nouveau_exec_job_run,
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index e1f01a23e6f6..20cd1da8db73 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -42,7 +42,7 @@ struct nouveau_job_args {
 		u32 count;
 	} out_sync;
 
-	struct nouveau_job_ops *ops;
+	const struct nouveau_job_ops *ops;
 };
 
 struct nouveau_job {
@@ -73,7 +73,7 @@ struct nouveau_job {
 		u32 count;
 	} out_sync;
 
-	struct nouveau_job_ops {
+	const struct nouveau_job_ops {
 		/* If .submit() returns without any error, it is guaranteed that
 		 * armed_submit() is called.
 		 */
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ee02cd833c5e..9402fa320a7e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1534,7 +1534,7 @@ nouveau_uvmm_bind_job_cleanup(struct nouveau_job *job)
 	nouveau_uvmm_bind_job_put(bind_job);
 }
 
-static struct nouveau_job_ops nouveau_bind_job_ops = {
+static const struct nouveau_job_ops nouveau_bind_job_ops = {
 	.submit = nouveau_uvmm_bind_job_submit,
 	.armed_submit = nouveau_uvmm_bind_job_armed_submit,
 	.run = nouveau_uvmm_bind_job_run,
-- 
2.45.2

