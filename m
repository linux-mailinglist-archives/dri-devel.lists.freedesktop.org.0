Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659692C048
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11210E5FF;
	Tue,  9 Jul 2024 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PF+MYIye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93CD10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=koLDN1PR3znJTaiuCGWTae1dfYUoXjyFBExlwnb98oc=; b=PF+MYIye1SgGQP2nPpvf6ldq7D
 Y0Tlc5gIqFpWZW/W8+vrMDzEigYAIApGmronRc5RgFKlSHntv6ObK4a3tHnF2IKYeV4cAqfQI5J8Z
 O6d9X/vEjkDhEEw7TgB3h5skFL89GyGoj7gKgu5P4sg/czH//xyE8nl/7RBRo5mpCI4RO1Hlw+BIF
 4lmS8EzgezvhdK5HXzH8RZsIuj1GEyFsm4m3QP5ddmHfhal0apoD7MTYr987djnrRLkjVbvzBOIcU
 UzG/xRhESqzi8L+b9oMvVIeHFEg+5JDnEGSr2bNQU1/pQ84xOSnwbYxAtMtv6SfgNp94MluSQ/wCf
 xqu022cQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRDnX-00CsoV-WC; Tue, 09 Jul 2024 18:34:36 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
Subject: [PATCH 07/12] drm/v3d: Validate passed in drm syncobj handles in the
 timestamp extension
Date: Tue,  9 Jul 2024 17:34:20 +0100
Message-ID: <20240709163425.58276-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240709163425.58276-1-tursulin@igalia.com>
References: <20240709163425.58276-1-tursulin@igalia.com>
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
Fixes: 9ba0ff3e083f ("drm/v3d: Create a CPU job extension for the timestamp query job")
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Iago Toral Quiroga <itoral@igalia.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/v3d/v3d_submit.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 81afcfccc6bb..a408db3d3e32 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -499,6 +499,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 		}
 
 		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	qinfo->count = timestamp.count;
 
@@ -554,6 +558,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 		}
 
 		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	qinfo->count = reset.count;
 
@@ -619,6 +627,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 		}
 
 		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
+		if (!qinfo->queries[i].syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
 	}
 	qinfo->count = copy.count;
 
-- 
2.44.0

