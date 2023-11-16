Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17F7EE66A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF67C10E2AB;
	Thu, 16 Nov 2023 18:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449DD10E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700158076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hPxzOncy5HIGVOblAN4i/IW7KR+JFRLvP+iQR6fOxe0=;
 b=CosX6M222v2sSUie3Lzy1XyvUqSdw6M/DpmrT8znDhz4lpVooxFBvFhYH+7EdUi1P+Fs9k
 MrzfdB123ia2CqINH1y2G1q3i782gUgRG/dAu26f2KRdWTRQ94VntxPyOCE1FaLsTbv1fN
 OTBMhPyFzDXa+zlxrlBufEI6DrsMLCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-tduuRuruO466HkGMyq-gqg-1; Thu, 16 Nov 2023 13:07:54 -0500
X-MC-Unique: tduuRuruO466HkGMyq-gqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40a36dd4a58so6892615e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700158073; x=1700762873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPxzOncy5HIGVOblAN4i/IW7KR+JFRLvP+iQR6fOxe0=;
 b=vn0zHoakTUruyqrMjoHEkbaSiBXbBk0wvOs24vRw4Y9b/BrYwh4CYSe5CJ8A2vR21d
 a/bUuxPakbWpAnm3R4RQOXZ78MVkHjV283WtIDS++PnP8Hu3I/liTTCjNl1BanWDtkRT
 ZhTPuzHd9oLiYJhwVaqcsl2xZaxgfpmDG83T8riYW/j5ml6BW7MYkaMjOEfef3nYIx03
 p5uqQ2BMiWRnlM/nyxNjkujpkaDYqE2qEL/rDASj8yAurwK34bBFFJnwlo20SPICGbgj
 4fdw7g7SdA59jCHk/H3LTsOz85N+ycXr3H0+Q9XG/CQWgWY2VDJztlSR+bUlbF0CRuzw
 BArA==
X-Gm-Message-State: AOJu0Yy3aXNeWjsrN9yG2+DRuSQvsKSy8+6ldOEiQ9sjtoOJmkIHBHpR
 Z1/uupTxMyDAH5RM1mhbUb/TFLBh7V5u5xJbkr8CPed82MJm2RvYNBrMKu8P7OW7IAM3CfInEWv
 KEzLNbXA7RjooB69IRYnIjDwE3M3H
X-Received: by 2002:a05:600c:c0f:b0:402:e68f:8896 with SMTP id
 fm15-20020a05600c0c0f00b00402e68f8896mr14609080wmb.0.1700158073625; 
 Thu, 16 Nov 2023 10:07:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmdfeAnuQFuohht1CLAm2Stx5W5EGXlcnDY8tsQEAn2nKKlrvW/+NDUyqH/j1nM9uFFuRyLA==
X-Received: by 2002:a05:600c:c0f:b0:402:e68f:8896 with SMTP id
 fm15-20020a05600c0c0f00b00402e68f8896mr14609042wmb.0.1700158073266; 
 Thu, 16 Nov 2023 10:07:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w8-20020a05600c474800b0040836519dd9sm61664wmo.25.2023.11.16.10.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 10:07:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: ssd1307fb: Change "solomon,
 page-offset" default value
Date: Thu, 16 Nov 2023 19:07:37 +0100
Message-ID: <20231116180743.2763021-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sahaj Sarup <sahaj.sarup@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is used to specify the page start address offset of the display RAM.

The value is used as offset when setting the page start address with the
SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
1 if the property is not present in the Device Tree.

But the datasheet mentions that the value on reset for the page start is a
0, so it makes more sense to also have 0 as the default value for the page
offset if the property is not present.

In fact, using a default value of 1 leads to the display not working when
the fbdev is attached to the framebuffer console.

Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../devicetree/bindings/display/solomon,ssd1307fb.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 3afbb52d1b7f..badd81459aaa 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -35,7 +35,7 @@ properties:
 
   solomon,page-offset:
     $ref: /schemas/types.yaml#/definitions/uint32
-    default: 1
+    default: 0
     description:
       Offset of pages (band of 8 pixels) that the screen is mapped to
 
-- 
2.41.0

