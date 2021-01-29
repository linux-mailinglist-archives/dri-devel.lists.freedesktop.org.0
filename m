Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5AF308A1B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04AE6EB8A;
	Fri, 29 Jan 2021 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2663E6EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 15:55:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m22so13146037lfg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VU9ZSshNHQ4g8nkoGAe/C8k3x0r4KexqlkzVzJ+RpXM=;
 b=pW6u5cY7Djvj9yW6hyzQFMJihTn+MoC6Yp0a8C3wwMgie4ic5IAunKEGoTCZTSyxiZ
 1rq+OIrDgEaK23beOb9NMjbY6tEiH/QCC4aSh+NRJ1U8V95X0jgI/gop0f9H+3LhMXVt
 N7v5z6RSIiiB6txv66E2pOK399Ig0/8tCNIJQUU0FykjECDdyPrIwRtHIDIDBj8ZCF9o
 SHEzMA5/IxHI1dTT0rzl+KdUqYJr0Ej+2bSMIihngu+ZQRtLlh2qKpQ+VSpvmKdih4aA
 2kFf+HhnIrvk1o1esHQPUGQ8/T+2XOtdXN5PaWZpf57zF4Ih0CX8Kuy5/w6dfxV94lAY
 Is/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VU9ZSshNHQ4g8nkoGAe/C8k3x0r4KexqlkzVzJ+RpXM=;
 b=ZSjOrq4CELjxXQKBjkPy4mBrKilw0EK+9NkhSKfV2GrCrxZr7F8O/cG/4KGU9OBuUq
 okpHXKHOnGnYbvrxOfhY7IIcQY3GZm8iyQP6V75HXnKn1EBcKFtTzUEDPQpnKqS+NZZD
 CMb9lZovGIFEh+RjvO7p7SrffIHISMZU8V64xkyMYOKct/fAKPmBc/JVBs2V/obeZhlW
 Hw+ZOWbg7WUINlgC5GJOXfFXqo8Li0CynWCR06t1Hqz7Uvp0o6DtGryXV/f6xGv2InMF
 upcXYvAadavwGD/b9BfgrAT8tWv3XcW/B8ojxvcokd/aabrqwKYDoLJTeHK8kiPDHzJu
 IZhw==
X-Gm-Message-State: AOAM530ia0EFyevXuWzQfTfg9Dsxrok+XujFezgaoBauFuMru0WoyC+n
 gtfpV6eUdKlHDEFlL2F5orRSesmpJys=
X-Google-Smtp-Source: ABdhPJynSN26FH+1kVnCtp3cCBmJNzHrbNktQW2MNKKUQkztfDUsBbnaLlvK4IPRtPNSlVmgP5rOZw==
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr2479341lfs.98.1611935725346; 
 Fri, 29 Jan 2021 07:55:25 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id c6sm2070095lfc.11.2021.01.29.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:55:24 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: Fix incorrect return type to timedout_job
Date: Fri, 29 Jan 2021 16:54:39 +0100
Message-Id: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
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
Cc: luben.tuikov@amd.com, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit a6a1f036c74e ("drm/scheduler: Job timeout handler returns
status (v3)") incorrectly uses "enum drm_task_status" for v3d and causes
a build failure. "enum drm_task_status" got changed into "enum
drm_gpu_sched_status" in v3 of the patch but the change for v3d got
lost.

Fixes: ("drm/scheduler: Job timeout handler returns status (v3)")
Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index ef2338a294ca..ceb33f8e4379 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 	return NULL;
 }
 
-static enum drm_gpu_sched_status
+static enum drm_gpu_sched_stat
 v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 {
 	enum v3d_queue q;
@@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
  * could fail if the GPU got in an infinite loop in the CL, but that
  * is pretty unlikely outside of an i-g-t testcase.
  */
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		    u32 *timedout_ctca, u32 *timedout_ctra)
 {
@@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_bin_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
@@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
 				   &job->timedout_ctca, &job->timedout_ctra);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_render_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_render_job *job = to_render_job(sched_job);
@@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
 				   &job->timedout_ctca, &job->timedout_ctra);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_generic_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
@@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
 	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_csd_job *job = to_csd_job(sched_job);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
