Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155CF56B361
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F022510F2C1;
	Fri,  8 Jul 2022 07:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068810F2C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 07:21:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3505C1FEC2;
 Fri,  8 Jul 2022 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657264876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h4xP92et7AcMK87OpnUn4dOJNQZ0aOIZ7YHkqiLwZ5M=;
 b=Y0CnLSkEJCTBhuUnu0022SVGslp0kSnGODP8qM4LFWIVAfjWe0YKNYBfogqmU6gLFFifnN
 ycXJewCEbqoqQqUY4uAxpGEryEzi0wO3olOrk2S8CFwnaya0IoHi+vZ9NJ9f6Ol8znDnow
 o4Ii8GWsETdH94CGac4PKQnFhRR+91o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657264876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h4xP92et7AcMK87OpnUn4dOJNQZ0aOIZ7YHkqiLwZ5M=;
 b=QzS9HK+Fe2SojxlUsQPKpPPaCv0NBvTpqMOSFo/9XUP18xlpD7UuZOwLTwDLVMSM+OGGxl
 xy2chp8JnkhHorAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1050F13A7D;
 Fri,  8 Jul 2022 07:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fX8DA+zax2KUDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 07:21:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: Don't read-back PCI option register before
 writing
Date: Fri,  8 Jul 2022 09:21:14 +0200
Message-Id: <20220708072114.13960-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the read operation from mgag200_init_pci_options(). It was
incorrectly added while refactoring the code. Reading the PCI option
register clears the register's new value and subsequently leads to
re-writing the old value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: ce19021fd99a ("drm/mgag200: Move PCI-option setup into model-specific code")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 73e8e4e9e54b..251a1bb648cc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -28,12 +28,6 @@ int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 	struct device *dev = &pdev->dev;
 	int err;
 
-	err = pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
-	if (err != PCIBIOS_SUCCESSFUL) {
-		dev_err(dev, "pci_read_config_dword(PCI_MGA_OPTION) failed: %d\n", err);
-		return pcibios_err_to_errno(err);
-	}
-
 	err = pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
 	if (err != PCIBIOS_SUCCESSFUL) {
 		dev_err(dev, "pci_write_config_dword(PCI_MGA_OPTION) failed: %d\n", err);
-- 
2.36.1

