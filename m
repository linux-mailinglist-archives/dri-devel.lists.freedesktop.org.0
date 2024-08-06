Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B50949347
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347ED10E397;
	Tue,  6 Aug 2024 14:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VDmT+qQH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7A10E399
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722955146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lulMY4n2fPx2dahXNVvaLbYmQNJeQbtHnB6R7KxHAis=;
 b=VDmT+qQHq45FyvNBIVcpvCADox685osB3BsHIH3TKtdB3XJxi8B8ozs9Xi1a/RLAmIbgA+
 6dmJbycrwxQ73NFn5uJGXN1Si4s2g8MYgvNtf7XAbQobVOnU2J6ml10ezHoAgwRIhqu9WF
 Eqqkz41H0RrkaVp2NoKsHtf8suuPlXc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-XjcKeYIiN9WggsvxUeGXEA-1; Tue, 06 Aug 2024 10:39:05 -0400
X-MC-Unique: XjcKeYIiN9WggsvxUeGXEA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ef1c0f5966so794051fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 07:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722955143; x=1723559943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lulMY4n2fPx2dahXNVvaLbYmQNJeQbtHnB6R7KxHAis=;
 b=EgxpX767gX9zW+ua0/EdHzU3Tq6a+C1AfMX0tuEb7kqk/OsbL8wS1YLrFYXLShoeg2
 gGgBAK/k5T4PmlKGT4bZ3XQ8/D2gWxEJSod4ZTKT3argsaRSyj24qslvcq6o3pWcF7f3
 TIAuEbRMVxqahdz6fX7EUxrszvmyxCI/MQkSNVA31WG4Dd5Hnt82UC01z7Au7QZsDSUR
 zkgehkpY8431ptYfRJS3AXzebbpAGRQF2Hqi2uVX0Z0d1F6oA5pSTUJIwMD21eHdTP4q
 UFVynUuLiT0azgxxV1eFBiKkBTDro7KpuMr8fUCXIWOdXB6AyCcSsUKwbeDJnUZ80Mua
 eivw==
X-Gm-Message-State: AOJu0Ywf4WcynHPfzsgYeH/2V+ft1dxUbKfITv3DtV896vdX93cZ+S9P
 7KQMbunW0Zt/hFcWnqw00J93AJYEOW/FyUZhLgcchLTjnGT/5FSp+b5Q29e2Qrl32gXX6/CHPRR
 Lp+UYwpHV8562xiznF23GD//qMVboY0HGpnWQ9PO30NTHrw4f3iEUoMs7n7G/h3CnsQ==
X-Received: by 2002:a2e:87d3:0:b0:2f0:1a95:7102 with SMTP id
 38308e7fff4ca-2f15ab1c215mr55822341fa.6.1722955143370; 
 Tue, 06 Aug 2024 07:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6nTV8TMdweugbmRIe2xn+r+NkGNern8stYSFF2V2rA6O68KoNSruXVS5LUUDKeNLhZZguPg==
X-Received: by 2002:a2e:87d3:0:b0:2f0:1a95:7102 with SMTP id
 38308e7fff4ca-2f15ab1c215mr55822181fa.6.1722955142966; 
 Tue, 06 Aug 2024 07:39:02 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d165b009a97301f486032f8.dip.versatel-1u1.de.
 [2001:16b8:2d16:5b00:9a97:301f:4860:32f8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e08012d7sm214285905e9.22.2024.08.06.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:39:02 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 2/2] drm/sched: warn about drm_sched_job_init()'s partial init
Date: Tue,  6 Aug 2024 16:38:56 +0200
Message-ID: <20240806143855.29789-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806143855.29789-2-pstanner@redhat.com>
References: <20240806143855.29789-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

drm_sched_job_init()'s name suggests that after the function succeeded,
parameter "job" will be fully initialized. This is not the case; some
members are only later set, notably "job->sched" by drm_sched_job_arm().

Document that drm_sched_job_init() does not set all struct members.

Document that job->sched in particular is uninitialized before
drm_sched_job_arm().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 include/drm/gpu_scheduler.h            | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1498ee3cbf39..2adb13745500 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -911,6 +911,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * Drivers must make sure drm_sched_job_cleanup() if this function returns
  * successfully, even when @job is aborted before drm_sched_job_arm() is called.
  *
+ * Note that this function does not assign a valid value to each struct member
+ * of struct drm_sched_job. Take a look at that struct's documentation to see
+ * who sets which struct member with what lifetime.
+ *
  * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
  * has died, which can mean that there's no valid runqueue for a @entity.
  * This function returns -ENOENT in this case (which probably should be -EIO as
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ce15c50d8a10..7df81a07f1f9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -337,6 +337,13 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
 struct drm_sched_job {
 	struct spsc_node		queue_node;
 	struct list_head		list;
+
+	/*
+	 * The scheduler this job is or will be scheduled on.
+	 *
+	 * Gets set by drm_sched_arm(). Valid until the scheduler's backend_ops
+	 * callback "free_job()" is  called.
+	 */
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 
-- 
2.45.2

