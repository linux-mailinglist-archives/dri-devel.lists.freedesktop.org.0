Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7C7A6DE3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503510E28F;
	Tue, 19 Sep 2023 22:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63510E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sYnsAvHn7qG+MQIuk2hAHYEL+8cykqbSNm8i3kR9jb8=;
 b=DAAz1TWnMb5Q2mykM5aT6Vi6vwskiGv7+yZGR+WLnSrBA+c1Gx/8PsHNaoHSQuajzJxOGH
 AvC9i7FmXcMo0L6mkByuTUQuuZRsKmWfYVeejCjMvch8l+JMWpM+ra5IsHUu+/YcmQ7IeY
 i0+978cvl4G13feKKPRBAivO4YXGtxE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-gdtECnKhPEy_LqSTBiBmzQ-1; Tue, 19 Sep 2023 18:05:01 -0400
X-MC-Unique: gdtECnKhPEy_LqSTBiBmzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13A7929ABA1F;
 Tue, 19 Sep 2023 22:05:01 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC31840C2064;
 Tue, 19 Sep 2023 22:05:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 00/44] drm/nouveau: initial support for GSP-RM 535.54.04
 (and Ada GPUs)
Date: Tue, 19 Sep 2023 17:55:55 -0400
Message-ID: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey everyone! I'm just going through and rebasing Ben's display patches
so I can push them in just a moment :).

(*the rest of this email can be read in Ben Skegg's voice*)

The primary issue being tackled here is that, for historical reasons (we
didn't know any better / couldn't make it work reliably otherwise), some
operations (SOR routing, DP link training) were performed during the 2nd
HW supervisor interrupt.

We don't have control of the display supervisor when running on top of
RM, so this needed to be untangled and fixed - which, is one of the main
aims of this patch series.

The ordering of this series is pretty important, so take care if/when
backporting patches from it.

Beyond that main goal, various other interfaces have been added or
extended to provide the information that RM will need for its version of
similar interfaces.

Ben Skeggs (43):
  drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
  drm/nouveau/imem: support allocations not preserved across suspend
  drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
  drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
  drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
  drm/nouveau/disp: rearrange output methods
  drm/nouveau/disp: add output detect method
  drm/nouveau/disp: add output method to fetch edid
  drm/nouveau/disp: rename internal output acquire/release functions
  drm/nouveau/disp: shuffle to make upcoming diffs prettier
  drm/nouveau/disp: add acquire_dac()
  drm/nouveau/disp: add acquire_sor/pior()
  drm/nouveau/disp: update SOR routing immediately on acquire()
  drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
  drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
  drm/nouveau/kms/nv50-: keep output state around until modeset complete
  drm/nouveau/kms/nv50-: move audio enable post-modeset
  drm/nouveau/disp: add output hdmi config method
  drm/nouveau/disp: move hdmi disable out of release()
  drm/nouveau/disp: release outputs post-modeset
  drm/nouveau/disp: remove SOR routing updates from supervisor
  drm/nouveau/disp: add output backlight control methods
  drm/nouveau/disp: add output lvds config method
  drm/nouveau/disp: add hdmi audio hal function
  drm/nouveau/disp: move dp aux pwr method to HAL
  drm/nouveau/disp: add dp aux xfer method
  drm/nouveau/disp: add dp rates method
  drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
  drm/nouveau/kms/nv50-: flush mst disables together
  drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
  drm/nouveau/disp: add dp train method
  drm/nouveau/disp: move link training out of supervisor
  drm/nouveau/disp: add dp sst config method
  drm/nouveau/disp: add dp mst id get/put methods
  drm/nouveau/disp: move outp/conn construction to chipset code
  drm/nouveau/disp: move outp init/fini paths to chipset code
  drm/nouveau/disp/nv50-: skip DCB_OUTPUT_TV
  drm/nouveau/kms/nv50-: create heads based on nvkm head mask
  drm/nouveau/kms/nv50-: create heads after outps/conns
  drm/nouveau/kms/nv50-: name aux channels after their connector
  drm/nouveau/kms/nv50-: create connectors based on nvkm info
  drm/nouveau/kms/nv50-: create outputs based on nvkm info
  drm/nouveau/kms/nv50-: disable dcb parsing

Lyude Paul (1):
  drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state

 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 511 +++++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  14 +
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  20 +-
 drivers/gpu/drm/nouveau/include/nvif/if0011.h |  21 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 249 +++++++--
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  96 +++-
 .../drm/nouveau/include/nvkm/core/memory.h    |   1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  90 +--
 drivers/gpu/drm/nouveau/nouveau_bios.c        |   8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 252 ++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 345 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  30 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           |  36 +-
 drivers/gpu/drm/nouveau/nvif/disp.c           |   2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 412 ++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/core/memory.c    |  15 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 146 +----
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   |  10 -
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 362 ++++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  17 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  38 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  15 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 182 ++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 144 ++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  43 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  67 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 460 +++++++++++++---
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  10 +-
 .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  12 +-
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |  19 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
 50 files changed, 2461 insertions(+), 1207 deletions(-)

-- 
2.41.0

