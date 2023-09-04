Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A869C791C2C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD90810E3CE;
	Mon,  4 Sep 2023 17:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68F10E3CA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6oBzeutVeCkn956eUnxIc5d5ac49gLhcNqAKwTWO3ZM=; b=fO7cnov6eOo3uCSWMC3X96TQvc
 o4w/Cl7A2hK9dl2nBJmtyHVEbODoCxW53igSz01Q5zpifkzOKa+gj8G4fZpPDMREt/lAyAXs/Lhyd
 Z5uTy1zsIBkdf0vIQA/AWmLHHgrGCGOus0PIY4lmd77EbeoDNsseicnHsE24APMWuev23JR6eLSq9
 MTRvegS1M+Hn6AMdfqK3Ewkm03mKGspT+qb3UmBh1oQMaZeQ4xB9uqosdiqS7gnos0BHjqPf8Xpc3
 KeRUE5J8K5JhxNYfH0SL5RqzDIClUMq9XNyppvYuyyKfVoEGInswBVPwcWxx6whhhptCGlWb4CPYJ
 7sJ+lVMw==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDjZ-0028nB-0p; Mon, 04 Sep 2023 19:51:33 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/17] drm/v3d: Create tracepoints to track the CPU job
Date: Mon,  4 Sep 2023 14:38:57 -0300
Message-ID: <20230904175019.1172713-10-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904175019.1172713-1-mcanal@igalia.com>
References: <20230904175019.1172713-1-mcanal@igalia.com>
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
index 88c483da360c..85c11e0fe057 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -262,8 +262,12 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 		return NULL;
 	}
 
+	trace_v3d_cpu_job_begin(&v3d->drm, job->job_type);
+
 	v3d_cpu_job_fn[job->job_type](job);
 
+	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
+
 	return NULL;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index ff8a77a4e2b0..5402d8aacb71 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -805,6 +805,8 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
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

