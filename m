Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FA9FF8F4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 12:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8910E6D7;
	Thu,  2 Jan 2025 11:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="r3kpxk1l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W5DCz7Qy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r3kpxk1l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W5DCz7Qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DC110E6D3;
 Thu,  2 Jan 2025 11:49:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CF911F38E;
 Thu,  2 Jan 2025 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735818590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9/M2L0IaJwNHUpNZEHn9C0RksUBS9hK+UVh8Fs3QBZg=;
 b=r3kpxk1lSh3B6RQlPjEAXD8YWjSbM2h9fL4ZhWRiopqPxRxTeQ8Hb/9lKBGm5jF4Nkxcmr
 OaO6xc0nZ3okFyyxPoe9ZAu3RfzJc/Wz5vkhfVXlQK/6vIUg7LLVEx+XDqALk4P+BPptFj
 tN8AMiJoXOTfc/psesRAf4LqNlLfRtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735818590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9/M2L0IaJwNHUpNZEHn9C0RksUBS9hK+UVh8Fs3QBZg=;
 b=W5DCz7QypT657BX5U/GS3Aq4rEXuiY7dnW37moWDCk8yb892KAvk3KiUHntOa6ixleD6JY
 0kSIrF14l+jCXBAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r3kpxk1l;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=W5DCz7Qy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735818590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9/M2L0IaJwNHUpNZEHn9C0RksUBS9hK+UVh8Fs3QBZg=;
 b=r3kpxk1lSh3B6RQlPjEAXD8YWjSbM2h9fL4ZhWRiopqPxRxTeQ8Hb/9lKBGm5jF4Nkxcmr
 OaO6xc0nZ3okFyyxPoe9ZAu3RfzJc/Wz5vkhfVXlQK/6vIUg7LLVEx+XDqALk4P+BPptFj
 tN8AMiJoXOTfc/psesRAf4LqNlLfRtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735818590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9/M2L0IaJwNHUpNZEHn9C0RksUBS9hK+UVh8Fs3QBZg=;
 b=W5DCz7QypT657BX5U/GS3Aq4rEXuiY7dnW37moWDCk8yb892KAvk3KiUHntOa6ixleD6JY
 0kSIrF14l+jCXBAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68B81132EA;
 Thu,  2 Jan 2025 11:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id S/hRGF59dmeZbQAAD6G6ig
 (envelope-from <tiwai@suse.de>); Thu, 02 Jan 2025 11:49:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/nouveau/disp: Fix missing backlight control on
 Macbook 5, 1
Date: Thu,  2 Jan 2025 12:49:36 +0100
Message-ID: <20250102114944.11499-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9CF911F38E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Macbook 5,1 with MCP79 lost its backlight control since the recent
change for supporting GFP-RM; it rewrote the whole nv50 backlight
control code and each display engine is supposed to have an entry for
IOR bl callback, but it didn't cover mcp77.

This patch adds the missing bl entry initialization for mcp77 display
engine to recover the backlight control.

Fixes: 2274ce7e3681 ("drm/nouveau/disp: add output backlight control methods")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.suse.com/show_bug.cgi?id=1223838
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

The previous submission seemed fallin in a crack:
  https://lore.kernel.org/all/20240517110853.8481-1-tiwai@suse.de/
so just resending it.

 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
index 841e3b69fcaf..5a0c9b8a79f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
@@ -31,6 +31,7 @@ mcp77_sor = {
 	.state = g94_sor_state,
 	.power = nv50_sor_power,
 	.clock = nv50_sor_clock,
+	.bl = &nv50_sor_bl,
 	.hdmi = &g84_sor_hdmi,
 	.dp = &g94_sor_dp,
 };
-- 
2.43.0

