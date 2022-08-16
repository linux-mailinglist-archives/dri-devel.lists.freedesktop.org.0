Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF83595F43
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6DC9AAE0;
	Tue, 16 Aug 2022 15:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1B9953F8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE4BA1FE97;
 Tue, 16 Aug 2022 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWiiBzmFyODb6P+yd623tp6I2C0aXhIGggrBAjalXf0=;
 b=a/+u+DU3xE24Mp/ygWTJ4R/nku3VMnegxB1ruMCZ4aB3pS90d6hKGrkeFi1lN4veZ4OkrF
 Y1enCN7zXnSmHc3oAXDgfNInuylTVF9dlltI084JgAiWfml9uSwU9kcNtXhjoVyO8ozp2g
 eTaSoTAbLfl70sKpXQ9LmXPzU+wud60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWiiBzmFyODb6P+yd623tp6I2C0aXhIGggrBAjalXf0=;
 b=RzZ7K07VUnWMIwpGAYwwxAx2FwZleJkGBLOgZvGlcXurz3gCsAAA975NqqqGFphA2JtCjo
 OFTkVAWojTUQM2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F783139B7;
 Tue, 16 Aug 2022 15:37:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qOkpJp65+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/12] drm/udl: Increase the default URB list size to 20
Date: Tue, 16 Aug 2022 17:36:49 +0200
Message-Id: <20220816153655.27526-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816153655.27526-1-tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems that the current size (4) for the URB list is too small on
some devices, and it resulted in the occasional stalls.  Increase the
default URB list size to 20 for working around it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 6aed6e0f669c..2b7eafd48ec2 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -20,7 +20,7 @@
 #define NR_USB_REQUEST_CHANNEL 0x12
 
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
-#define WRITES_IN_FLIGHT (4)
+#define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
 
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
-- 
2.35.3

