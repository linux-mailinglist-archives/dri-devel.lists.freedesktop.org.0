Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4452772AE7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832DA10E2BE;
	Mon,  7 Aug 2023 16:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F3B10E2BE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=C+/CyL6DWmJ97DvzadNxN/4lkkgbk7hRr9Zj4E1hmAdSuzbgFhJXbaLPqoRQZ2II9WaIxO
 m7EasRiv0PRVjFn8teXb4HaZDs0Hwr6jVAu/kIjrxLNAiwJ3dMHwqe7XqJDB4SKPAWQHCP
 AIO/QqAOj/nbEn1Ej8k7nPDvDK/qhUo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-RoW8FnpvP0-zyeHXxHpUHA-1; Mon, 07 Aug 2023 12:32:44 -0400
X-MC-Unique: RoW8FnpvP0-zyeHXxHpUHA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe0e1dfdbaso4476621e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425962; x=1692030762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=XLLNzDkcxGj/QwS+rd8NwAupsxb8qj/8rxjU4h+Jg6L9VL/gfDgc6gsWsUCCk9jKgw
 JMAWmxG6hzpCq0sbqCUsWYtjT6xIJslSozgfQ/dSfViu75KzZjeYKaPInvtDXnJG3D+5
 kUsH+HqydyhrbZsI5PEVSUvq52DGjl4LFKugAFDyldSWE+I0cZBjhl4qP0jLKhOl0dAR
 KzrAqau/lEzGU7kT7yxcTBcqKbnpLF+hk6Lie69DcoK52Q285Xv/+Di2YZlkHbo1CaaU
 ETM9+kw0GE9gDiAn/bLusX1bV73KJkVMZKo1ukEsOSAKFUSHy4J924mDxydEixR8hVt2
 XbOA==
X-Gm-Message-State: AOJu0YybZsX8VoOlOL9zB6XhSHuMJ74pne9iEgTWB+lTvehg6L5+R+hB
 fZxt88/xERGlumkI1ySI9CoAlQvJNJ+NmAXpomxFh/UxxD/ETv0e9x/AP6JzTM29OybTef/+318
 wGt3V9fwQ1tw9cfSQu27gXm4aGw1f
X-Received: by 2002:ac2:5e90:0:b0:4fb:c657:3376 with SMTP id
 b16-20020ac25e90000000b004fbc6573376mr5710686lfq.29.1691425962408; 
 Mon, 07 Aug 2023 09:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoveHUcxmtOtYeVGuvV0X+WYxTBKr9SEAQjhSbownwD6MHWzDQxtVUZ5WIVK3lj030C9Zegw==
X-Received: by 2002:ac2:5e90:0:b0:4fb:c657:3376 with SMTP id
 b16-20020ac25e90000000b004fbc6573376mr5710669lfq.29.1691425962042; 
 Mon, 07 Aug 2023 09:32:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a50fb11000000b00522572f323dsm5394761edq.16.2023.08.07.09.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Subject: [PATCH drm-misc-next 0/5] Nouveau VM_BIND uAPI Fixes
Date: Mon,  7 Aug 2023 18:32:21 +0200
Message-ID: <20230807163238.2091-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series provides a few fixes for the recently merged VM_BIND uAPI
mostly addressing a couple of warnings.

It also contains one patch to slightly reduce the memory footprint of
struct nouveau_uvma.

Danilo Krummrich (5):
  nouveau/dmem: fix copy-paste error in nouveau_dmem_migrate_chunk()
  drm/nouveau: nvkm: vmm: silence warning from cast
  drm/nouveau: remove incorrect __user annotations
  drm/nouveau: uvmm: remove incorrect calls to mas_unlock()
  drm/nouveau: uvmm: remove dedicated VM pointer from VMAs

 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  6 ++---
 drivers/gpu/drm/nouveau/nouveau_exec.h        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 23 ++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        | 14 +++++------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  5 ++--
 6 files changed, 24 insertions(+), 28 deletions(-)


base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

