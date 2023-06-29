Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B27425BD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211BC10E07A;
	Thu, 29 Jun 2023 12:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CD610E07A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:20:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 524A81FD69;
 Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688041202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
 b=ZbROsLIJAkfIR/+jRVLDcd83SvH5cZmugk8kZwgL9JSMI/gKbyQR3HtKCm4o42ShuZpYkk
 PpOlJkUDBbcOuQ/YbZW1LarrlsmuvA7IRfwyIlPCdp7XjLFZCUf5QkBgkeK4CAQiyu6q+p
 rHluDhQg1B0za6ZvhP208NqkrxcQvWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688041202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
 b=3Hj6UbEAQMoFiqqs75ilDIpvJONgA2he7Vj193adp37UYAYmUsCXwiE0RCS1+n5Jev4Itq
 c8ZFL5Xhnj0s4yAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D74B113905;
 Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8BuiM/F2nWRlVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 11/12] fbdev/core: Protect edid_info with
 CONFIG_ARCH_HAS_EDID_INFO
Date: Thu, 29 Jun 2023 13:45:50 +0200
Message-ID: <20230629121952.10559-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 loongarch@lists.linux.dev, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Guard usage of edid_info with CONFIG_ARCH_HAS_EDID_INFO instead
of CONFIG_X86. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 35be4431f649a..9ae063021e431 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1480,17 +1480,19 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
 		-EINVAL : 0;
 }
 
-#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
+#if defined(CONFIG_FIRMWARE_EDID)
 const unsigned char *fb_firmware_edid(struct fb_info *info)
 {
 	unsigned char *edid = NULL;
 
+#if defined(CONFIG_ARCH_HAS_EDID_INFO)
 	/*
 	 * We need to ensure that the EDID block is only
 	 * returned for the primary graphics adapter.
 	 */
 	if (fb_is_primary_device(info))
 		edid = edid_info.dummy;
+#endif
 
 	return edid;
 }
-- 
2.41.0

