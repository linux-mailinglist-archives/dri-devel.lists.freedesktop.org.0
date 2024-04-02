Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50502895128
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F56510FC5A;
	Tue,  2 Apr 2024 10:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="wWV0u0sy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C13910FC55
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:59:53 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a472f8c6a55so632066766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1712055592; x=1712660392;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXpPcJrb0/c9fFyOw1QyBw93a9H0uLAjKgu80GZ/xnA=;
 b=wWV0u0sy6zNLhOlUDT1twj/An+5hToxayZ4ewFyx9bxZuplFaoPBm23+cOiwn9YZt8
 QPzV/LiVmAmhGHh0D9zDy32+L4fOttSNxFTpks32qlxi19XZRZoiNitMNzIJODITayDt
 oLWUPvQtCsGzuIo+mN0Y1q1eFPvB48D7DcgoOtugiYyx1L5dizZPDY8AFaNOyPRIYiTa
 ZQLcJ9BK4QkTjOxQKXAHwqVhKBx1H/pnGqATCy2T+aBftvW5hDz+Ek1DaNfeRwFQdJKa
 gKO25IjKVTjdZFXUG7RV10dYjBjACVfKF16sn3MbsXrC3MF+myEOmo1XbIZesoAc/XYo
 Kdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712055592; x=1712660392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXpPcJrb0/c9fFyOw1QyBw93a9H0uLAjKgu80GZ/xnA=;
 b=aDI1G/TwUTGJPMvdSs0CMDkWHZJcJYPuyjJ3Uh/Gpj49xo1ctYPRl/4nasaJ2ROjJP
 Ac8fy2el0QqWlv8YHiyFP3Uh1vm2Lv1Sh39sMoAwULzcZ+19zka7XL368QqIazZtqmTS
 lb3c7FE1QeoZi4fu0w+Mp5Z7H6FwVCRpZgNmFpIYJKHge9LADXUyZs17nFEXYF5c0tA1
 oPaMgmRAo8gVsgV9xveHaiCwyZevFdP89nNqM2PuY+ZX/TH9R/aBogTnG0zf8mwrRyJG
 kTxstBKX0c+BSd/aUg2krjiS0r1LhuuHTdqtJPcwMWmRG+S70l9ZvtaLKsvZ2clirxuu
 wlRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7H5Dj3yy8JhID+99yw1tCtGYd5b1+Sd0dEAlSdHWznbsAE6moH7vYY2sD+j1uJHVbPiJ4sh4LnYiTpbuLcJg7Fjsfo/za8aFEOBnMebTO
X-Gm-Message-State: AOJu0YzWr/7P3TComtHricg4iztAxnN9JeQoVkVm/BZCYviuMt86SSaG
 eGM8AfusheVgf9PLPymU1QYMxgPwMHDyjsuDa5kSN5lLIfBViMyjE4fY42c0jPw=
X-Google-Smtp-Source: AGHT+IGGSoJIA97YOgNxCukuxcOn+f/JIPX2GrbHrot9689BBm4pd2Nezt74kHJqHep0H3+kkPIVRQ==
X-Received: by 2002:a17:906:d8e:b0:a4a:3557:6be8 with SMTP id
 m14-20020a1709060d8e00b00a4a35576be8mr7750846eji.53.1712055591722; 
 Tue, 02 Apr 2024 03:59:51 -0700 (PDT)
Received: from localhost.localdomain ([188.27.131.149])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170906275100b00a4644397aa9sm6398780ejd.67.2024.04.02.03.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 03:59:51 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: adrien.grassein@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
 marius.muresan@mxt.ro, irina.muresan@mxt.ro,
 Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH 2/2] dt-bindings: display: bridge: lt8912b: document 'lontium,
 pn-swap' property
Date: Tue,  2 Apr 2024 13:59:25 +0300
Message-ID: <20240402105925.905144-2-alex@shruggie.ro>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402105925.905144-1-alex@shruggie.ro>
References: <20240402105925.905144-1-alex@shruggie.ro>
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

On some HW designs, it's easier for the layout if the P/N pins are swapped.
The driver currently has a DT property to do that.

This change documents the 'lontium,pn-swap' property.

Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
index 2cef252157985..3a804926b288a 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -24,6 +24,12 @@ properties:
     maxItems: 1
     description: GPIO connected to active high RESET pin.
 
+  lontium,pn-swap:
+    description: Swap the polarities of the P/N pins in software.
+      On some HW designs, the layout is simplified if the P/N pins
+      are inverted.
+    type: boolean
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.44.0

