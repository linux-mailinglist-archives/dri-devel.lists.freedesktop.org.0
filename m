Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA581FF14
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 12:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760EC10E10A;
	Fri, 29 Dec 2023 11:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1B10E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703848836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGLVCef4QzbvTALYo2ea2BIkPY+CGFifWhpyQpWq1Uc=;
 b=I5Y0/lO2djOF+1Aw282lpL4FvQjCRx3HyIQUf0yC5mgmogj3gIE7dKlVkgB3mzwoQczJf7
 1XJ9ndfi7JhwfE3THaLvu2sUgx72MpvhGUwxKA6pA80g2CG7YI4qT8ImX9I4OSbpT/QlyU
 On1Gg7a1HR28fl4TIGV6Te6GvHj9/AI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-ulFa3ZP2PyiF3gR1PFOSiw-1; Fri, 29 Dec 2023 06:20:35 -0500
X-MC-Unique: ulFa3ZP2PyiF3gR1PFOSiw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40d31116cffso52757335e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 03:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703848834; x=1704453634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGLVCef4QzbvTALYo2ea2BIkPY+CGFifWhpyQpWq1Uc=;
 b=u6/nL84eEPPGtYAWV6vIQTXNgL8gznsDfDrxZOquGVqNnkBPZZH7vktnfulQT/S0/5
 cZyoE0dQqzMpEceKnIlirY/v9SsagmxkFSWk330PTdkqqugR1m/oWPI9/xBaAfPUMN0i
 kZQMqm12RINLXdEQN/IFhoqZ6b47eKMiEbgsmNJa4XNMqs7QhcDN60sI6Vk92QoxQ2q5
 Abtn19TUSfZgFbb74jD4zjD9AjfNucVI2kpgfsAvt66f11+usSfK3Zc8oquJY8xwaYkG
 jx+ozADHRzCzfaj+uXQAHxqQUEptqgUNxPG3x6ODSNnbmyYgi2kBYT4WWjIvTBM5LyLl
 9BBA==
X-Gm-Message-State: AOJu0Yyk8Q4k/lQmUTkEAfhSxCDY1lh1P9MpXw8thaB9EcsD+rAZBt4h
 ZjwMefOJTXW4rf89C9QnPQiwN5UN2HPZIn5Vf2aE2N3ENG9jUFkzwpoN0ND3UiFCFh1V16gDw/Q
 iAhipu2umzFZOOdwwdli92jPwCttjILrhKew4
X-Received: by 2002:a05:600c:4510:b0:40d:5722:2a0f with SMTP id
 t16-20020a05600c451000b0040d57222a0fmr4260988wmo.48.1703848834365; 
 Fri, 29 Dec 2023 03:20:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5fMHEN5dB+koli23UjcZjZeepGNiOT2nHkTioE3ZWE19z7sXz94XioXuGlb4SaA2yPuAFaA==
X-Received: by 2002:a05:600c:4510:b0:40d:5722:2a0f with SMTP id
 t16-20020a05600c451000b0040d57222a0fmr4260983wmo.48.1703848834168; 
 Fri, 29 Dec 2023 03:20:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b0040d5b849f38sm11297188wmq.0.2023.12.29.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 03:20:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: display: ssd132x: Add vendor prefix to
 width and height
Date: Fri, 29 Dec 2023 12:20:19 +0100
Message-ID: <20231229112026.2797483-3-javierm@redhat.com>
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

Commit 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
used the wrong properties for width and height, instead of the correct
"solomon,width" and "solomon,height" properties.

Fix this by adding the vendor prefix to the width and height properties.

Fixes: 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Rob Herring <robh@kernel.org>
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

