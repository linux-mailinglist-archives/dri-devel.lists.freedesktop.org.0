Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD7819196
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 21:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962B210E1CC;
	Tue, 19 Dec 2023 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ADA10E1CC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 20:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703018083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2gh7avZ+webTJh4GlB/OmJjsr2TX31NuZTJbonK+AA=;
 b=TKv2Ph6pSgWPvJo+RswnyE3kHrQY82y1ObLyC10SSSJbPLg8n+Aghch+FFo2JwQiIdbsWx
 ia+IPHR3IEmLzW9j8xmPYtLjUkxTsekCXtdkW1WL8F4AqfJWKDjUFhvbDvrM0rtv3TFtvD
 CzX6T7YAxJ+14q8l7B673lo2dGv7I90=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-Dit_Z07mP06Bz-Ww5S2JXA-1; Tue, 19 Dec 2023 15:34:40 -0500
X-MC-Unique: Dit_Z07mP06Bz-Ww5S2JXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-336719795a7so584863f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703018079; x=1703622879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2gh7avZ+webTJh4GlB/OmJjsr2TX31NuZTJbonK+AA=;
 b=XZAWqytRhgINlH4uJqdQ6hd4ZYBfroS/ZYZLa39+l0yJ/7nVJrE6ooUX/A5gPddc+t
 Eu8gisbIk0h9P8jjObmNpzLt8H5rK7MsmhOtTx2QRDtdQg0ydwIQtvbkOqb4xZAyZha0
 he4565ABtzRXQZcO5T4j4Ux9s2Z1sLBmPKT57rUtiABNcc8K53M0/w/qW5Px7rDs7QyY
 vq6YEcbN7tQmG47hR037mgAPue5UmMOHu2lb4KnPCNdom9Ae6GQk/jFr29wEHXiW1MaB
 ExZ1Eq2WI46VSIkh/HexlHQegP1si+8UkGwRy9u1rFqjAcq/M+BnkeAgibZRlfLo8f+T
 eCHg==
X-Gm-Message-State: AOJu0Yx3NsqibFnkwXvmJMyIj8JY5FHvuCh6UOWHMHXTNpf6QKLDN+E7
 FNezLQz0FoE9PMnM75Lwecapkv9euxYgEdVJlYk6LeqnXCpD/POBTywRaNG/2WUGbohMA2vumm6
 vb2O3ZE/4u2olTtc8xr6O7rDS0Wx7
X-Received: by 2002:adf:fbc5:0:b0:32f:7c6c:aa14 with SMTP id
 d5-20020adffbc5000000b0032f7c6caa14mr9345894wrs.37.1703018079105; 
 Tue, 19 Dec 2023 12:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfz12dyj5qQB1RZu3obqwFvurn6HeBaxHioQSLuCusvAEiMmUqPMMF1GzfYjGC0YmrWBecYw==
X-Received: by 2002:adf:fbc5:0:b0:32f:7c6c:aa14 with SMTP id
 d5-20020adffbc5000000b0032f7c6caa14mr9345884wrs.37.1703018078853; 
 Tue, 19 Dec 2023 12:34:38 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040c11fbe581sm4472994wmq.27.2023.12.19.12.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 12:34:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: display: ssd1307fb: Add vendor prefix to
 width and height
Date: Tue, 19 Dec 2023 21:34:06 +0100
Message-ID: <20231219203416.2299702-2-javierm@redhat.com>
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

The commit 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default
width and height values") used the wrong properties for width and height,
instead of the correct "solomon,width" and "solomon,height" properties.

Fix this by adding the vendor prefix to the width and height properties.

Fixes: 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default width and height values")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
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

