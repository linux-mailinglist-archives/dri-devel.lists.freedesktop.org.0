Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D775081C7B9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83510E7A5;
	Fri, 22 Dec 2023 10:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E429F10E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703239321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGLVCef4QzbvTALYo2ea2BIkPY+CGFifWhpyQpWq1Uc=;
 b=MyejpBTB+2O2UKuuTArdN6EuSnh/5E5GnvuUo6JidY0IzFDF62jQKu+s+xqhPufCvnDoiN
 vwI5vXZ08njm9kT7YSA1VM+8vqYCld0k2aJVQ1/sEJLAMhOFLpMWbvNlsbOKfVYHMCe09u
 UtTHjYBtwXNHJ1JHXCwCjVJU3cdwmpk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-GtDRe320NsqgE6LaLJ2P1g-1; Fri, 22 Dec 2023 05:01:57 -0500
X-MC-Unique: GtDRe320NsqgE6LaLJ2P1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40d27ea0165so12139665e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703239316; x=1703844116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGLVCef4QzbvTALYo2ea2BIkPY+CGFifWhpyQpWq1Uc=;
 b=GAQ32379BOWIgiWP7CX0l7xibXOtdkt2Jmc/v0yvecKR61svKfTYCdF1ePnJMWl1zN
 ZshLNEiON8cqukBwY6+blPGL8FMdbHFYdFmbf3puqzyIM4ktxg20X/sPYRwmhinToqgU
 irTfN0xwb7qQRTwyMk1sS/PaM0ODNxrJ+K3VBd/c8x6Z86lXWJYMNiPA5LZduWdgsHCp
 6wYwBwUdL+1F13hr47TKYrq9AIgUA2yps4fjqN2Qk2m50JwqjwWLP0H2mL/Issm41pLs
 NrLrz5+F1Crc3NVtFw6T1mqFUnUzpfWnMI/m46KK9AOFThAy8jQqojcNCuLBElWAlA9f
 Fjsg==
X-Gm-Message-State: AOJu0YzkAYjHn5Q7qzqmpgNRc2vjNb0GFxnTuzxs1Y2TP5uuteaaORy8
 +ov02FgXqcK3873SUpG7Aa/j8UYwOh5x5mD49jgQ9j9Ktl67oaBNSFYTWtPC9qCi9cDluAK7ixu
 SSNn0poCsMdb9rvMy3Lbh70Jf1Feu66OzKp3u
X-Received: by 2002:a05:600c:4707:b0:40d:30c9:2c0a with SMTP id
 v7-20020a05600c470700b0040d30c92c0amr579431wmo.115.1703239316294; 
 Fri, 22 Dec 2023 02:01:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3RPkPItpbxaMZzXzGJcG1N9FtcaSFzT+abGEsinJLJmdympQDNt+Rajm9hzaq7pPTWoOcOg==
X-Received: by 2002:a05:600c:4707:b0:40d:30c9:2c0a with SMTP id
 v7-20020a05600c470700b0040d30c92c0amr579416wmo.115.1703239316021; 
 Fri, 22 Dec 2023 02:01:56 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b0040d3ae032b3sm6811470wmq.9.2023.12.22.02.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 02:01:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: display: ssd132x: Add vendor prefix to
 width and height
Date: Fri, 22 Dec 2023 11:01:39 +0100
Message-ID: <20231222100149.2641687-3-javierm@redhat.com>
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

