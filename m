Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA+fIHxjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0381BF3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C76210E37F;
	Sun, 25 Jan 2026 18:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSCVCMZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F4A10E379
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b8845a47e39so63020466b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366373; x=1769971173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4XqZpkGSkEnuKP0+cVaiZq40DDr/xmS7/WCMvlfxBE=;
 b=QSCVCMZkeGcNDrIpcmU5qkXvbb16gQahT1i3LfZIib3psfC5Xyxvjt0CaLUlPuMhRe
 +Efd0O0rdHIfsz8sWWODeBqzh8+HEPBj+rQz80FjZ0pbPAqOupRR9if1hm5rZLBjLyFs
 Bkuzm8WPjsaPh6ulasFDClW+KFr+F9G8Un4m5ueHSwGexKvSCHgjJKIyh7UzLLaYMHkj
 BCm9QG1EyH8a63hobAoT8d0Y4redGCot1carsMBtSViRP1T4eheIGPya/hsl+GU8i5ll
 qnQreRjfETJC1i5/oaQsRJWtscukwh5MpOo52dBnpQfNHVRrkUAeHp86rEeG+94m2vul
 Ttww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366373; x=1769971173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B4XqZpkGSkEnuKP0+cVaiZq40DDr/xmS7/WCMvlfxBE=;
 b=WBVEcKgC2TyOcUvut4qOgksk0Zfe4nU07XD97FQsrbgeWNTIByBRCZx0AXA27N4ntZ
 hv9s9hJ2RoMJiDFy1ykVGmCvNWxiVW+JRx/XIB/4t4+ccWuOmI0l+Wgg2f9le/vhczQH
 xa8B95utn3/23ILop3EZSK88L8fhw2tz9IpQGdFRj2Ew1uWJPkVncvMUHmWmiw3RF0h9
 pnHaY7xGU80jC/TUJ1yNdUXOIAikPFyonMMsl1Spi1ZP5Kd7VfbEl5bq4+0jFKWIc9os
 FwAbz1G+tMgS9PLKekikTQqi3YLLeEWg+sHm1dXojh4jXims32OFa/L/MG3Ren7gB7jg
 XhSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3RTlzAE44E1D7sjKI6LmyWROGPF7gaq8uBH9zbBVdhzU63x1d3XLfLBCHxi/vB4W3FJ+Hni5HZGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1NE8tVgS8zKAA6kpns4FBIdYQc0k2n/9hg7iM+r+2J///Dg2i
 QckMtbLFKMVR7wasXK8Z5+cjg1blC88IXu2oJTmG41kYzMZJvPbwoq/vmd7Cgw==
X-Gm-Gg: AZuq6aKFclRgohDnBEt2jCElgXzq7BHis/dtlM/e+q5xjp6lopQuB1qUZGgzHHpAzVL
 q1O8P8bzRY3a+TF7wWvuXKe6CPHgcCDL+/tQvkGAmjDRZdQKk2OmYjEowsIF/aBwQMfJV+c7Ons
 SpVwxsFt3XdeCi91L/jMu7LDtei4M/QX5pHNOv9PMeN0jdgNLwpKgMxig9+btEg4TH7Uul8DaRn
 FHP5YQVXByQe0XhLOuT3DvnioIF296rHBRY0RfNGobJxnosP5uShfzSeGFaGUyDCxVhyBGgHjwJ
 Q7f0kO4fWx5eIkmCt5/eVt5S7r3+MzEUR/QaKpQO+y6cAJakTUEVFw/vfrO9Zt9EkZ0kchXiV4L
 mB7GPIgdEqNWPlrHxJKDDJi5Z+CR+mmSudjpkE3uvcosp9ILmoUz4rxwtiN0pZbamu9z9IH3+yo
 06GBJvvIzvIO1l7NFmsWfuXJnjgLa0dP+acvtBu03ptDk4ptOk4xBbCpVU547uzppG
X-Received: by 2002:a17:906:d54e:b0:b87:1c20:7c5a with SMTP id
 a640c23a62f3a-b8d4f85435amr104144566b.8.1769366372975; 
 Sun, 25 Jan 2026 10:39:32 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 12/19] drm/amd/display: Build HDMI vsif in correct slot
Date: Sun, 25 Jan 2026 19:39:07 +0100
Message-ID: <20260125183914.459228-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 26D0381BF3
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
index b93ba14d87d1..f95e8a739303 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7362,7 +7362,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.52.0

