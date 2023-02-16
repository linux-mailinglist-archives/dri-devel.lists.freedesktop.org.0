Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1E6989A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 02:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFC810E05D;
	Thu, 16 Feb 2023 01:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66F10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 01:07:31 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1676509649;
 bh=P/SbOyMzlTQLiogl1RKS9/I1ffYT18SGT5g5cIfqd2Y=;
 h=From:Date:Subject:To:Cc:From;
 b=uV3znYgrIZwShkNVfjQcRp+ytl9nR0n3bv27zV1ugjoYs6YCkIb/xInp77iNDsPy4
 tz6wrkyMM50lXAPYFc1yEB4Y2UC9IJBELA4EHT1OehaOeZJQgn2acH281RiIFto1Xj
 KwUmAEa+e7Jus3axPfKbRAmVEj7oPhz+2YdjJmAo=
Date: Thu, 16 Feb 2023 01:07:27 +0000
Subject: [PATCH] drm/amdgpu: make kobj_type structures constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230216-kobj_type-amdgpu-v1-1-b382ab606dc7@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAM6B7WMC/x2NwQrCMBAFf6Xs2YUkrR78FRFJmtd2taYhsaKU/
 ruLxxkYZqOKIqh0bjYqeEuVJSnYQ0P95NMIlqhMzrjWOHvixxLut9c3g/0zjnnlLraDgYU5xo4
 0C76CQ/GpnzRM6zyrzAWDfP6fy3Xff0Q1jYl3AAAA
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676509646; l=2787;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=P/SbOyMzlTQLiogl1RKS9/I1ffYT18SGT5g5cIfqd2Y=;
 b=NjH37FHMLFd1p1EMnA7Qx7v7EotJR3ho6RIcFLYC+ycLiNGbUWb8S/f01QeZrTlDNaN6tjGbb
 wjaDdczIgnxD1m0GhAmynkfczaMBlOwEHYwPdJW5DQU/y0ZY7RRr6Cd
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 1bbd56029a4f..8e04952e5144 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -704,7 +704,7 @@ static void ip_hw_instance_release(struct kobject *kobj)
 	kfree(ip_hw_instance);
 }
 
-static struct kobj_type ip_hw_instance_ktype = {
+static const struct kobj_type ip_hw_instance_ktype = {
 	.release = ip_hw_instance_release,
 	.sysfs_ops = &ip_hw_instance_sysfs_ops,
 	.default_groups = ip_hw_instance_groups,
@@ -723,7 +723,7 @@ static void ip_hw_id_release(struct kobject *kobj)
 	kfree(ip_hw_id);
 }
 
-static struct kobj_type ip_hw_id_ktype = {
+static const struct kobj_type ip_hw_id_ktype = {
 	.release = ip_hw_id_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
@@ -786,18 +786,18 @@ static const struct sysfs_ops ip_die_entry_sysfs_ops = {
 	.show = ip_die_entry_attr_show,
 };
 
-static struct kobj_type ip_die_entry_ktype = {
+static const struct kobj_type ip_die_entry_ktype = {
 	.release = ip_die_entry_release,
 	.sysfs_ops = &ip_die_entry_sysfs_ops,
 	.default_groups = ip_die_entry_groups,
 };
 
-static struct kobj_type die_kobj_ktype = {
+static const struct kobj_type die_kobj_ktype = {
 	.release = die_kobj_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-static struct kobj_type ip_discovery_ktype = {
+static const struct kobj_type ip_discovery_ktype = {
 	.release = ip_disc_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 4b9e7b050ccd..6d13ce6ec9cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -228,7 +228,7 @@ static const struct sysfs_ops amdgpu_xgmi_hive_ops = {
 	.show = amdgpu_xgmi_show_attrs,
 };
 
-struct kobj_type amdgpu_xgmi_hive_type = {
+static const struct kobj_type amdgpu_xgmi_hive_type = {
 	.release = amdgpu_xgmi_hive_release,
 	.sysfs_ops = &amdgpu_xgmi_hive_ops,
 	.default_groups = amdgpu_xgmi_hive_groups,

---
base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
change-id: 20230216-kobj_type-amdgpu-4d3f0e1e05d4

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

