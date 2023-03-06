Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4C6AC658
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791710E395;
	Mon,  6 Mar 2023 16:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3275A10E378
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9BAC1FE0A;
 Mon,  6 Mar 2023 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78fsQ7KT7qSrtly2mvkXihDfcDaUcc6ompl2U420mus=;
 b=tosgSDfD6XMO3Va3mwPRHkyncOiDlsB4YwZjvuAM9a2eQcv49zFwQPqIWijD+fZItv7UqU
 K+TEdhaAo4Wwess8SSTG7yMZThLrNY49EeBuYDJieAGWDL7LnlGSb3Hi8w6VKoI1cdrGxw
 bni037Ofyf4I70A8PbimHW/I4lGucIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78fsQ7KT7qSrtly2mvkXihDfcDaUcc6ompl2U420mus=;
 b=NTrKWFJjsWKC/O5zJGz9yrkMpb/bE0Hi3mLTuId/tAF0i7p/Fc3p2uJWGa07avfn9UCEJ9
 8ZiuIlLAWM1kvLCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9909013513;
 Mon,  6 Mar 2023 16:00:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IAGXJCEOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 26/99] fbdev/geode: Duplicate video-mode option string
Date: Mon,  6 Mar 2023 16:59:03 +0100
Message-Id: <20230306160016.4459-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assume that the driver does not own the option string or its substrings
and hence duplicate the option string for the video mode. The driver only
parses the option string once as part of module initialization, so use
a static buffer to store the duplicated mode option. Linux automatically
frees the memory upon releasing the module.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/geode/gxfb_core.c | 10 +++++++++-
 drivers/video/fbdev/geode/lxfb_core.c | 13 +++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 8e05e76de075..3ed85d2d53e9 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -497,10 +497,18 @@ static int __init gxfb_setup(char *options)
 		return 0;
 
 	while ((opt = strsep(&options, ",")) != NULL) {
+		static char mode_option_buf[256];
+		int ret;
+
 		if (!*opt)
 			continue;
 
-		mode_option = opt;
+		ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", opt);
+		if (WARN(ret < 0, "gxfb: ignoring invalid option, ret=%d\n", ret))
+			continue;
+		if (WARN(ret >= sizeof(mode_option_buf), "gxfb: option too long\n"))
+			continue;
+		mode_option = mode_option_buf;
 	}
 
 	return 0;
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 8130e9eee2b4..6e1e73a21bdb 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -635,8 +635,17 @@ static int __init lxfb_setup(char *options)
 			nopanel = 1;
 		else if (!strcmp(opt, "nocrt"))
 			nocrt = 1;
-		else
-			mode_option = opt;
+		else {
+			static char mode_option_buf[256];
+			int ret;
+
+			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", opt);
+			if (WARN(ret < 0, "lxfb: ignoring invalid option, ret=%d\n", ret))
+				continue;
+			if (WARN(ret >= sizeof(mode_option_buf), "lxfb: option too long\n"))
+				continue;
+			mode_option = mode_option_buf;
+		}
 	}
 
 	return 0;
-- 
2.39.2

