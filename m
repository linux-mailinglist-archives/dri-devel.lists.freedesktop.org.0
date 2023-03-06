Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C4D6AC6D9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DB810E3D3;
	Mon,  6 Mar 2023 16:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED9E10E392
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 902811FE9D;
 Mon,  6 Mar 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNt7g7qk3sNz1zHUSaStHnUvLckbyLDyTgt+yojcOaU=;
 b=sSn5L16MpIhjidLvMNCBDr4FRRQm/jwbp6ove7mwcqJnV62ScS4M1M4j7CBVp9L2gmTHfu
 sql+Kb67O68OSpxuTInrxN+65Qbam2Q97DctYwxoweaACPcYMQ61dv/qIzeSUnA8o0nvWm
 nlb5c0L67GkGSY/iUvxsJv9e53HZTj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNt7g7qk3sNz1zHUSaStHnUvLckbyLDyTgt+yojcOaU=;
 b=2bcIZLSAwIvktfikfJeQXEEUi+WahZFzsbEkYrkLuT6pYFhDjMKNq2HYVeV9VKd8XIv68Z
 0gzvebfe1cw4VUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3376313A6A;
 Mon,  6 Mar 2023 16:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6Ou7CysOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 50/99] fbdev/nvidiafb: Duplicate video-mode option string
Date: Mon,  6 Mar 2023 16:59:27 +0100
Message-Id: <20230306160016.4459-51-tzimmermann@suse.de>
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
 drivers/video/fbdev/nvidia/nvidia.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index e60a276b4855..eb91201babd4 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1498,8 +1498,17 @@ static int nvidiafb_setup(char *options)
 			fpdither = simple_strtol(this_opt+9, NULL, 0);
 		} else if (!strncmp(this_opt, "bpp:", 4)) {
 			bpp = simple_strtoul(this_opt+4, NULL, 0);
-		} else
-			mode_option = this_opt;
+		} else {
+			static char mode_option_buf[256];
+			int ret;
+
+			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", this_opt);
+			if (WARN(ret < 0, "nvidiafb: ignoring invalid option, ret=%d\n", ret))
+				continue;
+			if (WARN(ret >= sizeof(mode_option_buf), "nvidiafb: option too long\n"))
+				continue;
+			mode_option = mode_option_buf;
+		}
 	}
 	NVTRACE_LEAVE();
 	return 0;
-- 
2.39.2

