Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A007721FFE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D6410E18C;
	Mon,  5 Jun 2023 07:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1BF10E18C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685951292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wy1ybExd+DdkhzJijCZf2robb5n3TSjvDJzl2U7VfoI=;
 b=K8gJnHc6utf2QG3zsZ3XhSBRxgfIOfF9pRTBPtJBlT9320yccY9N08nHyIJstEZsPrHMID
 w2398pvgxyihzlDz61yWzrwtN+Ia8Iy2F0S+PgKAubskZCw3IEnAgLO8J8S4Nj1O+fDgrn
 LJBZRg2Xz34iVQAdiQBtlBRUVDBl58U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-ymxPIuoHPtauMxE5b-rCfw-1; Mon, 05 Jun 2023 03:48:11 -0400
X-MC-Unique: ymxPIuoHPtauMxE5b-rCfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f725f64b46so57345675e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951290; x=1688543290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wy1ybExd+DdkhzJijCZf2robb5n3TSjvDJzl2U7VfoI=;
 b=P/8u7po7odQjtwpxu45UvrvqumGkRbqcP+FecuvoEgjwWsVJ7KsipO9T3oPlY51iv5
 KxCcWl5rhkGkaWvQwvYwSInxidRlRguNxZbQl38n4nC8B9Vn+TGKYBV55o6Sg1CxVYS2
 Wbo7RFDwTp/hWDIQb2ayUk1ppdrpM/MHqVqOGFXY2KeDkYlKOtiC5hapXTDan8d4SWxc
 +78lD48CfTgO7mH2Ya8Nu17ZmJAR9PG8JTBRKri6rbzKcYqx5aa0HFV/LRuBK3kqVD9A
 MWV6OxyYHK4YXgPq45cfi6BySWzaLHpowngR9V/Ex2BtBi81FIvbvyqUffchSuOaV/8K
 pVUA==
X-Gm-Message-State: AC+VfDzUw0cDWs5gmg0wmNkiFA8hHAhwJCKlEcM9ygjPytDTTnbraupX
 vf6AyLMZnL5BVqZY3jCTpQ/4olBRm211wCwnSyYCsFMaG+ihozpZssWtnV0Y7FvH7OBvR4Mk0/T
 4IOGuPB7C+naoSGZziqo4v1p614tY
X-Received: by 2002:a05:600c:246:b0:3f6:a66:a36d with SMTP id
 6-20020a05600c024600b003f60a66a36dmr6957918wmj.10.1685951290364; 
 Mon, 05 Jun 2023 00:48:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7eFHg9bKquUpdsiK2KD6fy5tNMuQeT4ijXo/E1E9L9E6LlQGTfx9UJ7jtWPmSqTB0TklZmdQ==
X-Received: by 2002:a05:600c:246:b0:3f6:a66:a36d with SMTP id
 6-20020a05600c024600b003f60a66a36dmr6957906wmj.10.1685951290089; 
 Mon, 05 Jun 2023 00:48:10 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f4fb5532a1sm9715192wmc.43.2023.06.05.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:48:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: display: ssd1307fb: Remove default width and
 height values
Date: Mon,  5 Jun 2023 09:47:50 +0200
Message-Id: <20230605074753.562332-3-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605074753.562332-1-javierm@redhat.com>
References: <20230605074753.562332-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A default resolution in the ssd130x driver isn't set to an arbitrary 96x16
anymore. Instead is set to a width and height that's controller dependent.

Update DT schema to reflect what the driver does and make its users aware.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../devicetree/bindings/display/solomon,ssd1307fb.yaml    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 94bb5ef567c6..e8ed642dc144 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -49,15 +49,15 @@ properties:
 
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
-    default: 16
     description:
-      Height in pixel of the screen driven by the controller
+      Height in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
 
   solomon,width:
     $ref: /schemas/types.yaml#/definitions/uint32
-    default: 96
     description:
-      Width in pixel of the screen driven by the controller
+      Width in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
 
   solomon,page-offset:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.40.1

