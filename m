Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38EBC3FC1
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9186D10E7AE;
	Wed,  8 Oct 2025 08:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mbvM7/5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A975410E79F;
 Wed,  8 Oct 2025 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H35/cjmPaDHYl2B3Ku0xGtaj0d2xPh91+AUO2w1yF5E=; b=mbvM7/5If9AOEhpzhtW1++FcMW
 0NO7vFVpEVQSREfaJX0488w6iWmM39E7OZVyN7gfEGG2gnX0h/O9o6brzfeIXgNK7q+uQpYoq/78S
 KDrEyOvAGpAMnhbOGxABt1BzL8o3lVHolRR9m8JYUi85FSXnB7HQ3j6UO+kFMVpWfH5th88U1Hh+X
 JmV+av9VydhM/UcNb09n34730JHmfCLylQERRpw58wIfYVWDUwBg1IwrAbXRsWbWSvDOfAdhODEEy
 JybaA9fQ1LjlzLcG8A2pnXVmL/V/vLgHsdyNkEmMWI1AcmakZA95FArysSF6+Gt6B2OUkQQUck9b1
 CiAkYsXA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v6PwG-006Z19-E0; Wed, 08 Oct 2025 10:54:24 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Qiang Yu <yuq825@gmail.com>, lima@lists.freedesktop.org
Subject: [PATCH 20/28] drm/lima: Remove drm_sched_init_args->num_rqs usage
Date: Wed,  8 Oct 2025 09:53:51 +0100
Message-ID: <20251008085359.52404-21-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: lima@lists.freedesktop.org
---
 drivers/gpu/drm/lima/lima_sched.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 739e8c6c6d90..88a861cb5c39 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -519,7 +519,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 			       lima_sched_timeout_ms : 10000;
 	const struct drm_sched_init_args args = {
 		.ops = &lima_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = 1,
 		.hang_limit = lima_job_hang_limit,
 		.timeout = msecs_to_jiffies(timeout),
-- 
2.48.0

