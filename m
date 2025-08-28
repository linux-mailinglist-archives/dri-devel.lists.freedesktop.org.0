Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE19B39E12
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6589410E996;
	Thu, 28 Aug 2025 13:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EfnGJ83U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE54C10E996;
 Thu, 28 Aug 2025 13:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756386272; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SfLlNhcGaiAV8ngd9WXVLxk6lonfNzrMMFbx/iviGH0jxeBR3kr+VgWBhqpTnpFW52GplhvhYwYyyvvRPjzrSWWkmN7iaMSBxQSyGKlhuey88d+COua9Tq8xJNrA0JQpIy0f+p752vjejcUdDiEUSeyDl6Oej5SfkVO7yRGraB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756386272;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wSPcYmxr4h4S/Edbcw1vrMc3T6jdp2bx1PH1EprCoN0=; 
 b=TnWku8jWa2WVUh9anLpxQLPKJwWbJOFK2yq9/mJ491gu9jYB3SgvIJu6IMQ7auZz9bnYfJkhHJyjwOFrz8OHD1R048PEv3Qd1Cy9yTEWg3e9bvAlNyCukKFo8ZOJ/f2oYGhUw7LmBeE8i9p1xPOHD2mul3AuTRL016DvonzIr44=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756386272; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wSPcYmxr4h4S/Edbcw1vrMc3T6jdp2bx1PH1EprCoN0=;
 b=EfnGJ83UE0k3ISi/1Lw2JCtNx5zbXhWbuvMPa9Yu3uE/swSekDF99PWSgLD+MuuJ
 UzdIbwScMc2qK+dz07ZOmcC/AhdNt0W1c3lqzUFJ45AGHzUR5r75J31sd/kfK8b8mVQ
 hmXpEGeHl3kRmS2TCNrCCF4j0UUXPFrVMEppO4Nk=
Received: by mx.zohomail.com with SMTPS id 1756386270820850.229605349811;
 Thu, 28 Aug 2025 06:04:30 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 1/4] lib: add support for opening Panthor devices
Date: Thu, 28 Aug 2025 10:03:57 -0300
Message-ID: <20250828130402.2549948-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828130402.2549948-1-daniel.almeida@collabora.com>
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
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

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/drmtest.c | 1 +
 lib/drmtest.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..f4b429048 100644
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
index 27e5a18e2..1a933eae1 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -55,6 +55,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_PANTHOR   (1 << 9)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
-- 
2.50.1

