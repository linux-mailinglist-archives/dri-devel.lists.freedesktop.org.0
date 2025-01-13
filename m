Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A6A0B2B1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CD310E28A;
	Mon, 13 Jan 2025 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CaVPrLz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769D310E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 177CD5C53CE;
 Mon, 13 Jan 2025 09:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53031C4CED6;
 Mon, 13 Jan 2025 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736760375;
 bh=zN8vr8gKCDgzIHKOCZHlsEiuMBVTM1Ku6GESR0iPOnU=;
 h=From:To:Cc:Subject:Date:From;
 b=CaVPrLz+r6HPfO9HFyVrJB4hKSMDjcmtu3+dgPLBrIl7QtqmXaawN8rPur9fcKrpd
 c5NsN4iZzowCkMfV5l2E0EjktHGL7M6Pgl6F2s47OtWP9oV/O4wWGVKNiSZNLOdGXr
 bhfIlKWuNK4Zmnp85Srcc+3YCoengoEQigiqR7o27ztz7yAwONzI44WDTSSZ1WN6T+
 OJkxoeIuD/Z7jDRo1VuZ/hOveqLSyaUpKkIUTwcihFggaZDMtjhaGKsSYiPJMkqcEi
 AV3rQ73oW5fukQIxQuu2gvi+DS+NDHVsHeW658LdaxKG650rjMaLODsop/QjyNyN/V
 pd3vA92HFeXxw==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Date: Mon, 13 Jan 2025 10:26:05 +0100
Message-ID: <20250113092608.1349287-1-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
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

The dmem cgroup the page counting API implemented behing the
PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
potential build breakages. Select PAGE_COUNTER.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp@intel.com/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 61f50cafa815..5e5328506138 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1137,10 +1137,11 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
 config CGROUP_DMEM
 	bool "Device memory controller (DMEM)"
+	select PAGE_COUNTER
 	help
 	  The DMEM controller allows compatible devices to restrict device
 	  memory usage based on the cgroup hierarchy.
 
 	  As an example, it allows you to restrict VRAM usage for applications
-- 
2.47.1

