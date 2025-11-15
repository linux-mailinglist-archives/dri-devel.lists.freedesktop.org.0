Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C4C606DE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A3E10E2A4;
	Sat, 15 Nov 2025 14:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AdJXZGnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D32810E2A7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso239487466b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216062; x=1763820862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
 b=AdJXZGnz74DmGD/s0KUeeuZHxlUmzhXtn9m4Y/l7WJ/I9e614FI8jH1AGQusQqzX5B
 /OF8vJ2fRybxuB4Ea/o7V2Xj508ydbcuQOtkjhhlNeKzYWaRkdt4+KrG5OL/gPhbu4nN
 Mmz21116S8EhYUNZ8WRSV6F5VX/Dvioc/lV/lgadGKQ9+C6vlyvTdBOlJ/r63xkhg7W8
 GLzNCnoZYqe7LQ+ObLVFHSASF2WV+ZXHNfCbpOA3fo381eKP44Niy1ze60Dhytugmafw
 MuU2/2NSkQbJKq+Davnl2rFuU7vO8aNlvBpBg1VyYbCPEXhN/xkiixopidAtzDZsrPoj
 ViMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216062; x=1763820862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
 b=UZ9/xECpH9ZJoRoRIWF+n/hIlHLVFiOT8N3ifCZJ0NI36poLJsfxwWK+l7XbnXw1yu
 genDkz77nqkVraUkh7ScMjPTcltmRp95lcjOZTtsN2VnpiFcCGOfriF+SxHmj8jREqoI
 3J5Wn67bTPC5sLZ6CWaDPgNCcTtNQTV86reiGjtAQ10VtmHYllFh+nKuviK5AjwBZobh
 LY5ITXtWI05uOVnlRqxPb+3LJ3syJR4wYNRfgB7AQAktEZhnNHlYUQ/xhpchMSGajKPw
 tRcs0M5RmuSTQguDRCsvrKIKhF3yWLBS/9Dez15cdG3y9FOQ3iG5REA9kqaDJMHJSUDB
 JcRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiQ8LPmdh2pah0+gyyGz+c5uAfOsRV11Ftw5Ju4SKH/gJfNaNg3z6Gzii5r9IALOZcbWwHYFbGXDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXxXap5EkKaUIJjaZsZxF2uzYUEFdF4PuRh0qUrgIqFKyoox5q
 dQtgG1aHStgvGRmaxkA6Ku/XutWvUZYMSiKUgkeRnPsk3GFUB0wITCF9
X-Gm-Gg: ASbGncs9x4CvyCVxFtC+QToH9Jbq6dAJbuzqrVsbVfkEAOGkknmIldADswYO5DVBsST
 /yLjiEkXyM/fWoyCkb72G+IuB83I3xBrmpfxvc2IpNlp65JR//bvfLDZ9dkx65AM2yCwvzF+TTI
 YzViPclwl3AY37wmDHwj+HqjSLQDtucG11ludvr84euvnxFJg1JohJgFWuP/t1yCenA5OobIHmh
 +BFtrBXzJPxRWKX1N9o8JwzrB9n5ijunQzoCDYb01Bng/9TRvgEou5wex47A0j5IerCLEO8CwlH
 L2D4CNo7zwZXjxI5mRDoNRfAcAperel5KKZ3ojfaPVKX4EB3Xg+B7UZo0+l5Yuoo4vM9Nl/2uw7
 1VBWhl4AbPUmbGVMsejnhQK4J8UZBxYmt0HmRVZQJEMyogkVnLu06/MD9RFP3v624UcrkKdVhtI
 F0hA4hCVUnnjYp7XcO9eaewbLZH89xXQyLUQCpXU+DqnwCNLHTeUeD5WrQd4MsCxZM7CQ=
X-Google-Smtp-Source: AGHT+IGK96g9RzM8eg44aCNe4s7zkdHo6HIsmO/rv+pQP0RPewfWCNhEzO33viKn6j62oVKNtGFutQ==
X-Received: by 2002:a17:906:fe07:b0:b73:870f:fa2b with SMTP id
 a640c23a62f3a-b73870ffaf8mr113667666b.27.1763216061567; 
 Sat, 15 Nov 2025 06:14:21 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sat, 15 Nov 2025 15:13:46 +0100
Message-ID: <20251115141347.13087-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Update DE33 mixer binding so instead of referencing planes register
space, it contains phandle to newly introduced DE33 planes node.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.51.2

