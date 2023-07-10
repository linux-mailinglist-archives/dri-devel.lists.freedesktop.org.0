Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982DF74D120
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686D10E1A4;
	Mon, 10 Jul 2023 09:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1EF10E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:12:09 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666e3b15370so2265225b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688980329; x=1691572329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kU6Mm9mplXh/rNIwHwAKhJYGQu+Q7/SpCWJyNAcPJ1A=;
 b=cbmC3W5c0r8kKiacXG8ia/aK1e8HTbZRDHEjiLIDGiSWvt9hK//RdDkvjBbx/S1/7/
 oFrfD8tCQT11tzzrKPz7AbRyzPsDsR+c3BbYSPcF5g4DX2Fqxsv5o4mKilNx3qjVq7Xq
 /UbaX/b5Gv7XHCXHsbkpCBtsM6tVPYHO5pzYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688980329; x=1691572329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kU6Mm9mplXh/rNIwHwAKhJYGQu+Q7/SpCWJyNAcPJ1A=;
 b=WwCYU4QpSVfaRqBDhXOygu3ExPd2lxRx6Ra6zefWJfz6eBlg46/frPmZmpeN8P/xyr
 xF3ZvM/E6G/6CStRq/cq6gWcEaie0sY0y3G3B7v5I0hJx9cWRe/c3yg6uIUq2LQ51d3a
 NvYM2IpbqjhIaZ8vVY17KYmbbYOIesC44Wv4VWyqLAMRplXrlMGoBBqN/09X7xrUF2PN
 Wgfn3+txDAO7XoaN7Cgl+lPDvg6QLNDzMcXThy9LboTUjzGrj0pwMlqc/DWbr2bBfdUr
 aL4OntyOz9WfxZa52C0NVSrY5QTOsEoFBL+PPYTH+HOupenbuI34EysqCCpdsEgRvFKb
 25TA==
X-Gm-Message-State: ABy/qLZ77t2p09RsKOBgiX+Z7PUoCl599JJCAAnB5ohP2h9VvSJqCRhd
 LlGAsClms97Klzs8H2I8knciYw==
X-Google-Smtp-Source: APBJJlG3bdCWRX8Ctlyd2UtPoIN5gLeqYlnJpoXjhGbIk5y6k6/CpCzBBNUSLrunyFPet8Q3pArDKw==
X-Received: by 2002:a05:6a00:884:b0:682:a62a:ec36 with SMTP id
 q4-20020a056a00088400b00682a62aec36mr12561365pfj.15.1688980329158; 
 Mon, 10 Jul 2023 02:12:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:be97:1d05:f9b6:36a6])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a62ae15000000b00640dbbd7830sm6944589pff.18.2023.07.10.02.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:12:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/bridge: anx7625: Use common macros for HDCP capabilities
Date: Mon, 10 Jul 2023 17:12:01 +0800
Message-ID: <20230710091203.1874317-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM DP code has macros for the DP HDCP capabilities. Use them in the
anx7625 driver instead of raw numbers.

Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9db3784cb554..866d018f4bb1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -872,11 +872,11 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, DP_AUX_HDCP_BCAPS, 1, &bcap);
 	if (ret < 0)
 		return ret;
 
-	if (!(bcap & 0x01)) {
+	if (!(bcap & DP_BCAPS_HDCP_CAPABLE)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
 	}
-- 
2.41.0.255.g8b1d071c50-goog

