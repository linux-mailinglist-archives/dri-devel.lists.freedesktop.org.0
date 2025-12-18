Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931B5CCB88C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 12:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B621910EE5F;
	Thu, 18 Dec 2025 11:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MyiBF0Hl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2A610EE65
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:06:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-bd1ce1b35e7so331929a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766055998; x=1766660798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cdFvIevr5mzdhvM4kgzjZ8E4ELvYJD6tAAyBvcsXRWg=;
 b=MyiBF0Hl0ews5lCIvWMmLKW4vt0Quqzecq4o54e0LjeUNyvQT8phPOB4r768jR5EAZ
 INwl0bqLVqk4uRAJ0h5UQDNdIQnecz/K1P1sY1DRAcnsOvSC2t53AEbCyg3LMQhg7VUf
 05PY9NlJjWwIy3hAmLDhhJoII+n0wkmcePmEiNTGejxO7SjPR/IQzH75aAeqgd/wRyHT
 nK2JlqzQRP+HbQZvep9YwM4rXnxg1mL5+st4XVLKw7TajQG+v1eCS/jT4vVmxf3VpV9/
 ezrxSQqKJf11xxcWZUW3SwKhMH9XpG9yKcclUNGdBD7TqxrtAJn+zNuglhG5LrMMf2pc
 fBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766055998; x=1766660798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdFvIevr5mzdhvM4kgzjZ8E4ELvYJD6tAAyBvcsXRWg=;
 b=cN6Yv62nNODuar1Rd29WyfzCAZgXe2I6Hdx7O4cqg+r4G10QkqM908HY0T2+ScGNz9
 XwFXZT0er51b2hkrc8l0y2oO/6zFYeD2f3fd/GTF9b162LME5GaXyrDtaL2SObEKu3j1
 HMn2ttqQGiOEqErk9gWk9u0wGx7DTyBGZ8cEcpJVCUkry1h398FQYOJLnJGm2CcBR8qi
 IxQdETX2f7k2TLdgFSALETLCiJGMngit60bHk2vFNEuTU/Q+5eYGUP9cR777fK0u85AY
 77QWqla99pvhAWOZpnQqnVWJqysf2cuJCWxIMJsX4WPwSqGZqi1+HPTds9Zm/UCSP2xp
 EVcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1PGZA/BEAY4104gijzn2Hdph6fY1SOXxUAQbANg0dY6kIGfxdALMzEF0b92HrbkyJPXvaw/C+ONQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaTIXi1G3VcVF4t/Oo8b5lr2lc6lGJG2IqsyuJrC7S5SCSlbTq
 zrgntM3f4RcP7or9eOZ0iF9cbxoVvw+djJxLkpStcp3CfGYpmJXjuV77sTdwSyPf
X-Gm-Gg: AY/fxX635JqofpB9Ayr1sZVEUFt/9J49Xz4IDraxL8ZDtZ1QmCQjPwg6ndwLkbNDHJ9
 N4oE4uQPkL91LOa5avoha9RYZupXmf3sVObjXpvI6xPuxZ68pU5VC6JVGBU8cR2WlXxZXEtCD2F
 C0xkJRZ6oTIkMnuDc8DZE2yyf3eJhGB1ZjoQUV4Uz3ZAyv270qtQYg631F7AXXNNub5seVSXQeX
 AwnNHi+xjs35Q+JfJ5N0nKgKV53Lg1GhsXneto2FZg7pAeeY0CQhpdqLO1ZbmT2sL2PmrnBx0jd
 z+C+oE2aEpTPl76T53YQOxftjf/6ufkZlhHFvQH1Mi1N5Kvj/ipE7Z+mpj7N+Npq8BzgClzIT9u
 gbLTe3GiwNopUW2TQTRAOfKxEX4nsSP7O2Sw/jxW8a4F081zmiLwomdlU0CTRvU8EjSdjPbjw5t
 d4BgWMWWvaWT2GqC3U45hARaSD
X-Google-Smtp-Source: AGHT+IF41D7yyvkcVx5kn5auvMy6/Ayzmq08ms+IqGXNGWux8FOs5d5+Zz3A8dNim4TaMeJx/DkzQg==
X-Received: by 2002:a05:7022:3f82:b0:11d:f441:3ae8 with SMTP id
 a92af1059eb24-11f34c49569mr14945053c88.43.1766055998138; 
 Thu, 18 Dec 2025 03:06:38 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cbeb:945e:cfcc:849a])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061f473ebsm6896718c88.1.2025.12.18.03.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 03:06:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH RESEND v2 1/2] dt-bindings: display: bridge: ldb: Document nxp,
 enable-termination-resistor
Date: Thu, 18 Dec 2025 08:06:25 -0300
Message-Id: <20251218110626.605558-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Document the optional nxp,enable-termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
Changes since v1:
- Change the property name to nxp,enable-termination-resistor (Frank).

 .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90d..6bc786204e65 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,enable-termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

