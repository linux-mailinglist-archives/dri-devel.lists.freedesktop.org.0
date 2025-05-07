Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649CAAECD2
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D251710E89C;
	Wed,  7 May 2025 20:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZO1n1tf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCC10E89A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:31 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-72c47631b4cso135753a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649349; x=1747254149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uejrNc06iTAs+YLZjBRvSkO6o5dbouRkykrkJDTloTk=;
 b=ZO1n1tf6NG9fTU20oq5RDMgMdGL+0JUtmOQWeo8SX/SiJ/0jBnJtSU5WbjWRunB/jk
 RGFZfY0op+5q/OEHNh2OLxzs2wYr60LKaGXhz82F7Z9dK+jfRSvwD2Wz5cQ3BlVHsOH2
 SRDn+qmnc8DMMS4EEHl0bVUQYhxRKq6q8D0SWh27j93g7tXn0wxpLXtQkt/ZX1mSzwtd
 cSCHGi7dRlObLBAOgxfs3U2ni4xQ37trY7UcuOIME0p69z5sNB8p77uMRCNknuKqk2VO
 JGAoFCgpRT/ZuMyUEK88rkZtcfKztLw5VUj32EapWV3db0IVepuPpd+xgN5Zc41hzhRc
 ArKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649349; x=1747254149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uejrNc06iTAs+YLZjBRvSkO6o5dbouRkykrkJDTloTk=;
 b=fvWtoRuiGe5pLDbTpePoZ9odvmvs1oNksQospMKVJUcUGtP4BMmFLtjcYizjZNLkB7
 MjVs/ruANTBfFxvOb4+WLEVC7Maql4aGzcDK+MXlXXYRWT6YN6NvQl8A+/K4qtX7bnvW
 fuiUS+3bS3jZLS0u10grlTo04Lab6ItgMmETIokIrI2svKhLAwKhLZmkabx2WRNfNtMm
 5SQiF3boBRIV6VXfAatHKZL93yapffgqAKjozFq8Z5rh1KnMGYPw4QK4RDCzDk/WW2Lq
 YTHl+a7pvZySO17H6KT11nDVLClldp+UvPt3KXKQrU8d2AJ1O5HugrzrrPN1SLlY4u1E
 WCuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Bc6SUHtD6jPv9Ty+XodTcxtsFrRXUGlpn5lKPj7pep/noTQTTwQSzEqVn2vXeNzZB2T6wuuHEus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEbVAr23Nw0mdO1GoC0IsOnIOSyqnAq+2ZB/Ulq7VI4/HoJVN6
 mgW1H5uAF4vRLzPrsp/SsaxWL6b+A2OggLKkKnfyI8rMoC7b41lj
X-Gm-Gg: ASbGnctzlhYJqItBos507ODiM8RS1Zt07cR6UOR5oP9wzTdahs3qAxaDQDCiohJAFAQ
 MLCtWksM2L3Tgctg4BeSMd57tISUpVFDRNJqsqFWRtxnUvAmkC05RBsHIPq/+MQ6+pLF36mePpG
 CIskaApVDL4FTg7G776RYrGdNOHhfwSFOq7YS53lN2BYYMPBimkYBGBoEPfFejuBS/B7bT455h+
 8mg5o4kgN1br/LUX1HagMANRE8ikbPBo95yAv1NYY/9FTF1/Aw+gipNgqdjIP6cwIIbZE2/8/aR
 WtBUG/1HKHhknxBUMycrq66rHCPvhCYhnUU8v0CjCZxU5Qd5Qk4JgAc3geUygQ4U4fcoPKY=
X-Google-Smtp-Source: AGHT+IFJzZAXCyZXw0QWeomPprmm2P68wLAv+/7r9VxtEI/Sd4+CGxIKlA//Tnd+huAraTUCYejlBQ==
X-Received: by 2002:a05:6830:3749:b0:731:cac7:3634 with SMTP id
 46e09a7af769-7321c341618mr506386a34.3.1746649348955; 
 Wed, 07 May 2025 13:22:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
Date: Wed,  7 May 2025 15:19:21 -0500
Message-ID: <20250507201943.330111-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the required LVDS reset for the LCD TCON. Note that while this
reset is exposed for the T507, H616, and H700 only the H700 has
an LCD controller.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index daa462c7d477..955c614830fa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
 	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
 	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
 	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
+	[RST_BUS_LVDS]		= { 0xbac, BIT(16) },
 	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
 	[RST_BUS_TVE0]		= { 0xbbc, BIT(17) },
 	[RST_BUS_HDCP]		= { 0xc4c, BIT(16) },
-- 
2.43.0

