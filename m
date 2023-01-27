Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FF67E26C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C25010E451;
	Fri, 27 Jan 2023 10:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7950B10E44E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:59:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1C7D9218ED;
 Fri, 27 Jan 2023 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674817144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cBp1CMIM/DzCTcHwo/4LUyddjNj/UP/oSP/tqheJiAE=;
 b=crF5eUs/jtoLzvQmU1z3aUx/2GFAoHE8/l47K/C5R+8kWITOO3869Ou1z0DRjSRwWf4B8j
 RTmB9DYQnVZVcDqgvEdMPgzIzsUyNfCApMxVVnh+5qW50q6gTSrP7PIcPhJDBGc4N0ceNd
 oOe5Nq7ZpM+i+TuMADRmcteJ+ytj0P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674817144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cBp1CMIM/DzCTcHwo/4LUyddjNj/UP/oSP/tqheJiAE=;
 b=ELWRvUTAMdCCw0SmXVBc3Y3n6Ug7gtUUPGzhy7WlirX2F8mypBNgR/4j8DqzlXaMc24v1S
 qR6a3bzuCjjvfQBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7E791336F;
 Fri, 27 Jan 2023 10:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uW0NM3eu02MFTQAAMHmgww
 (envelope-from <jdelvare@suse.de>); Fri, 27 Jan 2023 10:59:03 +0000
Date: Fri, 27 Jan 2023 11:59:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/display: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20230127115902.276de20d@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/display/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-5.19.orig/drivers/gpu/drm/display/Kconfig
+++ linux-5.19/drivers/gpu/drm/display/Kconfig
@@ -3,7 +3,7 @@
 config DRM_DP_AUX_BUS
 	tristate
 	depends on DRM
-	depends on OF || COMPILE_TEST
+	depends on OF
 
 config DRM_DISPLAY_HELPER
 	tristate


-- 
Jean Delvare
SUSE L3 Support
