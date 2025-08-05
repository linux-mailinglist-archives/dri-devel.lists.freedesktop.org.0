Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B077B1AF32
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A3610E5EB;
	Tue,  5 Aug 2025 07:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IeCK90zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476D210E07A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 05:40:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-76bfabdbef5so1823540b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 22:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754372414; x=1754977214; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0tyxnWiAFtFlSMrrHDitQKy1NpdPNb0xJusSz78MXaA=;
 b=IeCK90zDVmtNO0sTjl7XM0/FIqS94JX9Di4GgJmtk/dCCM9oFrhPb9q4DhZmTz9Hbu
 mD1vOUV5sFItPxYxWPYDKjZa2+ACTezBNC7e3Jb2EH+D1onQcM438+7DClPxmRsBwfb9
 y+HcWI66on9FR+zSBlbRWNsG/4mC+0VNlMxkQQNjOwHzpM49VgqbgE2xOjvuSMwMLfrQ
 TJExXgHkVUhF30VDIeoXEZMvK0+PSPtrLKVygyUP+Tg0oDMF0SeNjZZfmBc0Qdoe/fBx
 6tsVyuNg3ZOxKBuvm0SmYk2URi5R1SPibwZR6tHbZtDsWu4PO5IajKmOG/3iNIB6LFx3
 pA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754372414; x=1754977214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tyxnWiAFtFlSMrrHDitQKy1NpdPNb0xJusSz78MXaA=;
 b=WHzP2pQwbsAoXYIWffEZj1LuACOM+moqyO+BHi7NflkHzmp55TzYyhDZQ0SDgZ9cpX
 Fw7QJ6w9LpBn4XSCP4x/JDGrU8v5Xl1PwDGnCnaYfwOpe7hzo5xcWklztp/zdSmuM1eu
 51OFd7SGeHuXmM4cYzvopE/fNZxv5FwxzDVN7h0+0EEhUUoYBaKyos8eOVsLazigNSxE
 SCM+oqefNt9OjaR9KFbf6cTF29lRlgc7MPCxpbYuq6Qy9l9FmAZv+XmVekPqhCisLKZD
 yHuOTTYbFtDICNn1BGmGi8SnHaKCGK3TjA/8Cd82HDFgCOvKNdN+v/+Fp/KDDXe6kou1
 4xXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYPALChmqx8Hf35OVYWJZ502ir8x3fp3BLGdkWEWhGdanf5FSaz/woBhdT+lmMJUI/zvBtKMmjNTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6sqOtxpjcCK4I0Vc10BIdamFgPd8lj8KTIBI6Js0iDIOKiG8i
 IatDU+WGVeYbM3Vl1E93Cw7IxRHjAJqOS6Xqh8b13j88Fv+e1WJzcZkU
X-Gm-Gg: ASbGncsM862UI+dEGIFJPv+2ES/pTDrD8O46EtwAwGwibT9AnXncrV0fljGO60atwSJ
 xtQaNekOzmbKL1Nn0iC+TALpnofQztARlbFKJbY2IOdL6pUywKnvoU1OnCuz03jwd9JclDG5o0+
 m/ACCw4c6kFTDYGH5UhijUoD8SDu3bhhmk/IntBI6b360s81fWD6ZXOgY0V+E218reIPqj8Lvls
 UqrcmtjInTVNp8oy5FiOtvik0BjEfmjd2/jvz4qfJWWIDNdO50ODzR5vpWrvP7ism2EU3V2HgkX
 KvST24uBRcFzXZT2jGGKcjFfLq1YR6Zc63/I9TG+VkCByQh6H936QZV8OMqUhctCSRMwvBwuNgI
 oCp8WSkY5KMiVi6QkB1URhaDkHlh3bGveFIzNYu+sdc02mgAcTIA=
X-Google-Smtp-Source: AGHT+IGePr5uTZDmO+y+EyakLuwaq478+JYPVKTZVU6MwgVtxFRA+ioMxYajV/fCZcclCbOjTcZI7Q==
X-Received: by 2002:a05:6a00:114a:b0:76b:cadf:5dc8 with SMTP id
 d2e1a72fcca58-76bec343109mr16169245b3a.9.1754372413653; 
 Mon, 04 Aug 2025 22:40:13 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 22:40:13 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 05 Aug 2025 13:40:05 +0800
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-drm-v4-1-94eaec01598d@gmail.com>
References: <20250805-drm-v4-0-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-0-94eaec01598d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=yJeEvLDqfY9RmjyBxNg8z+4hZIvaGh+lh39+Eku8oE0=;
 b=TpVOKWNQjqEOKfBGb63DVFiEfig4TuIFoV/0j6X+QfaE01jUZRXV0D29QzF7cjWg1udZ9U3B0
 6ileka/I/ofAfz/PV9pwP1Bp8eNGxiUm6VF6j6KrdsojIRQqUSKT1gu
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 05 Aug 2025 07:11:30 +0000
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

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..a495dab4e87f65a4a44cefe1e44c8f4425a89c29 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -931,6 +931,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1

