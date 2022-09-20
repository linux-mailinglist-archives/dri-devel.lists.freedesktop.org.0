Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B75BEF07
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 23:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577AA10E790;
	Tue, 20 Sep 2022 21:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E31A10E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 21:15:55 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E30756601FE2;
 Tue, 20 Sep 2022 22:15:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663708554;
 bh=lEIKK5fT8v0dLK+ycirNNK1k+LsBiuwrMzn6XNc24K0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jIev2eqmhkJWOjEjlYgdc2ysnGJOTAE8SBh5zeIV2Y0/+xKT/VYUlGd078ZonKDUu
 RedSrqpHMooxuxgc63KHRol71xOtNrl6kiTrUX1WYvM84rK/DJY2mxVstKzmQbdujG
 7yQ3fcMh3sA/Zyw0EQ8Zo9OjhJoEDpZnNK1WdtRQdtWxAs1/Xg67XV4Z3Mxf7O4CxV
 s3fXEHoo5j8SozXVIlYLaFeur8jT7d6WPogH6wV/dD3qWkMP2+7Xc173a72QfYEBUC
 9PF5Aa1PpdtMcPUxhlZimk9Tf8ONtPNNbTQ2OOij5uAimrbqh9OjHyy+suVS73JFiB
 0C5sT6Aq5iZ+g==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: alyssa.rosenzweig@collabora.com
Subject: [PATCH 1/2] drm/panfrost: Remove type name from internal structs
Date: Tue, 20 Sep 2022 22:15:44 +0100
Message-Id: <20220920211545.1017355-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <YynVAAaQPIPhuN55@maud>
References: <YynVAAaQPIPhuN55@maud>
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
Cc: adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Steven Price <steven.price@arm.com>

The two structs internal to struct panfrost_dump_object_header were
named, but sadly that is incompatible with C++, causing an error: "an
anonymous union may only have public non-static data members".

However nothing refers to struct pan_reg_hdr and struct pan_bomap_hdr
and there's no need to export these definitions, so lets drop them. This
fixes the C++ build error with the minimum change in userspace API.

Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
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
2.37.0

