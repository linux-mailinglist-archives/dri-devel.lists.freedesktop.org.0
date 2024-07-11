Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F992E33A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6A10E9C7;
	Thu, 11 Jul 2024 09:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RVz3MHY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F175010E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0mbz/fQwzoPySa2Th0QZboE8GOJpawLUq/2KBSEB9pI=; b=RVz3MHY1BFkyd9RfpH+FgREVk8
 bvm60f+IMa8aN7UI2caTZdC6sEq3qwBQkObxIOIyrTJW7vjohbN2sfpv7rVzkYVm95bwd2L5cZST3
 ag9ZZSB+7Hyp1APkLfa29dT2PbsJlMk96x8vcJVAHn/R+PEbrI6sCl2hGix1mGFTtOBLXqfVI2muk
 cz/FgXi5cgrOVZ18NRd+zCMEe8kPcSYNKic/QY985hEXGTOsKKvCNgWDZZ9rP/79NojECXGHuVR+w
 yv1Litli7z9/XmPW7ZdQPdGes4TpY+c1bwQl90ZSpffX0g3yGIBDAc9YLoOkLqSkK/l74HZemS7J+
 v3WQVSzQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRpu2-00DcL7-9M; Thu, 11 Jul 2024 11:15:50 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 10/11] drm/v3d: Prefer get_user for scalar types
Date: Thu, 11 Jul 2024 10:15:41 +0100
Message-ID: <20240711091542.82083-11-tursulin@igalia.com>
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

It makes it just a tiny bit more obvious what is going on.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index d1060e60aafa..b282d12571b5 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -485,14 +485,14 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	for (i = 0; i < timestamp.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
 		job->timestamp_query.queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
@@ -550,7 +550,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
@@ -611,14 +611,14 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	for (i = 0; i < copy.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			err = -EFAULT;
 			goto error;
 		}
 
 		job->timestamp_query.queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			err = -EFAULT;
 			goto error;
 		}
-- 
2.44.0

