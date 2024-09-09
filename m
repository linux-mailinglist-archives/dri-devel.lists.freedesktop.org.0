Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791C972397
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6A10E34C;
	Mon,  9 Sep 2024 20:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K09CiIvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1A410E34C;
 Mon,  9 Sep 2024 20:25:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6004B5C0370;
 Mon,  9 Sep 2024 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3823C4CEC5;
 Mon,  9 Sep 2024 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725913528;
 bh=IoliWmKGaEhCYdKBghauwV3MP5okR9y80Qjj6G0/EN4=;
 h=From:To:Cc:Subject:Date:From;
 b=K09CiIvB+58xqQbvxhPjwyN28rZ465yImGKT8X4NdVANWyYJqvyRSBr9IsV2pT0Go
 SZ9vF3vORB5MDSFuDFLhEUlVsiyn/fcfoz8htrQU0ZyH24J/3CtLsfJPHs/rd+jmli
 g3nzju0myd42sdx92p3o+/Dd+lMaZXbXD955O6QIR0Sn4DBlRinkj/2Cm5LNF72fnO
 EvDITU4nbPh7hKX9z17suVxMdhVty3sDmAVth3tO4cgIEZn8GvboWvWAkaT+qdG4pH
 +BGf7LdobcHVw2s2Uwgd8OIUVg3HmNjRTNKYTDTX5rPC4HWJz99OqxzsDNHtz6/Sj7
 /dX6WQrxEX5Kg==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: fix build warning with CONFIG_PM=n
Date: Mon,  9 Sep 2024 20:25:08 +0000
Message-Id: <20240909202521.1018439-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

The 'runtime_status' field is an implementation detail of the
power management code, so a device driver should not normally
touch this:

drivers/gpu/drm/xe/xe_pm.c: In function 'xe_pm_suspending_or_resuming':
drivers/gpu/drm/xe/xe_pm.c:606:26: error: 'struct dev_pm_info' has no member named 'runtime_status'
  606 |         return dev->power.runtime_status == RPM_SUSPENDING ||
      |                          ^
drivers/gpu/drm/xe/xe_pm.c:607:27: error: 'struct dev_pm_info' has no member named 'runtime_status'
  607 |                 dev->power.runtime_status == RPM_RESUMING;
      |                           ^
drivers/gpu/drm/xe/xe_pm.c:608:1: error: control reaches end of non-void function [-Werror=return-type]

Add an #ifdef check to avoid the build regression.

Fixes: cb85e39dc5d1 ("drm/xe: Suppress missing outer rpm protection warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9c59a30d7646..a3d1509066f7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -601,10 +601,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
  */
 static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
 {
+#ifdef CONFIG_PM
 	struct device *dev = xe->drm.dev;
 
 	return dev->power.runtime_status == RPM_SUSPENDING ||
 		dev->power.runtime_status == RPM_RESUMING;
+#else
+	return false;
+#endif
 }
 
 /**
-- 
2.39.2

