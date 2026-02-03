Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFZ7M/hEgmmERgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6BDDF4F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459D210E762;
	Tue,  3 Feb 2026 18:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KGbdZvi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB71310E75F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:52 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-650854d9853so1067292a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145011; x=1770749811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHIURFG0mejGoKIh/9LYz0d07pIYeDt6QmhYawdCAFI=;
 b=KGbdZvi+gCFadZXJ3C4sQsa+CpfKWZigKvAGTQ7to/yM4ny4VAIinLp3LemoH8rRnt
 +aL5ZFnSJ9hVbDNAkGjvsnl/3cow3tMVzIVeqnvbEL0vwr2g5Bg3f5U7EbOAO8Ztgxzt
 h0Zg1cYV376zzOyTHLMI4Nzkt2FDYmLyartIaF6u2ZJLkqSimat8Mwdb2/eszp1Cbv+m
 bTJBZ75OmHXtXQAidnvhtWZLbdR9hKpp/GncYDPENxTK1TGDoTHhdWIB4/GjBtdKaPcy
 1ktoEbNDWzvE+TqoK87clODGs1c+tIvMK8BnyRoQgHuo30aCj7teNSw29g3zrM1rGr/e
 1dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145011; x=1770749811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hHIURFG0mejGoKIh/9LYz0d07pIYeDt6QmhYawdCAFI=;
 b=KXnAeFfVt1J63v2GsWVRU/H+CMNyXI5/oK567BeWyA6wgmBrQQQLaAY4JhlGdl+gWA
 a7BBkOJ61mj++rsib9vEsprfogkTLpYegG05gL+WXt9B7Cwo+wcyMAnAd5SlWtkSy7mW
 jaQ+AVpkrbPitissRYWHGWatwmJhmRaQrrcqwqCeAnMhb9RY28NYo405CVD/tMPMmUJA
 UiThlYFz/Jl0BLYy2hFwdUuBQRocvQYRlaSHGFSZIrzxJHee2VwR6k8AWLzsp4fSG94j
 RNnQSnBhiftWAQTEZCZ4hevQVi6qt/uzfIIA3fSnt6zjxAUhZOhC19B5TOD+F3iAUSor
 nGtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeTPfCS5Z8klUk04oQQhJ2Q/imgNQH2fGi8WERMcY5xClbTfbAXeMyupIeIdasA1V4fgW5yHJzzMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8rn9ChsQtjJ/P+EYC6FdB1WMcQGmpubQi0p/WYDfSX2Bg1TB+
 BRYQr/quWSAAgoKJbUavW1ZX4JgkZGkNJx6leIVQ7d+f737R59xskzkF
X-Gm-Gg: AZuq6aJ6kB2ia68FRYmwRSYTD7uRfhnUqgu/yf8B3JQ+dK8cEmx0eFV1KgZvxsqZlN2
 jIVsKteVvDevGeTB/ESK5MdewherpnCEHyrgYLqtK6UFRaA7N+10xIQ2hxYeKBJVJrR2v9lzxyn
 qhCRESARAAnmsoqS9c8ZjZfeMZTcqh5X5UYzLbrTayeo4Ra/mkYjqqttJcsdj8nonsB6fOhR8ky
 2bQDDGQeG3y3vfZUb+dyLNPe1d3fi6bkQh+jjfdmAV/BPiOXDPq/Iy8tzE+aesXozJR74RKDag/
 YEGc5EVZu3I0FxJdruMHwkuzXMDemPzrzRJIGzWOwU5YPgBW5n81dXrPgi9IgXSaNCeeAC0Yr7U
 Zuh4Omcu8Okydp2ljPSv0hIF3Tplm89FEKwT8z8yLZURLJ/JXV6II7GIx8wSCUtg5ThWGiCyOGq
 WT7elWlF3ehGEqYEr/8ws4YpVhxR+HGP9BDl8YHhZarQrkUzshcK1bf2ewaMDi1zKQ
X-Received: by 2002:a17:907:3f08:b0:b8e:7dcb:7f23 with SMTP id
 a640c23a62f3a-b8e9ef22f6amr20500866b.2.1770145011116; 
 Tue, 03 Feb 2026 10:56:51 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 15/19] drm/amd/display: Trigger ALLM if it's available
Date: Tue,  3 Feb 2026 19:56:22 +0100
Message-ID: <20260203185626.55428-16-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 76B6BDDF4F
X-Rspamd-Action: no action

[Why]
ALLM automatically puts TVs into low latency modes (gaming modes) which
we basically always want for PC use, be it gaming, or using precise
inputs like mice and keyboards.

[How]
Read the ALLM info from HDMI caps and use it to determine if ALLM should
be indicated in HDMI Forum vsif. Additionally, make sure VIC modes are
translated in case of ALLM active as VIC cannot be used in conjunction
with hf-vsif. I learned this the hard way...

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c          | 4 +++-
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c  | 7 ++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 848c267ef11e..4a7c9f810e35 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4504,6 +4504,7 @@ static void set_avi_info_frame(
 	unsigned int rid = pipe_ctx->stream->timing.rid;
 	unsigned int fr_ind = pipe_ctx->stream->timing.fr_index;
 	enum dc_timing_3d_format format;
+	bool allm;
 
 	if (stream->avi_infopacket.valid) {
 		*info_packet = stream->avi_infopacket;
@@ -4658,8 +4659,9 @@ static void set_avi_info_frame(
 	if (pipe_ctx->stream->timing.hdmi_vic != 0)
 		vic = 0;
 	format = stream->timing.timing_3d_format;
+	allm = stream->link->local_sink->edid_caps.allm;
 	/*todo, add 3DStereo support*/
-	if (format != TIMING_3D_FORMAT_NONE) {
+	if ((format != TIMING_3D_FORMAT_NONE) || allm) {
 		// Based on HDMI specs hdmi vic needs to be converted to cea vic when 3D is enabled
 		switch (pipe_ctx->stream->timing.hdmi_vic) {
 		case 1:
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 8e110c86bdd4..53e488fdb4ea 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -541,9 +541,10 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 
 		info_packet->valid = false;
 
-		format = stream->timing.timing_3d_format;
-		if (stream->view_format == VIEW_3D_FORMAT_NONE)
-			format = TIMING_3D_FORMAT_NONE;
+		allm = stream->link->local_sink->edid_caps.allm;
+		format = stream->view_format == VIEW_3D_FORMAT_NONE ?
+			 TIMING_3D_FORMAT_NONE :
+			 stream->timing.timing_3d_format;
 		stereo = format != TIMING_3D_FORMAT_NONE;
 		hdmi_vic_mode = is_hdmi_vic_mode(stream);
 
-- 
2.52.0

