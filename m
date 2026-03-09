Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFfwKnB8rmnoFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:53:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60027235121
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0510E49E;
	Mon,  9 Mar 2026 07:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdutVr5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A8B10E4A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:53:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso113377305e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773042793; x=1773647593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
 b=NdutVr5GZcpfXOr9xc/Yr/1GCYx58E3rpBqe7VO9b+MUSBwbeoKjnqdzZP+mMsyZXt
 Zlc3U9xzg3+Y23lshOBQCpGAz61HBJ3DQCFORKW+SJDDqQag1a6hEWpfgpPBL4hTm47K
 FVPMM4GV4IOfAcLoQrZTYptZFHNiRlffjLsbmwL5v1q3FUkNeM5KNUZbgz6mxkXMjiG9
 8MsMjXvrLPdkXBaOstFFSRaifcV04LofuzPCY3OhgfX+h66qEJfZM/EnhvMOQw2RruLs
 zlAr2CJ/gpq1BwW1GCErmQiF8Hj8c34lfar9ZKusWP0qkqfcyiOsAfLjk8X3kNh7BNd8
 Oxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773042793; x=1773647593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
 b=wUcANNZWv801GI/xuFqMeiesRQSwvgWWq5UHT/MoYKPIm1tNbDOttxpNz1VC+A1u92
 UHwvrIEX8ZbvMovZ5zq8VQHBedNF8DJdWUZLea60CVOp8F3h/3gL22ICnsmOpVtcQQOg
 O0IPpNkR+mYVQBs2WvkCL3zTCtcv0MWW0ZcWy+ugtB/pXW7HDwml1qKjGG6M1nlAPg/T
 g60s47vLvd9eyn3vjPbSJGyaA/3mOaDg5AF7SkK6tp4j5L2zWitzR053zJ2XQToVDnnd
 vTFQh9FNjGDGG4w6zS8Va6kgcSyw67NvT/NIf7IGqGjUTebra1WGbpAp3WuCNi1pUZqj
 A/kQ==
X-Gm-Message-State: AOJu0YwoI11IbjACkObSPU4r92twREXw59Pbbcg7W4JkcWAUuKo5gEyJ
 /0+GBqrxaU+Rrrg8OKpD05CfC05mlYzRLsKB7dxAdYqBULfsnL3XYzTD
X-Gm-Gg: ATEYQzyLMnw2pG9fxFasTGOb22tmwWR+sLqtO9fXDUC8xAXty4dIWYQO8zQDJHF/INf
 leIBuuJhaqp4uxvmkh800Uk77e6ElYoJ5mlEHc16S/ccl5WmMWH1ym+KdbAPPAvn2usfyuDybqU
 jiQVlBXnn0UceuBPs0H9j2wNUd+9zx4laxqJpaA1rv7440RAHBkUNJE1iFAp4aeqJSMp+xouxu2
 iRguRW6M9NkSF8Deey2wUBECMmxC3zZWBaUARQ8P2KvdEUGeluUJLoSMf4FkYnXC/jviAmDZI7o
 CGecie7FJKnJMl43QJvv71diGEsT6tRg8JhZJh0I4DaAMZ4hN/njyQ9TEPzAqrxMyKD0Fd4GRgi
 x4a90s2337pD+C+MHGPQdu2fzeuUot5XoxxDRGPJIOudZ/+4l+62mfou+rCUVbFiwtkcYCwBJBZ
 wENHX3J/MU9D95ogc70ApUjQ8=
X-Received: by 2002:a05:600c:3f06:b0:485:3e00:944a with SMTP id
 5b1f17b1804b1-4853e0094c8mr13491155e9.9.1773042792676; 
 Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485245dbd87sm97799975e9.16.2026.03.09.00.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/tegra: dsi: re-add clear enable register if DSI
 was powered by bootloader
Date: Mon,  9 Mar 2026 09:52:48 +0200
Message-ID: <20260309075248.47730-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260309075248.47730-1-clamor95@gmail.com>
References: <20260309075248.47730-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 60027235121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index fbab10bc5c41..e7fdd8c7ac12 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -936,6 +936,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
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

