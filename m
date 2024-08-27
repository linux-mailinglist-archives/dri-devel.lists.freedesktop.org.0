Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED8E96038E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 09:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44CA10E17A;
	Tue, 27 Aug 2024 07:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IJ80h9f6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA7F10E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724744766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lCIJZLOyjsTHc0FIhkASd9ONi97hrv0PKkErCwe7I28=;
 b=IJ80h9f6WF2XHXRvJTmsMQFFLfUO2Ib2Uj2O9sPhxfvQEI6iQmqlOS65SzndZb5ReUbpeR
 b/IE87XJa28mCK7uSYONrANj+NoAhx7ofHUUQiPuS4MBlf+Djhb7vSSNtc99kV69eadimX
 1CreMSzn93CnQh5RULWWeJr8baAvl+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-HeN2qPejM6mxcBhFhjxYuw-1; Tue, 27 Aug 2024 03:46:03 -0400
X-MC-Unique: HeN2qPejM6mxcBhFhjxYuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso49459985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 00:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724744762; x=1725349562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCIJZLOyjsTHc0FIhkASd9ONi97hrv0PKkErCwe7I28=;
 b=SE2LtmeXmGoH0+FGzm3ALeFi837Upp0nBwsVjbybrTqIfj0sPlRr7360KzVyJ8rX65
 wn6LycdbZm8vn8s19ySCB5oVcVBLutLMYQgLSEAKbB75KUK4QvcwI7MpvbNIRmMzTdiQ
 GYk8p2gxjYx5xtw9JFG6++GlGlgPrA19rk8uuoYpzhXAeulSePF28DcX4tZRfC7F1s0P
 YPEfUIvZ2zZ+aXBof+wRi2vILEVmQNgi0EX0BIZqxOxR6vtb8I29VcwlX8dkVEWuO5zw
 XCwKrHY0zsRaaBdWcGbNbKxWXHEs8Sw7uTo1Z/pvsOQqtC5wKHAOp6h+5FnzdtRQanRX
 0Vsg==
X-Gm-Message-State: AOJu0YyC9C+/0BVZ7ZCCgOZ55UMRhsSenRQV+C45kGzB2cHxXMGUXGeQ
 6XcluGSM99FwBR5eum2XuRbaoZn1NXlolSABW78PTR4XjG0f7QWsnunl83zAgpYyLxdxFy6TQdm
 RTKSY0IsVezjE1TLdQ4qFzZjGhPpAiRO6u63PFCR9Gy+Msx8p5fQ75/vjvlfS1t3DDw==
X-Received: by 2002:a05:600c:35d0:b0:428:1799:35e3 with SMTP id
 5b1f17b1804b1-42b9ade4cdfmr11440855e9.21.1724744761785; 
 Tue, 27 Aug 2024 00:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGik2Opx3PDeJb8i8wW51P+RCvHvq1UmLg7w5MEaT370ExIUUEkmFSlpr26Nf6rxq8yfswqKg==
X-Received: by 2002:a05:600c:35d0:b0:428:1799:35e3 with SMTP id
 5b1f17b1804b1-42b9ade4cdfmr11440615e9.21.1724744761183; 
 Tue, 27 Aug 2024 00:46:01 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42b95c1eef6sm51299435e9.8.2024.08.27.00.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 00:46:00 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/sched: Fix UB pointer dereference
Date: Tue, 27 Aug 2024 09:45:22 +0200
Message-ID: <20240827074521.12828-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
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

In drm_sched_job_init(), commit 56e449603f0a ("drm/sched: Convert the
GPU scheduler to variable number of run-queues") implemented a call to
drm_err(), which uses the job's scheduler pointer as a parameter.
job->sched, however, is not yet valid as it gets set by
drm_sched_job_arm(), which is always called after drm_sched_job_init().

Since the scheduler code has no control over how the API-User has
allocated or set 'job', the pointer's dereference is undefined behavior.

Fix the UB by replacing drm_err() with pr_err().

Cc: <stable@vger.kernel.org>	# 6.7+
Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Reported-by: Danilo Krummrich <dakr@redhat.com>
Closes: https://lore.kernel.org/lkml/20231108022716.15250-1-dakr@redhat.com/
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..356c30fa24a8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		 * or worse--a blank screen--leave a trail in the
 		 * logs, so this can be debugged easier.
 		 */
-		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
+		pr_err("*ERROR* %s: entity has no rq!\n", __func__);
 		return -ENOENT;
 	}
 
-- 
2.46.0

