Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE679ADB641
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87610E3BA;
	Mon, 16 Jun 2025 16:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="saAwb6ic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWzwOCuD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ue3TZ7yi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gq51MwMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585CE10E33D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:09:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62C8221215;
 Mon, 16 Jun 2025 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750090162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bx6i2NZ8BbZBrNkIElY6uzwl2GaqIZIIjwPFKMYv8is=;
 b=saAwb6icJLSPyayJZyeWCYcfF6sLhVl2GprjCYXgMLgkyF76PdevYHAbY6b2wsVkHh7RXX
 giSBC0eCWznrXSpSsga8e93B4x2sLXsZ/5HgLvtwO7AKORufCD8cAh4+cVjkUDBoNXl3hV
 U/9D/dNn7RDXLkvzU5DDb27/YFGW9TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750090162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bx6i2NZ8BbZBrNkIElY6uzwl2GaqIZIIjwPFKMYv8is=;
 b=YWzwOCuDrVxMk/dZk/+rwM2wTjzFlIUDz2rysRQcXwNQ75zYE6ntpMRIsG7eYDSHIyKag7
 lvj25i3r92pDAODw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ue3TZ7yi;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gq51MwMk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750090157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bx6i2NZ8BbZBrNkIElY6uzwl2GaqIZIIjwPFKMYv8is=;
 b=ue3TZ7yiQq865YUUlgGbbdCLmNL/TkQTkRUu+r25AlbdBgLa4YQzpe0tfrzpvOup9sbtlR
 BYfzL9tmbJidhZ4TheHub78Avob4IzdeZNgRb8EmAFAFSOf0XHCJSdw+oKV+9wG256GQx3
 6OQf6f0aFzipYl5300ZFqotgRT/d+E4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750090157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bx6i2NZ8BbZBrNkIElY6uzwl2GaqIZIIjwPFKMYv8is=;
 b=Gq51MwMkyjQs/bLBV9jOh+Av8HGn3aFzXBqBjuNojMHe5NAQaR5Loh0RlR2b/T5FRFX9Yc
 gfVm9DFmFPs+frCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28E0E13A6B;
 Mon, 16 Jun 2025 16:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qAOqCKhBUGi5cQAAD6G6ig
 (envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 16:09:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH RESEND] drm/amd/display: Add sanity checks for drm_edid_raw()
Date: Mon, 16 Jun 2025 18:08:41 +0200
Message-ID: <20250616160908.26333-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 ASN_FAIL(0.00)[7.9.0.0.4.6.0.0.0.5.1.0.0.1.0.0.4.0.1.0.1.8.2.b.0.4.e.d.7.0.a.2.asn6.rspamd.com:server
 fail]; MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[7];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 62C8221215
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

When EDID is retrieved via drm_edid_raw(), it doesn't guarantee to
return proper EDID bytes the caller wants: it may be either NULL (that
leads to an Oops) or with too long bytes over the fixed size raw_edid
array (that may lead to memory corruption).  The latter was reported
actually when connected with a bad adapter.

Add sanity checks for drm_edid_raw() to address the above corner
cases, and return EDID_BAD_INPUT accordingly.

Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1236415
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Just resent, as the previous submission seems overlooked

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d4395b92fb85..9e3e51a2dc49 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1029,6 +1029,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
 			return EDID_NO_RESPONSE;
 
 		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+		if (!edid ||
+		    edid->extensions >= sizeof(sink->dc_edid.raw_edid) / EDID_LENGTH)
+			return EDID_BAD_INPUT;
+
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
-- 
2.49.0

