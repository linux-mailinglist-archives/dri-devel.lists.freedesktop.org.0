Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG55IBAXdml1LgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:13:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB78099C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7913910E0D6;
	Sun, 25 Jan 2026 13:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MA5Nm2kY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4915910E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:13:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so53479445e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 05:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769346824; x=1769951624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk9/KUnsa8pc3YOrwEPZ2UDRNz9c/Z03foaMd/NJjKQ=;
 b=MA5Nm2kYF7rWtZsdwQS/roU8pL+HNXqYrjYzVYOW34WWNuPIIa1jgonquw8bE1CR1C
 kiIUzHg4JDyqTsR5nSZ4pT7AONAAM/76dyrJEzB2M17xJgoWkE63nrrfghkhaF2okbBm
 LWCxVOY1YrPwbmXMyi8JoWSQw4taCgZRpXNEbXbqg7XjOBG+yie0+6zCXW8sEtJBCrpj
 Jv3bSseGVPAouv+56dDDR9cazH52kOFvIcx50oWpBCmgNU4H9CBlStrcWmiPyW0YzP2S
 jzTmBFC/x/rQIhWEiq720/Z10Am0g9brpFSzOsoj8rUEqCRVynzxYxJnOScchEC9+7i0
 eo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769346824; x=1769951624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wk9/KUnsa8pc3YOrwEPZ2UDRNz9c/Z03foaMd/NJjKQ=;
 b=M6/LAzXFjLcWJKNlxwaU5Ednj2y58pnSx2hezSW4A+3V8kHfm+FC9gb3XtoBw/SFSH
 rC81DJtv2o8up3y+/rbw04VVDLj4lSLyFFzp/Bp5Mk+QXEMMBm+2KFmLU2eTA5no5eA+
 mehth3C/xAFd0fL7GALSFyfRY7TzgpWQP/akhgVs5D1gk3qKxf8QtTXoRXw4Gowl/ih8
 Ulo8s9GddnfWsCGBUMtxU0u4v/3r/Uxd8z997xN3VgCWbb4PdopFytR/Ble66fGq/iD+
 ipUYzw1yTK+eeLjqXXXW3zwm5RJoKOXDDKGrr+H4DefIhtFMPZNSbOLUT8RAOjoIeAC3
 sHVg==
X-Gm-Message-State: AOJu0YyGNvBhsk+P6hbmMZmm2wnVRUkTNUwlLphO9guefOrrizBDPRHh
 FE5QxRWLtmYwpoYyZbJebQR5e9OLp8ILnr7OtT28SPYc8vtlwxDqTdvU
X-Gm-Gg: AZuq6aKa1WC8WwPCAQoJdjnuNIbbm7CTSqz49sSFRupP09PUxOfQtWUDtHK00SDrHIK
 kmEAZTZZDNl9xKqLA3AL0ggFIW7lwZujXFFzB0ZfY9OwftOQDyoccgAkeuJrH3/sST2bI3/ZPEn
 /XIXYPR0J1PAPXIoCgIduF8fwRLoWz+FqIeI3bWCRdVL1Icmv/ejAsJnenET/6OYLfs48dZ1Vp4
 2ZvMqSAIWOYSaQOtbkRR/GPbgbR23n+2FJIpuYcLpJ3iwCApxqnRMFb2FACcJBlaee5IndW5y7P
 KBPT7VZFZPfcMMw58Z3v/vub3tAbkV8O9emE22Yc79e2wFsUazLxrNeAqsH1qsC6X28rFFkjvI5
 l00Dp77lSzS7MrmsmX8WZVBNnjTA12K6AUMQpy+YdBBgNfZ6nZKYGWbvmwOQmwvaxJKhA2HMH4M
 5e
X-Received: by 2002:a05:6000:240b:b0:432:da3b:5949 with SMTP id
 ffacd0b85a97d-435ca0704fdmr2320057f8f.21.1769346823610; 
 Sun, 25 Jan 2026 05:13:43 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24a8asm21958244f8f.12.2026.01.25.05.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 05:13:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] gpu/drm: tegra: dsi: re-add clear enable register if
 DSI was powered by bootloader
Date: Sun, 25 Jan 2026 15:13:23 +0200
Message-ID: <20260125131323.45108-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
References: <20260125131323.45108-1-clamor95@gmail.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 32EB78099C
X-Rspamd-Action: no action

Original commit b22fd0b9639e ("drm/tegra: dsi: Clear enable register if
powered by bootloader") was added to address the issue of DSI being in an
unknown state after the bootloader, ensuring correct panel configuration.
This worked fairly well under the assumption that the bootloader had set
up DSI; however, in cases where it did not, the device would hang because
a DSI read was called before the DSI hardware was ready.

Removing this workaround results in the issue described in the original
fix: the panel initialization sequence fails and the panel gets stuck in
an undefined state. This is especially noticeable with command mode panels

In order to properly address this issue, the original workaround is
restored and placed after the DSI hardware is prepared for R/W operations.
This fixes behavior for both cases: where DSI is set by the bootloader and
where DSI is untouched.

I have tested this change on Tegra20 (Motorola Atrix 4G),
Tegra114 (NVIDIA Tegra Note 7 and ASUS Transformer Pad TF701T), and
Tegra124 (Xiaomi Mi Pad) with U-Boot, using both bootloader-initialized
DSI and untouched DSI.

Fixes: b22fd0b9639e ("drm/tegra: dsi: Clear enable register if powered by bootloader")
Fixes: 660b299bed2a ("Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"")

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index ebc78dceaee6..e499822b6030 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -934,6 +934,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
+
+	if (value & DSI_POWER_CONTROL_ENABLE)
+		tegra_dsi_disable(dsi);
+
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.51.0

