Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B842EA0B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753A6ECDE;
	Fri, 15 Oct 2021 07:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F416ECDE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:25:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B964D2196A;
 Fri, 15 Oct 2021 07:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634282750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FEUUj27ulbDb32bD7R86ZKoDCUryGDfUhfzXbUX6ovM=;
 b=QilGaD0R+0+dE64k3ABlWIr9a24y6W2so8eZl6ljaof+ASJKMEH5xpc+I9VmFkvr0Gw0KN
 XV//wkgndh+cDg5vtuSsvxf49pkjiVRSqkp1WV+qTy6ZhVnE7sVeGFkIQpNzfIcJ8DC24T
 NaeSGqmXbUJC+ZpWdoWrQQi/9i5RF6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634282750;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FEUUj27ulbDb32bD7R86ZKoDCUryGDfUhfzXbUX6ovM=;
 b=nBFknW5JJEDEfV2ixMSQlUQI3eRMPPPQmjD0p5G7PHdNfg9KZ+TsK8kmyFrCPijcsdDcqJ
 PxfWTn53Obh3jyCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B9A613B52;
 Fri, 15 Oct 2021 07:25:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z+rsIP4saWFHagAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 07:25:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	ainux.wang@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Chuck Lever III <chuck.lever@oracle.com>,
 Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH] Revert "drm/ast: Zero is missing in detect function"
Date: Fri, 15 Oct 2021 09:25:46 +0200
Message-Id: <20211015072546.3705-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 572994bf18ff ("drm/ast: Zero is missing in detect function")
prevents some systems from booting. Seen on Supermicro Super
Server/X10SRL-F, BIOS 3.3 10/28/2020 . There's further a bug that
results in

  KASAN: use-after-free in enqueue_timer+0x4f/0x1e0

which is also triggered by commit
572994bf18ff ("drm/ast: Zero is missing in detect function").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 572994bf18ff ("drm/ast: Zero is missing in detect function")
Reported-by: Chuck Lever III <chuck.lever@oracle.com>
Reported-by: Kim Phillips <kim.phillips@amd.com>
Cc: Ainux.Wang <ainux.wang@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/dri-devel/A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com/
---
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6bfaefa01818..ea64944ad4ca 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1306,7 +1306,7 @@ static enum drm_connector_status ast_connector_detect(struct drm_connector
 	int r;
 
 	r = ast_get_modes(connector);
-	if (r <= 0)
+	if (r < 0)
 		return connector_status_disconnected;
 
 	return connector_status_connected;
-- 
2.33.0

