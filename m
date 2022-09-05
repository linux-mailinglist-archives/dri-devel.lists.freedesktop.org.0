Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC25AD78C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D53710E457;
	Mon,  5 Sep 2022 16:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1E410E451
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:33:08 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u9so18107748ejy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UsGHds8dL3ejKYB+jlPaiDkEXV7AX3OaV0OJSZr3sdo=;
 b=h6e97oJcX3gPDg94V5fEFyDY6uvhG/lA7N68Tjf0PJZlq4E1xxFL1Lrk/alhEhlzyv
 XX+LMsVbaKuSSBRpIL1b1mYh0B91wBP+rtfO2E61NcPJ21Yfu/Yz9JBWND/pozn+PJm+
 a8CpHhZcwY6VcI19wydqnS6N6FS5ibM2abbNn4w9eP2A5VcgQw6KjtelDiiVtHGp+Bv7
 fNGfgbpG1sLUXWtMbTYUD46UaIyZo+zG48Bkn/dtij8k+a0AasBS50FT6YnxD5evV2lq
 Fs0egNPLhMM6W9Ii5TybY6FETeSvSbSOQB5Na0j/ALybrUkQsfiO8riV1CJ9N2Sh/sQm
 Mm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UsGHds8dL3ejKYB+jlPaiDkEXV7AX3OaV0OJSZr3sdo=;
 b=rusPPCD1OCqATZsbDLkxhs0qK2zmwldOJz749dcNWtZyVw1IOeWi9C87wG3wpPUdOl
 HgwAvbbhoHbhyrYnLeEzX78HdH1cZzS+EPRnzb7XXvNSbrbGOEX69HocjjOYdTVAp4ti
 kOQNkk8EmkEwgOVu9bBPIAMcYNYusMVczb3dcqP4U7gK018jsUDfQbr9HZWYRxHDBVGL
 Rs2dT7GycUEjZT2GZdNEcollUtlJkb1rwx/aYLg/mU4MTffPZuK0jxBDZNQqk8rlMsTq
 9+wIfjMnuQzzOHlWBALGRupxL0DI53Y5ZikqXuTuWVL8EEs0pIFzWTfb0bvIFwDUJsUy
 Eseg==
X-Gm-Message-State: ACgBeo0aFgU8Ie1Br/+SQStKeBFVJs3WqK55qVGAHCsHFPosA3I43+on
 QosW7RcYvumDaG7PxZcRDFA=
X-Google-Smtp-Source: AA6agR5AiFzASwCVW26MfoGCb5KcGtrpyNfm9M2F3k/LBi79yp5sf6vEB2XM5cter5q14y+TspfkIQ==
X-Received: by 2002:a17:906:d552:b0:74f:8506:2dc8 with SMTP id
 cr18-20020a170906d55200b0074f85062dc8mr11525832ejc.345.1662395586658; 
 Mon, 05 Sep 2022 09:33:06 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 cm20-20020a0564020c9400b0044e74c9dfedsm2828945edb.86.2022.09.05.09.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:33:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/6] dt-bindings: display: simple-framebuffer: Support system
 memory framebuffers
Date: Mon,  5 Sep 2022 18:32:55 +0200
Message-Id: <20220905163300.391692-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.37.2

