Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8981FF16
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 12:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144EF10E280;
	Fri, 29 Dec 2023 11:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D010E280
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703848837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KrXB2l1sK5WNrgL14b/nrn7vl1GLfrzGJcKXH5lPKk=;
 b=TPrQ59cRF2Lqltqr7X4SCgveDrz8Xm8Tze9YKItlLi/9sKhvzShzh8d8Ts54Hf4it8Atrr
 jfuQj0Xxzgx0rIjBDliovawZAjjC6y0F6/3mOIeVQSDR9dMgA/WPx/nbCTt3fPaL62rWlj
 /KkvNnJAH7qgf5UrsXXkOh1epm16gGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-ox4sEGQlMhG_0KevK0PGAw-1; Fri, 29 Dec 2023 06:20:33 -0500
X-MC-Unique: ox4sEGQlMhG_0KevK0PGAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d27ea0165so63819695e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 03:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703848832; x=1704453632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KrXB2l1sK5WNrgL14b/nrn7vl1GLfrzGJcKXH5lPKk=;
 b=v3zyi5mTk9oz3m15aVDDvjirAJHswLV2+knZik9/fP5MLXGn8QEoMgIg4+R84phrdG
 n86qdIkLDN0RJKQujvmS7J7dEVwBtFWfDb+YJ/q7eiKSYcENxPlStI3E1leH0xa3fnFq
 mta6vAg9jo5wEAT4o3x64pNEEAX9BCbkUm9PTaLJ800Qm44tbIrAl6MAkg34we1KZyuo
 DJRPAVgmP5wnR320PpBUCRaf2OVpluz18aL6kdpFpB/7d6n9dYZ69NqodkGX/P7/SCXp
 e9CBCN3IJsH4W6433s5yoWkCTPoYfr5fjXVgQBvNQm0U6GlE3dws7TAO+li2m1lw7BaO
 T51A==
X-Gm-Message-State: AOJu0YwWmV+cE9lpb2o41iiLOAkSo/rMGkWokypY1Nv4B28PxyeFyozr
 DXLvL0B3rv0Y7SUmjMpJgXI0DjkC8rXRc+NfmyQwfDXMsKXWsoQ96K7L9TtG/vmmymERnhgRL+M
 9OMNbsW4jxrx5li5iKcIX4UkRTI4J1VrUCNBl
X-Received: by 2002:a05:600c:5006:b0:40d:5f3e:f058 with SMTP id
 n6-20020a05600c500600b0040d5f3ef058mr1970522wmr.179.1703848832772; 
 Fri, 29 Dec 2023 03:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhNkbC6wTKaV7ceYhGd3wJqwAROupHIXBLke7SzKs9QNM4PK1OxxXjBt/V5Sz1m4Hsc4u5NQ==
X-Received: by 2002:a05:600c:5006:b0:40d:5f3e:f058 with SMTP id
 n6-20020a05600c500600b0040d5f3ef058mr1970510wmr.179.1703848832437; 
 Fri, 29 Dec 2023 03:20:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p35-20020a05600c1da300b0040b360cc65csm31388976wms.0.2023.12.29.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 03:20:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: display: ssd1307fb: Add vendor prefix to
 width and height
Date: Fri, 29 Dec 2023 12:20:18 +0100
Message-ID: <20231229112026.2797483-2-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229112026.2797483-1-javierm@redhat.com>
References: <20231229112026.2797483-1-javierm@redhat.com>
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
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

