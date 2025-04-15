Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB9A897D2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB1D10E6A5;
	Tue, 15 Apr 2025 09:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QmWaUoDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EuZmUEZW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QmWaUoDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EuZmUEZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ECD10E378
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:24:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0777721166;
 Tue, 15 Apr 2025 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744709086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
 b=QmWaUoDTm78rh2I7eeAuGlsPl3O5FkLtbXw2BTx8yLzbCj10q2HzV8/o+ir2/pRNrq4AZ5
 nPXlcl2KD9gcTfihd6fa2ywfyidiXpNsSoXuWxxz+Gd/6TZN2X+zKu4TAQIFrKqwQWx8+5
 dzg6XWUT/BoVXiAacsdxV20u4qonN74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744709086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
 b=EuZmUEZW1WzfE1dcFsQb4VEiqDYcCWnr+cFcAJleATSQw6z3en4cE98nZoO9ZljWf/nD7h
 AJsr+q4zIjRDBqDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744709086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
 b=QmWaUoDTm78rh2I7eeAuGlsPl3O5FkLtbXw2BTx8yLzbCj10q2HzV8/o+ir2/pRNrq4AZ5
 nPXlcl2KD9gcTfihd6fa2ywfyidiXpNsSoXuWxxz+Gd/6TZN2X+zKu4TAQIFrKqwQWx8+5
 dzg6XWUT/BoVXiAacsdxV20u4qonN74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744709086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
 b=EuZmUEZW1WzfE1dcFsQb4VEiqDYcCWnr+cFcAJleATSQw6z3en4cE98nZoO9ZljWf/nD7h
 AJsr+q4zIjRDBqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD358137A5;
 Tue, 15 Apr 2025 09:24:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LFIcKd0l/mehVgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 09:24:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/gem: Internally test import_attach for imported objects
Date: Tue, 15 Apr 2025 11:20:40 +0200
Message-ID: <20250415092057.63172-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,kernel.org,linux.intel.com];
 RCPT_COUNT_TWELVE(0.00)[12]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email, suse.de:email, suse.de:mid,
 intel.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO
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

Test struct drm_gem_object.import_attach to detect imported objects
during cleanup. At that point, the imported DMA buffer might have
already been released and the dma_buf field is NULL. The object's
free callback then does a cleanup as for native objects.

Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
clear the dma_buf field in drm_gem_object_exported_dma_buf_free().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/drm/drm_gem.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8..f09b8afcf86d 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
 	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
+	       /*
+		* TODO: During object release, the dma-buf might already
+		*       be gone. For now keep testing import_attach, but
+		*       this should be removed at some point.
+		*/
+	       obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.49.0

