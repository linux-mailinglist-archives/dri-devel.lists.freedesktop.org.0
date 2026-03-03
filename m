Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKrTC+5Ep2kNgAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C851F6CC6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0030910E8C3;
	Tue,  3 Mar 2026 20:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVRqt8ZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADD410E8BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:30:34 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8cb5c9ba82bso1020121185a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772569833; x=1773174633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1IVPvbiKHqb1wJCwFPWETEeAl2aF1oAt9knBh3vkK+g=;
 b=XVRqt8ZUMAgATsH23qWBqZuQZvUiw11MPR+9WilBcTLrH3jyiO84icj7zvEkmtf5Co
 70DcDU4WHphsSDohLn/IJ8cKCZeBvXZA5HcGdws2MbG26RHFfjP4+bTgdu7bWMj0ftIN
 sSRBLBpseDd+lioxPOpAY8Ni+43SQaTSD5ztSXI4jJcgjxrC5rEvCoEBBdb1+uyKyXRe
 ri1a8WX3Fm7i6lzDsaH/U2lhqA7zG1Nav4bwXzFpNi+HwrTT7ppLPM8gU3s8cH/mKM3j
 VJIY6KJk+QV5KumaOEpjKrFOHGPcAcZcPy+oBFXJXYxu0wqgjBk5ByPS7N9bFjdA89gA
 F8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772569833; x=1773174633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1IVPvbiKHqb1wJCwFPWETEeAl2aF1oAt9knBh3vkK+g=;
 b=UCfSD5QENfAr9x3TNczGpSm+ZC6Q2sbEUhbrAS+mtxfC4zLKqHgQxbBcZL+XiskuXf
 4pHw3MZKI2bo+zDCFuk1Ru6sAGO8iDeHZjvSCB1XglIP+FLP45SFTgBOSzXOVBVdWTxS
 axE9Ggki/1usMfNf4UY2RFUYRfseJ/RgADDbb2Smo+b2u558hG/+2Oz9Z8BB02gDJaO2
 t+EiKdonCMDQBfFefhJaUaRyV99rgrV9W4enCP0vzff/zlGDD5eN7sHkBA5NWFRZvS9a
 7IILFJa88/Qw7umlkwXg7V+G7ka77QfuYBp5FJu3n7RskcD6xn+fUryKK94Mdq2qqZw+
 vkTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcK6lPzIaTIHq4hRwm9WasC79GI+/FPrH6Kvczo3wbrhEgNIurIOO650iUbfZcUdyKJQDEUyq+wf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuUZFoB6b7nNcp2ASOuLTSQl5AKwGeb6taJ+8Dy3Hf2DjWvKw5
 vYy1St/m4r4r8vZ51YkxRJza6gzQtBfTjtOgg9TxMEGI69TpyklHgLa0
X-Gm-Gg: ATEYQzxKapxf9scypN/bi+hphBD1wpoHmraW6mfrDz/F61cZKJWawBns72OlFL1wntr
 29G+97eYe6NJpqD9b8qaCNeuZduwbNbOPhaT3YI/kpsobhAwRMGJYUhF0WW7fFTZ4FdQ1pU50Os
 mTXnBJ/7SX0dCwDRmUfVxYVfxxKGzWysfxGx4E3rwLNtuljk5aS+NQsla79Neko3+0SfpGm6yqt
 Um/MzSFwCI/WEkjVQOm0Y6lpKUGfuEqIMk+bHcSx4bklOlYg4/DsW8ZY9ZvTxQcGRG2gnRmRqBL
 0UwewSYTt2A3hVcctLpuThy4WIIr/Auz+a4RkTgBcr3bgVedJlLySzd3jjYnRkfViK0DNNDsit4
 kWzWUIZMJh4GW4ZGVJWds3wlQtI4M4WEgkv4m8chzEZsjv53ZkDUo8P93Pxr+yCefGm5022qIe4
 ggwWSm83EepC1M6YRKXa8mb1hlh8dKeLba0YSEABG729NXimChn+FakEKMce98L44bimNMm4NxY
 /3yC3wJgik=
X-Received: by 2002:a05:620a:444f:b0:8cb:c043:4592 with SMTP id
 af79cd13be357-8cbc8e91d2fmr2385763185a.74.1772569833106; 
 Tue, 03 Mar 2026 12:30:33 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf564c27sm1465032085a.0.2026.03.03.12.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 12:30:32 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 4/8] dt-bindings: display: panel-lvds: Add compatibles for
 Samsung LTN070NL01 and LTN101AL03 panels
Date: Tue,  3 Mar 2026 15:30:13 -0500
Message-ID: <20260303203017.511-5-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: C9C851F6CC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email]
X-Rspamd-Action: no action

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT
display panel
The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index dbc01e640..b31c67bab 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,10 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0

