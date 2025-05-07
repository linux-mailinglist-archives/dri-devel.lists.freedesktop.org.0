Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75FAAECDF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E8F10E8A5;
	Wed,  7 May 2025 20:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MoYDxRSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3B410E8A0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:33 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7311a8bb581so159594a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649353; x=1747254153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxQUx7fKiHIH0j8UlXMnlb4egqRRUOvhz4vjyisGI3o=;
 b=MoYDxRSX+XodbGrT6pf4RmAgCcYCDeC9HPhtjW4esIp/838I8e2/jMmGtFiWCysW7p
 B9DDpR+TsHd5GvEpjc5Az3D9rurKqlz9196CzrimVOPBe/3RZLUfGkdabh7zqFJQjwdu
 9Ecd8IJeOoyhiEuHDRaYoCm+JLvqsFiwxhAq8tnP+nCREt73bHyOtPQhp/hVmsM7383I
 Mc3TSG+/fHx31ibl0VhdrfwOpaVvx+c9Cz89RKTGDMvz0evMxVXkrIF9v0GWGZbhmvdM
 0Wv/Qs01rhpxoWqDMkxr5XWP2nKG2tbQxCkUiZakNwolRxDzqNn5dur76Y8+7hbJDXYM
 Qk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649353; x=1747254153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxQUx7fKiHIH0j8UlXMnlb4egqRRUOvhz4vjyisGI3o=;
 b=TAkghFmX2dhEebYtTps6IOcmgkz03IA9jIccjc4KGvOmiDS3LK7yGKtr1pjBqRWaBQ
 Va4xxZpialvCb5+A0OQ4cq1O/WyG6LWJX3RgxpL4k4+I+fkbrOxPTY/LzlQzIYfYjzUP
 q2o834JDyEAaN/nHsMtV7efmOPOO60NIMXKCP6us4ZOMR1ABFyZ9Ftn3s9aTSBHwB0es
 SJPW/VwDWIvkXuk1QTMpJ3X6w58l7Wi5JaY0Iyx3IYkA81mCKKiCS1vUfJ1sUS8DBSXP
 uRX42PQoFlodErRNpSeJooFoIf6AZU9zuVGgzJHngyizwUBgItWCwpr9x66D2EiYuK4H
 rVJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbjkEpqZF5u2vk9LJtRDEYZieTaVsxail3qA3KiF5VKMNEfvXfGeQfW6raYYnhrATVQcM0woWQ1Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVAMVT6LcuAKQ2HahTXrsYdnDuhlW6oQsvHrszg84UqNZf3zNV
 TtBSegzyVu1RjZsS/1Mi2/npbffPPgkKpTLQPBZ+ZxTbODMW8mkE
X-Gm-Gg: ASbGnctEDs8gncXXtsSDof4fUo02xeb4gCXJbBlfA9u9tPmXurh/YDZky/wpbdCyrPQ
 xOQ6uyvqDsmoQlpFbtAyqihwduiWEd8sy3rwy0i2AJRS5vULQQxS6QC3kj1mjEx+fA30SxW5dFT
 hy72xUFlPEWHy0w/wOZPxXLuts1kWYkugUHFLtwTehxsOQX7p4R+KoOc4Bpcn5To6kPXwmnzOD8
 3nWw1wpvoo+urF8jw2qMyiwg4g8OnXRCm1/fyacz2zoqtMpD4ovdcBOrucVMdQsMwSWMaoJ8/eS
 aL7XdVYdj5ZFCvA6jmcaFuMen6TkFzGlSUZQgA32qEtgLxolHGCWPJnJMUbNj8ARMedRwwU=
X-Google-Smtp-Source: AGHT+IEMEct8naOkTFIeGyQPkn5Ud20cBlIEl2qRYyNEjMLi4um0W9nrFDNK/o4EsMHn/xzNU9D3pg==
X-Received: by 2002:a05:6830:3489:b0:727:28a:1ca5 with SMTP id
 46e09a7af769-7321c56f3cbmr461230a34.16.1746649352889; 
 Wed, 07 May 2025 13:22:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 07/24] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Wed,  7 May 2025 15:19:26 -0500
Message-ID: <20250507201943.330111-8-macroalpha82@gmail.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33. Note that the DE33
requires 3 register blocks instead of 1. To keep things simple
remove the maxItems value for registers for the child nodes and instead
rely on the bindings for the child nodes such as
allwinner,sun8i-a83t-de2-mixer.yaml to enforce the max values.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.

Changelog v8..v9:
- Remove maxItems from child nodes completely and rely on bindings for
  child nodes to enforce maxItems.
- Remove reviewed and acked tags due to changes made.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..9d9418c40b95 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
@@ -47,9 +49,6 @@ patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
 
     required:
       - reg
-- 
2.43.0

