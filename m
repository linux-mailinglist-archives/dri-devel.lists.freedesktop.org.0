Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37492297DA4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CCC6E908;
	Sat, 24 Oct 2020 17:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Sat, 24 Oct 2020 17:05:37 UTC
Received: from abrecht.li (75-128-16-94.static.cable.fcom.ch [94.16.128.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F216E902
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 17:05:37 +0000 (UTC)
Received: from mail.abrecht.li (unknown [10.60.1.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id BBA672D97C5B;
 Sat, 24 Oct 2020 16:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li BBA672D97C5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielabrecht.ch;
 s=mail; t=1603558756;
 bh=HsJULwZf6cG3rWJMuqPzecGHdGk+1847RFAtqmArmVU=; h=From:To:Cc:From;
 b=LM12OErJy3GaJD/884SQoEOYRQEdJdTlomfb+bHVw5fVBm445k5hkOwW+aSl354Fh
 6MK8m8zIAylFWfcD/3X709jSdV6fWUF8SHfeprOMbrWsr3L2Kq4JCkoFrKUS8G724c
 172oClBSWppeGOoLIlOfS1CKMS+YN8r4ZBlJr548=
MIME-Version: 1.0
Date: Sat, 24 Oct 2020 16:59:16 +0000
From: Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Implement .format_mod_supported in mxsfb
Message-ID: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
X-Sender: freedesktop-linux-dri-devel@danielabrecht.ch
User-Agent: Roundcube Webmail/1.3.15
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will make sure applications which use the IN_FORMATS blob
to figure out which modifiers they can use will pick up the
linear modifier which is needed by mxsfb. Such applications
will not work otherwise if an incompatible implicit modifier
ends up being selected.

Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
---
  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c 
b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 956f631997f2..fc4b1626261b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -484,6 +484,13 @@ static void 
mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
  	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
  }

+static bool mxsfb_format_mod_supported(struct drm_plane *plane,
+				       uint32_t format,
+				       uint64_t modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
  static const struct drm_plane_helper_funcs 
mxsfb_plane_primary_helper_funcs = {
  	.atomic_check = mxsfb_plane_atomic_check,
  	.atomic_update = mxsfb_plane_primary_atomic_update,
@@ -495,6 +502,7 @@ static const struct drm_plane_helper_funcs 
mxsfb_plane_overlay_helper_funcs = {
  };

  static const struct drm_plane_funcs mxsfb_plane_funcs = {
+	.format_mod_supported	= mxsfb_format_mod_supported,
  	.update_plane		= drm_atomic_helper_update_plane,
  	.disable_plane		= drm_atomic_helper_disable_plane,
  	.destroy		= drm_plane_cleanup,
-- 
2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
