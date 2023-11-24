Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23AA7F6A24
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2D10E788;
	Fri, 24 Nov 2023 01:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EF710E788
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qgZnmkNy+sfCfK/HQzyBucXRDd+PHA+80KwJoOM8IYk=; b=Jo4e5TOvaJzokjI8uSVubZujVC
 jfGP8JkqSMWr1KS1LgUIIBNiju9W0Ot+IpztxnPP28pHPn45rL/eKYYAP8BRBIlIV4KmFoptAEh9u
 CnKc3TUkQC6ygKK90+Ze5xpcZxNhi9eIUlOsDZBfR/pdQ8D/XsDpI36VDfcMiNc0/wiHN+LmxsjCf
 meCjFbRJ736lKWtHInRsTzJ+zIYLkhTNNrNdR4FP9aPE7ALKkoo7J6P8h+EuSYbEaojefnIXvWyh+
 QQJ8K89sUmuFKnbLZZqHzh04iPCjVq8m0CMYbje6Lqz08ijTuYMEhp2obtPo9bGmedQkOnbPaaUMD
 lizjlYdw==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r6KyU-006Zga-5E; Fri, 24 Nov 2023 02:27:18 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/17] drm/v3d: Create tracepoints to track the CPU job
Date: Thu, 23 Nov 2023 21:47:05 -0300
Message-ID: <20231124012548.772095-10-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124012548.772095-1-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create tracepoints to track the three major events of a CPU job
lifetime:
	1. Submission of a `v3d_submit_cpu` IOCTL
	2. Beginning of the execution of a CPU job
	3. Ending of the execution of a CPU job

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c  |  4 +++
 drivers/gpu/drm/v3d/v3d_submit.c |  2 ++
 drivers/gpu/drm/v3d/v3d_trace.h  | 57 ++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index a32c91b94898..30a88e557217 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -288,8 +288,12 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	file->start_ns[V3D_CPU] = local_clock();
 	v3d->queue[V3D_CPU].start_ns = file->start_ns[V3D_CPU];
 
+	trace_v3d_cpu_job_begin(&v3d->drm, job->job_type);
+
 	v3d_cpu_job_fn[job->job_type](job);
 
+	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
+
 	runtime = local_clock() - file->start_ns[V3D_CPU];
 
 	file->enabled_ns[V3D_CPU] += runtime;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 955cf3106fdf..337a15b4b594 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -806,6 +806,8 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 	}
 
+	trace_v3d_submit_cpu_ioctl(&v3d->drm, cpu_job->job_type);
+
 	ret = v3d_job_init(v3d, file_priv, (void *)&cpu_job, sizeof(*cpu_job),
 			   v3d_job_free, 0, &se, V3D_CPU);
 	if (ret)
diff --git a/drivers/gpu/drm/v3d/v3d_trace.h b/drivers/gpu/drm/v3d/v3d_trace.h
index 7aa8dc356e54..06086ece6e9e 100644
--- a/drivers/gpu/drm/v3d/v3d_trace.h
+++ b/drivers/gpu/drm/v3d/v3d_trace.h
@@ -225,6 +225,63 @@ TRACE_EVENT(v3d_submit_csd,
 		      __entry->seqno)
 );
 
+TRACE_EVENT(v3d_submit_cpu_ioctl,
+	   TP_PROTO(struct drm_device *dev, enum v3d_cpu_job_type job_type),
+	   TP_ARGS(dev, job_type),
+
+	   TP_STRUCT__entry(
+			    __field(u32, dev)
+			    __field(enum v3d_cpu_job_type, job_type)
+			    ),
+
+	   TP_fast_assign(
+			  __entry->dev = dev->primary->index;
+			  __entry->job_type = job_type;
+			  ),
+
+	   TP_printk("dev=%u, job_type=%d",
+		     __entry->dev,
+		     __entry->job_type)
+);
+
+TRACE_EVENT(v3d_cpu_job_begin,
+	    TP_PROTO(struct drm_device *dev, enum v3d_cpu_job_type job_type),
+	    TP_ARGS(dev, job_type),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(enum v3d_cpu_job_type, job_type)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev = dev->primary->index;
+			   __entry->job_type = job_type;
+			   ),
+
+	    TP_printk("dev=%u, job_type=%d",
+		      __entry->dev,
+		      __entry->job_type)
+);
+
+TRACE_EVENT(v3d_cpu_job_end,
+	    TP_PROTO(struct drm_device *dev, enum v3d_cpu_job_type job_type),
+	    TP_ARGS(dev, job_type),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(enum v3d_cpu_job_type, job_type)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev = dev->primary->index;
+			   __entry->job_type = job_type;
+			   ),
+
+	    TP_printk("dev=%u, job_type=%d",
+		      __entry->dev,
+		      __entry->job_type)
+);
+
 TRACE_EVENT(v3d_cache_clean_begin,
 	    TP_PROTO(struct drm_device *dev),
 	    TP_ARGS(dev),
-- 
2.41.0

