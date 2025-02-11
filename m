Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CAEA30FD7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 16:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8E10E6EB;
	Tue, 11 Feb 2025 15:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ra4fURoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Yy0eZub";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ra4fURoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Yy0eZub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03FD10E6EB;
 Tue, 11 Feb 2025 15:32:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B70565C44A;
 Tue, 11 Feb 2025 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739268530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3s2MHc3chpf4YmzucLQAgde8O86lj1K8eKaB4Rm+fac=;
 b=Ra4fURoGuAhKdETVrmii++K+5Hi7vd+oSsoT5AV5Np3oTbE0gFHG0sj+aiw9YzvPjmR02M
 3l9tk48JAqieulwGZifx+AbKQ+JpVSLH8a4nx5mzkC+RTwydgxwIa2ork4ZORuDpqI1BqH
 Q88xkD6M24Ev+q3mDuXjRlICGxzhfi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739268530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3s2MHc3chpf4YmzucLQAgde8O86lj1K8eKaB4Rm+fac=;
 b=9Yy0eZubkbeKyqzMoLK0UVTSRYlVO97UMmoNvJs8fZV0STNwTn5agvDlHzb9RoFM9XKscF
 oTfV5GbvBNPjPRBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ra4fURoG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9Yy0eZub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739268530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3s2MHc3chpf4YmzucLQAgde8O86lj1K8eKaB4Rm+fac=;
 b=Ra4fURoGuAhKdETVrmii++K+5Hi7vd+oSsoT5AV5Np3oTbE0gFHG0sj+aiw9YzvPjmR02M
 3l9tk48JAqieulwGZifx+AbKQ+JpVSLH8a4nx5mzkC+RTwydgxwIa2ork4ZORuDpqI1BqH
 Q88xkD6M24Ev+q3mDuXjRlICGxzhfi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739268530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3s2MHc3chpf4YmzucLQAgde8O86lj1K8eKaB4Rm+fac=;
 b=9Yy0eZubkbeKyqzMoLK0UVTSRYlVO97UMmoNvJs8fZV0STNwTn5agvDlHzb9RoFM9XKscF
 oTfV5GbvBNPjPRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71C6713715;
 Tue, 11 Feb 2025 10:08:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F1eQGrIhq2fHcgAAD6G6ig
 (envelope-from <tiwai@suse.de>); Tue, 11 Feb 2025 10:08:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amd/display: Add sanity checks for drm_edid_raw()
Date: Tue, 11 Feb 2025 11:08:46 +0100
Message-ID: <20250211100847.12937-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B70565C44A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, suse.com:url]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

BTW, I'm not sure why memmove() is used instead of memcpy().
I left as is for now.

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index fbd80d8545a8..a92bc12a095e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -980,6 +980,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	enum dc_edid_status edid_status;
 	const struct drm_edid *drm_edid;
 	const struct edid *edid;
+	size_t edid_len;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -1010,8 +1011,13 @@ enum dc_edid_status dm_helpers_read_local_edid(
 			return EDID_NO_RESPONSE;
 
 		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
-		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
-		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
+		if (!edid)
+			return EDID_BAD_INPUT;
+		edid_len = EDID_LENGTH * (edid->extensions + 1);
+		if (edid_len > sizeof(sink->dc_edid.raw_edid))
+			return EDID_BAD_INPUT;
+		sink->dc_edid.length = edid_len;
+		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, edid_len);
 
 		/* We don't need the original edid anymore */
 		drm_edid_free(drm_edid);
-- 
2.43.0

