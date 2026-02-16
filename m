Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6McyDuBEk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F11461BA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABDD10E3B6;
	Mon, 16 Feb 2026 16:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nI9X7+PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A452F10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:25:00 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso2051155f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771259099; x=1771863899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
 b=nI9X7+PDePAWo81woNg+XaVakuQtkrLId7T3NPZX5KFrAUldTHzYehwydVXbt+oYn4
 k6pfI9BZfyKaeEVCS+oaaHDOnB1QV1NW3bRvmMHr7QLfi+OW1cvmNFYh6ghbDqQJisYQ
 +DTnHP8Nrsu9nwr4Haa5wRSDp4S0yKLta5ExI9q008b0iTbjfOocMhXpNqYmTagx45Jh
 StbNhhJWKPmd/T/b1EtQYMQa2v/3zDF8omJpx0b1COYG8An4K9vB7nQ+NGbO54LVKlx2
 n2HI3lCjy2g99ytGxgxpiqX3r3uU7vJE1nO96bxtZk4xqv1s8XWY0XX+ehejkBzjAWyz
 MKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771259099; x=1771863899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
 b=Hd+RBe2Bn1KxH/Q5OOH7pcoyItJIvlfGScRkYxRLjQm7yEH7QUV7bpgzC4Fg3fPlGZ
 tBx7prAJ2pmJBfdp1DKBmvF6Qer9gXvbi0moJ698rqDkDt/qmLRi3fTXiL2SmsL/P16U
 sCdI6cRU8InWLgRnBwhTEGdYUMPIBqwH7ODZq19sM9JRtcB8tO+iOZCHsHqMiZa1CrGq
 ozuiPZS6bI6vUwIZ+lmPXgKL1LZK6ulZpzrTrZe/go0Z1Wq3FNTIfklPsy6tvy5dECC2
 UTbzUU0G0R+BQkQLqhLRezh/K9eZv1gjhcW+ny60lE3DLD4t7z4f1dAUqgxGc3xuVAtt
 3qXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnlet4ovBuY/casOWs1r8wia/3CjnrvPvnMkt6wbkaabBDdLurTSKxzPyXbDeg6Yby0c8m4sb6e3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza+3fdxNNpuenFmL02EWI4uc0IrOGJoBZDHj2C5AQUGHLFlWA6
 YY3s93PoKsfpm7lOG2A7NNF79JuEmyYJnEW+PoNVsdca8RVeMbIJiWid
X-Gm-Gg: AZuq6aL8KL1R4+riHXoaEghRAJgU440P7xZYz34ryMRbal4QFCV9ENx+frCoM5r0Yyk
 X1MU1EJKTa2f7q0lanq6FDp97872ERLwvMUDXj8z2EkZrPNs6u4/RTwGkZCM6RnGXYZRcik+dv/
 hR4CGeMO85le4DL02nHHLb5lSvO6QVLX9/nNV6DqCefhIY5kbVRMw5ohMLDQHZsaIqt0hQgasIO
 Ds45rnCocDPG2qnxeH9BopnAtP6fI6aaey/EWnXmt9LdzVKq4CTuo1sCrGm1REJmsu8AF4vkOG7
 zqI2sjr6l2ugEzsTXmXWEOJ43jyhqOWPJrAjoKKfsSDoHtzRE59pOzqerP00E0gyHQDZNAisMNF
 OlebuYjVn8okWferHcuI31LmhXv+HKs4BNU8C4piPSQ7G0y03rTbMJKs24SDWyJ5AFwFYc3YfY7
 sIMzO+AputMEuV5QTK4Rvp+OKmKxTBXw==
X-Received: by 2002:a05:6000:4010:b0:436:1b1:6cbd with SMTP id
 ffacd0b85a97d-4379db25b60mr13014530f8f.6.1771259099036; 
 Mon, 16 Feb 2026 08:24:59 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:24:58 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v2 4/6] dt-bindings: phy: mediatek,
 dsi-phy: Add support for mt8167
Date: Mon, 16 Feb 2026 16:22:15 +0000
Message-ID: <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
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
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,linux.intel.com,suse.de,ffwll.ch,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DE2F11461BA
X-Rspamd-Action: no action

Add support for the MediaTek mt8167 SoC: the DSI PHY found
in this chip is fully compatible with the one found in the mt2701 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index acdbce937b0a..c6d0bbdbe0e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-mipi-tx
+              - mediatek,mt8167-mipi-tx
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
-- 
2.43.0

