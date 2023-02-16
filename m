Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB969899F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 02:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF810E004;
	Thu, 16 Feb 2023 01:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237A10E004
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 01:05:36 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1676509534;
 bh=IVBAbq+p3hoTXWJlTZmLI/40oSSDdV0kZu4KVH+IXTU=;
 h=From:Date:Subject:To:Cc:From;
 b=KZVerghpYl9EniP5JD5JDJPwaYLf0qJbVq/OwA8lTrs48a6VquniofrHaf/nsMg40
 on7rRTjKRDEq5Ba+udGj0aaFuuQ027fqXPOoOL4rn5HWOBZmSW7V2Ws6AYWdMpmlnk
 8NDg8yai1NgjZtZwm6VGUZj8xe9/X2kfrZNcOdRQ=
Date: Thu, 16 Feb 2023 01:05:30 +0000
Subject: [PATCH] drm/i915: Make kobj_type structures constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230216-kobj_type-i915-v1-1-ca65c9b93518@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAFmB7WMC/x2NUQqDMBAFryL73YBJMKhXkVKycaurEiWp0iLe3
 aWfM4/hnZApMWVoixMSHZx5jQL6UUAYfRxIcS8MpjS2NNqpecXp9fltMjS6UnXtkDBYp00DEqH
 PpDD5GEbJ4r4sIrdEb/7+X7rndd3pJkikdQAAAA==
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676509531; l=1627;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IVBAbq+p3hoTXWJlTZmLI/40oSSDdV0kZu4KVH+IXTU=;
 b=aIk/xPnRJGbvs8WW/pbryE5nyXYrxV32q9QWxWXyvNiJdzUCmtbetX0pMdJrPwLDPXagAALvt
 gskrXgwRwvcDKdJ4nHFUnGBIb3I57Pg+AdOpk3dVby4wF8bw30972kY
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definitions to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 2 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 9486dd3bed99..df15b17caf89 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -71,7 +71,7 @@ static void kobj_gt_release(struct kobject *kobj)
 {
 }
 
-static struct kobj_type kobj_gt_type = {
+static const struct kobj_type kobj_gt_type = {
 	.release = kobj_gt_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 	.default_groups = id_groups,
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index f2d9858d827c..b5e0fe5dbf6c 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -421,7 +421,7 @@ static void kobj_engine_release(struct kobject *kobj)
 	kfree(kobj);
 }
 
-static struct kobj_type kobj_engine_type = {
+static const struct kobj_type kobj_engine_type = {
 	.release = kobj_engine_release,
 	.sysfs_ops = &kobj_sysfs_ops
 };

---
base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
change-id: 20230216-kobj_type-i915-886bebc36129

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

