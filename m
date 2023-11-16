Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF187EDD5B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848710E250;
	Thu, 16 Nov 2023 09:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3F10E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:52:13 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 051511C0DA7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:52:11 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1700117529; x=
 1700981530; bh=K3YRmKofc6N6uINNSmeFkKZnxYRW32B+l0K9TQS6g74=; b=i
 nMMJ0bQJaJANR3cyvZIDtllai0Jb3wM2NMR6v0N44d1he6CesRdVEz4LV1xwVaid
 yR6vSF3dOYhgTbBb0WbbzgHFO577pOdVVNpkTzsQ4MxkRohc6/5KtvnVM4nbfdoF
 7EkecHOTEsvOp/0SH9ZuZnt9fz/4iSjkE9vDSixOZo=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U5nqlVVJNTOH for <dri-devel@lists.freedesktop.org>;
 Thu, 16 Nov 2023 09:52:09 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id D04BC1C061A;
 Thu, 16 Nov 2023 09:52:07 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] tvnv17.c: Adding a NULL pointer check.
Date: Thu, 16 Nov 2023 09:51:59 +0300
Message-Id: <20231116065159.37876-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Nov 2023 09:06:53 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 Andrey Shumilin <shum.sdl@nppct.ru>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, vefanov@ispras.ru, ykarpov@ispras.ru,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 vmerzlyakov@ispras.ru, khoroshilov@ispras.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible to dereference a null pointer if drm_mode_duplicate() returns NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..1f0c5f4a5fd2 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -209,7 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_duplicate(encoder->dev, tv_mode);
-
+		if (mode == NULL)
+			continue;
 		mode->clock = tv_norm->tv_enc_mode.vrefresh *
 			mode->htotal / 1000 *
 			mode->vtotal / 1000;
@@ -258,6 +259,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
 			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			if (mode == NULL)
+				continue;
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
-- 
2.30.2

