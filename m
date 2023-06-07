Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E737270C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9A410E54C;
	Wed,  7 Jun 2023 21:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BC210E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:53:09 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-65292f79456so3704951b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686174789; x=1688766789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7J6bms7QMm9w3IzcQHeVQuT7VvkTcEsATD8y00OpeXw=;
 b=lNOTHZUjf8JdjTbU6E6X/mqcY+Zwnqg/qRWUnY9Mwi3PCLRhThFa5YBIH0SWb6uJ1+
 rFr2+HfY1hSDBAI2d85k+n6W6gF4wlv/tcnXPvydjr0FRk5O5EZevrutN13VURxdh3VR
 aQknU7zcndxDLitCgvK20aLmQb01W2KregYks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174789; x=1688766789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7J6bms7QMm9w3IzcQHeVQuT7VvkTcEsATD8y00OpeXw=;
 b=kwa3fys+ssHCNMBUQ/W+kFv/7OS4228Pp1olpNDMBABjh1x8RCYyexQTea/1EfC4LT
 Phy4ecatVYTeiFmn2kD9ngI7ho7BEVoKB1mDNtiXMOdWccw//cw66bKr9yOyF6iUvorD
 P8qgepuhonbYJjAY5ra23ALetJI52eeyn6vp0RVOdIBmhPWtgA5A2ek3My1SAD6XQKD3
 0mTHNK8RJmpG1yL240KYXjKNQx0ghFIdAIoUhIKDdk/DCsSvsj0btNO+NBB5bRcYRAXQ
 Acp8l+hW3uJteS9jwswUlgiASKHAJkzjblZn5tRV6bDltY2Yu81AFt2ZZlRe2cb7qbpe
 vDfQ==
X-Gm-Message-State: AC+VfDwpNOkiAnv8DNYDM++LmYZJada/wNc1Ne5bQV+w68mye5svTwA8
 SlnlBYWok4beMDJOLHVIkXjScm3WW01InnB6+Vw=
X-Google-Smtp-Source: ACHHUZ6msq2zIZIoWR6/BNnd7gqzLUkkb+f55DYioqbBeFy7Kfz5MTf1YZEWIMbYfJuT7GP7UJVbsw==
X-Received: by 2002:a05:6a21:328d:b0:10b:2214:7ab0 with SMTP id
 yt13-20020a056a21328d00b0010b22147ab0mr2370510pzb.21.1686174788778; 
 Wed, 07 Jun 2023 14:53:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
 by smtp.gmail.com with ESMTPSA id
 j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 14:53:08 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed touchscreens
Date: Wed,  7 Jun 2023 14:49:23 -0700
Message-ID: <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
index ce18d7dadae2..72212382d702 100644
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
2.41.0.162.gfafddb0af9-goog

