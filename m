Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE6930E8F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 09:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6AC10E083;
	Mon, 15 Jul 2024 07:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iuksjxav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBBB10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721027757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Y2AbOnd9Mq1S+7NRXex8Vmbtv9LUYdHTykQN+yx0Do=;
 b=iuksjxavJUklQpcJqczxwTceq+Uzd61JsRMIg4Gsxkd8rfoFBvYF3XPDk9OdBXpPUJiZDw
 EZWdRxyULx7RZDzzDXmendE2d+0sE2mIH59I6Dtx2JR6+T6YdLZP4TJtaI6m100G52DUE6
 qHRRV3GaHKSIbDejLm8Z33tIFzz1e+Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-WThJoGFwPLm5_k4IGzQCjg-1; Mon, 15 Jul 2024 03:15:53 -0400
X-MC-Unique: WThJoGFwPLm5_k4IGzQCjg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52e9c23da78so486134e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 00:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721027752; x=1721632552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Y2AbOnd9Mq1S+7NRXex8Vmbtv9LUYdHTykQN+yx0Do=;
 b=ByjSL3JKPJNHmiSSgZS5LTX+Ww9pLhB6rRdnhO5ntBKUB2ZovCMjIjrJv782U5R3UC
 eczUAPhojrDu8uH67aZzGKsw5EHxBMLofEDo28Oq3FMyXZJQDEMrA6skGbPk0r82FyOX
 WGjzxHZzqrHFUjXF5tpPsDTCNYINRepM98sI5phNLmxvjC2rPiLEt6QeTNesnE20C73h
 jC2UgBX7w9ZXcU6iHf5zkZTa0kODi2mdTGC+J/OVM2iUd98R9u6oeHN3a20SM021QF8N
 v3qORdGW/ewe4fxY0xZyZRrXEPJKKuNwJlQ8Yo1OnyUbF6Ds3ZT1U7Tp7c1VpCruZHdg
 y8rw==
X-Gm-Message-State: AOJu0YzbphC7ovo7oeblffw6AmVeLA7Pw45plOk60zB+OL8lybK6KEE+
 RobRxf1+ufEOYn4+ga9GKYSjNB12VmzzLah4a/XX6v/wfRLsC7hFZGijs8Hxe5ZOR/mE4R8O/6J
 GC0zT1L6HHG2DOhghgd3C3KZrbUpFN3JL6D/JpNBOXSF4oX8s2E6DQTXwBu95yRSJxQ==
X-Received: by 2002:a2e:9859:0:b0:2ec:4a95:5f05 with SMTP id
 38308e7fff4ca-2eec98bbdfcmr57232641fa.3.1721027751666; 
 Mon, 15 Jul 2024 00:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIxAd6BD5bhLdYSEanXaJBCdpDuS0Tp/uJ2ilToq7YjUr3fTfHTb5q7xuks66ttJZX4xDRWA==
X-Received: by 2002:a2e:9859:0:b0:2ec:4a95:5f05 with SMTP id
 38308e7fff4ca-2eec98bbdfcmr57232551fa.3.1721027751282; 
 Mon, 15 Jul 2024 00:15:51 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426740daf6dsm95815705e9.1.2024.07.15.00.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 00:15:50 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, Marco Pagani <marpagan@redhat.com>
Subject: [PATCH] drm/scheduler: Use ternary operator in standardized manner
Date: Mon, 15 Jul 2024 09:15:33 +0200
Message-ID: <20240715071533.12936-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
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

drm_sched_init() omits the middle operand when using the ternary
operator to set the timeout_wq if one has been passed.

This is a non-standardized GNU extension to the C language [1].

It decreases code readability and might be read as a bug. Furthermore,
it is not consistent with all other places in drm/scheduler where the
ternary operator is used.

Replace the expression with the standard one.

[1] https://gcc.gnu.org/onlinedocs/gcc-14.1.0/gcc/Conditionals.html

Suggested-by: Marco Pagani <marpagan@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..02cf9c37a232 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1257,7 +1257,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->credit_limit = credit_limit;
 	sched->name = name;
 	sched->timeout = timeout;
-	sched->timeout_wq = timeout_wq ? : system_wq;
+	sched->timeout_wq = timeout_wq ? timeout_wq : system_wq;
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-- 
2.45.0

