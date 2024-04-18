Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D245D8A9A4C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAA10ED26;
	Thu, 18 Apr 2024 12:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZNEELSp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9404113134
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:48:31 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2a7e19c440dso667252a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713444511; x=1714049311; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uGDsLEb5BghVT9qGOK/loQQdaX4v11rqejOU2LWrdN0=;
 b=ZNEELSp6dJZSOV0mBRcvgWnPWICQ1Clf3q0ZAK3ZRiY/s1Fb77u2rRtqd7mBBAP82P
 1MX9Wc+JNpI+HLRuD3j8S9hGpKRWllL1h5NFAB5JASUSVseO85k5+q+L36+Q+lZB8vG/
 G0JXMBo4oWD1jRTEsAAmwIS0XqVr6+IpH0Jy3IbSrn7SJHrAeXinINehwNrdiHmG9UXQ
 pZXI+KsMDOEPyHhqPk+efVV9QSW5AoYE/Ck6tkleXkV+2zbEVxJZ2pUAdqoXjzvwRTel
 3ZVzeoNKk8532oj+5LV61HexFyVZdzHK/IhIrswbPXhh1ehWfSGpNX4rc9xBJFVMzxCE
 YkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713444511; x=1714049311;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGDsLEb5BghVT9qGOK/loQQdaX4v11rqejOU2LWrdN0=;
 b=mxOK43UVKqh572bnEEtSDnNU6Z6Xx2emFFRZreIK61b/B7WkA3N0eI2RIbh7KoxQVK
 HPL1zNfkrvOUxiKPPWKIIBc5xMYIVsnXv5xvtC5qet0EP4Nb/vtltbpRphua0cnxlJc8
 XcTP9eOY8No7/Y/4p/EAm6iJPa5ukQIcQPhAy/Pop5kbRk6OUALBQMzwlHNPb3iVRNND
 gPaKfj9GqPwiuWbBqADHoJDKW/XijboxiuY2jAwQZ6mWKvow0A86UUfeFFnuT7o3u3oW
 ttgH+dDT4mmgspeAjwBbZ2tf5HwhHt7OID5VWMSu/Ji0sTIdZQWvN0lkAswLvJzGcjfR
 MdYA==
X-Gm-Message-State: AOJu0Yy0hoIUnLWMH9LXrH/pjP+Eu9ihpa6kcD6fLPYrFrlQLgcFJPrQ
 gJ2gIOqXlAa90H/PLQfbStxjdYbRQbWdkqfzro89ZKS6jf3jxA0s3Bkph6XM5UE=
X-Google-Smtp-Source: AGHT+IFp+L1hQ3/71MRE5nC1up3U+FLG4bqHqA86kwgOkj44rzc6HfpwUAixZbMftqOKs33+zrh95Q==
X-Received: by 2002:a17:90a:88d:b0:2aa:c2ba:3758 with SMTP id
 v13-20020a17090a088d00b002aac2ba3758mr2382354pjc.42.1713444511114; 
 Thu, 18 Apr 2024 05:48:31 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 ju24-20020a170903429800b001e3d8c237a2sm1423509plb.260.2024.04.18.05.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 05:48:30 -0700 (PDT)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek ili2900
Date: Thu, 18 Apr 2024 20:48:14 +0800
Message-Id: <20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The ili2900 touch screen chip same as ilitek ili9882t controller
has a reset gpio.

Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
index c5d9e0e919f9..5063ea2c8375 100644
--- a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
+++ b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     const: ilitek,ili9882t
+    const: ilitek,ili2900
 
   reg:
     const: 0x41
-- 
2.17.1

