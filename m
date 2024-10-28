Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAE9B2CCE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F4410E462;
	Mon, 28 Oct 2024 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gsPuGcXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8410E136
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a9a1b71d7ffso625957166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111184; x=1730715984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rR+lzb/We4vJpOJMhvb0fzb6ziPa4r87OMQDrQMxLAc=;
 b=gsPuGcXp6kPfV8iWmjrNWodlkfPg95DeLqz+CbkTXuwFxgboAedx6Smb44lRrOyyMt
 Ve2wC/63P2AvIzDmGhuiRa0GzEte3i8pufEJ66mkbtQhGyOQ5fcBXZuRdQU0RDvRwW8f
 RW0Hu8PsgIXtfoxQolTtQqolhKtPR05kNoIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111184; x=1730715984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rR+lzb/We4vJpOJMhvb0fzb6ziPa4r87OMQDrQMxLAc=;
 b=j6Y23GDti4FN88aji1KnFy7S6/B+SodSSr7BGdav+2ulUYhg8M0IwLuSMfXQ2DY6ON
 EO/cQ0M4RtTLw9TW5n3WECqqE2vdWuORq09G/I296hlwP3jN5+yTv51OscXeX9lcNJTp
 00CLeOrrAjHLN0f72sYU1GDjxxzFvPZj9WREFphkVaVSnFXhdw2AzQ+bzlXxY4m20uNv
 kI8RL7jtLlGrdIHhsFFCct9ckL2/vji68VIlBzXdgUgAeomM3TwdElH7QFv4qfKzgzJz
 cwuvhlAEnOHdsgNxojQw3dG+pofap7lHeFlikhtwtrwmuo+WicNt7XBqwArRf2UjLpla
 4kkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuw3Agtzgxk0LAbFrQhL1nkgYKbLHsfyCFwW06rLSInAczUzdnGrSHCcSHvACwuZEqQz+ag0Kv47Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfknnIth/DEGIBJe1L0LzRaAOvj5VmC6trDPfMAmyEP15ZzoVk
 N/YSiAJ7/vCMaVBEEib1GhFQ8lWKuRmHrwQFLBy1eruO5pTQVSwYaPZ4NjBtclk=
X-Google-Smtp-Source: AGHT+IHAVYFMAgB+KAyZO87/7sx3tp0rbXix+BIz1smt6N19gM+Y6+v1PukMzpc/m5GRKmJHBaYyMg==
X-Received: by 2002:a17:907:7e91:b0:a99:403e:2578 with SMTP id
 a640c23a62f3a-a9de5c91d04mr907125266b.5.1730111184145; 
 Mon, 28 Oct 2024 03:26:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 09/10] dt-bindings: lcdif: add 'fsl,boot-on' property
Date: Mon, 28 Oct 2024 11:25:32 +0100
Message-ID: <20241028102559.1451383-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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

The property states that the (e)LCDIF display controller has been
initialized and left on by the bootloader. This information becomes
relevant in the case of supporting the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..937f108daacb 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -71,6 +71,11 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
 
+  fsl,boot-on:
+    description: |
+      The controller has been initialized and left on by the bootloader/firmware.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.43.0

