Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC276236B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6649610E3F3;
	Tue, 25 Jul 2023 20:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CCE10E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:36:57 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2680a031283so1747725a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690317417; x=1690922217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vug0/nTFX8HO+SAnOamtMcLZ6ZH608dzw2nZDsl1wy8=;
 b=lbVLtx4hawMq5I080q+oToFTxyc6v6bosk165MRmbugZnfuhF31ItqVkRUAkZjutOw
 WIaLBwyPHkjC4XIR1DDCQtEx+c7Xxocb3RDBVJqDHyPqL4cNT2L7k/0maaU2NBk1kqWo
 SdNFbskTdR6zphWqI4pbKO0FGlCP2SxMpLr0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317417; x=1690922217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vug0/nTFX8HO+SAnOamtMcLZ6ZH608dzw2nZDsl1wy8=;
 b=NECUamocIvFMy32WbRVVy253BtBk1tgVA+d8O/RgvTOGaIPmsY+ivW8VTYTNxce14n
 nJKhogJFCs6COnanINhVx893AkoQGnvDoayZ3XBDuTf3LsGe6Arwvra09Nl2fOp+IXUV
 P3L1qzx1hdSFljkvG/9nwUcjfcudLx41VT8o56ZTY1yCsEIRcoHSIkvZEaFExTXSMbcy
 XjBrN50yRdk5AX77UPDadNm+lRVcXJT4TSzM/VmciEgHlA/d7oMXmKB7KDdCUaCYLCKJ
 DkUSunugSUiKrBwX7gppE0ctqiKCwN7alFnu0vCc5NTgMLGZ20BcFUeJEJCg52lh8/iZ
 X3cA==
X-Gm-Message-State: ABy/qLZORGrjrRv9G+leny9jGKLIv0ayb8UEebHXFicdOyaKIp8goAaP
 2Tt+WRgAIN3M6vQbkVcWQeDZQA==
X-Google-Smtp-Source: APBJJlHkgAZG/OJ1KFcQovVcUne0usZdrPv/+u0mY9r/jpFUyo+4WhHECLgM3amT1IUm+DvTloPrWw==
X-Received: by 2002:a17:90a:542:b0:267:f9ab:15bb with SMTP id
 h2-20020a17090a054200b00267f9ab15bbmr240485pjf.14.1690317417199; 
 Tue, 25 Jul 2023 13:36:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 13:36:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/10] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed touchscreens
Date: Tue, 25 Jul 2023 13:34:36 -0700
Message-ID: <20230725133443.v3.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), touchscreens that are connected to panels are
generally expected to be power sequenced together with the panel
they're attached to. Today, nothing provides information allowing you
to find out that a touchscreen is connected to a panel. Let's add a
phandle for this.

The proerty is added to the generic touchscreen bindings and then
enabled in the bindings for the i2c-hid backed devices. This can and
should be added for other touchscreens in the future, but for now
let's start small.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Move the description to the generic touchscreen.yaml.
- Update the desc to make it clearer it's only for integrated devices.

 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 5 +++++
 .../devicetree/bindings/input/goodix,gt7375p.yaml          | 5 +++++
 Documentation/devicetree/bindings/input/hid-over-i2c.yaml  | 2 ++
 .../devicetree/bindings/input/touchscreen/touchscreen.yaml | 7 +++++++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..3e2d216c6432 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -13,6 +13,9 @@ description:
   Supports the Elan eKTH6915 touchscreen controller.
   This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
 
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
 properties:
   compatible:
     items:
@@ -24,6 +27,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel: true
+
   reset-gpios:
     description: Reset GPIO; not all touchscreens using eKTH6915 hook this up.
 
diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index 1edad1da1196..358cb8275bf1 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -14,6 +14,9 @@ description:
   This touchscreen uses the i2c-hid protocol but has some non-standard
   power sequencing required.
 
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -30,6 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel: true
+
   reset-gpios:
     true
 
diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
index 7156b08f7645..138caad96a29 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
@@ -44,6 +44,8 @@ properties:
     description: HID descriptor address
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  panel: true
+
   post-power-on-delay-ms:
     description: Time required by the device after enabling its regulators
       or powering it on, before it is ready for communication.
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 895592da9626..431c13335c40 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -10,6 +10,13 @@ maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>
 
 properties:
+  panel:
+    description: If this touchscreen is integrally connected to a panel, this
+      is a reference to that panel. The presence of this reference indicates
+      that the touchscreen should be power sequenced together with the panel
+      and that they may share power and/or reset signals.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   touchscreen-min-x:
     description: minimum x coordinate reported
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.41.0.487.g6d72f3e995-goog

