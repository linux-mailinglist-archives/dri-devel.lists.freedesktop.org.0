Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C71722985
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650AC10E2BE;
	Mon,  5 Jun 2023 14:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDA210E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10B811FE6E;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwHTtL4maltNtd60X3Lp4/7d0iX8Vxyi3cPv1Uashgw=;
 b=aXBk5ztVyuKOBTF6vIqrGnAMCXt3t1cSGRtBWeQ+WCLevCiH/+SJy6ez2G+xMKX8DIV1WM
 8Sief9Y968DijcTldImoU09vgsjdFNUS2NN8MBEHLKDFmla3R0pnIfxfLsTd8+7Y0TO97X
 FmpMhw81KiEsjCnJXV0YmsTG7uCydp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwHTtL4maltNtd60X3Lp4/7d0iX8Vxyi3cPv1Uashgw=;
 b=Au85PR9bhDRWMseyydte0MttTzakiFmbRW4gE2YfY0f675mcgAKppD/rjh7ZWu9//xHJqd
 kQdVQtLRhFfYThDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B877E13A3C;
 Mon,  5 Jun 2023 14:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EHgjLLT1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 21/30] fbdev/sm501fb: Output message with fb_err()
Date: Mon,  5 Jun 2023 16:48:03 +0200
Message-Id: <20230605144812.15241-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix case were dev_err() is being called with struct fb_info.dev.
Use fb_err() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sm501fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index e0d29be1565b..46951a095274 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1293,7 +1293,7 @@ static int sm501fb_sync(struct fb_info *info)
 		count--;
 
 	if (count <= 0) {
-		dev_err(info->dev, "Timeout waiting for 2d engine sync\n");
+		fb_err(info, "Timeout waiting for 2d engine sync\n");
 		return 1;
 	}
 	return 0;
-- 
2.40.1

