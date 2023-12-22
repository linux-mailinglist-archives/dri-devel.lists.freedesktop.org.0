Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442281C7B4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B410E7A3;
	Fri, 22 Dec 2023 10:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3C10E7B5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703239317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KrXB2l1sK5WNrgL14b/nrn7vl1GLfrzGJcKXH5lPKk=;
 b=GU2RmBdFOnBr8krKAgNZyg3reorslOw4WPWM8WUsK1AMaqhZP0H8uz6+RoWcrrCiSFzJ9Z
 4RoBz+LnAqEhK0fhMPeoMtel3dCRuX/Em2jS1w73lY2FREXPqqTFNrVJAUyZC5kl7Sm8WV
 OYLchaoqj2KsuIT1cAQmk9kDz6nB3E8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-R_PXSERRNdqU_5JVo984SA-1; Fri, 22 Dec 2023 05:01:55 -0500
X-MC-Unique: R_PXSERRNdqU_5JVo984SA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40d445525dfso2402815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703239314; x=1703844114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KrXB2l1sK5WNrgL14b/nrn7vl1GLfrzGJcKXH5lPKk=;
 b=NqPYGrrIi4afdZzOJL/Mmcp9xe+vxcPOjMGP/Melde1bkzIFbowtgbiJyVYYXNj787
 2M8mi2yglHywrLWJvsTb/WsISUQlQeOa32OrMKuRWqPJRSYmhZygunOCJdPgW1kSfBxd
 7vUP8G8XjhIlfIFjtIFmUDgPDLcABoMMweL98UqQPOzgZEG03g8ngWpswasFM0Gif5iC
 v9ctTN4URye1obfj44AzUeKvBoMQwFpl36wAHu2NDmXkEVZhnC1+Dt9ekzPxUxE11wv6
 MRn/VsqeSbolr4XHvo3UkTh2tAaiQC/CCk89waJZKx30xR61G75axx5j4gPWSlm+PlS/
 C4CQ==
X-Gm-Message-State: AOJu0YzZPIo6QmKhZ2Xw2NXHiF++EZf1bO/QRwyJNTsXV3jRB4+9vLzr
 qjH5ZEe9XNZckWAFSDBbHBa7fvo+ngA12jHFn7beoIvf8/YD0qRuY5zqLa5n9OJSvFmSbdbyv2g
 wQZVMaLCYXHk2Ve7PHTU5GWXPM2YuCPVGr0Pd
X-Received: by 2002:a05:600c:3516:b0:40c:69ac:bbe3 with SMTP id
 h22-20020a05600c351600b0040c69acbbe3mr560831wmq.151.1703239314155; 
 Fri, 22 Dec 2023 02:01:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9cdk7GcDcHXW+tJWxQX97Hy6R4J0/6Wgjy0y5eLHmsXkFwLAr+yP0CIsp2UB1gvczU2KRrw==
X-Received: by 2002:a05:600c:3516:b0:40c:69ac:bbe3 with SMTP id
 h22-20020a05600c351600b0040c69acbbe3mr560817wmq.151.1703239313866; 
 Fri, 22 Dec 2023 02:01:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0040c11fbe581sm6426861wmq.27.2023.12.22.02.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 02:01:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: display: ssd1307fb: Add vendor prefix to
 width and height
Date: Fri, 22 Dec 2023 11:01:38 +0100
Message-ID: <20231222100149.2641687-2-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222100149.2641687-1-javierm@redhat.com>
References: <20231222100149.2641687-1-javierm@redhat.com>
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

The commit 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default
width and height values") used the wrong properties for width and height,
instead of the correct "solomon,width" and "solomon,height" properties.

Fix this by adding the vendor prefix to the width and height properties.

Fixes: 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default width and height values")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v1)

 .../bindings/display/solomon,ssd1307fb.yaml   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 3afbb52d1b7f..153ff86fb405 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -131,9 +131,9 @@ allOf:
             const: sinowealth,sh1106
     then:
       properties:
-        width:
+        solomon,width:
           default: 132
-        height:
+        solomon,height:
           default: 64
         solomon,dclk-div:
           default: 1
@@ -149,9 +149,9 @@ allOf:
               - solomon,ssd1305
     then:
       properties:
-        width:
+        solomon,width:
           default: 132
-        height:
+        solomon,height:
           default: 64
         solomon,dclk-div:
           default: 1
@@ -167,9 +167,9 @@ allOf:
               - solomon,ssd1306
     then:
       properties:
-        width:
+        solomon,width:
           default: 128
-        height:
+        solomon,height:
           default: 64
         solomon,dclk-div:
           default: 1
@@ -185,9 +185,9 @@ allOf:
               - solomon,ssd1307
     then:
       properties:
-        width:
+        solomon,width:
           default: 128
-        height:
+        solomon,height:
           default: 39
         solomon,dclk-div:
           default: 2
@@ -205,9 +205,9 @@ allOf:
               - solomon,ssd1309
     then:
       properties:
-        width:
+        solomon,width:
           default: 128
-        height:
+        solomon,height:
           default: 64
         solomon,dclk-div:
           default: 1
-- 
2.43.0

