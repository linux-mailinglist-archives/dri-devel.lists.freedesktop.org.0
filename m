Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11EB50F98
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9EA10E878;
	Wed, 10 Sep 2025 07:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyqfSUix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123EF10E878
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:37:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A6O3ax032346
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qpH83xM68WBYwHeKrO4S/O
 WP4WBR11yqOxSj2QwNRQA=; b=UyqfSUixk903AbZxhV4O5Qnk+x7NRS0Z37KZ0U
 8i/OlnQqg60rlyjtOo5ExlygE85JJdpEsqbL8KrsXf8E9zgyerLhRYeFiPf8imw5
 BNT9y+Q4rC1+mEwyE54diVIm4Yy8yxNkTbV4Fp/+3rSCIxB0o54rmn4ZXUxOIDqF
 p0gCzErQlSvv2LLH0Z99E76NeHZjYXaQ+QMZLjIUSQUHhicX4aLXBWosOGHq5xOm
 +UsMUFOqh9LidkgqisUCdWfg4QMFhCQmQfVXkl4hy3aa6FFU/rwhJv71tElPE6ly
 C7xKN2xB6baP/Jgv85MnvsDjFp6UrDZAUKsQ4TTakhx9KCGg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m2w19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:37:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77283b2b5f7so13371497b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757489859; x=1758094659;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpH83xM68WBYwHeKrO4S/OWP4WBR11yqOxSj2QwNRQA=;
 b=DiW5ePH4oZemKXQPEaf/SLlYGWjVcT6cQmdwJzZGGvXZt9DqvNSbkTixP692ZBaK4v
 +c+36jhvS4CCoaWKOOLKN8ciNTz132WiFcnaNaVB0AxZTTHeN2H4cbOpUF1aSWsCrr1z
 1mHBtB2eEKcs2RPcssoNZnYlVUtBBckSWjBa8HWUDnY95rHTw80YWgSzoZN91Bw35gCJ
 YYvawexXpGHzW87ydgmShGG2OGiYbpwr+w7wUN9DqHfUggH++R1EqUxRU+koXrdFYzw2
 Ioci8kKkRSF78W8VxeiKN2qpzN2bPNTAJn4cwTdK1n0aDVoDOxP/X51aiqD7Y+a6tWXe
 tEWA==
X-Gm-Message-State: AOJu0YwcggZmseQitm0F0E7rGTaZAI1THI27dyVh/TcrchLO2ldoBYVA
 y2iYod5vA2PJdbtCEJrzSVsSNc5XQoPD5p2ANDa+wfUr9Rzh7c930QPtFdSMIFy9KVG596YPkyI
 1MlGu4t5cPgF3uvrvdETW7w9lx4fwQbbJVTgIwmWcnf08pV0q7WgcDqJ2pgv96G1HicY1KA==
X-Gm-Gg: ASbGncsKs/lf+Gj9euyDfHW7XsJPk4kPnMFscMQQ+ByxcGT2cud57ueCg3wLdBzsram
 QJuu3ia/pAw0CBuN4kNoXrOkkhiJeOhhgV9+vZbRl3XsnWsMDpjDl8rKufMLPYoftXEGB3TTtMh
 t2jXeTvDQO8FlfibbSkKOblup0+jo2BTet3ZqgLdR4EUmPtgPKTmwIOk//4KvRQ/sLIYBH3dGK5
 jfg+IckOQofKGZr/cIZ4svw41mY1A6N62Ebh8om74yr6DJkUvB9bkDiNQ7m1zudvQ4o9faWxwGq
 ba1fi4UsqPLBcZTiyMNXTzQlbO0M/ug744PiSXfEZxgYgCI+sbZ+HpgzGcC0QteqXw==
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr19863530b3a.31.1757489859328; 
 Wed, 10 Sep 2025 00:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLXL3v7N0gh33XG0PkJWPquXuIz/nB1XoVwRjBvYA1VOTk7oKc81QPqOi4OYMUY1vfrJuysQ==
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr19863519b3a.31.1757489858877; 
 Wed, 10 Sep 2025 00:37:38 -0700 (PDT)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774660e4ddasm4199822b3a.20.2025.09.10.00.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 00:37:38 -0700 (PDT)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 13:07:28 +0530
Subject: [PATCH] dt-bindings: bridge: lt9211c: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALcqwWgC/x2MWwqAIBAArxL7neAaQnaV6MPHWgthoRGBdPekz
 4GZqVAoMxWYugqZbi58pAbYd+A3m1YSHBqDkkpLg1LYEMR+GYXohcscmqGtwugd+lEO0MIzU+T
 nn87L+34qz+loZAAAAA==
X-Change-ID: 20250910-add-lt9211c-bridge-5a21fcb1c803
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757489851; l=3554;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=ArUraQTPQoIbSH/uDZ7dfoUv8bSRIlKaGZGF2p1zUDg=;
 b=RUUo6FwTn2Y+k2N60GUFyekAWwynzkKjZYdUtHk0SHoRk/k2Fl51ShyzN7rsCRM2gKuEeMXBf
 zXYSTbSAXtuCsOqj6oeHL3xPrH97miSSicjMritjDap8Puyv0Up9GLR
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxI0XO4BRVkkX
 Oan/lErIuLhw0POByIiudlo2hh7OxufX4yTheu8IYtIC6w6ZZOo++mcksTDgOSC1M1gUE6jvh67
 mqMAgvioJjpV19206yHJyMcneckUcUSDV7is4jurgG+flMiLyVi8pMQcjBvTjgdaQ67+R//qbhp
 3kGLWw4oBLtZ/gT1yo9wN/UZ/bwIYjrO7itFDESJCJIpcfNF3Gk4+K5+4ffp0J2CT5jzxsdsNJb
 I2Ly/D015JlFYkaipGlTGwB5ZB5YXGivc6eG+obx/nwCUk+9MGckgxNObUUL3dx47sIyNZUmpE+
 1qrFRCh/9iaFe3+LUE9hO3vLEhvFgZVKlP1wFCnYShtvPijKpKLEXqKW4zr+jncnxzpP0vvutTY
 qirt609Q
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c12ac4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=Xc6W96i5Xe6cDM1WBtQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: KUI3nHAUErTDCnngyW7H2vlJl4AlrbUo
X-Proofpoint-ORIG-GUID: KUI3nHAUErTDCnngyW7H2vlJl4AlrbUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add bindings for lt9211c.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
new file mode 100644
index 000000000000..619f718618d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
+  or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9211c
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vccio-supply:
+    description: Regulator for 1.8V IO power.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI input or
+          LVDS port-1 for LVDS input or DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI input or LVDS port-2
+          for LVDS input. Used in combination with primary
+          port-1 to drive higher resolution displays
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI output or
+          LVDS port-1 for LVDS output or DPI output.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI output or LVDS port-2
+          for LVDS output. Used in combination with primary
+          port-1 to drive higher resolution displays.
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - vccio-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      lvds-bridge@3b {
+        compatible = "lontium,lt9211c";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+
+        vccio-supply = <&lt9211c_1v8>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+
+            endpoint {
+              remote-endpoint = <&panel_in_lvds>;
+            };
+          };
+        };
+      };
+    };
+
+...

---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

