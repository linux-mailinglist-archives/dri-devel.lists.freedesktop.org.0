Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPYhHR4qmWk6RQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949F16C102
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9782D10E10E;
	Sat, 21 Feb 2026 03:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M4gOzhY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7C10E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:44:22 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso1578574b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 19:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771645462; x=1772250262; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJmFbB3FwMiKYWU/wDkbhYitxVoyIrAuDm/JRU1AydA=;
 b=M4gOzhY8tkMZlqCVXTcNV7sElzvpS36HLc4HSFSeH7zC1tm4pqmYFIuVNLx5e+KCvZ
 4JCGTU43y9sEmj0wl5Vzq8nL0IcEr/9ifzYMdJiTfPeFgrHETHQuP3ybVwrALXKBfcqk
 hXLwLCQJVPJ1heuqH4nQCZ7LkBK28brpF8vncgbWjQezw0rPHJzqhjnThS8i1bVDloxO
 WqYS0Pms0Tu2+pxqUw4aJBlYAZF2rwKGPmpXTJ+udhfmBVP1cYqnAPAACfVnurXZUYTE
 BIeM9/+uPCb/vG2SdCnOoSYW2PaOPs6oJvyIlOBRSIetQSV1fu3gfTROmU01Dam+x7bs
 XH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771645462; x=1772250262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rJmFbB3FwMiKYWU/wDkbhYitxVoyIrAuDm/JRU1AydA=;
 b=IOIfiTDBUSYJuVS94N9a8ji1dH4bTk40Kw4u8HfU9ZLvQvWfVcOqOUF+y3vYCV4wi6
 oqFkkue3pu6r6KlKsvjOSH8JaeBGEpcIYTZg65DRUbdUwn8e9/88kPFu+ZDf64U8TDXV
 TBIFcbKRbXoVH8Pobqh4pA3jovtnk8/3qGdSSLAu2wP0mgKacJkigdqG/s0c0nBEqXTh
 jw8KXAf4B95cRHCtbbgSLXdpMh3rxs0FhDB8ybO3Q0pESfw8UptnVuekJia5riwBrrzl
 ObTiqKq3oO9/vsyB33/SgsZvBU/zvysJ4mKRtCiSUJsVszMQfqLpBJeBJpeKIHj8Q59K
 Wi/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMwjYwMLbb7GkI+2fydC4rPPo6TA59dljcmnvyp/StgUPXhTzFSQSuBcxqHPbFc/6py0BrjhfIYKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0X4MsT14UY7jPmkQfyJL2I98kuBA2E4iAhnC2BW9sKfgtr1Bx
 uF4DSLMcVypbAhP9f7+nWtNSUvugvsurqoHCyFVav0odo7vEP+6n+djk
X-Gm-Gg: AZuq6aK1fX0L3ZEaqfkKhYdgie03pW3sr/PuN51rpbEH1J3Ck0ognO9ngxdUfEaXVkT
 RFf2xRKNcm/AAaa4JOLPndTF4600VxfDaQqztQ7X9vsUeP1Pa3Um9FHdkHxwAXkRZSJ0QVjmLNa
 0bmRV44alnr7xZP2uKneOk7pkFXv0BImcVnQudPGXu6p4ps9A1q2xOeKY6vAZAEOgInbiWFtGNc
 RR1rQTHCzuce0g4bsy9AsvaLHu0BBi2N5kB9eXrG6XCOoWzsfhqMyA10ydvuNsiddJdWjoQjelN
 n5KKOj5kCF1iGsFbGC7Fcrcc/Q8MRC3ge6lEuviHKCw/s2GQXQB3OX1Cmif8q1mqpIom63P0mAd
 VoLdSyJi+jjS7wrVA3jPD1sxPS8q5jMJG9kFd4SXI03lPlkGwbrMeGw8rMH2REg02Ozwy
X-Received: by 2002:a05:6a00:430c:b0:822:682d:2c5f with SMTP id
 d2e1a72fcca58-826da948eddmr1927546b3a.28.1771645462263; 
 Fri, 20 Feb 2026 19:44:22 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8ba11bsm714951b3a.50.2026.02.20.19.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 19:44:21 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] Revert "drm/amd/pm: Disable MCLK switching on SI at high
 pixel clocks"
Date: Fri, 20 Feb 2026 19:44:01 -0800
Message-ID: <20260221034402.69537-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221034402.69537-1-rosenp@gmail.com>
References: <20260221034402.69537-1-rosenp@gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2949F16C102
X-Rspamd-Action: no action

This reverts commit d033e8cf4e8f6395102cdbc3cb00dc7cb9542f53.

Cc: Timur Kristóf <timur.kristof@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 29cecfab0704..05eaa06dfa34 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3486,11 +3486,6 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,
 	 * for these GPUs to calculate bandwidth requirements.
 	 */
 	if (high_pixelclock_count) {
-		/* Work around flickering lines at the bottom edge
-		 * of the screen when using a single 4K 60Hz monitor.
-		 */
-		disable_mclk_switching = true;
-
 		/* On Oland, we observe some flickering when two 4K 60Hz
 		 * displays are connected, possibly because voltage is too low.
 		 * Raise the voltage by requiring a higher SCLK.
-- 
2.53.0

