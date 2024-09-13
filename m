Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5097773B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 05:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8491E10E14E;
	Fri, 13 Sep 2024 03:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="j/rHsNAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5CD10E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 03:15:22 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20536dcc6e9so3169145ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 20:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726197321; x=1726802121; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
 b=j/rHsNAlXqrrY0rBmrAV4JwDxyMRmhWhRoz0KhMM7NfGZQR+aK3JyjG41qWKzYfpSy
 SrvFoe4SAPPGFVotasUMFT5yM52DhRmUjfzd2QLQeViEVKVC6Gl6WhTFUAMombSz4rjB
 PAnX3MRDMAO738J1DntIiTDmA6EoHQs2Ge9UMuQ8K9HcMJj7ZY6GeJVc78L+oDZtelYY
 d21oj1chOVDsq0YzFYVDkAFx+s9TggpfrXQ8ZZ9JHKH2GIfWvS35zzSsf7Z2v6NgSCOD
 cCT0BBaVMRqXoNNbZwdWENCrWV630PqmSys/5jyMWX+u9JAdyy/ZLyvf3qm54v/QmGYh
 dOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726197321; x=1726802121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
 b=OX2JIzDXMNFm/Tr0cAT8467O59JylUZk0KyoSIXJb2vtLCo77ogC5CLW7yd+49Jxob
 9P4x+UC+bI1KtnOVKadmZ54np9Cl7w0xMW5QpwcmM5CIh+3ZDimCtmmqVdetieAZYAdr
 5FQD87UaFmHlOfsvY86ZoqBpyqZi8lNFdgOQg1ccBiFLJWcXaUmkq69KDrqXSevF9qGb
 2qMikQqKaAcgR4UtRqKjRLfY9Os+oBk5F60AllUWlsae2VVHH9+3OUrl+zyjxwj+6AVm
 I3aDpRoa/RBpHMPqYoGu/UdKn4ji9o0J3z7zQ8UXik16vCwqRrzNAnZ7F0WIqqexPnT9
 yAoQ==
X-Gm-Message-State: AOJu0YxbMMdmEj7HSSUJQ+zIIybeEFTfz04IO9WCAkiShGkgui/KDtmX
 VjchjBoxVAVe+89TSUHxqjmIgOZbjazHz1XQYrNkj5RkvUZXOuyqkrpbohgmEAs=
X-Google-Smtp-Source: AGHT+IFLcFR9k1KDMp3YZ8kv5zDdnsd4R5MF4jpiNdAwCjYyvN8FoBA8JFiQndfJ/O13ddyQ9AEPVg==
X-Received: by 2002:a17:902:f643:b0:206:a935:2f8 with SMTP id
 d9443c01a7336-2078262cc4amr22980855ad.2.1726197321379; 
 Thu, 12 Sep 2024 20:15:21 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af45432sm20382305ad.91.2024.09.12.20.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 20:15:21 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Fri, 13 Sep 2024 11:15:04 +0800
Message-Id: <20240913031505.372868-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
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

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..43a824bee1b6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

