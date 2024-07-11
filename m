Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E592E335
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1D10E9BF;
	Thu, 11 Jul 2024 09:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GN1hw++2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128BE10E9C2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zJ7rNM2TLeNhsmbhTQPtz3yMcMEr7fhXFuoaaq4fu2Y=; b=GN1hw++2tM6qfv2HJM+wToFW0G
 o/6YxO17U3VI8sCt3QY32mFB8Ow/2uR0y6svd6b+JtG24DXvhLLZP+vH9xdsxxC3BNcDgKNdtd22z
 uP7MYz/0qW4t3ygBnTmjTJgPb1jxllxzSZFJkB8rz38otkghbnCOviny8MJ1zlV2wRKLlxVYrguFx
 mfyo6qNEHkRk/9wswOylrrNrYBja1kxDG3z7EM9rx7avYHygLlzsG9mKMvsevgVspns+RzA5bYk+h
 NBzrQPxPFqkQsvnd5pUxwNPWxuESrD/D1/64MSdB3ehq+Dl+ZTkJ3N8zZjYJ+VZzKDNUJEAWmelcA
 0BY+y+uw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRpty-00DcKX-C7; Thu, 11 Jul 2024 11:15:46 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
Subject: [PATCH 04/11] drm/v3d: Validate passed in drm syncobj handles in the
 timestamp extension
Date: Thu, 11 Jul 2024 10:15:35 +0100
Message-ID: <20240711091542.82083-5-tursulin@igalia.com>
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

Fix it by checking handle was looked up successfully or otherwise fail the
extension by jumping into the existing unwind.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 9ba0ff3e083f ("drm/v3d: Create a CPU job extension for the timestamp query job")
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Iago Toral Quiroga <itoral@igalia.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/v3d/v3d_submit.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index d626c8539b04..e3a00c8394a5 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -498,6 +498,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 		}
 
 		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!job->timestamp_query.queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	job->timestamp_query.count = timestamp.count;
 
@@ -552,6 +556,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 		}
 
 		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!job->timestamp_query.queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	job->timestamp_query.count = reset.count;
 
@@ -616,6 +624,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 		}
 
 		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!job->timestamp_query.queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	job->timestamp_query.count = copy.count;
 
-- 
2.44.0

