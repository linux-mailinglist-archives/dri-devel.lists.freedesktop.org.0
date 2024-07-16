Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB29321CD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5135110E5C2;
	Tue, 16 Jul 2024 08:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="pDv6o/cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038210E5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:29:02 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-708bf659898so1519503a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721118542; x=1721723342; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCtvvIx/yZJGexuJqTFw9RuA3ab7qr2Xt+qsnXbhE9U=;
 b=pDv6o/cbfNz8uSxmsrDbEcBlZtOAqNs39QHdsUQJ+jyqlDQHLV/Okjyl2NGJ9+4scc
 S+tFb/Hs9hmWkKekxFO3NuWzuLdJLV64/S0+VnX4FxVnoqqHcvCF8NqaQsl3vXMUr2St
 o6dEraSCqWMvC02GqobmjtIIRHjBpt7iGAPuO4kygQcxEhIMv25qg06qcsEVuTcvwts3
 5prapYzMWUndb0E0YrRlmGCJt4bVW4/eakMXc6LkcHDqg9ULYmH5mjQQ+hriKEbyVZcZ
 8ih6kYSfIkqOCSJuDkWyv6d0XMMMXvDbrtNsSS/OotcRzcBg76FMTtH0UWzm35amo8aX
 7MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721118542; x=1721723342;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCtvvIx/yZJGexuJqTFw9RuA3ab7qr2Xt+qsnXbhE9U=;
 b=MhGkaXv4sR4B9CS93UUW/MKtcb/sqyjYkINGqHftejaDfGbrxkEkBdGQfbC6eE2tWI
 us+XXLhhtsGB1whQtYzB0t2ih2Q79ggKNBDnNexbdVBK7BV0gJyooL3BB2zcbJ+Pxvkt
 rbmIoY+r2VGOdLHhBbL2aBswdZPvkkdy1PHnajbQcib1/xKgXvsk/KAAVJ8bvPqTson8
 oSJmsAEXPAuBvm6qUXarDNXnPcP3JEpsAgoOQxcXy8iGyEFcOlLMmwsAIyFYPlsku6hT
 NNfQeAw+fi4XCRCI0Xl8vaKSK/pZctJtNgSRxHSABhzNvD62mCL+PEotPhOAGs7ovQed
 /iPw==
X-Gm-Message-State: AOJu0YwyNmD/FH00ofhPElRRNP3HIvQBhJhsmZoYViG9/1++i/3RYZZj
 3TkYxlR8jg1UY+os5BbkMIkFJE65Y2sCyilnwhinnwMpRzNPIyvc/yMxP7GjOas=
X-Google-Smtp-Source: AGHT+IEdh7/ptoL+oZD1LR9e0MBdyHHjA70akBaKcXOjtXoQ623zVqNT3IYVU90f2CE4eUeMZnXb5g==
X-Received: by 2002:a05:6830:25c3:b0:707:9b5:90aa with SMTP id
 46e09a7af769-708d9948af8mr1706743a34.12.1721118541931; 
 Tue, 16 Jul 2024 01:29:01 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7e110sm5714347b3a.121.2024.07.16.01.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:29:01 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 bentiss@kernel.org, linus.walleij@linaro.org, dianders@chromium.org,
 hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] Add Add elan-ekth6a12nay on the basis of elan-ekth6915
Date: Tue, 16 Jul 2024 16:28:49 +0800
Message-Id: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

Elan-ekth6a12nay requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 300ms, so the 
post_gpio_reset_on_delay_ms is set to 300.

The Elan-ekth6a12nay touch screen chip same as Elan-eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

Changes between V3 and V2:
- PATCH 1/2: Respin the series on top of v6.10.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: Respin the series on top of v6.10.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan ekth6a12nay
  HID: i2c-hid: elan: Add elan-ekth6a12nay timing

 .../devicetree/bindings/input/elan,ekth6915.yaml          | 1 +
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.17.1

