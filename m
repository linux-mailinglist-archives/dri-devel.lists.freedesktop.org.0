Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E792D311
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDAA10E7C2;
	Wed, 10 Jul 2024 13:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fWkO0ve+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A1A10E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TDtqO9MK8SgdF8kKESLOgURvKmp06Mz+kofQjG5MKBY=; b=fWkO0ve+2N6QbsEi4LXNJyereh
 AcV0bzF/ggX10V+YBTWxtu0aIayWLhVANO/R1reGpmcUCSGmJWYkFpVZE57nYKF0d8mvjaDKjMguD
 uSDaYMLJReWk3679Nmr0LRo6HAabORdOFMlPoTDn5p7VBSzG5d+yk+IlOcs3IfqHAgeYi0QU8sFeW
 pW4pfTXg0BsTLdgjpqYccFLfNnzDVg2BD0qDPcZjGJIbwhdmSmtPhF0nB/heLquLyD8Zz5mUxoOJZ
 NDw/RIVeV8CBd7+L+DCUo0RYZMcfXhjlsFgt3mbtgG2kcMcGHGFwf6hMJflzZkH8CZcEwWuX6i//t
 Wq3budDQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRXZl-00DH1y-Kw; Wed, 10 Jul 2024 15:41:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 12/12] drm/v3d: Prefer get_user for scalar types
Date: Wed, 10 Jul 2024 14:41:30 +0100
Message-ID: <20240710134130.17292-13-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710134130.17292-1-tursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

It makes it just a tiny bit more obvious what is going on.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index b0c2a8e9cb06..9273b0aadb79 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -486,14 +486,14 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	for (i = 0; i < timestamp.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
 		qinfo->queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
@@ -552,7 +552,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 		qinfo->queries[i].offset = reset.offset + 8 * i;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
@@ -614,14 +614,14 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	for (i = 0; i < copy.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
 		qinfo->queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
-- 
2.44.0

