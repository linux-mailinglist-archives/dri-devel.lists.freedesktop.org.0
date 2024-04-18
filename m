Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91CA8A9701
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 12:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C987210FBA9;
	Thu, 18 Apr 2024 10:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="J3cJG67L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26E10FB41
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:16:09 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6eb7d1a5d39so316278a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713428169; x=1714032969; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jJd4b5GIeq3KKj5gKwLyS3L0URtHswHqGyOVSmgZgE=;
 b=J3cJG67Lh9WB2mwUQCEGExlEQKoaqWTM+oM5bFUoBcFyU3piEitNBB0gfS5addDnSW
 kAHx1cxU25eXSchWzMI9ax+3jqmws62qmO8Pz6hy9Kz+PHmxTlaPaU72NgvQ/dk41CL2
 fy1BjC3JMKr0YwBuWqEUQoAnpjqKaLYwKeqcBCI449e9pYMMW2JAVEY828ngMddd0NQk
 tgB7CemGWX/n0K4YiSChn2E5cRXWm3CkCUrQJfdWGc+tePmk7UH3V3P+kDgSa9+0yzMq
 XHdsZqa2exOSGuuiaSgrcG7MJGbfJIpF2J5vbxVUx279TMKAM2o0epfuZa0xLxlZM4fI
 QnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713428169; x=1714032969;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jJd4b5GIeq3KKj5gKwLyS3L0URtHswHqGyOVSmgZgE=;
 b=dU2oy5JPVGsDgn5QkdQEjjcUO5NFxfc/sNHZEzEY4l7MqnMJWYrPgC6j5X+Jv53D48
 psMcvdx/HS9rS4mTslcb0t3iVaXfmltYwovAsTzmcKXV3O5cGIugb4XYcJVHoakn5Cr5
 3XhkHk5JDuvhLM48a5LUepWbGGLa7Xk30gD/uDm0ekb6x60nn+Xj2u7zhnPmDT7ZAfNq
 QeNoxALLWkcs26N/kF9eQfoYy4Rz/KK3susNB/SQqr+X7MeQt37FgIO4PiSJT6sPWQzm
 SA8ERHwjoxD9HuZPK/ktQ9MuHrq5QIWu/fWK7qj8GHN03labj33EFqDdIOuEuDxFodAe
 l+aQ==
X-Gm-Message-State: AOJu0YzhQoUE7ibENLDX2LHKIbktILzzvk47g+XOHyCL6n9oYG41RmTS
 LozamXk0Hda/m+898/bj+kiz3w2LlChZ7WzmLWRMh1J5f9xqtx2FjGpH8izxZ0I=
X-Google-Smtp-Source: AGHT+IFjDUrGwm9kDxD+zeSPOCUBeTz3i7kYis3qMb3lTFVeiheqy30dloEzF9ToaqSHJSuHws4RCw==
X-Received: by 2002:a05:6808:60a:b0:3c6:e0a:f3c8 with SMTP id
 y10-20020a056808060a00b003c60e0af3c8mr2096740oih.35.1713428168829; 
 Thu, 18 Apr 2024 01:16:08 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a634e52000000b005f3d54c0a57sm881394pgl.49.2024.04.18.01.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 01:16:07 -0700 (PDT)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Add kd101ne3 bindings and driver.
Date: Thu, 18 Apr 2024 16:15:46 +0800
Message-Id: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 18 Apr 2024 10:09:14 +0000
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

Add bindings and driver for kd101ne3.

lvzhaoxiong (2):
  dt-bindings: display: panel: Add KD101NE3-40TI support
  drm/panel: kd101ne3: add new panel driver

 .../panel/kingdisplay,kd101ne3-40ti.yaml      |  63 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-kingdisplay-kd101ne3.c    | 607 ++++++++++++++++++
 4 files changed, 680 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c

-- 
2.17.1

