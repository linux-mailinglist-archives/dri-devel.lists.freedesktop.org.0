Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EF70E56B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF9810E4A9;
	Tue, 23 May 2023 19:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570810E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:11 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ae8ecb4f9aso330555ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870270; x=1687462270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwDjBDjP1Eb9OTHMLCOR/AtNeUUStJkdoOVhV208Dc4=;
 b=JnHGvwp0MHHOERL70p/cjO3RLqzhUHXpXt/IGTpt6niWqd33tv18uY+o73i24RL1qw
 M53aApytyNVs94yi+SrqUH9g238/bAvF11jqzC2QJuyLgWzNiZ9/Otkm9Yr1lR2Q3Jlf
 FXGmHGyY42nSz871E9Rwe7eG95HISA1p4UxbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870270; x=1687462270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwDjBDjP1Eb9OTHMLCOR/AtNeUUStJkdoOVhV208Dc4=;
 b=DEbRqRf2MszzhkNSqpCywvCOkU068PbiuDp2ZrWdhwllQwoLqonjSYkSXI89pDdZHR
 FZ7DoPZtXl8ZLIuyIt7FxZsRXp51LTcSsiJYj0bQG/feTXaKZ8ZCFRWeCmY5IYsZMPmW
 vFGxnZCw//+iexsgsPQVZMoqyytSttb1lp1SC1jfXU5H5P5OTBmDQ+vum8YxMT5BAVFH
 fEBct+FAlR4YSroRAzkeetJbw9q3ojiTZeixe/1Mg8MFV+p7ZaBUV4O019P+uxKOUHPe
 ZoP5B+PIpsziadODbpvKyDhyxfJyPrlBgRqRjvWV0uN3xGry4xfT/xwZ52U+9fXF/QQl
 tBIQ==
X-Gm-Message-State: AC+VfDzFEWEI4kM4uKy4MUtXdVvIn9Pe56O5CJj7AH0sYKbMwIy0lJ5s
 VoK3uiEczBdw3zhM9dng3mYomA==
X-Google-Smtp-Source: ACHHUZ7vfuZ1/I9FGbWeX0x+7CckoFKSaTGBFxiIakeywxadcLTtqYuNkWOGl9K3N1nc5OB4YVmv4Q==
X-Received: by 2002:a17:902:f689:b0:1ac:8148:8c50 with SMTP id
 l9-20020a170902f68900b001ac81488c50mr18595095plg.28.1684870270645; 
 Tue, 23 May 2023 12:31:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed panels
Date: Tue, 23 May 2023 12:27:55 -0700
Message-ID: <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), touchscreens that are connected to panels are
generally expected to be power sequenced together with the panel
they're attached to. Today, nothing provides information allowing you
to find out that a touchscreen is connected to a panel. Let's add a
phandle for this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
 Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..d55b03bd3ec4 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -24,6 +24,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   reset-gpios:
     description: Reset GPIO; not all touchscreens using eKTH6915 hook this up.
 
diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..a5cd8dafd450 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -30,6 +30,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   reset-gpios:
     true
 
diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
index 7156b08f7645..c7ea6c148838 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
@@ -44,6 +44,12 @@ properties:
     description: HID descriptor address
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   post-power-on-delay-ms:
     description: Time required by the device after enabling its regulators
       or powering it on, before it is ready for communication.
-- 
2.40.1.698.g37aff9b760-goog

