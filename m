Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F878C0BAE
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A37B10E404;
	Thu,  9 May 2024 06:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="HYNhSn25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C748510E404
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:50:30 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f4496af4cdso554585b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715237430; x=1715842230; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JUD6JeUeqy4EDOMZvaUaU8rJSme+do2VQmFMoN9eP8=;
 b=HYNhSn25EXD0GTZ2KM27kEoIsIC3CUsllhNV7lz5t3/MZrAr+GuUGT2fkykg1FnifW
 NKIEuBM9H2GHETPGO3Nhvv1X6oTE8yYvZTxFKEKwGymKhske/H5WVnxOA7VkHbko8eNL
 jiBaov6ySIu3L+SHTPQEc5fOAGD4Lnf2mrHsR/qVrlJhLe0fkKsB912otllBniQeasUi
 cq3EHkaQk3vUQbJNL9NSw4Zx2lSsnmIy4gXSWKtdzdB5e+18+wzGR5EoYwMKNGR6RFId
 UquPtVepIFkwA/lJsw2pwMT4cmwOmy6ri/OKFwcpJR2OJlaaFK5BoAHs3lF8o6AuywvN
 oGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715237430; x=1715842230;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JUD6JeUeqy4EDOMZvaUaU8rJSme+do2VQmFMoN9eP8=;
 b=gS9U8HYJT3pHHsf2htAEF+0QdfARJstb381PCqwDfQaGkhVLgB/9QPGThnPunDV6N+
 yY86IFI5VRLJvhLNCoaWVdt6QmwGEie5aJ3Eov2kCD06hnmTbjyQT/WM897DmTNLPwMN
 EqwsnI56a/GQUZCkG1evrmTzVVtbyvwLLGcSS4Z8kLli5r8N7MA1vVJ0+aodFo0Y2tiR
 rg98uyzzs2u1249Xr5l+sArpORdoZ6zdgwu6K/mHUGtjPU/jaBRcDS+uMcZCnM/75qCT
 KtHw7Vxm9dHIrLHoaX3rH/9ryhdrALkA96G+osudjDYj0PA0RERjdTCvT08ENO3e3zQ5
 2rqA==
X-Gm-Message-State: AOJu0YxmzSg+iNmBLXY3wB2Ww1mz2CVgEhN+sarhgHN0TtDpXs+xDXts
 kcZhB1c2SISCCLwyx6QhAA+T9u49PzxS3ki6mRNEbRt4DWBUmGpsjaYAorpzgOU=
X-Google-Smtp-Source: AGHT+IGIlroM64N0tzcOuwqZINRbt4eE7exWvM0jiOPyVjAiOkfOGMjYLCS5hbxf7kIlKYsqyYhiQQ==
X-Received: by 2002:a05:6a00:1b55:b0:6ea:7b29:3ab7 with SMTP id
 d2e1a72fcca58-6f49c27f72bmr4931054b3a.23.1715237430274; 
 Wed, 08 May 2024 23:50:30 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a84b6bsm633939b3a.74.2024.05.08.23.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 23:50:29 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Add starry bindings and driver
Date: Thu,  9 May 2024 14:49:57 +0800
Message-Id: <20240509064959.23550-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Add bindings and driver for starry.

Zhaoxiong Lv (2):
  dt-bindings: display: panel: Add Starry-er88577 support
  drm/panel: starry: add new panel driver

 .../display/panel/starry,er88577.yaml         |  59 +++
 drivers/gpu/drm/panel/panel-starry-er88577.c  | 444 ++++++++++++++++++
 2 files changed, 503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-starry-er88577.c

-- 
2.17.1

