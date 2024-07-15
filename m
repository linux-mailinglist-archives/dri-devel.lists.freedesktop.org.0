Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1565930ED0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 09:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4082010E273;
	Mon, 15 Jul 2024 07:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="O4obS+3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6DD10E273
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:32:15 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3d6301e7279so2682629b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721028734; x=1721633534; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6CswuAcA19Pr7Qir263TiKyjJHE6FeE4xJ8Qxw0DaMc=;
 b=O4obS+3bDa8/i15uprA89sY80aH0tS6gRa4PpjzxMwxsrWo33calXZB1KPk8xjaGWA
 SG7JdoPElzkIPVtuD+DCsPYiyfo/X30T8jWHlo8DFUgf/4B2BBkmAQm7JUmx1hQRENpl
 FYy/cj+oz3+SHb5YGo7QgHpYlj6rDMDPRFUuq/J0ZsAw6jzHUcPUZWcGhF0JmmL2lQoa
 2+Ovr+NWijT0t5+zsDjlu2bUaN4egNLKR0NawUknc2sRE8oeOn73GZp5oTqeJ4yJo07Q
 bblSX05HaEoLgjkSm8zZ7rX9uzdUi6kX0Ad8v1bxLuGNW8K5Yth+yh9zjx1a9ViGZ5Hw
 Md2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721028734; x=1721633534;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CswuAcA19Pr7Qir263TiKyjJHE6FeE4xJ8Qxw0DaMc=;
 b=aCMIs3IBIEc3EBpu5z8PeBCAsnmlbdx7BSQ2ahe3S5fE696dLhA/93jYCW3zmHnzTe
 jSolH/rwLVGh6EhkvYoVGE4EFXk34IlS87/CVRyOh0cvowNTtFqGpJ58Fm50CnxLshwI
 VzgzVDD/c/eRu12ooQ3ob2S8HdRO9hzbM5Jz9lYGS2EmI6M/H5SyygaljdvCFq+NgJXj
 WMnYJ7oMfJw9n1ZFavymJga3W+G7R4S1JlKbwClo4EuTTZqdCj+U5pNXNajrwAB527Ax
 MCthm6pKQinq3NyTlsSiPyWxiCSLVFrUzfm6C65LB1efRxC29Y4Jg67BRuf0odpZjTlf
 teBQ==
X-Gm-Message-State: AOJu0Yx33S43BqlRrA+yDJq7Zd6O3dbQusrrt7it5DSlwxklgBSXFaii
 d2N1qY9IEldDJNb5gyTYlMf4mAdCNxhCjxgx9E+QHpp2gZAdMwxu54MGeJ9LCpE=
X-Google-Smtp-Source: AGHT+IFbm0uDFRsPJa0Nz1krahRsJcjD7FdB5iaBEphN/CcHhS8Ov/LHN0lN+9E9KFXJdEPbJMBvlQ==
X-Received: by 2002:a05:6870:3287:b0:25e:1c7c:3de9 with SMTP id
 586e51a60fabf-25eae7efbdcmr14809287fac.15.1721028734517; 
 Mon, 15 Jul 2024 00:32:14 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca75a6sm3654464b3a.164.2024.07.15.00.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 00:32:13 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, linus.walleij@linaro.org,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Date: Mon, 15 Jul 2024 15:31:58 +0800
Message-Id: <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes between V2 and V1:
-  1.  Respin the series on top of v6.10.
v1: https://lore.kernel.org/all/20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index a62916d07a08..bb5910460811 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - elan,ekth5015m
+              - elan,ekth6a12nay
           - const: elan,ekth6915
       - const: elan,ekth6915
 
-- 
2.17.1

