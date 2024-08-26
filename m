Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A095ED82
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 11:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC0710E12A;
	Mon, 26 Aug 2024 09:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bGBJd8aX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2450910E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724665172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uR899B065jOcrVl9yza1zNeFHvJl6+GeFio7R8TZkKQ=;
 b=bGBJd8aXxmiAHn9Xy6Tq68lTD+4YXSGPzX+VAlq8N2XYzSGJuIZHWkwDh5d25VrP5SpeYD
 pXOmNCVzVKTc5rC58zZ4pyW+zDKJy9QY2wTBVuv4cKDpzjk9A6D1KjL5qGC6PH+M2FVEIY
 JA5e3xalyaA3Red36YgOs/5ng2pzhdU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-Xnz87NfWP-20hzrSpVmV-A-1; Mon, 26 Aug 2024 05:39:31 -0400
X-MC-Unique: Xnz87NfWP-20hzrSpVmV-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-372fe1ba9a6so2778617f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724665170; x=1725269970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uR899B065jOcrVl9yza1zNeFHvJl6+GeFio7R8TZkKQ=;
 b=eT3SwBs9s7aBaqf7CHsopWZATDrm2i8skN6BnUOb9U4CYflyN+7ilAGQGmwZ0mZ8qH
 8vczb4JUpOlAwWNEgKjxG0OJGt2K2kSSS/ovSYJv7ols5OMJE70k3gzPjB1EhxI+3ITh
 6/dU4i4wQ678KbNRFFxxULZjoFF9bZYDHPCqiRAHT8MCg0ntpm91RWjLED3iohhc2Rfw
 1rwpG/6EwtWZ9AuQ4zcZ4CRbdVrny0PuLkA+nYAazBdMwipZHxJJA6c8YKQW/ErdN3JY
 gIXIYJQ6rFrk8PPEaq5bHED/kTCiDe9/5ipmsc64eX6F5AFCj5zCdWsYebnPnDEb9zkJ
 7O+g==
X-Gm-Message-State: AOJu0YyOLjCZdE7PCqZwinpMOs32Gf0hy9wOhp2aMEQODqT4WBpZ7IPO
 0+n4BQ4pCKHi8Q0q9OcB5+3/UOasaiZg5y7zpnAy1s+zbgZEX2ZGa9Ri4ucYz4Ix3RTCjcsa3GX
 4puBBQNYNiXjX+0KHflSJbk2YL1c8qXR90eAgSwukW2OULbYiHlZfiWil2NOMpuzsSQ==
X-Received: by 2002:adf:e8cc:0:b0:371:8a74:4170 with SMTP id
 ffacd0b85a97d-3731185f71amr6097337f8f.24.1724665170104; 
 Mon, 26 Aug 2024 02:39:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcbKAtoD3Ot+SkhpRiDC9RWG4/j7MciBN+TRfrGtd6WnJLCGaP/EhauZN9tDTwxvdNwj1msw==
X-Received: by 2002:adf:e8cc:0:b0:371:8a74:4170 with SMTP id
 ffacd0b85a97d-3731185f71amr6097316f8f.24.1724665169545; 
 Mon, 26 Aug 2024 02:39:29 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5180106sm150418705e9.41.2024.08.26.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 02:39:29 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/sched: Document drm_sched_job_arm()'s effect on fences
Date: Mon, 26 Aug 2024 11:39:17 +0200
Message-ID: <20240826093916.29065-2-pstanner@redhat.com>
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

The GPU Scheduler's job initialization is split into two steps,
drm_sched_job_init() and drm_sched_job_arm(). One reason for this is
that actually arming a job results in the job's fences getting
initialized (armed).

Currently, the documentation does not explicitly state what
drm_sched_job_arm() does in this regard and which rules the API-User has
to follow once the function has been called.

Add a section to drm_sched_job_arm()'s docstring which details the
function's consequences regarding the job's fences.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..e563eff4887c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -831,6 +831,12 @@ EXPORT_SYMBOL(drm_sched_job_init);
  * Refer to drm_sched_entity_push_job() documentation for locking
  * considerations.
  *
+ * drm_sched_job_cleanup() can be used to disarm the job again - but only
+ * _before_ the job's fences have been published. Once a drm_sched_fence was
+ * published, the associated job needs to be submitted to and processed by the
+ * scheduler to avoid potential deadlocks on the DMA fences encapsulated by
+ * drm_sched_fence.
+ *
  * This can only be called if drm_sched_job_init() succeeded.
  */
 void drm_sched_job_arm(struct drm_sched_job *job)
-- 
2.46.0

