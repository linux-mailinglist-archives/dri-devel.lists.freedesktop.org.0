Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219327FF69B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6117010E734;
	Thu, 30 Nov 2023 16:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4D910E73B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7oSZPgtm7FaRyKeqjrX4/MeX1CTnWNaij67tA0rkpQk=; b=nebhAEQXwcsyBRl9iP/dujW/lB
 Yax4R54nuqbJQlTsjhiO+QYbC+8QKPO2YT3JnFn2bEcqEovi7N5zZHGWMrermq1ijnoSV8MhMdVd3
 eCp5/EsLSMyMKocIrGJXL9ILVbPZfRVFeY9xAL9erA6qp4jZKHM135LBDV/vk4wI7lHO6a/uvzve0
 bGj5/BvOctbKauCtuVX6xLek7+9ARdAn2zJEvt27djbgZ2KZZe4YWHIe5hGGkaDOQLpTSn6YQORLg
 aQZFuRJiGpMEdjoYh5+ia8gM4X6uQG27IuIhuszdhLkvVbuTxXXlc6YiBL2903S1wN0iDAaDNWUV8
 xYjUPCNQ==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAQ-008scY-VI; Thu, 30 Nov 2023 17:45:35 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 09/17] drm/v3d: Create tracepoints to track the CPU job
Date: Thu, 30 Nov 2023 13:40:32 -0300
Message-ID: <20231130164420.932823-11-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create tracepoints to track the three major events of a CPU job
lifetime:
	1. Submission of a `v3d_submit_cpu` IOCTL
	2. Beginning of the execution of a CPU job
	3. Ending of the execution of a CPU job

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c  |  4 +++
 drivers/gpu/drm/v3d/v3d_submit.c |  2 ++
 drivers/gpu/drm/v3d/v3d_trace.h  | 57 ++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index c89e92fc614c..ebbd00840a73 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -288,8 +288,12 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	file->start_ns[V3D_CPU] = local_clock();
 	v3d->queue[V3D_CPU].start_ns = file->start_ns[V3D_CPU];
 
+	trace_v3d_cpu_job_begin(&v3d->drm, job->job_type);
+
 	cpu_job_function[job->job_type](job);
 
+	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
+
 	runtime = local_clock() - file->start_ns[V3D_CPU];
 
 	file->enabled_ns[V3D_CPU] += runtime;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 124935547f17..c134b113b181 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -824,6 +824,8 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 	}
 
+	trace_v3d_submit_cpu_ioctl(&v3d->drm, cpu_job->job_type);
+
 	ret = v3d_job_init(v3d, file_priv, &cpu_job->base,
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
2.42.0

