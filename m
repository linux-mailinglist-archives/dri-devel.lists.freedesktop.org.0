Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHnMGrBJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D40146533
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB5C10E3BD;
	Mon, 16 Feb 2026 16:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MJNSYCfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDA10E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:29 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b8fc023934dso18313066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260328; x=1771865128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KSOhFxZTGl0VyB0dvJbtjxL4ii4LJZxM+Bjjm62DzE=;
 b=MJNSYCfbcL6ZQn/MsGyEUdVcLAEI8XCuHZe6NBJ/HNjopz7h1Q/Ht7ZJ9tnanYStgV
 UZcy/aJh0kyedszX3L7PbZbdoBA3/9epyckcDMkVUOg3NJfGeDsrMw0T5ZHbxi8f7ZUH
 tSPHUt7onLy2SVhjS+CLt7bzHLMIVjhcSVO69jexr6qz/xQ9KHWJlgN1S/J/vvUgL59m
 CZXSv9lS4dSFubu0BRXhRP/478yYundaj0eiUSHNBo+K1tqdyvbn0fs35BUatp7rDEqQ
 zzsGJsUTrGBXIwMph/b4Jcy7Ko3oGyqy2moFOzYpHlDmJWHw8TOOzWHGT/TYjM6IAhRw
 uQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260328; x=1771865128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4KSOhFxZTGl0VyB0dvJbtjxL4ii4LJZxM+Bjjm62DzE=;
 b=DskPQAwNCW+wCvne7YyVT5zar87Ky9A/gTIb+ITzk4ave3wf6WPvg/S7K5+DgHJXMH
 QGsG/8j8IZUt1Xt3CwefaZ/q8mMrcQPaqQ6HRIiziqHF1gmk5f5RwCfvstXiVV1R7tK6
 NW+gEjLllH4dHIsIJIsOALf11Rx055tRJkLDVHGrdl7ewAvjhIijm/huTC1zKVFDaeeM
 K94mmCfd5xmUb6BUwpwLMJK7KmJWwTb6zObnDrAf/7yTGjpTPkwRIj4SjxVMA32IVoAo
 O+We+p6p757/GVr7hFiUuZHTruZcpAmYRd5zaqFpwRoN7vEylTf8MSTDCL0PwrrTkb9h
 VcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtQiK48COv5qkweKpkvGCRRzopF6dhUnoSIYPeVtZk1NrGWZUath1eqdlLA6TzAwWrpDY0Qa6f5Tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxremjNnNtQeYmukBTjFLr+n1TcGrpu93qVIbgrHtgFoX4R8ll2
 cx3dFSwoiZOUuzhKh0C7NN51l63P9WPnmGC4080FXCvbnjAx9Ck9NnhT
X-Gm-Gg: AZuq6aJTMevJL9TpScw4gyuYKuhCS8EwY+5yAvXfmMt+roXevmPTXxGCbJk7rrTZQ6y
 xJ10bqtqqScUOxDAlr/JcwAnj8hyAepLp81SPr9/ovQO7CLQCB1isUkU9ABhT6cjtTtuuYLNadQ
 sw3aLCevQSt6gaPzo6AkugkwTR3WsG7q4t8bPcZ+W5AbHWV6uhG18lx/qhvnPQqVpS6rnU1jRrF
 HYeuTvqCVD6Wv6btedZ+cBmUJEhAZtU9ExvMLGbvTkSuH6LfBGnDMg6cIdbYJ0FFhnuh7mN0Ajh
 FdFj3+IlIWPHSXBWtyWcCByfuhZ1D587Y2kYIoHNq1GpDbIpDzcufckU5s8vtxbS1x+AOIO5lV5
 8Owzu1GaL+vGWa8vJGWsxhv2ZB4PJUAimd6HTXqf68tsp2JwxNQyKEWbYgKhi0QmBTaTPMQX8Pq
 XdQudQLdaOyGnLEnki3YQWc4c1R2Irco2vd2SmDxMpyz8V1lyyHiXzwONGqjO/05zKmClejkHYJ
 FSR
X-Received: by 2002:a17:906:6a24:b0:b87:3c3a:cb7e with SMTP id
 a640c23a62f3a-b8face00ea5mr368555866b.6.1771260327617; 
 Mon, 16 Feb 2026 08:45:27 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:27 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 06/27] drm/amd/display: Check for VRR range in CEA AMD vsdb
Date: Mon, 16 Feb 2026 17:44:55 +0100
Message-ID: <20260216164516.36803-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: D8D40146533
X-Rspamd-Action: no action

[Why]
Some monitors only expose GTF ranges (or others, without Range Limits
Only flag). This breaks VRR even though they have explicit FreeSync
support.

Currently, if monitor ranges were missing, amdgpu only searched for AMD
vsdb in DisplayID but many monitors have it in CEA, just like HDMI.

[How]
For DP and eDP connections, check for VRR ranges provided in AMD vendor-
specific data block if VRR range wasn't detected.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3894
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4457
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4747
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4856
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 64d1dae4d214..b3bf5e0c19a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13332,6 +13332,12 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		/* Some eDP panels only have the refresh rate range info in DisplayID */
 		if (is_monitor_range_invalid(connector))
 			parse_edid_displayid_vrr(connector, edid);
+		/*
+		 * Many monitors expose AMD vsdb in CAE even for DP and their
+		 * monitor ranges do not contain Range Limits Only flag
+		 */
+		if (is_monitor_range_invalid(connector))
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
-- 
2.53.0

