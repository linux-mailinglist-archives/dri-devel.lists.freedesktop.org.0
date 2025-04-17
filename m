Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE325A918C2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B4810EA92;
	Thu, 17 Apr 2025 10:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aUcJo+N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A610EA92
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744884306;
 bh=shNxlj9ESDsTC4Lep3X5MzDe30qp7OO0h5CAHjdtufs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUcJo+N2KKIj0RX80S4btVtC6sk1SYhS4apD7yMDoEgX2i9BZ6J//Ap9gECGg4qDB
 Kw7i3bwqiChzd6PhmakQQpFoYDRBxzUCMLTfKZCiszSdtnTmH2dckAbJ/hHxnRgcJq
 A4D+6v3zQRgeEED6OZOwZTxi8HktKQQExUGpAKRGvz3DIpwX018S+RbOxK+VLtitHO
 dqFiZdGKLi9MOYFiuOHm/OfjAsjTXBilWbKnsENSqSKiD8V/6VSjlAqaE4+TlmEW55
 ce6nHxF2iyR6Zb+i6rAYgwBFBGZrDUTdwcohUqkXvQ3SUX6yycUxxGuV65MHKiEkrJ
 F39Roy+dxW4FA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EBB8917E0FA6;
 Thu, 17 Apr 2025 12:05:05 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 1/2] drm/panthor: Fix missing explicit padding in
 drm_panthor_gpu_info
Date: Thu, 17 Apr 2025 12:05:02 +0200
Message-ID: <20250417100503.3478405-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417100503.3478405-1-boris.brezillon@collabora.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
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

Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..1379a2d4548c 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -293,6 +293,18 @@ struct drm_panthor_gpu_info {
 	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
 	__u32 as_present;
 
+	/**
+	 * @garbage: Unused field that's not even zero-checked.
+	 *
+	 * This originates from a missing padding that leaked in the initial driver submission
+	 * and was only found when testing the driver in a 32-bit x86 environment, where
+	 * u64 field alignment rules are relaxed compared to aarch32.
+	 *
+	 * This field can't be repurposed, because it's never been checked by the driver and
+	 * userspace is not guaranteed to zero it out.
+	 */
+	__u32 garbage;
+
 	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
 	__u64 shader_present;
 
-- 
2.49.0

