Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF392E338
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293710E9C6;
	Thu, 11 Jul 2024 09:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cErZLg6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABAF10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YPNiIz3stEkLohQYb4JLVFQLWPs2wC9BvTR5uzKIUTI=; b=cErZLg6FViMKXrjiAF2rv89ZDn
 lPviyuHKQ8BqgQUkECCaYahJES4KeOKP3p+fU2/I41m06NqQ3rUk1EkqyPemIrWX4nm3YcUigJh82
 UaPiOPYIN25Xgj6h4arAaAuabv1RtK2inxfRLch4xm6iLkh/aTdGd9wlFCI5c0lsF6RHEZ0RHgiWI
 ROyw/3j6WDVqPbLGTfTLT5vZobWGem6hihHwVkelfmHKIMxe+Zsv2wfL6jac5xT/QZvYhF1PVi8pw
 mmdkt7c7gB+e03KO/ehab1Ir9+HGAOCrz3QrOENqSchvwxPRRUYoer/ip6uUxEPh0FzwYTaCBu/QA
 wnCfx0Vg==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRptz-00DcKd-1N; Thu, 11 Jul 2024 11:15:47 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
Subject: [PATCH 05/11] drm/v3d: Validate passed in drm syncobj handles in the
 performance extension
Date: Thu, 11 Jul 2024 10:15:36 +0100
Message-ID: <20240711091542.82083-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240711091542.82083-1-tursulin@igalia.com>
References: <20240711091542.82083-1-tursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

If userspace provides an unknown or invalid handle anywhere in the handle
array the rest of the driver will not handle that well.

Fix it by checking handle was looked up successfuly or otherwise fail the
extension by jumping into the existing unwind.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: bae7cb5d6800 ("drm/v3d: Create a CPU job extension for the reset performance query job"
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Iago Toral Quiroga <itoral@igalia.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/v3d/v3d_submit.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index e3a00c8394a5..3838ebade45d 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -710,6 +710,10 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 		}
 
 		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!job->performance_query.queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	job->performance_query.count = reset.count;
 	job->performance_query.nperfmons = reset.nperfmons;
@@ -790,6 +794,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 		}
 
 		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!job->performance_query.queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	job->performance_query.count = copy.count;
 	job->performance_query.nperfmons = copy.nperfmons;
-- 
2.44.0

