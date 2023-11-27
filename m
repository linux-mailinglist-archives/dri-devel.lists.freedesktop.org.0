Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F887FA06F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E826E10E26E;
	Mon, 27 Nov 2023 13:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E4C10E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0277203FC;
 Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BF2D113B3D;
 Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id eDebLcyWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 03/32] fbdev/vfb: Set FBINFO_VIRTFB flag
Date: Mon, 27 Nov 2023 14:15:32 +0100
Message-ID: <20231127131655.4020-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++++++
X-Spam-Score: 10.75
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: F0277203FC
X-Spam-Flag: NO
X-Spam-Level: **********
X-Spamd-Result: default: False [10.75 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.17)[-0.829];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[11.56%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-0.87)[-0.875];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vfb driver operates on system memory. Mark the framebuffer
accordingly. Helpers operating on the framebuffer memory will test
for the presence of this flag.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/vfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 1b7c338f99560..c748b9311fb12 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -440,6 +440,7 @@ static int vfb_probe(struct platform_device *dev)
 	if (!info)
 		goto err;
 
+	info->flags |= FBINFO_VIRTFB;
 	info->screen_buffer = videomemory;
 	info->fbops = &vfb_ops;
 
-- 
2.43.0

