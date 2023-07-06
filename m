Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF3774A0A2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6C410E464;
	Thu,  6 Jul 2023 15:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE18210E437
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 133EF1FDF3;
 Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S6OE/6vVwojx8uLdiLFqAty3LxGvxsG3EamOo9J62k=;
 b=tHn0fLlbpOw54dXdjN5mGJ9MqLA2gu82wyEgYkITomxhck8a5/5fqr3ox3UrAc+Vforbr+
 WwEvP4koKxW+QLU1RGny3RET5D/JsCRrHjdDrA5SkQyj0+OfQqPTHWoFvaGner67shs7hj
 13uWIMUeYVpuzQkxD5OXb/VM2wKknV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S6OE/6vVwojx8uLdiLFqAty3LxGvxsG3EamOo9J62k=;
 b=GtvqXWhQtxMC2IcbVbDRPTM/VLVMrRrNncA1dJ+jaaWWwy7C/4pfQ4A3EnIcI0Z/6pVkpD
 fwfqRGr7WZeIYrDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E895F1390F;
 Thu,  6 Jul 2023 15:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8LLZN1vapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 09/10] fbdev/xen-fbfront: Select FB_SYS_HELPERS_DEFERRED
Date: Thu,  6 Jul 2023 17:08:52 +0200
Message-ID: <20230706151432.20674-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706151432.20674-1-tzimmermann@suse.de>
References: <20230706151432.20674-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kconfig token FB_SYS_HELPERS_DEFERRED selects everything that
is required for deferred I/O on system-memory framebuffers. Select
it from XEN_FBDEV_FRONTEND in favor of the existing identical selection.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 763316acfc02..ec2abe882ed9 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2073,11 +2073,7 @@ config FB_VIRTUAL
 config XEN_FBDEV_FRONTEND
 	tristate "Xen virtual frame buffer support"
 	depends on FB && XEN
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
-	select FB_DEFERRED_IO
+	select FB_SYS_HELPERS_DEFERRED
 	select XEN_XENBUS_FRONTEND
 	default y
 	help
-- 
2.41.0

