Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k4ClKPREgmmERgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FBDDF31
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F0810E75C;
	Tue,  3 Feb 2026 18:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q6SDYOXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B5B10E75C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:48 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64b686e7d04so655075a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145007; x=1770749807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0zIdsXy6yEQ4Kw4OgKCvel61dY5GUoe4J4Zasteni0=;
 b=Q6SDYOXyfsxJrk3RAlldetpM0Rqz1hDrtt/v+PeQsplEey71ZKLusMQO2mglrxrxvi
 6sjFusvR9tE6qCAP9nRG8omhK8EcBdLIxhRjikfb6tqWwQAp1rVZxIBWY7rDzDDLR4CM
 +NXlkT0qkvnVlrq8uDJNoasMyd3Cpkm2nzIZOIey5wb20PbQXajxNguCkFAcqoaErB/1
 eEJTlQ+jfM7Jg003lg+y1bfCUWfqYXegmO3ehcTmBrU9YuODYM/AKk4jV7Yxg5BtJX01
 EWGpVbBW9fo+zc7rMKA9A39Ppn6Om7SvYFJAJZJ5i6Evf4fXTt82eoeoZ6Fl4l4ZVuSp
 wTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145007; x=1770749807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g0zIdsXy6yEQ4Kw4OgKCvel61dY5GUoe4J4Zasteni0=;
 b=p5RkahlkCM7JphqLRRSQXCeU+AZgP921TMugFd07tUt+CqzEOl+dJRQoMKEC5pkUV/
 XOg9lILGzWAeOu5Zv3iHbDXjWmJdh2ENt+Yb7RdDBUInby+zGwZiwge+oObb0gQciwyV
 mMqnktCHC2drYBXJqtxSZqh0YOy60dHWPkT9RU/slxt2vbZu/sUoeZR2hcFw4KqICxmD
 ziuqJd4UDJ4yK6jQR3oh9fkTfc0U0hd6LyKwOYofVN0WKlpVsSmcjj6zKVN7az4p5NC/
 B4vJHo5/EMlP1MQwT6ermqdy/V9HGHK1cSwZicuUjqReInhGRMl0VBgo1oRi93W8gPLg
 kf4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3uwIB0rQpdRzt+l0iY8ZXvbKLFy+JcLuaR04K9fvz0tW5XWgIb+KaAV8nNVeqXVLl0f8iHnzo4hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAiFaBB5v2u7tHnB77VZtNmmYDXaUdI2kJm84FV36u7LKRfLcM
 ThwdDSOsloAu9b54IsR+RUpG9OjccC3NZYbdNpPZKUXtgEBCkkKBCyCk
X-Gm-Gg: AZuq6aJzXeQ8yjk7o9WsPTekpLMgfXxas+11pBWlJCHPC9LebCrtepMS+uqq5yym+4z
 KPeCQ+4yLF4AslY9Q426DgLiqpp3KhzOq5AuKH/3IAkOjEgMlLGFZL+w8f0JkfOUpsLS0O9g551
 5hojF6gN8Wex++0hTmV13Hgetqa+0nNoHQA1V5D6OYJAUxF8rV9SLXJErHBejtSTbCBsfkSMdP+
 tln0dHeGif1plhrQrIhh9hcPqBsAYVtRrctLNz2aSF7Qqx2O3otiLdNuLxd8gJzJEszP3I5E0x+
 Gyu145AnYMKHjlrr3uwcTFPSkuv4+xp6mqnXRH9Pg+WOUuTjhoT4CL7xDazpnoIV1m1w9DiXnMl
 OdsHjpnsTntrRT0c2yuAJJS9xtCXG2VWsZ48AYFOvxLKJ4+qA5ANG3wvekRoQwOTznVMz+CzzPW
 T/sfGRsJHroY9XVycJkZD83hUXWa7zveMUMW29S41+askpus57oYJ9YU3JINpGEM0C
X-Received: by 2002:a05:6402:6da:b0:64d:23ac:6cae with SMTP id
 4fb4d7f45d1cf-6594a1e4230mr155645a12.6.1770145007089; 
 Tue, 03 Feb 2026 10:56:47 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:46 -0800 (PST)
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
Subject: [PATCH v3 12/19] drm/amd/display: Build HDMI vsif in correct slot
Date: Tue,  3 Feb 2026 19:56:19 +0100
Message-ID: <20260203185626.55428-13-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 3E7FBDDF31
X-Rspamd-Action: no action

[Why]
HDMI vsif was assigned to vsp_infopacket (FreeSync) field

[How]
Build HDMI vsif in the correct hfvsif_infopacket field

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2200161da71b..ab01a45aef1c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7383,7 +7383,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.52.0

