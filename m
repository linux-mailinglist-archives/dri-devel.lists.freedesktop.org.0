Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D964D938A0D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464C10E39E;
	Mon, 22 Jul 2024 07:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="XG8k8/iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFE010E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:31:53 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7a1c7857a49so343353a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721633513; x=1722238313; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2KAgnjwVQOc0ZyTb2UjcVxk7fFjtqOGmwkkRzyiULQ=;
 b=XG8k8/iFgrcgCpbfeLQHEjY3UjWSRIa8SloPrqHgyXlDsvNO1j02tSlOSy4BZXyomO
 1HsM3F0+K1ujg84NVvV1HFUSGPQxDmn1cFtimiF2hMpG3duF9LRBBV4KdtsMEbPhPMx0
 VI1kBxGPotAX+NZ+iQrxoAhGdJnhct7mO7zYU08mpjHOhJwq827bIynhsMMdLUtDPl6s
 /Ec9qamqoBBd7mbRMKvqV4SrO3xRxZyEU5Z+D/I3uWf13X3kRonCIDiYexo362xjGwvi
 7ybXugGG9rYe38l8b/T5/Dlzf0pL6Nv3uegBLyJi/YhXAIGyz/Wv+WrzRSQNM4FQRw52
 iJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721633513; x=1722238313;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2KAgnjwVQOc0ZyTb2UjcVxk7fFjtqOGmwkkRzyiULQ=;
 b=nPgRKIBBNIE2cWbpTpactnGjHT83UBfp0NJ2zXz/eAww8sOinEz8nHe3w5HJEGZ7LO
 C2UfgZKr31VZagwmzf5PsK4wlthQxku9d7gqwRAB8Aoc59jn0+z3OjAnWJ+yVbDQ7l0l
 +xylslTJD45WSwarnK2kMpFOLbiOTww0ysEXvC2oS6uwzOmxLaZX+NqxAVhPaS9AaMQf
 SQcr4jEfNWTfgciqLfmV2P79Hanrs7//rpQtLR6sCaqof0WsDnlQ3ciAaazm+rJf4NM3
 G9YA/tiKLRuLQB5DkrSXHNHxPlTcS3ghw1QClmV8X6I+tj3kZ0cvgEz8Fe3zWu+UL5pa
 QZcQ==
X-Gm-Message-State: AOJu0YyqLzBBSf2hdMLyhTDxuMQnPUZjcqhG8Ml3lvcPi+OQE1th0HtQ
 mAmXvaoSdNbdmmWyu3BvfGBS1ITlRgX92HqqxAYtY0gSiQp3yNIlvFeRPOjKGBc=
X-Google-Smtp-Source: AGHT+IGF9DhXIv1Qu8bMdlHQYClv79GhIKxblDYYH1XqHLI7fo+5ZVtusQJQtSx2l3XpJXTjpOMXMA==
X-Received: by 2002:a05:6a20:4f02:b0:1c2:8d16:c683 with SMTP id
 adf61e73a8af0-1c4228fd07amr3773629637.32.1721633513114; 
 Mon, 22 Jul 2024 00:31:53 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-79f0e6c9461sm4081162a12.61.2024.07.22.00.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 00:31:52 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/2] Add Add elan-ekth6a12nay on the basis of elan-ekth6915
Date: Mon, 22 Jul 2024 15:31:34 +0800
Message-Id: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Changes between V4 and V3:
- PATCH 1/2: Combine the 2 const into an enum.
- PATCH 2/2: No changes.
- Link to v3: https://lore.kernel.org/all/20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- PATCH 1/2: "ekth6915" isn't a fallback, modify it.
- PATCH 2/2: No changes.
- Link to v2: https://lore.kernel.org/all/20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: Respin the series on top of v6.10.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan ekth6a12nay
  HID: i2c-hid: elan: Add elan-ekth6a12nay timing

 .../devicetree/bindings/input/elan,ekth6915.yaml          | 4 +++-
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.17.1

