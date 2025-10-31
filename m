Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF8C249B2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBC810EB9E;
	Fri, 31 Oct 2025 10:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fd9xUXlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9087F10EB9E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-429babfccd9so1529683f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907781; x=1762512581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5RYdD1QoUGDR2Tgu8m6WkM1ZGxPlfPcnOpoxoT7WDc=;
 b=fd9xUXlAbWajSa5A4YiX2lXTbkKNaS0tRinXOP3tybUe51w8gvjg4tCBiWPUsNoi7o
 5XsGUDw9rim93ddQO8g/tDfZbtsRG1gKdPmB81hOEkUaitZdnNKbD/rZDJsZvJZCWacD
 /P+eRInEgZnpD6ZUY6bhP7vYwhRPsWCspGfs8TDn3mD7LqDan7kAjnc/siiIqrqZnyEa
 qyQTeALLupia4F7XqFZNfH9DBtTjdF/VxBFMk0PCAcE47Ii5a3Mks9MArp5ZK4e84h+p
 Vyts1A0LYEoVWPV5mY73A1fjMtLifa2eR8lyUeXWdpra/4v16tmf3rTBO/3CP6/cm2oZ
 fBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907781; x=1762512581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5RYdD1QoUGDR2Tgu8m6WkM1ZGxPlfPcnOpoxoT7WDc=;
 b=nQ7DH4P78Q59AduLxRxaOOtLq6YpSoyoNudl2rF3hgYtOI/WaXAdzI3upkWl+EGf0C
 dXnQFQh1xyaoObAjacedmgwY2YBgTCROwwHkMbBrVNeFpmLWI8XwqkSaXmH2/fSF9rUk
 uNQnP1QCE1A0HihqV1B1vllwE6jznoe54Go9kN9wtrA1k9XiznADKcnLhmP71KiZ0EgP
 /+MQUelYsKc3ZlN5FlUNRGbgU2M3felNfE9zDzc5WD6bHh8pQC/prXk7H9EtzkX5/oF2
 fQUJyhPgNG4QbwXIRRtzBxJlN0ZzT3rvs3lyFjKX16amxiDR4QJuKbuWF2xHdNE97nkZ
 Gwfw==
X-Gm-Message-State: AOJu0Yzkm3Zw82CWxjuDZ6wHyTQtxV8OqNQx3zrpKBnKJq3aYXMoEXAE
 E1ik2iKEimL5bZQYo7I9yUsG1W4MLSKRdg4QN3SBN0EiOcPlhky6VZxy8tSJ2YYW
X-Gm-Gg: ASbGncujHc/e0pDiH8Wr+zDO/oaLcXD5Y6QN+HSd4UjLSGoyL4rbiZy2xbkqRy266JZ
 YnobcfGpnWDD+n13yE5RywjrQT9eC1Bn5rzqXPo+J7+R5BH2xaeccLQCV7MfxyZl0Fm0znwcWNQ
 U7fwBdQutgIUnLQHRq6rnGhpdP4tGBDllzrMMAQj8xEt/V0St/HvkPOahfZvb0ce7Bq68/dpLd7
 lhhangeb2MnhDAiCdTlyqmxDyYxps0po4Bcu7v0aTtVFyjsxRD2j928Z+b4WKWHXaeeaBsF24kG
 7yy4ce7ubKuZ9nc++OakSZ9m4Rs5OyoGY1zTdAFWTRvFpMcyLaCGNKif/+HcxNwt77olYfRTPuE
 IeUfUaa5xjziMgDtFAQlgxYwTYAketxZ006H3arnpY93Xq76cqkIyFZAWEwq8nVP3HkFOlHDRjm
 KWW8esL0BDkIb0KtwbMvnX+A==
X-Google-Smtp-Source: AGHT+IE8VBb875dxLRxDB34lR0lZEjeaTd1sqXxjVzPNZFqjTJI6vGaaBoNW4XialIBbVA/YfCjRrw==
X-Received: by 2002:a5d:5888:0:b0:425:7c2f:8f98 with SMTP id
 ffacd0b85a97d-429bd675fc0mr2308988f8f.1.1761907780764; 
 Fri, 31 Oct 2025 03:49:40 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:40 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 31 Oct 2025 12:49:19 +0200
Message-ID: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
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

The new VM_BIND interface only supported 4K pages. This was problematic as
it left performance on the table because GPUs don't have sophisticated TLB
and page walker hardware. 

Additionally, the HW can only do compression on large (64K) and huge (2M)
pages, which is a major performance booster (>50% in some cases).

This patchset sets out to add support for larger page sizes and also
enable compression and set the compression tags when userspace binds with
the corresponding PTE kinds and alignment. It also increments the nouveau
version number which allows userspace to use compression only when the
kernel actually supports both features and avoid breaking the system if a
newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

- v4: Fix missing parenthesis in second patch in the series.
- v3: Add reviewed-by tags, revert page selection logic to v1 behavior.
- v2: Implement review comments, change page selection logic.
- v1: Initial implementation.

Ben Skeggs (2):
  drm/nouveau/mmu/gp100: Remove unused/broken support for compression
  drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
  drm/nouveau/uvmm: Prepare for larger pages
  drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
  drm/nouveau/drm: Bump the driver version to 1.4.1 to report new
    features

 drivers/gpu/drm/nouveau/nouveau_drv.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 102 +++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  69 +++++++-----
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   4 +-
 5 files changed, 131 insertions(+), 49 deletions(-)

-- 
2.51.1

