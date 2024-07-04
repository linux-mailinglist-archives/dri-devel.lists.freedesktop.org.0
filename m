Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96492723E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2D510EA45;
	Thu,  4 Jul 2024 08:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="JlwQcdtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D6310EA45
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:56:08 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2c80637d8adso321678a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720083368; x=1720688168; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXOoxvvOe31w1ncPerleKixgz0Ceuj04whgXRu8l0SQ=;
 b=JlwQcdtSOAB/kGL/pE9YZHlof+J0f4s56wQSBfSMDS3LaK1qeShMSn+6iKASMO8QQR
 thKHByJ2kSedpZuW2uVt9W4rpwrhapX9ZobHeqaCKzJW3/VFJK+J4PTw09ZpATFjG9xI
 dMhPc5M3WoIsPcUpwaKJinywkUN63SjXlAhSXd++r0Ye8MZujhJUSII7WUc1ekaZPkHq
 YMLgTaq2snXG5Mn/Uh/GoGTkXOFfw2sCMN3SDkt5qgFseE5cKnBLb5u5RYiETY3IUuO0
 TcxZME59WfegXb/jdbZkKX3tK06/KSaMcZRlbjuy8lWzYikO1wl4LM0tKcrONjMgDq3I
 AWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720083368; x=1720688168;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OXOoxvvOe31w1ncPerleKixgz0Ceuj04whgXRu8l0SQ=;
 b=MQnBiAAzQq03UAYjvIKjEGNT+ariko3M6zXJofYwc8+1v6zSSESmBD29TJ/zm04ifI
 b78eTlOnXxSXUvWXtVqIwYarjv0NxPeOUQI3EQhbPUllEIk61QwU5YUZX7r+ABgbSVd6
 PZaGMtjzjg3dEHtH3OlmfF1zdZGru93SjxUaPyCBvGwpiLeUNL5iMMVGfWXmb1W+VvOp
 oOBYiczWGattOLqWjAn989ZuK1LeOEOIEs4EEHj+M2IJlNFO8CJ/sGKI8uAKzOtz1Ur9
 W5LexWp4+CrbnMaSdwRBLWROm5M5EDtaiQ4bEKRGsfhyrYcadl4QrVRUDbXHIC3Dz4e/
 THwA==
X-Gm-Message-State: AOJu0YxkO0kFQkduo1NmUPAVljzS98WZNAicUbuQ1g2T++fnOG7c+X31
 O5vjTkGUMUUfL0j7ne9hXvsLvaEz/DF0LG5tddPsifOfp9vpvBiG4v4U8ZdQ0Yk=
X-Google-Smtp-Source: AGHT+IEwW4pDtpfHuwfN8E1EywFvTESPh1XIyJapLgL8zwTEtD/NyP7knccVK4/CsOptrrx9sDsSuw==
X-Received: by 2002:a17:90a:eb05:b0:2c9:888a:7a7b with SMTP id
 98e67ed59e1d1-2c99c570392mr636231a91.25.1720083367671; 
 Thu, 04 Jul 2024 01:56:07 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a97282csm962572a91.20.2024.07.04.01.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 01:56:07 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Thu,  4 Jul 2024 16:55:53 +0800
Message-Id: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Zhaoxiong Lv (2):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan ekth6a12nay
  HID: i2c-hid: elan: Add elan-ekth6a12nay timing

 .../devicetree/bindings/input/elan,ekth6915.yaml          | 1 +
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.17.1

