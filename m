Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13330BE795E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 11:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1F110EB8C;
	Fri, 17 Oct 2025 09:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MY05habf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W2joHQIQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MY05habf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W2joHQIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE7010EB8C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:19:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CB571FD9B;
 Fri, 17 Oct 2025 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760692781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SdDd+oPBx64OchoIBGxjTBrw415FRuCCDkOLf5TW1KA=;
 b=MY05habfaFd86WJr8Tm6pACJDQJkbtCPiNOcMaRzu/fsu1WsmliZVQfiifqFFHsmuqwnhC
 uHzgzq/4OJMdyigYyKBWZcttxudHj6y5qNZBLXp1zNZhHGYMXNln5TreH4aXCQPogT0QF+
 P43/tjbR1CzHb796uFUGWo3/Mv2j0vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760692781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SdDd+oPBx64OchoIBGxjTBrw415FRuCCDkOLf5TW1KA=;
 b=W2joHQIQ/Ux1VmmxEIE71eXOvuZwFVSttnvBv0LRLZwN0ae0m0JiyyuiR9h6eHpTaDXWGz
 4dOHnYqLn7bLq9AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760692781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SdDd+oPBx64OchoIBGxjTBrw415FRuCCDkOLf5TW1KA=;
 b=MY05habfaFd86WJr8Tm6pACJDQJkbtCPiNOcMaRzu/fsu1WsmliZVQfiifqFFHsmuqwnhC
 uHzgzq/4OJMdyigYyKBWZcttxudHj6y5qNZBLXp1zNZhHGYMXNln5TreH4aXCQPogT0QF+
 P43/tjbR1CzHb796uFUGWo3/Mv2j0vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760692781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SdDd+oPBx64OchoIBGxjTBrw415FRuCCDkOLf5TW1KA=;
 b=W2joHQIQ/Ux1VmmxEIE71eXOvuZwFVSttnvBv0LRLZwN0ae0m0JiyyuiR9h6eHpTaDXWGz
 4dOHnYqLn7bLq9AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1134613A71;
 Fri, 17 Oct 2025 09:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 933DAi0K8miAJgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Oct 2025 09:19:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gem-atomic: Reset plane state to NULL if allocation failed
Date: Fri, 17 Oct 2025 11:19:02 +0200
Message-ID: <20251017091919.58770-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Unconditionally reset plane->state to NULL if the allocation of the
shadow plane state fails. Avoids an invalid address in the field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 6fb55601252f..569d41a65a0b 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -338,8 +338,6 @@ void drm_gem_reset_shadow_plane(struct drm_plane *plane)
 	}
 
 	shadow_plane_state = kzalloc(sizeof(*shadow_plane_state), GFP_KERNEL);
-	if (!shadow_plane_state)
-		return;
 	__drm_gem_reset_shadow_plane(plane, shadow_plane_state);
 }
 EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
-- 
2.51.0

