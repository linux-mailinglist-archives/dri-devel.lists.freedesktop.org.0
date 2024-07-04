Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB90927241
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057F210EA48;
	Thu,  4 Jul 2024 08:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="NhKDOZTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5ED10EA48
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:56:12 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-761e0f371f5so91337a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720083372; x=1720688172; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HU6hvuxuaxwFr3kU7mCJAsHrIdHyV6zPoRNePKzbdwk=;
 b=NhKDOZTt82bxCrVeD47YPBhJcNlvSa8I9aeBwIDvX6n/fb9fi807BwzVBeSsi1FSeP
 wY0BQBGo1tFkwmwzuw8w5fS2+ez26ZBdhxFqi9Se+DZKPy+SttraN01JsLT82y5RnYOB
 jrTV/RYhUpJ+4qE8yrhbMYEVapkpSXt3HxclnV+6nj0cfhmRc1ZtilX+lgpB5OCjcYbP
 9Gp6N12WlsZz//mdxjYV89/8SSzAdPPKkIV9T/9J9Weu7oCnaicFquhuCxh2vHw41XDv
 lBJp74PIAW5XUdpZoqMq3LrUtHxJDACPeCxQWQmesGX4pSXVbSOXXw6QxnjVZSTKBUkW
 6hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720083372; x=1720688172;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HU6hvuxuaxwFr3kU7mCJAsHrIdHyV6zPoRNePKzbdwk=;
 b=vfy2EUg1uykx5qKrtwNJIbHY0z+trD17CFwDAEfYnJdxsKTV4TbQGAVh6aVeLNZU/B
 kPCtB3yDU6Om9N1nNFYFYN2qwAVsxnoNR3oSCDmbZRVkZMO1Mkk5z3aQXzRVtHA+Kng1
 1/4RfsVowUOuZwmBoM3nEIEokAYE3qwi45i+3TtpKVMBjbTWzh6PsQ/X354Y/OgJTMLR
 4L7uz+NiOvugldHLpNRcgIs7AoyqhJ6NEzswbGtUOMiYLEvSy7q6MyNHXnqW/DBxBKn4
 cz0KG90B2kVLK2TAtitVf3DF6GqLu6TiFH/AF7bvdaYuGwioUWmoGkqLZhBvdqWTis3U
 4nWw==
X-Gm-Message-State: AOJu0YxDrPFdFdkwfdAh5PHjMAuKPTI0Sj5kQ/G6P7CALdxjjixMHKF5
 RRMaNf0BWKjmYWWYPkmkwhIrBfgC7T3MBFgAJ2GOvRFafrL1GZpO23ZjmB2Yzvc=
X-Google-Smtp-Source: AGHT+IGpMVM87ZSRHOmVDMb+jxuKrOdkzBfFepNQcYRIQF1P/x7zZM5uBxlC8GAU8SWrioNhjW/vDw==
X-Received: by 2002:a17:90a:898e:b0:2c9:6abd:ca64 with SMTP id
 98e67ed59e1d1-2c99f325530mr1191127a91.9.1720083372432; 
 Thu, 04 Jul 2024 01:56:12 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a97282csm962572a91.20.2024.07.04.01.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 01:56:12 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Date: Thu,  4 Jul 2024 16:55:54 +0800
Message-Id: <20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
---
 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index dc4ac41f2441..0bbf9dd7636e 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - elan,ekth6915
+      - elan,ekth6a12nay
       - ilitek,ili2901
 
   reg:
-- 
2.17.1

