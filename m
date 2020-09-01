Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50218259494
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 17:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258D6E875;
	Tue,  1 Sep 2020 15:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B646E875;
 Tue,  1 Sep 2020 15:41:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o20so988968pfp.11;
 Tue, 01 Sep 2020 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrLlTmYG1RGdAv4uh1a2Vj9Ca0f5vJ6xgSyvmtjMFJ8=;
 b=c703Ej1oAv/twTNahzRLiABY2Gdfj7BHDVrm64a2qQIk4mlySrEPWPWhBXk/Z7YV7C
 7KLjWx47ts3wDWsWsoN9gKXOjI3ISM8D5mAqiTDqv1CPUxYxVqQC4dhHxl/2jdg5HfYq
 /0V2gpsi/tRtSRlREjtuAU7/0/W1trOjERb0ON/1C9AXajlPBR/N6hqCBq6moOHQR671
 KqDgmh1voQ822awqEID/n/fcfSkOiOvTBlUvycWF8edxaG8KXWfbRRRd+GKhFfrBF3G8
 8wfE/zjANx9DOG98a6BPskMiedzWuGyVrZJfnj+WioMkmfOEhJeNtak0wQeSAcQ2Dwk9
 f32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrLlTmYG1RGdAv4uh1a2Vj9Ca0f5vJ6xgSyvmtjMFJ8=;
 b=SlEwEV+h1+5a+Tai2gOsfcvbUb/4jPBpNl9GrSXSekbFpB6Cs8zxw0L0M2VVb454Vq
 2rl9WwfzJIa+/+blzCqtrnPs8G6spN54urhrvE2iiW/WL3HDE1+woMaloLrR1CqDskBP
 1ZQQQ7CQHzlgIE2GlA/+glPk5BEaRyMMzUUEi3YwOKIqMPkjMxZlMTwLFVVDHjEt3QLm
 mQ7aTeg9RF4K586EhRdGSp2O1XsdrMVtOrElZOiZydaAuYkVEE8tLVvgGagZdBgf3Myy
 ZOX3KSZxJF6g5vynATH+NtX61yEoKrDuamHQvmaMvEhBQewPXXA2PhBVkKOuQCiYIy0K
 hBqA==
X-Gm-Message-State: AOAM530GKd+LzmooIZXBdMOrSV1VEd9kxFC0IbIJxvsPPD/ZSxVi1kce
 yWS8JsCS60R5YQ3bVQ6qkWmg0DT3PBWuiA==
X-Google-Smtp-Source: ABdhPJyFbCGyio3eMah/PcTiHzD5KOkPR/XDwROjdZrngkCxNWsVjpHitZHMPdN8toexNvaczokcKw==
X-Received: by 2002:a63:5f8b:: with SMTP id t133mr2072708pgb.238.1598974875113; 
 Tue, 01 Sep 2020 08:41:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id h11sm2454426pfq.101.2020.09.01.08.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:41:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm: Convert shrinker msgs to tracepoints
Date: Tue,  1 Sep 2020 08:41:55 -0700
Message-Id: <20200901154200.2451899-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901154200.2451899-1-robdclark@gmail.com>
References: <20200901154200.2451899-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This reduces the spam in dmesg when we start hitting the shrinker, and
replaces it with something we can put on a timeline while profiling or
debugging system issues.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +++--
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 722d61668a97..482576d7a39a 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -6,6 +6,7 @@
 
 #include "msm_drv.h"
 #include "msm_gem.h"
+#include "msm_gpu_trace.h"
 
 static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
 {
@@ -87,7 +88,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		mutex_unlock(&dev->struct_mutex);
 
 	if (freed > 0)
-		pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
+		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
 	return freed;
 }
@@ -123,7 +124,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	*(unsigned long *)ptr += unmapped;
 
 	if (unmapped > 0)
-		pr_info_ratelimited("Purging %u vmaps\n", unmapped);
+		trace_msm_gem_purge_vmaps(unmapped);
 
 	return NOTIFY_DONE;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 07572ab179fa..1079fe551279 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -114,6 +114,32 @@ TRACE_EVENT(msm_gmu_freq_change,
 		TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
 );
 
+
+TRACE_EVENT(msm_gem_purge,
+		TP_PROTO(u32 bytes),
+		TP_ARGS(bytes),
+		TP_STRUCT__entry(
+			__field(u32, bytes)
+			),
+		TP_fast_assign(
+			__entry->bytes = bytes;
+			),
+		TP_printk("Purging %u bytes", __entry->bytes)
+);
+
+
+TRACE_EVENT(msm_gem_purge_vmaps,
+		TP_PROTO(u32 unmapped),
+		TP_ARGS(unmapped),
+		TP_STRUCT__entry(
+			__field(u32, unmapped)
+			),
+		TP_fast_assign(
+			__entry->unmapped = unmapped;
+			),
+		TP_printk("Purging %u vmaps", __entry->unmapped)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
