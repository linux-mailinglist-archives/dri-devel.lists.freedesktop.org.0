Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D632E3BF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2186E514;
	Fri,  5 Mar 2021 08:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832C36EA2C;
 Thu,  4 Mar 2021 15:20:13 +0000 (UTC)
Message-Id: <20210303132023.077167457@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdClLt4+fuyCD6ZyqthkXbcv3Ic59BWpZ3AO1GEhCVA=;
 b=xMnck+A//N+JJ/RpCJYdExXhoUvZ2fcDik9DVsp1+5j7nuopQjCucFhmvkqVup9fM19Grj
 BXnfokOAQ6iuFq44L7pJ4+c4eVzu+k+76u9fdHc+X7OnXi0aAftiBRG89BlNAzJpRFBBJD
 0M4yCujiJH2tIhkhYO+VhD3K8VhrGHcp+ALOlmOexUgS1vIovXUubnt2oT6Nx6A6SmS/l3
 vzPAPkoceU7qZmr7PyHWloesBXaP6TBOlyFg+fytBEZRG2FbHaO8xuMcvI/nmYapv0qIO8
 m8+eGV23YjiKIi9mf8XHp90jzjRch6yjA6YXHjJhKuuZt3XMjXT6+iEyiqVurw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdClLt4+fuyCD6ZyqthkXbcv3Ic59BWpZ3AO1GEhCVA=;
 b=puGQh+pRRhN/TY3HF9OfSaRiQL69Lg4hw447EvqmiySd+QW3AXl1HHcjurw7yenjNobZem
 +chTQ0TX3LANkTDQ==
Date: Wed, 03 Mar 2021 14:20:23 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 0/7] drm, highmem: Cleanup io/kmap_atomic*() usage
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the DRM usage sites of temporary mappings requires the side
effects of io/kmap_atomic(), i.e. preemption and pagefault disable.

Replace them with the io/kmap_local() variants, simplify the
copy_to/from_user() error handling and remove the atomic variants.

Thanks,

	tglx
---
 Documentation/driver-api/io-mapping.rst             |   22 +++-------
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c      |    7 +--
 drivers/gpu/drm/i915/i915_gem.c                     |   40 ++++++-------------
 drivers/gpu/drm/i915/selftests/i915_gem.c           |    4 -
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c       |    8 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h |    8 +--
 drivers/gpu/drm/qxl/qxl_image.c                     |   18 ++++----
 drivers/gpu/drm/qxl/qxl_ioctl.c                     |   27 ++++++------
 drivers/gpu/drm/qxl/qxl_object.c                    |   12 ++---
 drivers/gpu/drm/qxl/qxl_object.h                    |    4 -
 drivers/gpu/drm/qxl/qxl_release.c                   |    4 -
 drivers/gpu/drm/ttm/ttm_bo_util.c                   |   20 +++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c                |   30 +++++---------
 include/linux/highmem-internal.h                    |   14 ------
 include/linux/io-mapping.h                          |   42 --------------------
 15 files changed, 93 insertions(+), 167 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
