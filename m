Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044DACFDF7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A784910E96D;
	Fri,  6 Jun 2025 08:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N/tKQFFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A755010E93C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749197375;
 bh=ZxuCCa/1kOTt0rgwp47A42IY3LczuUZfybgVoKG7VH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N/tKQFFguOCGCprP73SnuWquoVbBSJbEJJDc4/9thHTkysS7Q/ZVGyzenyHzAkppN
 elST2DfUUXVTOKUGLGPVEZZ0ruB/ua/sbjRxW+RgB7UjrNgeRahLtlM5r8Ugn0EYwl
 jbA1hCuqQFeBsm4lFusOiS2pioQI/SbXsqBQGfS55sFzLRFd9xc+42fxMRBVzHADx4
 LT6EI7T9oSuhVCTM5E+nsNqc0uQS7Acv2SWIgEYD6rd4zQZxzavNMxC2VqgTszkGlo
 LfaWPpcqPs22L5FKmcCvzchT3fJdUaZ3EkqEESHJFnuj6CsWtOnxID2VY54EhwymN7
 gkK0qi8irXMUA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1948817E0156;
 Fri,  6 Jun 2025 10:09:35 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 1/2] drm/panthor: Add missing explicit padding in
 drm_panthor_gpu_info
Date: Fri,  6 Jun 2025 10:09:31 +0200
Message-ID: <20250606080932.4140010-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606080932.4140010-1-boris.brezillon@collabora.com>
References: <20250606080932.4140010-1-boris.brezillon@collabora.com>
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

drm_panthor_gpu_info::shader_present is currently automatically offset
by 4 byte to meet Arm's 32-bit/64-bit field alignment rules, but those
constraints don't stand on 32-bit x86 and cause a mismatch when running
an x86 binary in a user emulated environment like FEX. It's also
generally agreed that uAPIs should explicitly pad their struct fields,
which we originally intended to do, but a mistake slipped through during
the submission process, leading drm_panthor_gpu_info::shader_present to
be misaligned.

This uAPI change doesn't break any of the existing users of panthor
which are either arm32 or arm64 where the 64-bit alignment of
u64 fields is already enforced a the compiler level.

Changes in v2:
- Rename the garbage field into pad0 and adjust the comment accordingly
- Add Liviu's A-b

Changes in v3:
- Add R-bs

Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 include/uapi/drm/panthor_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index ad9a70afea6c..3a76c4f2882b 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -296,6 +296,9 @@ struct drm_panthor_gpu_info {
 	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
 	__u32 as_present;
 
+	/** @pad0: MBZ. */
+	__u32 pad0;
+
 	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
 	__u64 shader_present;
 
-- 
2.49.0

