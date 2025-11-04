Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CFC32E79
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 21:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A514710E666;
	Tue,  4 Nov 2025 20:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ih1macbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790210E665;
 Tue,  4 Nov 2025 20:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762288158; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hjOt4mX95GYMecs0Iie+MqkSikg7wE2KM44wfDubwxTZ6CbVLwqSFMf8blqi38e5jmwO8bAdSPw+CGoWFqk3mMpyXc+llwdONf8Prz4KUhhf6WJgO3Odg/rcJuud9JdHJP73rO+xY/2yb4I4H4GHKwo/CyECSjZs/L3TmDi9tZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762288158;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=q7gtw3CvroebxZHfR1KmAMJkjZAwDJ2+4Rhq+2zxFhY=; 
 b=EpNpl86hO2eubfyQ6g8KrpxR7+mpF//3ajdPpOXSWZaHn6yqtjIJA0r+KRUDgbyZLyIoZXm8gg2rjMTBGEzpJXIv3KB9k1gM9++y+U1Z4xL2D8BLx+bepU+TU7WTQ/dsAHH/QlACIK+Xw5fec3ZZLPf3aCGNS+8A+mAcM9JVk2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762288158; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q7gtw3CvroebxZHfR1KmAMJkjZAwDJ2+4Rhq+2zxFhY=;
 b=ih1macbj5uP19eVxxBoV0Ru0L+w9fAzBXlkTbQu0WsR6BzqVTjkHu+trFWfC101u
 wVUW57qur9xczQ6iMO4p38aakr6GO82GqegssY1/HlurSonWgDn7oLxu0GmX59qrnYv
 LEngoZ2P5arGitkYVK8Xn4Ysrc8chd+SpTWF0BvI=
Received: by mx.zohomail.com with SMTPS id 1762288156636722.3960606325146;
 Tue, 4 Nov 2025 12:29:16 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v3 1/3] lib: add support for opening Panthor devices
Date: Tue,  4 Nov 2025 17:28:41 -0300
Message-ID: <20251104202845.2879460-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251104202845.2879460-1-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

We will be adding tests for Panthor in a subsequent patch, so first add
the ability to open the device.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/drmtest.c | 1 +
 lib/drmtest.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 590c4671a..3d8c8e79e 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -220,6 +220,7 @@ static const struct module {
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
 	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
+	{ DRIVER_PANTHOR, "panthor" },
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 8416aa491..4b0a71102 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -57,6 +57,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_VMWGFX   (1 << 8)
 #define DRIVER_VKMS	(1 << 9)
 #define DRIVER_VIRTIO	(1 << 10)
+#define DRIVER_PANTHOR	(1 << 11)
 
 /*
  * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
-- 
2.51.0

