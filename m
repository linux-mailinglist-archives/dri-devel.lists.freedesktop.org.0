Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB11930ECF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 09:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362A810E1EA;
	Mon, 15 Jul 2024 07:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="GlI6cvB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4410E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:32:10 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70af3d9169bso2729666b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721028730; x=1721633530; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU1rxmI86o5sSy9mWgyvdZfBDmEh8iUs62QhEQ70ryU=;
 b=GlI6cvB0O+J0sb94D8O4Dke4ekm7AYVSGQp06cfAqkASs0JAIlo1lZG/YV9XecCkX5
 n8nhHhcJb3ce5kYoJosecyaIvVf2g9dH8tuC11Hnf/qoRMKyXXaBwSTcrpEklRiYmnNW
 ump3fXafJtbpsCdf+OYSugkn0fiYE+wGLWF33ZycQ1FHBfKrZGzCLdp24Q3xcNqOvr3A
 Cy3CMdzIzTBLStde9A5rjIsouWlgGwOf29V42IeDWfrtR4o276dUd7KOQlenTPm5fB8m
 CggKncF8Khtq6PVDY4o/QzxcuFpqRREGBbi8iwJv1SWLOWCcx1fOALgyiTmmkqw7VNHT
 8i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721028730; x=1721633530;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BU1rxmI86o5sSy9mWgyvdZfBDmEh8iUs62QhEQ70ryU=;
 b=o3xky9Np+OsjR/4MxFa+E3wwNLZlanwliAZ67hp0v486yas7+B8iRJWDO5tzPG220+
 E9LlWUv91wyPdbFyNcVfY93fDUTiJn0JjgSvveN50sFUUxo0FExgzrbzvJ6MecrVSAYV
 /JahO+xNGtpSAFGnelPAsSfJsoldnZVSIqKl7kRVlWcxBNqQXyXumFMvGe4UyoR9Fypk
 w+tEgGSV4yHN78CCJVOqu+NDXPbR07xDjVnjwbmBug3DCabKxrm0gBX3L7HjLdUTH5ig
 4U5636Tvwg4B7duh62su02R1bz/Df9OjK9Hxdm89lrjLkoCsDn1iV7wvOFknibYctfsB
 7Vtg==
X-Gm-Message-State: AOJu0YwU6obFgw38AOZj/g3mMtxwOvkE6xKS12zSB2XVyu3gv2QHA/XC
 sKtO/7xsB7EkcsT26Vv+WEnS9cox+XQ6F7sIkA5uMm5MF6NW11FDMFdPW72Z1pY=
X-Google-Smtp-Source: AGHT+IFeK1zVSa0EG0mSSa/orniI/Xcso0OuomS0td75qDeaGr6wqFxmGjNYbtPS7w/xWuJR3oCwHA==
X-Received: by 2002:a05:6a00:4650:b0:706:34d2:62bc with SMTP id
 d2e1a72fcca58-70b435709d9mr18101468b3a.18.1721028729929; 
 Mon, 15 Jul 2024 00:32:09 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca75a6sm3654464b3a.164.2024.07.15.00.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 00:32:09 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, linus.walleij@linaro.org,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Mon, 15 Jul 2024 15:31:57 +0800
Message-Id: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
initial time is required to be greater than 300ms,
so the post_gpio_reset_on_delay_ms is set to 300.

Changes between V6 and V5:
- PATCH 1/2: Respin the series on top of v6.10.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan ekth6a12nay
  HID: i2c-hid: elan: Add elan-ekth6a12nay timing

 .../devicetree/bindings/input/elan,ekth6915.yaml          | 1 +
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.17.1

