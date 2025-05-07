Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D377BAAECE7
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A15B10E8B0;
	Wed,  7 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwhC0Wh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC59710E8A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:41 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72c0b4a038fso168425a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649361; x=1747254161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l94voh9nFi8NC+FZhT6bHJgs5D7hhrZlzdK4jTqxAoo=;
 b=LwhC0Wh6XxxyiMhNPwYvmz/xYTfukpFbxG8a4fcJoJuf3cTbNqnwgK4x4TXMDB9S0/
 B+sbXx7d0c84sAjlTYLEA16FN98fFhXT2Ckg2eEACHp3gMb2Y4b5UpH12R05XrpjPz31
 YQTPwLBJA2D9q5gCQP4QoCNCvpk1P/ZQ13kfGjV172Nl3RFvxsk2ShHvh6j4WOkhkQYn
 on5zr0LQJu5RQXfwTHvjmfyEc8N3fym8H/FLvRXdBXyqOW0XBpXXolHxUYtrkWPhIrN5
 AryX1S/ycyW+EiBFK3boIvZEOkAGbp/YKC50bm13LUGbckbNGqIXASPVCvwo/rMyyMza
 Agxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649361; x=1747254161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l94voh9nFi8NC+FZhT6bHJgs5D7hhrZlzdK4jTqxAoo=;
 b=GNpgGwCu2eIwj4zO76F9YfJFWG62RE/Ev5Fc0DviZVt7qXoik3qaoMeuRB1IyZmvGo
 3Z3NSelD7WUsMK+s/mPw0efQ2izC7HB4Gizq28uB71tUqyIrA0RYJxZle2f1rDGg0Qpy
 Wvcm+BVIUUw736MYzJPPdu1b348aNaYurTQzrRrP6Ue0zOGScsCRHOUqBj0f9ukA5c6P
 YFbFTAH6Zn8xKO4vdLbwfp+xqUAOp54UNoUDXj0uSqytuX2OBddo9u62lFFb2aYCw0cG
 soSyw1t+KLg4PbvNoWMUP3u3TF37clgLduJRhyiGP+o8EpwkZBe7xm/yANqJ83ATKNpx
 D1Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJMFjuXoq6GzsLP9pZU33NXwNj3Ff8o+Kk/xD4msqM42jyivwQjdnpvnjHvzObHRz//fWxh8cv4BU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX4gG2WkLbtocLFgkLN8kxIdhUqm9W+AW8e/KccXuKxGpxzHxk
 Vqmw+vZUKKgKvNXS5En4Ga8vWXIdfHW3BgzihVNlop6ixGVypKhB
X-Gm-Gg: ASbGncs4ehdPxWv33cQAzbzfl/v1MWOUl9MTh70v5kqKDUDuJxeAf9XWRiwjd1As5cO
 PcgJlNAXeHrq8RLI0/7K8gV2Rjqzuc5lWQmx45o6XJ4umS3JfSmOC/jMrzHwxppxK9EtkezfwfV
 +pYnwlXVYXYfKMRltp2mFxAe0wmg2QtoWEP/mjK9pdRrRezWing8ZmAgHSLjBoy34QzBGix/eJB
 ebe9UaZWx4a9y6hDzPXbhQAuFpxFlKc5GwEnnLaiAn71QqVEIMPVBlc1LCkJwN8SWYL2SCDTrNw
 rD1NsT6vNbhHA7uR1uE/sQoUkswPx9tz7vjhbX5b/URZgLwnmM2rcq/uUizz
X-Google-Smtp-Source: AGHT+IEVQSwtup8hGlcNXSdOKoaKgaTojdmH8y9v80kzgTfNqzsMyv7A4MwSEPxNN6DhO6wxF1WRAg==
X-Received: by 2002:a05:6830:418e:b0:72a:48d4:290b with SMTP id
 46e09a7af769-73210b239a5mr3495482a34.26.1746649361106; 
 Wed, 07 May 2025 13:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 18/24] dt-bindings: display: Add R40 and H616 display
 engine compatibles
Date: Wed,  7 May 2025 15:19:37 -0500
Message-ID: <20250507201943.330111-19-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chris Morgan <macromorgan@hotmail.com>

Add display engine compatible for the R40 LCD controller, and for the
H616 TV and LCD controller which is functionally identical to the R40.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..caed517c68de 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -53,9 +54,15 @@ properties:
               - allwinner,sun50i-a64-tcon-tv
           - const: allwinner,sun8i-a83t-tcon-tv
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
       - items:
           - enum:
               - allwinner,sun50i-h6-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
   reg:
@@ -231,6 +238,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +288,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +306,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0

