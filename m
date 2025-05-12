Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1DAB30B5
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AB410E138;
	Mon, 12 May 2025 07:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYuWbnOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C233510E138;
 Mon, 12 May 2025 07:42:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7410c18bb00so4480007b3a.3; 
 Mon, 12 May 2025 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747035778; x=1747640578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ixYcQq0rSF0bg9NFU6d5lRXfvmxhdZj5BggjL8hxVE=;
 b=cYuWbnOAxPJ+L4sidzOdV0Dculq16OP3wmMg5z+7vKOfcFYlZNPPWmkWpXhfORo3rU
 4q2d+VSbuDNchFB049QHMoZzgr+leE3QLOFgnjFFF2rA4Kxxed5GaDEE8k5EhuQ2E1AO
 WQftZGLCfUe91A0e2od7w0YtchxTBCcoupX4ZwfnO8jYvrh9oBknQQWZTAnvslRsU6eF
 mi0wxMv1JfGvlszePKgNzWE+6SlEKHIRVSMTfJDIVcUHLg87x59Z5htLrw7l/Obyp4WX
 MuCF3W+NOGfpuBYnaa9M3A+TzRTQSfG6uaWtZelgrXvXgsbP9AE/2wLKE1+BiU3Vwecp
 GhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747035778; x=1747640578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ixYcQq0rSF0bg9NFU6d5lRXfvmxhdZj5BggjL8hxVE=;
 b=MBSLtKdBktL1r60oA83YZ36FQKQ3pkctwMwVjHMauZcHG9x8k6vdvhhCYDi0sqMhQp
 Fe4+WgZFqpfxTCs6A1xJqli2DznqZTy2reUPlHEaXx6dzv1B98RYCzCsKccX2jAaBRb+
 XDWYn/5M0QABhTWzn6frNv29B9FY9R5a4mMtHVAM1Mi7ChRWcU2mU429XbBnl1PTLq8X
 vpC1edf66NkrtYBZnIPHifgBf4rCEFvE+LgZ11xXm6IYEg4F0oPkFjQL2a9uiTgNlcHq
 adg0HYHpKzBX2Y3qdxncU4vXnBpn+C1AEjmIS2UvWf9q8w1wkJnNN6czmCmObrtUG+2i
 Ow+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj1dPwTzC1sDkwvOYDJMDKPWYQ2aIa8Ch5AonflmdIL2pyjUwMdNq0gP0yIeFcFV4VgzIypAkH@lists.freedesktop.org,
 AJvYcCXWsgxRVaECXB2lJ3+F+HnJHL88O3Gnlb5sXkmezrOdOxIgWcahlRGfDfm9t8HdGC7L7H/XByxs5Xbv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7z8PUu/33mJwzxGlAibJe4mD2cSdawsNwk0LIB+wgqQ4TIuVn
 Xm/2eYZBm77t0xy/jt3ifjWjAgmeZKV+MapDG11QGZFpc6SjCw2Q
X-Gm-Gg: ASbGncuMuD+wkdJK5DQ31NA6xGL7LYPuokidPMC8Iq/1KBn4K5YANoo591ZshTj7KjO
 FUFCKOGaKGa7gYj5t1rbeVGIM/ir/N7I4Xkm8wN8btSvzUc+L8P9vFZ0lEie9KcgIyXkPCNqxp0
 CKYZgET7fnTXypvbOYfSFI5Trgt+O013Y7p+OCgpKgZIlVB4HphGGgCLTum0176rpWIkZf7DSqW
 L4IY1mz258J9/8GO8cUvgLYk50YyLjUFxc56LIiprIQU9h7hNTiaeGjzlxIpDAMrTnGc0W6J9tk
 TmZRtDqvhJ2pULexUKwgfNnBCeLXF1p25KP0hkb8+yyZL4BnuEM=
X-Google-Smtp-Source: AGHT+IEM8O9x95BglttkpsX1VYoI4jLWpK+gMFTpf3ZBXg7sxj3iLdI7bWtsrH6IFjYE84LOvjVznA==
X-Received: by 2002:a05:6a00:190f:b0:740:9a42:a356 with SMTP id
 d2e1a72fcca58-7423bd5544cmr17176473b3a.11.1747035778066; 
 Mon, 12 May 2025 00:42:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a0d007sm5690848b3a.96.2025.05.12.00.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 00:42:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C0F76420AB0E; Mon, 12 May 2025 14:42:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux Media Subsystem <linux-media@vger.kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation/gpu: Disambiguate SPI term
Date: Mon, 12 May 2025 14:42:16 +0700
Message-ID: <20250512074215.40928-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=bagasdotme@gmail.com;
 h=from:subject; bh=0Ff/DfdS8SM8W7YuaV5Dll23KaO6sYsRLEZgfh2NHJI=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmKSxutzjK83xzJWfo1+rSB1/66S/XV36er3TApzjA81
 P5Q+o1ARykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACay9wPD/zCXyKlr4lNVHMKL
 ix8lhjNN5fR0bSuV3Kz27HEtX0IMM8P/hPX6hu+LdjKZsbzb95rhbZH7R/+Cnk8pWqH2DAtMGY8
 zAwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Documentation/userspace-api/media/glossary.rst:170: WARNING: duplicate term description of SPI, other instance in gpu/amdgpu/amdgpu-glossary

That's because SPI of amdgpu (Shader Processor Input) shares the same
global glossary term as SPI of media subsystem (which is Serial
Peripheral Interface Bus). Disambiguate the former from the latter to
fix the warning.

Note that adding context qualifiers in the term is strictly necessary
in order to make Sphinx happy.

Fixes: dd3d035a7838 ("Documentation/gpu: Add new entries to amdgpu glossary")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250509185845.60bf5e7b@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Also Cc: media maintainers.

 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 2040da593b1490..30812d9d53c645 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -182,7 +182,7 @@ we have a dedicated glossary for Display Core at
     SMU/SMC
       System Management Unit / System Management Controller
 
-    SPI
+    SPI (AMDGPU)
       Shader Processor Input
 
     SRLC

base-commit: afc6053d4c4b0a6be500b9e643aa17221e93a57b
-- 
An old man doll... just what I always wanted! - Clara

