Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5860E4EA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0110E57F;
	Wed, 26 Oct 2022 15:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F8F10E576;
 Wed, 26 Oct 2022 15:36:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so22250184ejb.13;
 Wed, 26 Oct 2022 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoMWQpOsm4pNAdd277GYa33vLcAp9QeaHSjtvnxhucU=;
 b=ca17gAjP3fSdJAHUU8tMza3zNqXHfORa18aw4dw0lxXOAV1lGEYUsgugaDx/4hTJTN
 kbtMCn7ziKKcEApabUAwJxHgF5Y3y57KKTwTv2Whqip1klnaDm/VcaDzkuVzAdh2H/gJ
 UMHBAD8E3+JHqeDVOiwfi1ZQN7qoHrjRa0PANZ6HrFXfkFSq3F96Q+8H3ckB5kbaTzA3
 demPeVKKbOg0BZiI0hB8C68UNezVgHMcQEArWNCTjHETQhyC3Pczkz7dsuOfzz2MnL3l
 ZQ62bf8kdgtWwVVGGCr6yjxcMwhl3Vv2i6q3k4EiMLT5zIU7M0q0OWmiznQo5AplTPnc
 gFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JoMWQpOsm4pNAdd277GYa33vLcAp9QeaHSjtvnxhucU=;
 b=zfLHCMo1HyErAtV1iJY1FU9/MSPBN0AmreFHts0E1RCoVxN6VA2C926eziiDj0gEWa
 LxpuZhH/OxB1ITy30AEBZDg/BUehVq6H6Jh3wEvGKjT3fB13f78bugJWNvEiI33QqsDv
 8TBnBxIR0wO5c+Y7+SFL11nJGqr72nzzkr7q/FcdqEUKhKgITqCVnajhD/UFW/By5/XE
 7y/hLjA8TLQ6bkBjkWsq302CsF3KPCGIOqtupp8o+087g8CGrkhuZ1LKFz6KHiRaZMUs
 wUcnqmWQcuG8XOWwbU79rx0zZyhFLEbGRAyFIairr1XRffCGaJBB1QHyTXNxxl2bszqc
 5d5g==
X-Gm-Message-State: ACrzQf3q5aGJuZCZkt5VU1+SK6HDrioqGSZKu66BNc9i52ndnCUGnKf2
 ipyYrWpfocbpFsuJeYiFTZkV/FYg4VI=
X-Google-Smtp-Source: AMsMyM5NTpvpUw/S0Eo3inEJKVAMsXZbEWqmHn01qoFJAn5Si/voQ8g2JHsjwbUfEJi1N5nvh9t+Kg==
X-Received: by 2002:a17:907:a055:b0:7a4:48e1:65c3 with SMTP id
 gz21-20020a170907a05500b007a448e165c3mr17559336ejc.764.1666798563831; 
 Wed, 26 Oct 2022 08:36:03 -0700 (PDT)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170907780300b007abafe43c3bsm3066715ejc.86.2022.10.26.08.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:36:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/scheduler: deprecate drm_sched_resubmit_jobs
Date: Wed, 26 Oct 2022 17:35:57 +0200
Message-Id: <20221026153557.63541-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026153557.63541-1-christian.koenig@amd.com>
References: <20221026153557.63541-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This interface is not working as it should.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bb28f31bff6f..ecd4afab4adb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -489,10 +489,21 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 EXPORT_SYMBOL(drm_sched_start);
 
 /**
- * drm_sched_resubmit_jobs - helper to relaunch jobs from the pending list
+ * drm_sched_resubmit_jobs - Deprecated, don't use in new code!
  *
  * @sched: scheduler instance
  *
+ * Re-submitting jobs was a concept AMD came up as cheap way to implement
+ * recovery after a job timeout.
+ *
+ * This turned out to be not working very well. First of all there are many
+ * problem with the dma_fence implementation and requirements. Either the
+ * implementation is risking deadlocks with core memory management or violating
+ * documented implementation details of the dma_fence object.
+ *
+ * Drivers can still save and restore their state for recovery operations, but
+ * we shouldn't make this a general scheduler feature around the dma_fence
+ * interface.
  */
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
 {
-- 
2.25.1

