Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D158369D4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54D610F573;
	Mon, 22 Jan 2024 16:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89FD10F575
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:12:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8E17DB80E6C;
 Mon, 22 Jan 2024 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049F9C43390;
 Mon, 22 Jan 2024 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705939959;
 bh=u40yPI1eo5OCBcJ6otQkqT3GuoiQ5GJ9+8tgn1ubg/s=;
 h=From:To:Cc:Subject:Date:From;
 b=pM1dKqXL0D39T4s644c17DUpE9aVRYMCKqL2DY9cAHmf7KA70sKxHCbT6ZZhifHk7
 yzdaiA8XHCVk8NfFE8lNI+/bw4f5Kt9VmTjhBII3SDeGPyxI35pctal+49+XjHn0g6
 8G2/p9p3a+MinQq6vII2pli08Lf7iwTQ12+ilub5Rhu6xvMCtvk8fExWs0XhPZ+lxO
 j8Fuj0gl2aUeDCe34MpT+uxbmnszi6/1g40H8Y95deHzg3Yoj5u0JBT6503P133d/w
 Q6F74z+6A8zlqEcwa1ceG4Z9xG/cjQ61zdpKsyCsz2thqSzEepUn4i2BB31Ke9KGkf
 lWCPhFqKQZ2Ow==
From: Arnd Bergmann <arnd@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH] drm: apple: use strscpy() in place of strlcpy()
Date: Mon, 22 Jan 2024 17:11:55 +0100
Message-Id: <20240122161233.125192-1-arnd@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Since commit d26270061ae6 ("string: Remove strlcpy()"), the strlcpy()
function causes a build failure.

Since the return value is ignored, changing it to the strscpy()
causes no change in behavior but fixes the build failure.

Fixes: f237c83e4302 ("drm: apple: DCP AFK/EPIC support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The apple drm driver is not in mainline linux yet, this patch
is against https://github.com/AsahiLinux/linux/tree/bits/200-dcp
---
 drivers/gpu/drm/apple/afk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/apple/afk.c b/drivers/gpu/drm/apple/afk.c
index 99d579d5ce47..9fbcd18878e8 100644
--- a/drivers/gpu/drm/apple/afk.c
+++ b/drivers/gpu/drm/apple/afk.c
@@ -236,7 +236,7 @@ static void afk_recv_handle_init(struct apple_dcp_afkep *ep, u32 channel,
 		return;
 	}
 
-	strlcpy(name, payload, sizeof(name));
+	strscpy(name, payload, sizeof(name));
 
 	/*
 	 * in DCP firmware 13.2 DCP reports interface-name as name which starts
-- 
2.39.2

