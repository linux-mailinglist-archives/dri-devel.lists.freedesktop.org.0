Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C51D4650
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C916EBE8;
	Fri, 15 May 2020 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C1B6EA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 20:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=W7q9fn4XN2n9/68cf5tS2Enuv46
 NvEawyvtgZa/O2lo=; b=wjvKNZur93eS31N2SCzLQcGDpAajcZrzhkOsQTz1TxN
 VT95ilzXmFdbcUmFNrATRibu4tm32X2emLv3nIqzlNBbFho6hWuOmZLc6G07guK5
 JFT3fQdOJYkP9xm4KYnHyA3SRth8wjyvqnPbCP+QlCtR1YYEnJ7/AMxV5iZFQrdg
 =
Received: (qmail 3475788 invoked from network); 13 May 2020 22:10:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 May 2020 22:10:19 +0200
X-UD-Smtp-Session: l3s3148p1@i5BQK42lNN0gAwDPXwcWAIZZjypw6UMc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/vblank: remove outdated and noisy output
Date: Wed, 13 May 2020 22:10:16 +0200
Message-Id: <20200513201016.23047-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The R-Car DU driver calls drm_vblank_init via some helper functions in
probe(). From what I checked, most drivers do this as well. I have a
config now where DU always stays in deferred_probe state because of a
missing dependency. This means that every time I rebind another driver
like MMC, the vblank init message is displayed again when the DU driver
is retried. Because the message doesn't really carry a useful
information, I suggest to simply drop it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/drm_vblank.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index da7b0b0c1090..ce9bed24c2da 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -483,8 +483,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 		seqlock_init(&vblank->seqlock);
 	}
 
-	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
-
 	return 0;
 
 err:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
