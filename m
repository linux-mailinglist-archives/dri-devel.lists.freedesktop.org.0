Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C703600CCF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0510ECD2;
	Mon, 17 Oct 2022 10:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5CCB10ECD2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 10:46:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D33D1FC4;
 Mon, 17 Oct 2022 03:46:18 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.1.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 345FD3F67D;
 Mon, 17 Oct 2022 03:46:11 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 1/2] drm/panfrost: Remove type name from internal structs
Date: Mon, 17 Oct 2022 11:46:01 +0100
Message-Id: <20221017104602.142992-2-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104602.142992-1-steven.price@arm.com>
References: <20221017104602.142992-1-steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The two structs internal to struct panfrost_dump_object_header were
named, but sadly that is incompatible with C++, causing an error: "an
anonymous union may only have public non-static data members".

However nothing refers to struct pan_reg_hdr and struct pan_bomap_hdr
and there's no need to export these definitions, so lets drop them. This
fixes the C++ build error with the minimum change in userspace API.

Reported-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 include/uapi/drm/panfrost_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index eac87310b348..bd77254be121 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -242,7 +242,7 @@ struct panfrost_dump_object_header {
 	__le32 file_offset;
 
 	union {
-		struct pan_reg_hdr {
+		struct {
 			__le64 jc;
 			__le32 gpu_id;
 			__le32 major;
@@ -250,7 +250,7 @@ struct panfrost_dump_object_header {
 			__le64 nbos;
 		} reghdr;
 
-		struct pan_bomap_hdr {
+		struct {
 			__le32 valid;
 			__le64 iova;
 			__le32 data[2];
-- 
2.34.1

