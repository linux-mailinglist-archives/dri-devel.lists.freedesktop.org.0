Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7BE8A9A4B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91BE10FC4D;
	Thu, 18 Apr 2024 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="0IGK8/Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6512E10FC4D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:48:26 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e8b03fa5e5so288905ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713444505; x=1714049305; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBVJjQh/Nx8BXhkrFisIjtogBH13cAN8LyyArAUlFGo=;
 b=0IGK8/AwA+X/mIo78LjtuSshNYiosZ+PX6lmNi9lw1mzg191s4cpXP0Zvrbgq4WGgP
 vrJpe4XwUbZYwMqp802X7c4JQH8qpMAmzp1P8LpBjm7kOlyyxuNwpjuXs0xTOWG8qg/2
 OuhGgsmCzmPfvGDaq+1OmMuQpZs0PowlBWvx7ionALfu74H9ulzwdmDiSrUiAzuumJIZ
 zw1RsVASxazj/seL0I54/S2Pgb1fl/qkQulyQ1QY3kbtt6DHaWzW0pRmhlGLTtg3oY2a
 f7XKLfZ7lYMWcbHlhh/AHnZyFyUFDPylIkSryUS74aKhhUvk/amAhFgG7nDLYlF+aQPv
 Z3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713444505; x=1714049305;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBVJjQh/Nx8BXhkrFisIjtogBH13cAN8LyyArAUlFGo=;
 b=dBXwA1w6fxChLi0rJhBJZuU3SakQTiy2w7ZMZ0hfEZysNhHqxCkHdlOJpWCb0YSo35
 /J19JsCZ+CV8kALVU/PQs+NHuXzqL5i+QQbDp/r6HeCJ/pBgc7ySxc2CKvphwxQWsF8E
 8VwfglQRTuK2JIERk8DGE0UgyTHHhKUZXiZ9X+wnhMydUnCwCAqo4lAYOMnmhrfdXmPC
 Sf+7nkT77Hukr8gQZPQl0uGg3R0XFy8RjQgCBrrS+eASjUdMMaRCile35dJqAgnyrFUH
 BUJ2sXXnYCR64DULexR9yIHh7WLHnFCivP8OA0/W3rxLTTWEz062c+psVVYtWcO9vQgb
 tICg==
X-Gm-Message-State: AOJu0Yw3vELXcvgXqVOyeGhjAxVceONAu7Jxj4CUagdxyHsS1U5YmbQm
 TwVaYSlO5h0ADZpAZ1LlMqT3r4WlLlWQgWJ5+aZt+Fx82IP7sDEA0MWLs5Vvvi8=
X-Google-Smtp-Source: AGHT+IGSiSDDmR8LYcqwjG3haTEKWA5AkubEyL3ysc5fD6DHGQT11eT1vAj07i5o5JXkET0KZpz3OA==
X-Received: by 2002:a17:902:9a0a:b0:1e4:24cc:e025 with SMTP id
 v10-20020a1709029a0a00b001e424cce025mr2713328plp.59.1713444505581; 
 Thu, 18 Apr 2024 05:48:25 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 ju24-20020a170903429800b001e3d8c237a2sm1423509plb.260.2024.04.18.05.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 05:48:25 -0700 (PDT)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Add ili2900 timing
Date: Thu, 18 Apr 2024 20:48:13 +0800
Message-Id: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

ILI2900 requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 100ms,
so the post_gpio_reset_on_delay_ms is set to 100.

lvzhaoxiong (2):
  dt-bindings: input: i2c-hid: Introduce Ilitek ili2900
  HID: i2c-hid: elan: Add ili2900 timing

 .../devicetree/bindings/input/ilitek,ili9882t.yaml        | 1 +
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.17.1

