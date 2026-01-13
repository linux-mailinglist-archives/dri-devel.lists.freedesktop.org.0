Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0BD1B203
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AD10E548;
	Tue, 13 Jan 2026 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nek8yepm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B22E10E545
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:53 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7cdd651c884so130116a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334392; x=1768939192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8NK3Ykk7hfqolFaWL1u6Km9KABPeFUAOu8kCyf074c=;
 b=nek8yepmDG/QctgsnBgI/EU0eYYmFRR1iAK4ebjKZBKD16evQp/iyJRObT1Y8ibdZZ
 0u9YuYij/gVMln4C14BWxcdciH1Bo2q3K/jDsa5g7wZoXY4VW9HIE7RwN7dQd8cAIOdO
 7bhiWQzsNfjPqFdM/uMEf4/5TRvrCZowA7lPvKKMbEFdnIBc9v57qInGkwYe9yAfC9pk
 5nX1KJf1oT/ZnnMwY80z5S2ysKEmdtLjf25lYkVPU0Z41UAkbG3IvK0i1PrOhZszN62M
 VsQP9dqD3OzutUsmihkJ3EIKUu4FZT2v4YjR/KZiEI2xZ+vIaaB+fcg8yjS74bWHVUrO
 b0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334392; x=1768939192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M8NK3Ykk7hfqolFaWL1u6Km9KABPeFUAOu8kCyf074c=;
 b=s7mpMwr6IMOvcSy+WimnZkgk9NcyGwgbY5WaPriaRhP85DozFNUlpiZw+3JoGHIoLH
 B+C5W1ZRWD8sGNujpzQ0uLEbE3yOXAjKu/h6LBLD2l+efzRCbFFxZU99KHi55uGjeap9
 2pznU3l1QslQEt+/oLu3ENBSQ3Y+RLNDL3Sd6lUfot/EnttQ1WEm8ore9Xc6k6rmI0bQ
 SbWsXDG2nJmaXpx9cKL44nI1IUL8ppAxKfB3lniOQ3rgHCn1QYltL/gFOlSbxSkFY3SW
 0XiJc+UX3Yn7SE1OtRaJWWots5NHZbXaHwWGQksb+H2r7oj4LXyj2kPFCxlg71H07C7d
 MnLQ==
X-Gm-Message-State: AOJu0Ywijst0Sh0whaA3cmP7M+t7n1rOkFJVAmHrmVLJrME0/M9FHNJ/
 /3r3QQIbNNq82TTZk4HCy03tUW4Oszdf1rv/wY3/oOjcU0MMeVKEBtZF
X-Gm-Gg: AY/fxX58ddlt6Dp7Bvd/0rEw2BAkzwnJRse0ET/OCpnmkwKGeYPTlBvEge08H8Yc/E9
 mPV0dLEskj7BiXOetKsywFh7yxmVx41tx66o4kBSRyUOQtSoqrI1HK0zif0RT+W+ZYO0PyeruT1
 aG7jjoqoKcLSAHgasnr1Vuzy0EUS51znxikiNLwdPUNZaS5tfe7c9YdBDMtqGA46Szolm6CbYMM
 cc94RMeeuFT0jUI1AppNvfpjAdFS+2DQa9zMInl5KA0uFGrD41ON6BnGBdxEpdfTedGqJDpnMbJ
 o2Jj2+kgbOZv4xRr7APCfYQMvf16Y0SRPR7dSDnbWaT7TREHgcObKmACkLe35+Lo9Ow4zVbZh4+
 uuq4G3j7mL7hHGsRwctnUrQm2jGtrChJH+RFHICoDkpWEKDMLuFjmXKvHkwUbbUm+pur2gNlu/C
 80bA7fy7X/
X-Received: by 2002:a05:6830:2b07:b0:7c7:e3b:4860 with SMTP id
 46e09a7af769-7cfc91608camr140237a34.10.1768334392359; 
 Tue, 13 Jan 2026 11:59:52 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:51 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/6] dt-bindings: input: touchscreen: goodix: Add "panel"
 property
Date: Tue, 13 Jan 2026 13:57:20 -0600
Message-ID: <20260113195721.151205-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add a "panel" property to define a relationship between a touchscreen
and an associated panel when more than one of each exist in a device.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index a96137c6f063..a26a54d63a1c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -42,6 +42,8 @@ properties:
       address, thus it can be driven by the host during the reset sequence.
     maxItems: 1
 
+  panel: true
+
   reset-gpios:
     maxItems: 1
 
-- 
2.43.0

