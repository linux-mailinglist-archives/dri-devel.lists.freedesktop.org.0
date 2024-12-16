Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243F9F2F7D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9A10E5CC;
	Mon, 16 Dec 2024 11:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="I1LoHCoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4210E5C1;
 Mon, 16 Dec 2024 11:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734348890;
 bh=y5VdIlFmZrN99wi17sHDS/2XA6J1JYaGxHyZF4VUIi4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I1LoHCoq945+zGqi2IJw4PxdFgsNnMEsCh+MDvewdAwWOrbvQ6KLSiNTIbLg5yzn1
 jcN/lq3bd/ulKW8+VJAlilAJWJHswSCyZg3KwsVTXZlMx816S/1SrZ9k6QbcliP1NA
 lz2vqXg8r3nA+XBY8L+mzkSccVgIdg/yYTKDS9KM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:34:51 +0100
Subject: [PATCH 5/5] drm/amd/display: Constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-drm-v1-5-210f2b36b9bf@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348889; l=1989;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=y5VdIlFmZrN99wi17sHDS/2XA6J1JYaGxHyZF4VUIi4=;
 b=CINJ3HLrSMhMcfUsU7NZIyH1+y1/TzIm0rkb5ETIxXa+H/f3F/O5bIuXKhuLkCFAOgO1NyygM
 0FozzyXfHeLAjv++M4Tndb+I24Twp4TVweWBj+rGRLNhapMZs6RYICv
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index e339c7a8d541c962aa44ae25ad97b864285394b8..e27d077396327bbe25014aec5b978293b1c20dac 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -614,7 +614,7 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
  *	incorrect/corrupted and we should correct our SRM by getting it from PSP
  */
 static ssize_t srm_data_write(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *bin_attr, char *buffer,
+			      const struct bin_attribute *bin_attr, char *buffer,
 			      loff_t pos, size_t count)
 {
 	struct hdcp_workqueue *work;
@@ -638,7 +638,7 @@ static ssize_t srm_data_write(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t srm_data_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buffer,
+			     const struct bin_attribute *bin_attr, char *buffer,
 			     loff_t pos, size_t count)
 {
 	struct hdcp_workqueue *work;
@@ -698,8 +698,8 @@ static ssize_t srm_data_read(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute data_attr = {
 	.attr = {.name = "hdcp_srm", .mode = 0664},
 	.size = PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, /* Limit SRM size */
-	.write = srm_data_write,
-	.read = srm_data_read,
+	.write_new = srm_data_write,
+	.read_new = srm_data_read,
 };
 
 struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev,

-- 
2.47.1

