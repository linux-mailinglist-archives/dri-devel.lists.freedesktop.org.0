Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183037659E1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9F710E1DB;
	Thu, 27 Jul 2023 17:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215F410E1D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:18:33 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so490975b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690478313; x=1691083113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk2vuhX6NA1oRdFPUtDZvRSgubu1bvTtFKVaGPcS2eM=;
 b=mxd6UkT7rYL9pJGavqPLHJYyxGk82kdHQo2XMtrp3F+1JngllhHEDUcsAIaLBkVaJC
 hzGEbcHT+9SNvAeLH6T7yMlQI+ABKg08GG6QQdWMasA6ihDV4GxOJN/nIsGabE+H30Zx
 FQORVxi/FM7Qij6meZ3UH0u5zmvrVsSL7A3oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478313; x=1691083113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wk2vuhX6NA1oRdFPUtDZvRSgubu1bvTtFKVaGPcS2eM=;
 b=j4VABJflIFh/alHNofYjAYnMuwaEk7x5I3IaqR0Now+p98nY3LNWSVGty7goG3TTIh
 ipE1VHxZ67zWl1FLV3wWZ17y/+1fC+F09/JbGwNzwNBvDXhxhqca9ELJYSeIYjZgX2jf
 5N7JIgn6p4tZq71iwLP89w4mOppRokxpDQ5Dq/aOcIWnpk0LkwK2GMxhfaOuA0+G9V43
 9XjyhUramvvWV3R5IcNzAT5l8/Ya5djHCirw1KSmbjngfb7EQbwM5Fmf20rqpY/VKkka
 TE6ZqyQ9aV9n+xg23QzIDQMI87kugJJGg1W2DDu1NhrDHLFjYHHG4+e49sn5asvsAm9/
 EXNw==
X-Gm-Message-State: ABy/qLanAiIThUR+7FMifiSgngSLk5CKKfVB/R2r+Q6f4f2ogqsK8ZwX
 j1Fhu1Bkr7c0pB+RL04dUSAGYw==
X-Google-Smtp-Source: APBJJlFGzINd+KHGdbpkLIsXy545tFo/TL/61IX1RAOVuTfN9pnaWw8Ruc6GFSu3fCSKKgGeQWarGQ==
X-Received: by 2002:a05:6a20:1603:b0:133:17f1:6436 with SMTP id
 l3-20020a056a20160300b0013317f16436mr4169051pzj.19.1690478312683; 
 Thu, 27 Jul 2023 10:18:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2339:954b:b98f:611a])
 by smtp.gmail.com with ESMTPSA id
 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:18:32 -0700 (PDT)
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
Subject: [PATCH v4 01/11] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed touchscreens
Date: Thu, 27 Jul 2023 10:16:28 -0700
Message-ID: <20230727101636.v4.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

