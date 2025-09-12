Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1DB555F5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E0610ECC3;
	Fri, 12 Sep 2025 18:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SZ0/5Uaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CBC10ECC2;
 Fri, 12 Sep 2025 18:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757701196; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BuAcfr8C9kWiEcgjDtr193f9U0QT4+Ce0urJZjI1CObSvX83IjVuIcss0Smj18+P0GJODZIWAEMlUCVNTUmk2sozSq+QrSatef/iujWfofobCu24SonobFRN00Fdx70QHk+6HJ3G+D175nL/fE/XpMO/ObAIdDemm2CjBbs+Nd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757701196;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HbKCXgrbq0yaplG7bTypWXUDmqb2YJF7JNTbNq4RRuQ=; 
 b=SwlMkj4Q9oztrrFId4STRYA2Al4A/tq9gDWslCO5DaCne+ZhG56wW9LELrQnayfxwdzzHlpuuYZM8vpMneOM8MOQhneRVx7pR+EhbIU6qlBh0mlDxi67I3AqQg6uDDSjARrGTbQZ+0IVuj8i7slsE9Mm9nb0JzhcVcGjNTxh+MA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757701196; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HbKCXgrbq0yaplG7bTypWXUDmqb2YJF7JNTbNq4RRuQ=;
 b=SZ0/5UazcD53MtOtoyPacAdPrjzvatqAYaIt3rUWrcb6LpAG1iMLrjHgDDJE8vtM
 39Y9EYNMCG2QPEjbjRcovip5ZOlxPA/M4M27xTMqO4KUYFiEyT+S5V/Y9r1Q0HA7JCf
 3UqsajhXgulwH2yqLMj0mFdOdibmSHMTUiBc0e2g=
Received: by mx.zohomail.com with SMTPS id 175770119449343.83357593899166;
 Fri, 12 Sep 2025 11:19:54 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/3] lib: add support for opening Panthor devices
Date: Fri, 12 Sep 2025 15:19:28 -0300
Message-ID: <20250912181931.3738444-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912181931.3738444-1-daniel.almeida@collabora.com>
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
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

In particular, these will be used to test both Panthor[0] and Tyr[1],
i.e.: the new Rust GPU driver that implements Panthor's uAPI (i.e.:
panthor_drm.h).

This work is being tested on a RockPi 5, featuring an rk3588 SoC and
Mali-G610 Valhall.

[0]: https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
[1]: https://lore.kernel.org/dri-devel/aMLB0Vs0dJ_AkU4z@google.com/

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/drmtest.c | 1 +
 lib/drmtest.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 551385867..ea37a886a 100644
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
index a9542dde2..4c34ac311 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -56,6 +56,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
 #define DRIVER_VKMS	(1 << 9)
+#define DRIVER_PANTHOR   (1 << 10)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
-- 
2.51.0

