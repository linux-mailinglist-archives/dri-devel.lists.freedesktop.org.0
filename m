Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915D9F2F74
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861110E5AD;
	Mon, 16 Dec 2024 11:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="TFLqVQXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBCF10E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734348890;
 bh=o2oExs9IS06W2wuTSfy7oT1l8YCPWwQFt6kUrnFUcG0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TFLqVQXcetsLZl4BIY3y/1jcvzpCNw4sozes71NWxTpoeXNFd/FcaFvjWwhhLY2rF
 hUl5+AoaGI+/nwWzjIXSRKwa+gGP/K2UyCwgd9Q9ApO0Bm8tNO0LfO8HVKZ0Er4HqL
 Z3no+vu54umlGSikUT99/vtxnbiDss237I0jhFyY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:34:47 +0100
Subject: [PATCH 1/5] drm/sysfs: Constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-drm-v1-1-210f2b36b9bf@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348889; l=1644;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=o2oExs9IS06W2wuTSfy7oT1l8YCPWwQFt6kUrnFUcG0=;
 b=YDmkkKVCgYlLLAJGaraFPnhIxIZeJCB5izojwBThggOwU+itKqHGgNedKgKWJkRPTYsHnYk+P
 abbCqn4jFHpBwSskuQY+JEl64etJ1fYoE5IJrYarbj6F/tbjMPeoIJF
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/drm_sysfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6adcd16f3f325a2ae8e35f41851c00b272..60c1f26edb6fad23153c32a29fd3be02700fc938 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -261,7 +261,7 @@ static ssize_t enabled_show(struct device *device,
 }
 
 static ssize_t edid_show(struct file *filp, struct kobject *kobj,
-			 struct bin_attribute *attr, char *buf, loff_t off,
+			 const struct bin_attribute *attr, char *buf, loff_t off,
 			 size_t count)
 {
 	struct device *connector_dev = kobj_to_dev(kobj);
@@ -315,21 +315,21 @@ static struct attribute *connector_dev_attrs[] = {
 	NULL
 };
 
-static struct bin_attribute edid_attr = {
+static const struct bin_attribute edid_attr = {
 	.attr.name = "edid",
 	.attr.mode = 0444,
 	.size = 0,
-	.read = edid_show,
+	.read_new = edid_show,
 };
 
-static struct bin_attribute *connector_bin_attrs[] = {
+static const struct bin_attribute *const connector_bin_attrs[] = {
 	&edid_attr,
 	NULL
 };
 
 static const struct attribute_group connector_dev_group = {
 	.attrs = connector_dev_attrs,
-	.bin_attrs = connector_bin_attrs,
+	.bin_attrs_new = connector_bin_attrs,
 };
 
 static const struct attribute_group *connector_dev_groups[] = {

-- 
2.47.1

