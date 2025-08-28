Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F9B3AB7E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8113610EABC;
	Thu, 28 Aug 2025 20:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kD2Tz1i3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071BA10EABC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:18:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24457f581aeso11605385ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756412293; x=1757017093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=CCMfyYe+rRC89koI5NU7x//VsxIZJbbgljIhPc8iuh4=;
 b=kD2Tz1i3P+FrIx2GRUgcEQ/jTq37uJ2qk7Du4lPw4xbwTTjvS7SmyCkV0mEPFt8Ju4
 GjDHygwgyXeX3gtcMi2LFwAaQivYTRRw7TlBN43PMe/8VOqOtGKAFkKfQDUybN33eaD6
 fNormO9VFmMZxh1SrpPJnoe2UojGs8AHiK7oAHcPsIAoUd3UDLgXcrJ/jXWcrx6OsRMS
 ecLZe8o67iH2nNg7dGNyvGNMP1tBrG4ZObKV8jIngQ0aGRxljgVGrLMDTavv/gTEBbDW
 h2TKLxJJ5qnwliMAJv89SVtLvZcbk8UczYAUJF6WK3BueYeb6ES5yZCOaT3fo8hh4v4l
 E+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756412293; x=1757017093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCMfyYe+rRC89koI5NU7x//VsxIZJbbgljIhPc8iuh4=;
 b=g5G6yCMj9KRHSBNxlQOdcgrxcrtkkbojVV0/k0jW+qlEcIieydkFgIafnfua6LuZFz
 q3v51S4gyrI6pUX7GrEgexVazlp3L0ewFJmfhXxnuqDFMuSVGZdjWOnS6KAtHBMqfRra
 b7Pqq15KzDGAlFKyS6Fl3GSB++rUKb4MHvVGtIfSQ18b+fvb48jjA0ezWqcj29+GMJEL
 csczzV39p5Sp1MLPK2HI1+tt/Mu8xLEnfbNxwPIAVeWHznd/1wzecaJbzlLKt8F7vnZ3
 +vEj+NR9r+k8/E9NFrpgfxvtuT7626pXHnoFLp3hX4Kxjty1FGUQJ9Hk39J0TbbBpNJv
 mtKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHSboW5ttPW7x4QT3iwInvYaDFzhmyKBtQKjGXpJymQTOBKJhC3KGUlmPNJv7dkIZ6nXhNrktnG08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZmRn209Gc3UGSDSm7vrnRd6xyhexa7HhRw2H2kVD8rvEyNpqh
 YLyjCclcCaSIGw3v2mz+g60743wnZCoGX09F8C5vqyS1qIdF2uSWLYc4
X-Gm-Gg: ASbGncvUid24VZa0ePbSYLiBDuHawNvjzRo13lWY6zWmQ7KPqZOcLLUFuCG4gLpXufW
 8S2sXDS/m0RafJ5A3Fi46eKSLRTEIpQ1qvEHN+eFF5G3gUvOQuy6CgD4Z3HkrjpYCYaFpfLM7IL
 iIYdY7TI4Pl5C9Bwu0uMOPZrhlJ1/hOzfr/SvVopEHqjBVxrdjL4T4yBMEw06XCP6oXAwPB+FIu
 klYo3iXNMA6kS3eKN7ViuljbexIp4qVKOTM1IQdYeuWg4QdF0FuxFGFkeNSjXaVgsz4zqFNhsWe
 umkMd709mzNCQyiZo83qCdSepIgex6hq8yl5vXVBhL2Nxp/tfAxIO9ZIkDSZoerXqdwBqIDZNjO
 s3rmzV3Az6WnXubvgKN2Vkh/pzjdrdf/0ghWV1AgJrhmvfdFhIRS4Oz9FAxROr0mq
X-Google-Smtp-Source: AGHT+IFh9t117fD0EHzHKAg9oD3dUeYrOE3aiYwPGzUsuZ2JoARj2Ixr7cTSErqIhXlJe1VvZL+iRA==
X-Received: by 2002:a17:903:17c3:b0:23f:f96d:7579 with SMTP id
 d9443c01a7336-2462ef446c2mr304033375ad.37.1756412293434; 
 Thu, 28 Aug 2025 13:18:13 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24903705bd6sm3884375ad.30.2025.08.28.13.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:18:12 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/panthor: add custom ASN hash support
Date: Thu, 28 Aug 2025 13:18:04 -0700
Message-ID: <20250828201806.3541261-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
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

Some socs such as mt8196 require custom ASN hash.

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add asn-hash
  drm/panthor: add asn-hash support

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  8 ++++++
 drivers/gpu/drm/panthor/panthor_device.c      | 28 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h      |  6 ++++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 17 +++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 5 files changed, 63 insertions(+)

-- 
2.51.0.318.gd7df087d1a-goog

