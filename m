Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8331189EB9C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B641130BD;
	Wed, 10 Apr 2024 07:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="yYDU0ZYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A18C1130BD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:15:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e0b889901bso52193625ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1712733301; x=1713338101; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMgN1wGlJBkfHf6qhNjS/iN/zmrqgeoHgJDlTShDEmw=;
 b=yYDU0ZYrxZabN+dNC4110hFyC4R5rScVFNzrxQgP3bCc4aqAGbBo6nZUa8LxuIDbFn
 juhOcsloWgEMBzKd1BgbilGua3dlwhQU//K+24IW/YkjFL4YiBJnoWr9Dq5kX4Ru23aq
 7MsDD4JOv0ozc3d8ChLZGIbjicqxEAIZLxvZddbvaasolXVyJ5cLCwgyWbcUdjJpGr0p
 bVPulLADm/ix/rhiyFsj64ItKPrAObJOexDFbzVhZ1CVOetGhGX9NcWk8lc/LJJjqx7w
 ISYEfOGpYVn/IyQ8/daRAEGAMFjhVkaET7vMo22rzosgIZ/8jp+isPMY2Wj9B2/o2CVn
 cnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712733301; x=1713338101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMgN1wGlJBkfHf6qhNjS/iN/zmrqgeoHgJDlTShDEmw=;
 b=Z/4EFeNzjpn+msqPva8woryspCT64BJTrLhIhPSloJhaLe+ULwJNVwPcmTI3VM1RcK
 fLn4d51bZt0WeDnXJ78ZJnzxKpK9Ae/6TfkfohvDQ5i3id0LPbyPUSWcogsDUpDQ2kUv
 WAonVoJMpunYtug7BAGIkNl9x04SHkoCmrc9jngEyBsvfA3eGWnVtxeY8WWkSjnxzJnt
 r576o3lG4O0DvI9i/p1ERbdUCRA6P3k80cUnqVIiQbfGxh7aGs9GfojdFvJGzbsITwGz
 fTAXd0kgsWhncvbUyQtu+HscPmT50GE5cha3Iyy8ImXUcODJa6Q2kS/88smHOtRsI6BS
 c/yg==
X-Gm-Message-State: AOJu0Yy7YXNGZxs+ei+aOuHWHLzP9O5uel+7lEyNs73bKgqKHLK/cqhk
 Rosv6cKZcgrAUHgVIkexmB4eCKFJG7qr+Q7PUebhhr8HKufKmAY/1JkwplfAFpY=
X-Google-Smtp-Source: AGHT+IFGbsYgF5UbyKw/0YINggk2A28D2EI8l1L+dqGsTasJL7COTt62tjxZ8TKej65BKBde0GIyIg==
X-Received: by 2002:a17:902:fc48:b0:1e4:4887:74f0 with SMTP id
 me8-20020a170902fc4800b001e4488774f0mr2348799plb.36.1712733301495; 
 Wed, 10 Apr 2024 00:15:01 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170903409100b001e264b50964sm10107975plc.205.2024.04.10.00.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 00:15:01 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/4] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Wed, 10 Apr 2024 15:14:36 +0800
Message-Id: <20240410071439.2152588-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nicely
with the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 906ef62709b8..50351dd3d6e5 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -36,6 +36,8 @@ properties:
       - starry,himax83102-j02
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
+        # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
+      - boe,nv110wum-l60
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

