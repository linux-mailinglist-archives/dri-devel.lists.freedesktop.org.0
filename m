Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48C7D192C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 00:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50310E604;
	Fri, 20 Oct 2023 22:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D0110E604
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 22:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697841094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U9iwHq/WW92wIMDf4fjn3PaKiv4Qj6cmxyyqbItQ0rE=;
 b=SqGCp0aid+jbb+M7bK1U5rbpNM5NpxRitulC0WVOfEub1+TrE4U/2NZkzZDHmumbouXpx8
 axE3myGWOXCVwzHPO3EIHcB2EGNahcR3QP9rEHq+8JqGXHCPSz92O9BklsplFSLxF7ZGr5
 tCrjOnhmGK3enCoKbY2IDtTDbZ+UWyU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-oUiaaloMNjWMWUY5_5Yd9w-1; Fri, 20 Oct 2023 18:31:32 -0400
X-MC-Unique: oUiaaloMNjWMWUY5_5Yd9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so7771045e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697841091; x=1698445891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9iwHq/WW92wIMDf4fjn3PaKiv4Qj6cmxyyqbItQ0rE=;
 b=EwBGH6gz9pIEaXvVThEvLbHmAzfh2fBekE2tooWz3TVSE39F2icoJeYtX1iPZ2Bcn+
 bdwfJg3x6NY++4eZaY3+gFRCWuNieqjsn5mk2UK/LlitYmmIt9DIWJnZpKZEwJpejXR7
 1R98sgFgDWK3fzF26gzOidEuJ12HvFbii4d6R5PIUBEd440R6+6aqtwEAHU0DSyT/yRA
 AjsLKlQDfibanKP09PJksFR82jMw99ppecbI3UCFx+Ecs6f+4ZKX4YbYFrmSKu4xrMwB
 ineeqcVyhJqwoJ/UdW+5LZs+ckVfMyAABis353xlzGKSBBUyV23dUgDknNsZotILVYHc
 SNMg==
X-Gm-Message-State: AOJu0YwPTkv5eaaoWPWk9MDgsWhwttIVpTfqWXuw1ctPztpQIOkS4hON
 Gd6X/z1C+fiSqGkv5QsOwdYrP/iaU35BpZZsEOOy+pvDE3P4ds1bQ7gZLajt5gWK7pWZA+aIf/9
 6aL/xlGNe5nKpkCfT6M1J6NDOCAMP
X-Received: by 2002:a05:600c:1c21:b0:408:4cf1:e9d7 with SMTP id
 j33-20020a05600c1c2100b004084cf1e9d7mr2415649wms.20.1697841091447; 
 Fri, 20 Oct 2023 15:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEli5PDwUY2pVZDmRAcMX/xPEvIZZL1cQUyUecghxpFLxqzMscliuiWSb8kQaNJ3fTi6Xu9nA==
X-Received: by 2002:a05:600c:1c21:b0:408:4cf1:e9d7 with SMTP id
 j33-20020a05600c1c2100b004084cf1e9d7mr2415635wms.20.1697841091092; 
 Fri, 20 Oct 2023 15:31:31 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b003fee6e170f9sm3113382wms.45.2023.10.20.15.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:31:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: ssd132x: Remove '-' before compatible
 enum
Date: Sat, 21 Oct 2023 00:30:17 +0200
Message-ID: <20231020223029.1667190-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a leftover from when the binding schema had the compatible string
property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
got dropped during the binding review process.

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
index 0aa41bd9ddca..37975ee61c5a 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -11,10 +11,10 @@ maintainers:
 
 properties:
   compatible:
-    - enum:
-        - solomon,ssd1322
-        - solomon,ssd1325
-        - solomon,ssd1327
+    enum:
+      - solomon,ssd1322
+      - solomon,ssd1325
+      - solomon,ssd1327
 
 required:
   - compatible
-- 
2.41.0

