Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2C6326C2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C1410E2DB;
	Mon, 21 Nov 2022 14:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4DF10E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 14:48:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECEF2220F2;
 Mon, 21 Nov 2022 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669042125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NUrS+lQaYIBygZZ1oRuFGgQfEIu7uBcQQX4r8VE3fkM=;
 b=PBFlQT+3bMbK69Vfip/yAGjKaX45m43sql9gfp+GWnr9IiNme5M+eyDag/i4QECRNZzTW0
 b3ZF9CD2W+OgEF1/XQDy5stgYVoDgnCppcOQqnBnP0PGoU1mrzHjKFjQPlzdkYq8wdz9Cy
 n5IrwrYX1Ck3gS6KIOPMB/ree6yD7Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669042125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NUrS+lQaYIBygZZ1oRuFGgQfEIu7uBcQQX4r8VE3fkM=;
 b=p9O/fWo1+fQ35r1ITqCt66gcWpA/FBmLxXBsrhTZlxhDW54xwEjaEyFQJaRCTLRUx1bkTY
 CphoSnwo/4klYCAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B87F11377F;
 Mon, 21 Nov 2022 14:48:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i7VoK82Pe2PoKAAAMHmgww
 (envelope-from <jdelvare@suse.de>); Mon, 21 Nov 2022 14:48:45 +0000
Date: Mon, 21 Nov 2022 15:48:44 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] drm/logicvc: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20221121154844.385b29fa@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/logicvc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.0.orig/drivers/gpu/drm/logicvc/Kconfig
+++ linux-6.0/drivers/gpu/drm/logicvc/Kconfig
@@ -1,7 +1,7 @@
 config DRM_LOGICVC
 	tristate "LogiCVC DRM"
 	depends on DRM
-	depends on OF || COMPILE_TEST
+	depends on OF
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER


-- 
Jean Delvare
SUSE L3 Support
