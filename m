Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A0B56AE5
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 19:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2C10E060;
	Sun, 14 Sep 2025 17:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LEUBfyMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809DF10E013
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 13:14:57 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ea3d3ae48fso177341f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757855696; x=1758460496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=trovOubMvRidAW+mhU2Jgw87jFAcVgjTEKFsXv7vGoI=;
 b=LEUBfyMemyBW6cS1DItUIwHyF1HRt5k5J4oLfihN+nCMDoTSmniY2uinpddkQKWmyx
 LrO+sDvfS8or+9mozdq4uWjj6SEad1nRBn1Na61lVnD27SRazU8EW6zOGeiEpegjbgMG
 rt7oUG42b11OXIxj8mxhzR89C05+3Mx9llnA7VzpBlEmMgZdQPE+6RRzbQzULpFX6D4Q
 95rPdupKrKP+RM/7+iONzWH79yWC1VZ0zpOdgjZpE38G0e1jjmaa8lbvHBVtkpvbPsSQ
 HPwdquGLSDIKG8VuZJHNLNNY8p614UXOkRwnWLJ7WRhktckrKB2PSMmODAJWlQ8scJ/u
 b4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757855696; x=1758460496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trovOubMvRidAW+mhU2Jgw87jFAcVgjTEKFsXv7vGoI=;
 b=Ev1yh2ORlsT8tuMgXexJJCICJL0cTHZseU3jVyk26gBbXIeF53hwRD3Uz87ZcC2iJ8
 ti6CSP8ld2HBd6eh+O2uKwKxKZgHnUDrxHnIoftYtnzkRZXpJA0ecmhTFt/OIcKExBG3
 3owgM5qIF/MEIV/moGZ8s8X9SMhVyv6B53gXIZ9BdiaU4poyU67ozz+zxp3HzE3QZcX7
 XNB0Gdrltmq0HEQvKAYFa6Ogedh4ffySV/KcFg+IKV+cmKO9r3y7MF1+/m3J0SfMVmgX
 Xf59gNT2nHMliIGNuEYra5Y0nqS3LQebECWAmMW4kMCaA8TVR9ODJN0j0nqOycojHi6f
 yh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7FerhtVBUYAGiPgojxGAIktROYofiXKaysIzUCxPl0jtE9ph5bKNZRTC5Tbysf5Va/Z77c7U7khM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi48YAq8bOknjDAHSgnpN792phL7RVjGz5pmfWvk4bidaALSfU
 yvoY5h/+Zw17duBDikX/NURupOXAtdJMAuVFdM9ZvJX9QQ3GHFuSI+0G
X-Gm-Gg: ASbGncsKP5FzrVGsfk8xPLwDGol62/DdBjemvb+xfPo/fz6UhPdZc71cMpk6kkHtIEc
 RENHjahbH8A0lmWoph8TjMFdt347coa+0hCR0IvvlIv1tLND15rCuHjC9nWHa/AAhNB8ylIAmYz
 bvpeS54oYWV2v7vU8qjFB+4wRNmVY7WkR97ZdXl+RYhAji0xuiL3tFurEA99XnrcvOYUk5AaknH
 BsbxPce9M7sVhJfARj9IIKCvVUjerZ9kKtN/tl4xjhHaHlc3csK9s2z5rZ9hz0Mch6XMTtwpJHy
 S0JW6AOSgpJjHd3+WyVrI0or4bPe9+7MiTHk4ECIhIEjfjgLMD+DvMe2lh8QIUj7TjNYWXqUbHZ
 nMJMuEKBqaT+dU/24u+sIBt0XAKGDYA0s2PJNvxmXhA+fLINxHMy5gJFGdamFVxuACcVo6hgt2w
 ==
X-Google-Smtp-Source: AGHT+IHRcpNwEriTVL0pqLCUolaMHN3iy4aeYsC4oOedhjGnfClQkxnzDxvjJY0nYW7MccwibGt9RA==
X-Received: by 2002:a5d:5887:0:b0:3e7:44c7:4bad with SMTP id
 ffacd0b85a97d-3e765a36ea1mr8604552f8f.31.1757855695771; 
 Sun, 14 Sep 2025 06:14:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com.
 [91.139.201.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e80da7f335sm7255453f8f.8.2025.09.14.06.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 06:14:55 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: gpu: arm,
 mali-midgard: add exynos8890-mali compatible
Date: Sun, 14 Sep 2025 16:14:52 +0300
Message-ID: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 14 Sep 2025 17:39:33 +0000
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

The exynos8890 uses the ARM Mali T880 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 48daba21a..a7192622e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -53,8 +53,10 @@ properties:
           - enum:
               - rockchip,rk3399-mali
           - const: arm,mali-t860
-
-          # "arm,mali-t880"
+      - items:
+          - enum:
+              - samsung,exynos8890-mali
+          - const: arm,mali-t880
 
   reg:
     maxItems: 1
-- 
2.43.0

