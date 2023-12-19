Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC61819197
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 21:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8574C10E20D;
	Tue, 19 Dec 2023 20:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15A10E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703018088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiVYl512QhGYSepDsrAuE1nuD6kWmIVdAFOPcanDwvc=;
 b=Id7XPjLNVgHvktGtHRDSmyx6w15wYE66ly9XXwJQsus6GffNRVZlMpGctnL3dVwsSfUwPy
 66gwp1VveH/j1OGLjMXTo1ruri0V2SaVn8+a7GBDmzRJPPHcDVzOx0P9UBCywFCj8vvaYz
 EgFVpDiyxJOJYrJP80zcA7caVEzEXIE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15--xazBuKvPMG4YQAnYdHrBw-1; Tue, 19 Dec 2023 15:34:45 -0500
X-MC-Unique: -xazBuKvPMG4YQAnYdHrBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d2f6f2787so4263045e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703018084; x=1703622884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NiVYl512QhGYSepDsrAuE1nuD6kWmIVdAFOPcanDwvc=;
 b=Reqf8o4KOxwVoIKrlblajzb3we2tpZUaGTnPFB9+GWaFCozHj1w9VULJP4+KGqte57
 zYID0/S/8U8VrAvJ7G7o4tWW1ntbRvHUGb3L6WVV19ZcsHX6po5XOtudot+fvlLQ7v0m
 lTnrx7aF/GlC6YCXRKiVWvZSsNlf8E8vHVepHHfWQEgHI1YJPYhnTcEAtx67/gnfBrEb
 HB4x41CZ+Pe//aOTKHlDZiNNpSsw48G4h91jIXG3y2fLyXFiwHnpqqCp8RD2CuDpERtH
 ut+ehI4VS6aZlyCre5Ip1JN10RYdAEB+OLd3WHUkF3xLC5OsqC8zu6xYmGuZi+vjJa64
 HD/Q==
X-Gm-Message-State: AOJu0YxoSm5YQoS8ZtQVTjLuwW+1NAyCLZZkPafbAdg6ZDMpmM10YThW
 A2+Zm3NZdqczw+ECaTJgWBqAMVtfD6szJOw5fSl77Rspv074XI0nzGSCUDhom1j4SffqD9qWsiH
 2BE0O8fLkNBjRp4ht5QFw64JaqQxY
X-Received: by 2002:a05:600c:44c7:b0:40c:2bb8:70c9 with SMTP id
 f7-20020a05600c44c700b0040c2bb870c9mr9608760wmo.150.1703018084371; 
 Tue, 19 Dec 2023 12:34:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6aQ1XQXOizk6reDjlxoJMiPmuIWJ0QcHegbS1RgeL9ztmoE3yAj4OKXbYEsvTfcyds5jWDQ==
X-Received: by 2002:a05:600c:44c7:b0:40c:2bb8:70c9 with SMTP id
 f7-20020a05600c44c700b0040c2bb870c9mr9608753wmo.150.1703018084172; 
 Tue, 19 Dec 2023 12:34:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0ac500b0040a3f9862e3sm43508wmr.1.2023.12.19.12.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 12:34:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: display: ssd132x: Add vendor prefix to
 width and height
Date: Tue, 19 Dec 2023 21:34:07 +0100
Message-ID: <20231219203416.2299702-3-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219203416.2299702-1-javierm@redhat.com>
References: <20231219203416.2299702-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
used the wrong properties for width and height, instead of the correct
"solomon,width" and "solomon,height" properties.

Fix this by adding the vendor prefix to the width and height properties.

Fixes: 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 .../devicetree/bindings/display/solomon,ssd132x.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
index 37975ee61c5a..dd7939989cf4 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -30,9 +30,9 @@ allOf:
             const: solomon,ssd1322
     then:
       properties:
-        width:
+        solomon,width:
           default: 480
-        height:
+        solomon,height:
           default: 128
 
   - if:
@@ -42,9 +42,9 @@ allOf:
             const: solomon,ssd1325
     then:
       properties:
-        width:
+        solomon,width:
           default: 128
-        height:
+        solomon,height:
           default: 80
 
   - if:
@@ -54,9 +54,9 @@ allOf:
             const: solomon,ssd1327
     then:
       properties:
-        width:
+        solomon,width:
           default: 128
-        height:
+        solomon,height:
           default: 128
 
 unevaluatedProperties: false
-- 
2.43.0

