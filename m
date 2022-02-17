Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AAF4B9ACD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59F610E955;
	Thu, 17 Feb 2022 08:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D15D10E958
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:22:42 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso4734737pjj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zytHf9FkJ/PPPieoPlaB6am9Dki6g+U3R/IZo38jLU=;
 b=auYbTr3bUun55c3vBXt7qY9ZrmwpIs78nu5pz18cj7v0siiy6+G4aRNbk/2LLcvodS
 asUmF3hxOd6ZBy+ihtNE6oN8R9cn1ymyRv9UHjqnbDk+q41MxMNbtxf/MMEUbPKEYXA/
 dhm2coht7GKbfTxGOJDbdrBGoDbRdjO0iSzxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zytHf9FkJ/PPPieoPlaB6am9Dki6g+U3R/IZo38jLU=;
 b=zOC/qTMZyahILf9vN/9OudejIOyYt/6kETYLeDW+aufpoU+9VZScdY91mfBLc+6FAv
 dOIV1Qhq3kok7+Xs5s8irWctJVAieg1wElVeIJnOLkqpfH9PiMFTqt3EGyv2B6SvRwD0
 rWHQLn4wWZ84CdFEgRzpKkApPDg7I2Ni2MPDFrVCSRVk5OHEae5y8zhB+rP9xcqSwaJp
 SuyLYDwGQfgYKowpDIq77OMo6Fiy9Say1CrB6F5A0poVIFwPcS1Vwsx78AbOhAtshDUm
 Kd9POm2rU4vKC7WRk0EtP3gBKTFHpU91Y3pgsgYRrbq01yR+s/sSvNBTL7xrlpRJwBSq
 TZSg==
X-Gm-Message-State: AOAM533kj11bgGfXe2gSjqTfP+mMV7vSCpL5tlxQfMzgB1253GyYZ8kf
 GvxGQRbC2Ku2WdHnAdqvf47SqA==
X-Google-Smtp-Source: ABdhPJzkyaeJpICrlVtn3FjTPp3zOJJq42VV/eJRldL/wDp5OS70ij2lPbhKBr0CbkwHJR5GBhSQ+Q==
X-Received: by 2002:a17:90a:9408:b0:1b5:3908:d3d1 with SMTP id
 r8-20020a17090a940800b001b53908d3d1mr1948242pjo.188.1645086161956; 
 Thu, 17 Feb 2022 00:22:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdb:2c0b:b1f8:e426])
 by smtp.gmail.com with ESMTPSA id m8sm1545449pgb.0.2022.02.17.00.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:22:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>,
	Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux
 read command.
Date: Thu, 17 Feb 2022 16:22:25 +0800
Message-Id: <20220217082224.1823916-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the previous transfer didn't end with a command without DP_AUX_I2C_MOT,
the next read trasnfer will miss the first byte. But if the command in
previous transfer is requested with length 0, it's a no-op to anx7625
since it can't process this command. anx7625 requires the last command
to be read command with length > 0.

It's observed that if we clear the DP_AUX_I2C_MOT in read transfer, we
can still get correct data. Clear the read commands with DP_AUX_I2C_MOT
bit to fix this issue.

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2: Offline discussed with Xin Ji, it's better to clear the bit on
read commands only.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 633618bafd75d3..2805e9bed2c2f4 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -253,6 +253,8 @@ static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
 	addrm = (address >> 8) & 0xFF;
 	addrh = (address >> 16) & 0xFF;
 
+	if (!is_write)
+		op &= ~DP_AUX_I2C_MOT;
 	cmd = DPCD_CMD(len, op);
 
 	/* Set command and length */
-- 
2.35.1.265.g69c8d7142f-goog

