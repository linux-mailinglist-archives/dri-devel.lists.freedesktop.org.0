Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE05174A0A1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399810E465;
	Thu,  6 Jul 2023 15:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD0110E435
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC7E91FD65;
 Thu,  6 Jul 2023 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LAe03vb9IhXaEKz5mFi8+dV6xovZ5LeTsmRknDA0M4=;
 b=ds+VtJ776NQqFdrtbOU4lPKg2Qra8vwur88Yg7N2uGzHgW3dIXK+sRfKHluJnRa2A1pz8A
 KUWHlSLRrtptF2Brajo6ob54qX+FVuUnD6KuHy2+VAiGsbwSLT2tFygerGwwsGuFf6wAfh
 M5qL4Xjy/55edevHHcWQ3Uv85u3zbyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LAe03vb9IhXaEKz5mFi8+dV6xovZ5LeTsmRknDA0M4=;
 b=jxn2l9cLay5aCsU230g+pUua3qH3ZQGr0N21TSHmrKmK1BX1ifGeTEyLWbolFcWbGwyV9V
 3CqgJz1ERQtaLSCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6D6B138FC;
 Thu,  6 Jul 2023 15:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ODvOJ1rapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 01/10] fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
Date: Thu,  6 Jul 2023 17:08:44 +0200
Message-ID: <20230706151432.20674-2-tzimmermann@suse.de>
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
it from FB_BROADSHEET in favor of the existing identical selection.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f14229757311..fd862faafe66 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2179,11 +2179,7 @@ config FB_MX3
 config FB_BROADSHEET
 	tristate "E-Ink Broadsheet/Epson S1D13521 controller support"
 	depends on FB && (ARCH_PXA || COMPILE_TEST)
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
-	select FB_DEFERRED_IO
+	select FB_SYS_HELPERS_DEFERRED
 	help
 	  This driver implements support for the E-Ink Broadsheet
 	  controller. The release name for this device was Epson S1D13521
-- 
2.41.0

