Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CD8A3BD9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 11:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED68F10FB62;
	Sat, 13 Apr 2024 09:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="I8NcdD/e";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="I8NcdD/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0510E387
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 00:32:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAC6022C4A;
 Sat, 13 Apr 2024 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1712968375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ga9BDy950sqrkymKo/DX0soSuDFkOI9AzOuH62JvhYw=;
 b=I8NcdD/e1cLEL+nxIyxQnHqKpsUPCfjG7jRi48rRO496Fg9sqJd96AMINZ//aK1SXlaaBk
 yx4TdpyriWgtaSgGl3g1WhSlTJSfzkL68Mk4dsPaxMgqIS5ivgz8XTOgNTqZPx+CdO/iOO
 ZzXxGKsXCAQYTDO6ttOJiJVn4fGySh8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1712968375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ga9BDy950sqrkymKo/DX0soSuDFkOI9AzOuH62JvhYw=;
 b=I8NcdD/e1cLEL+nxIyxQnHqKpsUPCfjG7jRi48rRO496Fg9sqJd96AMINZ//aK1SXlaaBk
 yx4TdpyriWgtaSgGl3g1WhSlTJSfzkL68Mk4dsPaxMgqIS5ivgz8XTOgNTqZPx+CdO/iOO
 ZzXxGKsXCAQYTDO6ttOJiJVn4fGySh8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE3361368B;
 Sat, 13 Apr 2024 00:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /MuCKrfSGWZhGAAAD6G6ig
 (envelope-from <jeffm@suse.com>); Sat, 13 Apr 2024 00:32:55 +0000
Received: from localhost.localdomain (silencio.work.jeffm.io [192.168.111.21])
 by mail.work.jeffm.io (Postfix) with ESMTPS id 52F881014592;
 Fri, 12 Apr 2024 20:32:50 -0400 (EDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
 id B6E721079455; Fri, 12 Apr 2024 20:22:54 -0400 (EDT)
From: Jeff Mahoney <jeffm@suse.com>
To: Wayne Lin <Wayne.Lin@amd.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jeff Mahoney <jeffm@suse.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/mst: Fix NULL pointer dereference in
 drm_dp_add_payload_part2 (again)
Date: Fri, 12 Apr 2024 20:22:52 -0400
Message-ID: <20240413002252.30780-1-jeffm@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-0.00)[25.85%]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,suse.com];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_THREE(0.00)[4]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Mailman-Approved-At: Sat, 13 Apr 2024 09:09:34 +0000
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

Commit 54d217406afe (drm: use mgr->dev in drm_dbg_kms in
drm_dp_add_payload_part2) appears to have been accidentially reverted as
part of commit 5aa1dfcdf0a42 (drm/mst: Refactor the flow for payload
allocation/removement).

I've been seeing NULL pointer dereferences in drm_dp_add_payload_part2
due to state->dev being NULL in the debug message printed if the payload
allocation has failed.

This commit restores mgr->dev to avoid the Oops.

Fixes: 5aa1dfcdf0a42 ("drm/mst: Refactor the flow for payload allocation/removement")
Cc: stable@vger.kernel.org
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 03d528209426..3dc966f25c0c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3437,7 +3437,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* Skip failed payloads */
 	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
-- 
2.44.0

