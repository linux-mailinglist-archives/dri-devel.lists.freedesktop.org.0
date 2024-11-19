Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD09D272D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CA010E63E;
	Tue, 19 Nov 2024 13:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MFVDvEAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD610E638
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732023791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IM6q7lPHlKw7C8MOy/l7XDFqHINGkT4HlVPOzeoZ1E=;
 b=MFVDvEAZuCXGriL5T10IUdm4yO1TSO0gIoGsezY3hpEkb6cVs2PV9wofUKIX2CtYUKTtTX
 lNmYoxDBVwzdMrmTscMf5UOiEp3pZKmMqwy7NapaFPfWzGWYJfAaokF8I9bVnDjX3lyVOX
 OJlWSYKHfop59242vgRzYyrp691S1JA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-6k466TgCNBah8p3-Zlvv8w-1; Tue, 19 Nov 2024 08:43:10 -0500
X-MC-Unique: 6k466TgCNBah8p3-Zlvv8w-1
X-Mimecast-MFC-AGG-ID: 6k466TgCNBah8p3-Zlvv8w
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b141ea40dcso712599485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 05:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732023790; x=1732628590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IM6q7lPHlKw7C8MOy/l7XDFqHINGkT4HlVPOzeoZ1E=;
 b=VnzkJLmOuuzwsgqQbGwTG0qh2hYWvt1GaOjZ030SUpD2JqftiZQHnE9Y69W3UozHrC
 049eISxfKoj927POHA/gQMiiKxVom87B6CJwp3nWjj1VeHEQu3VtuHUXmG2GOYcLjrD9
 qlcO4IXc8yskJKoQErSEvNMoo6TTKSWDJDT4hcr7JV9hrjg5wcUMoR0R7AmF5zgESS6T
 5wUO+wpI195bNFjuTmG2WkCIFwgbeCZI6kGRzMzfD1J0lPeE+fUGCl3VF3mvDYBUhfFa
 vn1/XQZcn9uZXhXCBIx2CmKTOxb8fFc4Cm2sqL3lwmz3PqW5SxpcPZvdasXyG46baYR1
 8vVw==
X-Gm-Message-State: AOJu0YxdPl/Dnfskx+9YaQkfp+JU6oIgGDVycupInwR/SktYpY18VF4S
 OR17aa52s6aLZYO+jT4SlCiXbcvnEWwHs99ZW/Qo0erJH5U0WmtZS20Ve71hd1SstPFmcDlOVF4
 u3d9vcmgIlkduoBX7eNf90enX4c8xewJgTT9T/NuRmpmna8SsHEA+wUkzSfCOUN2Ibg==
X-Received: by 2002:a05:620a:269b:b0:7b1:51e9:ed77 with SMTP id
 af79cd13be357-7b362295753mr2552954685a.10.1732023790161; 
 Tue, 19 Nov 2024 05:43:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG/xwFaUxOxPW1wDrOOSo9UtfbQeOA5GrZcLn6I8J8cQ6ka6/q58utbZ7HRC+hOW2oKPOs+Q==
X-Received: by 2002:a05:620a:269b:b0:7b1:51e9:ed77 with SMTP id
 af79cd13be357-7b362295753mr2552951785a.10.1732023789869; 
 Tue, 19 Nov 2024 05:43:09 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b37a8aa02fsm92513685a.128.2024.11.19.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 05:43:09 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/sched: Fix docu of drm_sched_entity_flush()
Date: Tue, 19 Nov 2024 14:41:23 +0100
Message-ID: <20241119134122.21950-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119134122.21950-2-pstanner@redhat.com>
References: <20241119134122.21950-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T2izTTnwu9LoKCXGNzrFcH_7KoYWZlEXHAMjt-1jTdw_1732023790
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_entity_flush()'s documentation states that an error is being
returned when "the process was killed". That is not what the function
actually does.

Furthermore, it contains an inprecise statement about how the function
is part of a convenience wrapper.

Move that statement to drm_sched_entity_destroy().

Correct drm_sched_entity_flush()'s documentation.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 16b172aee453..7af7b448ad06 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -270,15 +270,12 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 
 /**
  * drm_sched_entity_flush - Flush a context entity
- *
  * @entity: scheduler entity
- * @timeout: time to wait in for Q to become empty in jiffies.
- *
- * Splitting drm_sched_entity_fini() into two functions, The first one does the
- * waiting, removes the entity from the runqueue and returns an error when the
- * process was killed.
+ * @timeout: time to wait in jiffies
  *
  * Returns: 0 if the timeout ellapsed, the remaining time otherwise.
+
+ * Waits at most @timeout jiffies for the entity's job queue to become empty.
  */
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 {
@@ -290,7 +287,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 		return 0;
 
 	sched = entity->rq->sched;
-	/**
+	/*
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
 	 */
@@ -359,8 +356,11 @@ EXPORT_SYMBOL(drm_sched_entity_fini);
  * drm_sched_entity_destroy - Destroy a context entity
  * @entity: scheduler entity
  *
- * Calls drm_sched_entity_flush() and drm_sched_entity_fini() as a
- * convenience wrapper.
+ * Convenience wrapper for entity teardown.
+ *
+ * Teardown of entities is split into two functions. The first one,
+ * drm_sched_entity_flush(), waits for the entity to become empty. The second
+ * one, drm_sched_entity_fini(), does the actual cleanup of the entity object.
  */
 void drm_sched_entity_destroy(struct drm_sched_entity *entity)
 {
-- 
2.47.0

