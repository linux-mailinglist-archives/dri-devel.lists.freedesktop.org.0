Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53791BEE6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970C410EC2E;
	Fri, 28 Jun 2024 12:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="QECNFTS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239A710EC34
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:45:10 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-713fa1aea36so240741a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719578709; x=1720183509; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rg3tdU7ppY8HgCadeya2IfmEx35gEyixCgdQukzslp8=;
 b=QECNFTS90X7jOV+7tQMZIATdTKaaA2ARPuO3++pmVlsx36f9saTONmTpXmJCU8CnGA
 5B4C4L1Rt4lvaA1c2IE7ddzF1EH+zXuzGoOXt9JhhmD+DZsF2h9HUDaxHxnVDvW1mKu7
 Qm8yHZB9Pw9EA0O6c0mpHXNxBYOHtxJJmLNXf4R6Oq4pUWKhSlMMlwWq67L5u/UtWXew
 nVlIWTMtbXJ91atS6ZBv9/PYxyRCpv9ct+JbVhCTkolHUfK/+flmRBWHCYxE6H27BSOq
 1is/F/y4qb8H7y6eI65+P77BcuZ7Ter85QgbbMyNr8KBpKTRFVcPM1ZcA7bLCrZysIDR
 7UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719578709; x=1720183509;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rg3tdU7ppY8HgCadeya2IfmEx35gEyixCgdQukzslp8=;
 b=MkMVvx57wKO6FVXT931jMzwsbgRpeAFweyhKpkbPmKHdiwAeGj66SI+5CrjtXAZJTV
 QpHtnYx+/2FeQXI6BZzr1exjfso6YMuVdatHmQkpyT4vDtDwVR8hsVIrqJdJoXNtZn4f
 jWaR316iU++KD3YphAQLIoIQJvTPgSIrBOLCXhZAabQjx5gOvyxEnSw68IUZdlZ16ZkP
 IuLEAoaV9/BP3b6K7ewYN6zoi1fMUEkuodrg1TMvcdIX2vTQffhUT4QEr2v3kAurLIR8
 NTvE2qhATYuOY2zXm+ly4+2eMH2cnCvf5DlaJjiXKwsrGgM1HnJDk31TILJSaKd1i5ib
 PKkg==
X-Gm-Message-State: AOJu0YwYeHFMVckrMbcw1l9eeFO72hc1fn7EUXSEmQSb/h1NShQpqgN+
 Ni2K/vgE+V2mmRjklD2uy0BRE2Fs7QC9iHyh4SLwAdCXBF6wh5f8YgFbuXe/pd8=
X-Google-Smtp-Source: AGHT+IGi1fGSVYxtAxmFf/MTdTm122/UI6yNXUDQyXrOEFT3f8SKiRbbUQL8tC6sqxHVlH4xLvD96Q==
X-Received: by 2002:a05:6a20:72a0:b0:1be:eae8:9975 with SMTP id
 adf61e73a8af0-1beeae89b72mr627357637.15.1719578709482; 
 Fri, 28 Jun 2024 05:45:09 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15695b4sm14346255ad.225.2024.06.28.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:45:09 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 2/5] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Date: Fri, 28 Jun 2024 20:44:41 +0800
Message-Id: <20240628124444.28152-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The kingdisplay-kd101ne3 is a 10.1" WXGA TFT-LCD panel with
jadard-jd9365da controller. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes between V6 and V5:
- 1. No changes.
V5:https://lore.kernel.org/all/20240624141926.5250-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
- 1. No changes.
V4:https://lore.kernel.org/all/20240620080509.18504-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- 1. Move positions to keep the list sorted.

V3:https://lore.kernel.org/all/20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- 1. Abandon the V2 patch and add kingdisplay kd101ne3-40ti binding to 
-    jadard,jd9365da-h3.yaml again.

V2:https://lore.kernel.org/all/20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  Drop some properties that have already been defined in panel-common.
-  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it

V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 41eb7fbf7715..2b977292dc48 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - chongzhou,cz101b4001
+          - kingdisplay,kd101ne3-40ti
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
-- 
2.17.1

