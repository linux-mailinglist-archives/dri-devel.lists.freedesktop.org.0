Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B067E6B46FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F7510E8FC;
	Fri, 10 Mar 2023 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150F410E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:47:59 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-176eae36feaso6063542fac.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ETxKkA0CWLBgbyAgVLy9qpug2yXjisvnXqA0S7RLTqY=;
 b=2FWozSikjNrPDlwLv0B3d24IWUs01oVPvaT7bgrKxrUEYEeEZz66WdiNC/RZNYa5yj
 cBH5hf3tLWE5MDnnTZCRuxoDqwTD5ZK/uFZmq0WZuVNzV0FigjyJuTUESfA/QSYP2ZYW
 UzHBXyJ+D2+aEETMb05oUuxEH9gfJXeWQ+hjTSHiL/CObZ2K1lYymrFiybeQDbtPEBvR
 8sJpPTPB0ym7QbDWIjc91LuJ+vmPRRYxRBUJR387hE+M06oP3+15v2pNvXs0vzUH6oXp
 GBPASMkSFV2d7+eP4LEbRX9+JbiTzpv25NlGJMx5bUur3YiEBynBxCa24mtuLck0UyRD
 JC6Q==
X-Gm-Message-State: AO0yUKW9aNCl2K8FfiuahqXrrmaJXrjbJn2uDKtWasWRb2WirHukH0tA
 lUplCBJW1rrUOdY+c5BzMA==
X-Google-Smtp-Source: AK7set/1ag3y6dD1QRTKVA81xe6JG5qypBhJeLO+p+L0vkyaAbWPH0yMo54nh3CufsknS4wbkcE54A==
X-Received: by 2002:a05:6870:219d:b0:163:b0c5:8730 with SMTP id
 l29-20020a056870219d00b00163b0c58730mr15337879oae.12.1678459678109; 
 Fri, 10 Mar 2023 06:47:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 zf30-20020a0568716a9e00b0017299192eb1sm97370oab.25.2023.03.10.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:47:57 -0800 (PST)
Received: (nullmailer pid 1546216 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:31 -0000
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: as3711: Use of_property_read_bool() for boolean
 properties
Date: Fri, 10 Mar 2023 08:47:31 -0600
Message-Id: <20230310144731.1546190-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/backlight/as3711_bl.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 3b60019cdc2b..28437c2da0f5 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -286,23 +286,23 @@ static int as3711_backlight_parse_dt(struct device *dev)
 		if (ret < 0)
 			goto err_put_bl;
 
-		if (of_find_property(bl, "su2-feedback-voltage", NULL)) {
+		if (of_property_read_bool(bl, "su2-feedback-voltage")) {
 			pdata->su2_feedback = AS3711_SU2_VOLTAGE;
 			count++;
 		}
-		if (of_find_property(bl, "su2-feedback-curr1", NULL)) {
+		if (of_property_read_bool(bl, "su2-feedback-curr1")) {
 			pdata->su2_feedback = AS3711_SU2_CURR1;
 			count++;
 		}
-		if (of_find_property(bl, "su2-feedback-curr2", NULL)) {
+		if (of_property_read_bool(bl, "su2-feedback-curr2")) {
 			pdata->su2_feedback = AS3711_SU2_CURR2;
 			count++;
 		}
-		if (of_find_property(bl, "su2-feedback-curr3", NULL)) {
+		if (of_property_read_bool(bl, "su2-feedback-curr3")) {
 			pdata->su2_feedback = AS3711_SU2_CURR3;
 			count++;
 		}
-		if (of_find_property(bl, "su2-feedback-curr-auto", NULL)) {
+		if (of_property_read_bool(bl, "su2-feedback-curr-auto")) {
 			pdata->su2_feedback = AS3711_SU2_CURR_AUTO;
 			count++;
 		}
@@ -312,19 +312,19 @@ static int as3711_backlight_parse_dt(struct device *dev)
 		}
 
 		count = 0;
-		if (of_find_property(bl, "su2-fbprot-lx-sd4", NULL)) {
+		if (of_property_read_bool(bl, "su2-fbprot-lx-sd4")) {
 			pdata->su2_fbprot = AS3711_SU2_LX_SD4;
 			count++;
 		}
-		if (of_find_property(bl, "su2-fbprot-gpio2", NULL)) {
+		if (of_property_read_bool(bl, "su2-fbprot-gpio2")) {
 			pdata->su2_fbprot = AS3711_SU2_GPIO2;
 			count++;
 		}
-		if (of_find_property(bl, "su2-fbprot-gpio3", NULL)) {
+		if (of_property_read_bool(bl, "su2-fbprot-gpio3")) {
 			pdata->su2_fbprot = AS3711_SU2_GPIO3;
 			count++;
 		}
-		if (of_find_property(bl, "su2-fbprot-gpio4", NULL)) {
+		if (of_property_read_bool(bl, "su2-fbprot-gpio4")) {
 			pdata->su2_fbprot = AS3711_SU2_GPIO4;
 			count++;
 		}
@@ -334,15 +334,15 @@ static int as3711_backlight_parse_dt(struct device *dev)
 		}
 
 		count = 0;
-		if (of_find_property(bl, "su2-auto-curr1", NULL)) {
+		if (of_property_read_bool(bl, "su2-auto-curr1")) {
 			pdata->su2_auto_curr1 = true;
 			count++;
 		}
-		if (of_find_property(bl, "su2-auto-curr2", NULL)) {
+		if (of_property_read_bool(bl, "su2-auto-curr2")) {
 			pdata->su2_auto_curr2 = true;
 			count++;
 		}
-		if (of_find_property(bl, "su2-auto-curr3", NULL)) {
+		if (of_property_read_bool(bl, "su2-auto-curr3")) {
 			pdata->su2_auto_curr3 = true;
 			count++;
 		}
-- 
2.39.2

