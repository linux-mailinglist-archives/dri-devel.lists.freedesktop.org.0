Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B179E5BEF05
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 23:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E010E2B1;
	Tue, 20 Sep 2022 21:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334D10E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 21:15:56 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F61A6601FF3;
 Tue, 20 Sep 2022 22:15:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663708554;
 bh=wCR3zfHJELmrJogOttjvU01URzBCA8MAipPvDe5kxXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HyYexSO7dZEl5v1I7o9f1UtUTRiwnv2V3Fqe3+cM0Og0HXbZVW6hjrQEWmfEI6rGq
 HbQpWH5ayAfzVyyF3O9a7KG8GG/wMZ+EGtHtv5+7vWM0hG0Jb56aEP5LHRMkJxmO0E
 Ud5+yQ5oJbY4oe1zoJzisJHBD4dgXio46mlaVttRQ5RLyQEzJ4OinPPsQ54K2TRO5Q
 RO+UK0HC70MJ5HrbYUikgfolVb9+EtBFxolnc1lewSOuyoQmIfVB9s3RFIt+trJx2Y
 xfRSCvIiukE7ASKlseXFUfL4DbrPgLYLruxpQCJhUdueY2iQz4AYtEp18DLkPAxjAm
 8tfuE/5NRxbVA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: alyssa.rosenzweig@collabora.com
Subject: [PATCH 2/2] drm/panfrost: replace endian-specific types with generic
 ones
Date: Tue, 20 Sep 2022 22:15:45 +0100
Message-Id: <20220920211545.1017355-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220920211545.1017355-1-adrian.larumbe@collabora.com>
References: <YynVAAaQPIPhuN55@maud>
 <20220920211545.1017355-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__le32 and __l64 endian-specific types aren't portable and not available on
FreeBSD, for which there's a uAPI compatible reimplementation of Panfrost.

Replace these specific types with more generic unsigned ones, to prevent
FreeBSD Mesa build errors.

Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7252
Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/uapi/drm/panfrost_drm.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index bd77254be121..c1a10a9366a9 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -236,24 +236,24 @@ struct drm_panfrost_madvise {
 #define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
 
 struct panfrost_dump_object_header {
-	__le32 magic;
-	__le32 type;
-	__le32 file_size;
-	__le32 file_offset;
+	__u32 magic;
+	__u32 type;
+	__u32 file_size;
+	__u32 file_offset;
 
 	union {
 		struct {
-			__le64 jc;
-			__le32 gpu_id;
-			__le32 major;
-			__le32 minor;
-			__le64 nbos;
+			__u64 jc;
+			__u32 gpu_id;
+			__u32 major;
+			__u32 minor;
+			__u64 nbos;
 		} reghdr;
 
 		struct {
-			__le32 valid;
-			__le64 iova;
-			__le32 data[2];
+			__u32 valid;
+			__u64 iova;
+			__u32 data[2];
 		} bomap;
 
 		/*
@@ -261,14 +261,14 @@ struct panfrost_dump_object_header {
 		 * with new fields and also keep it 512-byte aligned
 		 */
 
-		__le32 sizer[496];
+		__u32 sizer[496];
 	};
 };
 
 /* Registers object, an array of these */
 struct panfrost_dump_registers {
-	__le32 reg;
-	__le32 value;
+	__u32 reg;
+	__u32 value;
 };
 
 #if defined(__cplusplus)
-- 
2.37.0

