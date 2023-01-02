Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E4B65B2FC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 14:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17A610E33E;
	Mon,  2 Jan 2023 13:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752F410E33E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nzcvpLcYCt5neYgexYxu8AQHxkEEAl9FR+0zzVReMEs=; b=Nj40IlB4HUlGv6VaXRsGUxmFCq
 2uynkQbuWX+oDoXsOWiQqofkBCCQkHvy9tTfYsyrBAQrc60LhrTl+XrRCO7paPXxLI9RxBq//SA9H
 j/iGh3JUUvI3B1VjhGcuDwl0f2w7qmWWBwzTnqcmN1STvMAitXHqnlNmIV7zox7YNfd0LjYyvoaSx
 wHjp1KyOAM8IwBjgdLdloJt5kXVDtCq+NP1YQhVhRym+gQmn7KH2P6qepuo3bhOTnTcwXdqKMoz7w
 Qw6LnwAfgK2q/1dlDaN5IsK2Aq0P1OnbbzRmSPfXHkIj8HGObgeyVNo1bNY5s2XTILxVHmzMM3ufW
 mSjqGg/w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCLKH-00FJac-9i; Mon, 02 Jan 2023 14:58:05 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vc4: Check for valid formats
Date: Mon,  2 Jan 2023 10:57:57 -0300
Message-Id: <20230102135757.262676-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, vc4 is not checking valid formats before creating a
framebuffer, which is triggering the IGT test
igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
to create a framebuffer with an invalid modifier. Therefore, check
for valid formats before creating framebuffers on vc4 and vc5 in
order to avoid creating framebuffers with invalid formats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 53d9f30460cf..5d1afd66fcc1 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -500,6 +500,27 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
		mode_cmd = &mode_cmd_local;
	}

+	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+}
+
+static struct drm_framebuffer *vc5_fb_create(struct drm_device *dev,
+					     struct drm_file *file_priv,
+					     const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
	return drm_gem_fb_create(dev, file_priv, mode_cmd);
 }

@@ -1033,7 +1054,7 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 static const struct drm_mode_config_funcs vc5_mode_funcs = {
	.atomic_check = vc4_atomic_check,
	.atomic_commit = drm_atomic_helper_commit,
-	.fb_create = drm_gem_fb_create,
+	.fb_create = vc5_fb_create,
 };

 int vc4_kms_load(struct drm_device *dev)
--
2.38.1

