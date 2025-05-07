Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9879EAAECE8
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A566310E8B3;
	Wed,  7 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XRVLCOTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666010E8A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:39 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-72ec4634414so161085a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649359; x=1747254159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=id9bhPaJz6moPdglTk4FYXKc5tAiLx4T44z9LJHeLkM=;
 b=XRVLCOTppbjAXN0uzKSO4b4luvlKy9FBIknRdxHMCo2iUwPu4TO78zdL/ENRdjCIoM
 oCUoLijAUrAIx7InG2/NduVMwIblTWn8Go1Qdl99LodtCDBr0INmZ+H2OW3WkX2Glzjj
 V3BRfNqHV8MOBNBw7UIt7gutvnvoi03n6vSzfO3OFp1BhLhBko+L7ItiF6QafBkK7sE4
 55XZJgKjjThk/AiwhwMLA+UhGqB0o9Iu4WKMw1pgDBwaNDvlH9zNVC9LRqBu+Sqd8w9X
 PkWHE4MaI2nB+2rrOj2UMG1LCN1vkzyLnaSy/zgevLlyMVM5CX1dXGX07YfurVTuovLp
 MCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649359; x=1747254159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=id9bhPaJz6moPdglTk4FYXKc5tAiLx4T44z9LJHeLkM=;
 b=iwrBCm59jisU52WzYW91Evd6NF9UZdwrXklxRrU7+1mXPpSe+W9j7zpSRYMSdvCR0q
 OZApMhXE4IrmF4mGftQzTjheY8VjLjhw3pMbGvRCFY4/9GrMZmDDbBSSwzB5Jc46FIMe
 Q0s1rojNz2udRhS4rLgV16MUDRasRhKpY0uQ/yx9Fg+y2Bl8cGJpb2L9wzG6IqSPXBKs
 ao6WMgG21kpm7N4AV+ZtMy8wqw3sOxiEnpHGYJcNwVTtIHsPACgVEtxtPz00JknHXBME
 NaZ2y1/9/2YGncgvXk3gIUqOvDMycX8pH5K4/fZgWH/phl0BQOb6/1d2/vATVNVgtRC4
 lIRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd/AP+gGp83jdv19i0+iVKLgl9isgvTHVlt7Ce7Irkg1jcoDWjuzp39coOlj4ifniMN156EKAOvdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaRN3WkBTUmm89sC76qpm+oGwECtGq6d3R1TKqh654zLmNG7W5
 6uk7mbcdz/J0Cj2ik+umE8c546Fx+SEYtHYMMD1HPwEn3RUZJvmo
X-Gm-Gg: ASbGncsEBjs4MLQKR86AL23/q5oEYoidGYNav+L9acpPk8ZaKBzVKFOjVCeZ57jb3sv
 wQo7L/QgdAQ5Umzh7WRzOyxFlUp6tGwrakBRwWQYXUbUW1REj7zhtu//G/q+/8lcsppZeekIIkI
 Rz4ekI3wK/v2bX5Xiyysto8oTj3niXeDAzIzAL6Kdp0J/eGAum7LCUEkrxqIJAVsSRZt9aLKYIg
 37yJjKVJiPbxbZyV7cYGeg/J/Fa5k9uKJ/bpZbslhOv8gKaPpVS7tQC4L6QathP/zT0h3Bt5nZP
 PwFo/ZI+qCno9kmvT26FdEkCIgtVyhw/9XYvhT/J4PHarAImueC0QytDyai4
X-Google-Smtp-Source: AGHT+IFO2FSa+xQWdLmtuKlKo0tEBUduiG8HDfdozWd6lG/VFdAHRJZVwS50QY1s0aePXNuu0vX5ng==
X-Received: by 2002:a05:6830:418e:b0:72a:48d4:290b with SMTP id
 46e09a7af769-73210b239a5mr3495379a34.26.1746649358947; 
 Wed, 07 May 2025 13:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 15/24] dt-bindings: display: sun4i: Add compatible strings
 for H616 DE
Date: Wed,  7 May 2025 15:19:34 -0500
Message-ID: <20250507201943.330111-16-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

Add compatible strings for allwinner,sun50i-h616-display-engine. The
device is functionally identical to the
allwinner,sun50i-h6-display-engine.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../allwinner,sun4i-a10-display-engine.yaml   | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..81a173b41534 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -48,23 +48,28 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun4i-a10-display-engine
-      - allwinner,sun5i-a10s-display-engine
-      - allwinner,sun5i-a13-display-engine
-      - allwinner,sun6i-a31-display-engine
-      - allwinner,sun6i-a31s-display-engine
-      - allwinner,sun7i-a20-display-engine
-      - allwinner,sun8i-a23-display-engine
-      - allwinner,sun8i-a33-display-engine
-      - allwinner,sun8i-a83t-display-engine
-      - allwinner,sun8i-h3-display-engine
-      - allwinner,sun8i-r40-display-engine
-      - allwinner,sun8i-v3s-display-engine
-      - allwinner,sun9i-a80-display-engine
-      - allwinner,sun20i-d1-display-engine
-      - allwinner,sun50i-a64-display-engine
-      - allwinner,sun50i-h6-display-engine
+    oneOf:
+      - enum:
+          - allwinner,sun4i-a10-display-engine
+          - allwinner,sun5i-a10s-display-engine
+          - allwinner,sun5i-a13-display-engine
+          - allwinner,sun6i-a31-display-engine
+          - allwinner,sun6i-a31s-display-engine
+          - allwinner,sun7i-a20-display-engine
+          - allwinner,sun8i-a23-display-engine
+          - allwinner,sun8i-a33-display-engine
+          - allwinner,sun8i-a83t-display-engine
+          - allwinner,sun8i-h3-display-engine
+          - allwinner,sun8i-r40-display-engine
+          - allwinner,sun8i-v3s-display-engine
+          - allwinner,sun9i-a80-display-engine
+          - allwinner,sun20i-d1-display-engine
+          - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-h6-display-engine
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-display-engine
+          - const: allwinner,sun50i-h6-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0

