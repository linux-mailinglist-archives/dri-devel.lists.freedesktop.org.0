Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7D6989A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 02:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD810E0E0;
	Thu, 16 Feb 2023 01:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D310E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 01:09:05 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1676509744;
 bh=V531A1mtpKWQcvrMaihobrwS5e41GRmm87PsL+uN8es=;
 h=From:Date:Subject:To:Cc:From;
 b=IAUU1a5rRB5i7mH/AWXrxGiTK0pdweZJ/ZyUH86IhKK1qKnsOywScYyyCSa6oUL93
 SOKRgbGJQaG1ft1dgCMnV8NdEH2Ee1WP4IWpwRNmIT/AGpAcp4U3QRfNdapzT1xrjc
 +ciEKYDwJgb5boH7DygBQXr8Mtd3c8dLuBvoaWH0=
Date: Thu, 16 Feb 2023 01:09:00 +0000
Subject: [PATCH] drm/amdkfd: Make kobj_type structures constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230216-kobj_type-amdkfd-v1-1-337abb104da2@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIACuC7WMC/x2N0QqDMAwAf0XybKB2IOivjCGJTTXTVWm3sSH++
 8Ie7+C4A4pklQJ9dUCWtxbdkkFTVzDOlCZBDcbgnb8437S4bHwfnt9dkB5hiQGJQxelI3atA8u
 YiiBnSuNsYXqtq8k9S9TP/3O9necPDkizOHcAAAA=
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676509741; l=3587;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=V531A1mtpKWQcvrMaihobrwS5e41GRmm87PsL+uN8es=;
 b=kYY1zEibQVGvsyoUpN4UBRby0/UOQm81zpCrkVNsQxe2T1/B/coRpFWSAjINXjXTiPCUJdiLx
 tFZ608D+FmZAxhbPAXGkZ0SrONhyFHxBvYbVm9Lo+ibD7xcZKwhFB7D
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definitions to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c  |  8 ++++----
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 51b1683ac5c1..8d719f90db40 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -344,7 +344,7 @@ static const struct sysfs_ops kfd_procfs_ops = {
 	.show = kfd_procfs_show,
 };
 
-static struct kobj_type procfs_type = {
+static const struct kobj_type procfs_type = {
 	.release = kfd_procfs_kobj_release,
 	.sysfs_ops = &kfd_procfs_ops,
 };
@@ -469,7 +469,7 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
-static struct kobj_type procfs_queue_type = {
+static const struct kobj_type procfs_queue_type = {
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -478,7 +478,7 @@ static const struct sysfs_ops procfs_stats_ops = {
 	.show = kfd_procfs_stats_show,
 };
 
-static struct kobj_type procfs_stats_type = {
+static const struct kobj_type procfs_stats_type = {
 	.sysfs_ops = &procfs_stats_ops,
 	.release = kfd_procfs_kobj_release,
 };
@@ -487,7 +487,7 @@ static const struct sysfs_ops sysfs_counters_ops = {
 	.show = kfd_sysfs_counters_show,
 };
 
-static struct kobj_type sysfs_counters_type = {
+static const struct kobj_type sysfs_counters_type = {
 	.sysfs_ops = &sysfs_counters_ops,
 	.release = kfd_procfs_kobj_release,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 3fdaba56be6f..8e4124dcb6e4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -278,7 +278,7 @@ static const struct sysfs_ops sysprops_ops = {
 	.show = sysprops_show,
 };
 
-static struct kobj_type sysprops_type = {
+static const struct kobj_type sysprops_type = {
 	.release = kfd_topology_kobj_release,
 	.sysfs_ops = &sysprops_ops,
 };
@@ -318,7 +318,7 @@ static const struct sysfs_ops iolink_ops = {
 	.show = iolink_show,
 };
 
-static struct kobj_type iolink_type = {
+static const struct kobj_type iolink_type = {
 	.release = kfd_topology_kobj_release,
 	.sysfs_ops = &iolink_ops,
 };
@@ -350,7 +350,7 @@ static const struct sysfs_ops mem_ops = {
 	.show = mem_show,
 };
 
-static struct kobj_type mem_type = {
+static const struct kobj_type mem_type = {
 	.release = kfd_topology_kobj_release,
 	.sysfs_ops = &mem_ops,
 };
@@ -395,7 +395,7 @@ static const struct sysfs_ops cache_ops = {
 	.show = kfd_cache_show,
 };
 
-static struct kobj_type cache_type = {
+static const struct kobj_type cache_type = {
 	.release = kfd_topology_kobj_release,
 	.sysfs_ops = &cache_ops,
 };
@@ -566,7 +566,7 @@ static const struct sysfs_ops node_ops = {
 	.show = node_show,
 };
 
-static struct kobj_type node_type = {
+static const struct kobj_type node_type = {
 	.release = kfd_topology_kobj_release,
 	.sysfs_ops = &node_ops,
 };

---
base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
change-id: 20230216-kobj_type-amdkfd-abd9fe9ab060

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

