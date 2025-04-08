Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D81A800F1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD4310E645;
	Tue,  8 Apr 2025 11:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sJP7jjTu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ySc9g0Ri";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sJP7jjTu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ySc9g0Ri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FF710E669
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:36:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6F0921168;
 Tue,  8 Apr 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744112199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QYGHBdp97lGITAfEYvYH7s7ybn2vEQ6+KgeX9HgxvtY=;
 b=sJP7jjTusg0CIRTgv8Htb0CnQden4PZIo8JLh2sd4G0rvbry7cVeRG9qX4S/JRvoAhCOpf
 e8jFo1mE/oiV2brXvxhlzWkf35eLazo1FcwMNzkMs5VN198j3jJ4MoDjWNR/EGx1GATWBi
 KNrxjQZ32v4u7V5uKbaDa3a2XFQOSo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744112199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QYGHBdp97lGITAfEYvYH7s7ybn2vEQ6+KgeX9HgxvtY=;
 b=ySc9g0RiWl9utOmJoLW6k/JDK+113O8XF6I+/dcdism4aKjh329J8r0CRg71RD6zORdVC7
 Xlc2Kd2dh6g0HPBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744112199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QYGHBdp97lGITAfEYvYH7s7ybn2vEQ6+KgeX9HgxvtY=;
 b=sJP7jjTusg0CIRTgv8Htb0CnQden4PZIo8JLh2sd4G0rvbry7cVeRG9qX4S/JRvoAhCOpf
 e8jFo1mE/oiV2brXvxhlzWkf35eLazo1FcwMNzkMs5VN198j3jJ4MoDjWNR/EGx1GATWBi
 KNrxjQZ32v4u7V5uKbaDa3a2XFQOSo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744112199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QYGHBdp97lGITAfEYvYH7s7ybn2vEQ6+KgeX9HgxvtY=;
 b=ySc9g0RiWl9utOmJoLW6k/JDK+113O8XF6I+/dcdism4aKjh329J8r0CRg71RD6zORdVC7
 Xlc2Kd2dh6g0HPBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A99A13A1E;
 Tue,  8 Apr 2025 11:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IJplJEcK9WfTDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 11:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jacek.lawrynowicz@linux.intel.com, maciej.falkowski@linux.intel.com,
 ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
Date: Tue,  8 Apr 2025 13:31:26 +0200
Message-ID: <20250408113247.418007-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/accel/ivpu/ivpu_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 212d21ad2bbd0..e0d242d9f3e50 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -30,7 +30,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
 		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
 		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
 		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
-		 (bool)bo->base.base.import_attach);
+		 (bool)drm_gem_is_imported(&bo->base.base));
 }
 
 /*
@@ -122,7 +122,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 		bo->ctx = NULL;
 	}
 
-	if (bo->base.base.import_attach)
+	if (drm_gem_is_imported(&bo->base.base))
 		return;
 
 	dma_resv_lock(bo->base.base.resv, NULL);
@@ -461,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 	if (bo->mmu_mapped)
 		drm_printf(p, " mmu_mapped");
 
-	if (bo->base.base.import_attach)
+	if (drm_gem_is_imported(&bo->base.base))
 		drm_printf(p, " imported");
 
 	drm_printf(p, "\n");
-- 
2.49.0

