Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C28431F86
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4186E056;
	Mon, 18 Oct 2021 14:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A66E056
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:28:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i12so41686104wrb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyYaNMyG0h2GRFSHh3MvaiQhHBrpmc1k1spDZIbhBKw=;
 b=0/NGh/p3sVcXxesecSYKBMn+eToUPj771KYfsNeQCDLhfvuEUJ5FP1n91Fc0PZIifD
 glWKqHP+V0kSU4kSqmrZPGYo96bTVrA70NoDVbsln11HONolpEu553ByvveFwRB8c/Fw
 bQwrsEvm+Qbx7sXQhU+2T6fDsNzNCMexYfeC/aJAxKoRWyuLI36YhQrS15aZv83JTxx1
 w6tTRbbqZ4QciTX8PjRykKnc1tBKLYm06iFTOjExWzDkvLrdfXvfpMh7+ZPZRMUDJLgC
 NmPVgavhPxE3MtmgK5I7VCgIIbjkVwiXqs8C/KrkrJ8wcsy6gus0sFGar9CncJpOHePM
 uDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyYaNMyG0h2GRFSHh3MvaiQhHBrpmc1k1spDZIbhBKw=;
 b=3O1XIvXrVWS4D9bCL3UdHKraESRoDkiaYlFwf8oBZvgswRI4EJjZPDU6qssjRptc6P
 V2TEzDwTBiAawQKZk2rtqABaWGeuVz6ZcwmwYhRiq7ZcGO5pxPXf4ylzG4NrFJfKWsX+
 FYuXHfgMbfDNWAGf/l4mOwrZBNEeRUvy7ji0uwiVrkmNgcNJUnWqd3F6IS2ZV4NHViZ/
 ypUK1DJwq2pu9BQp2So88jjyp2tkYF/hjYPvL4zRXQEF/ghwS5ni+vnSRvxyJ76yVcC0
 6egZYkMZ4mM8ECU7gNLJwtR1npeIc4KXCEY0dYith4Fb8XO3CROQUSIE/7vfBvd500N2
 I26g==
X-Gm-Message-State: AOAM530HoYE7SeKalCQ0qBHamTF59NgvjhNJ06oOnuEUGKfTL1vwiupI
 +b65wRC8gy0SF2d2HrJi6WgOOQ==
X-Google-Smtp-Source: ABdhPJyViJMpa/W4XVDOttFAuL4XjTh4Xpqfxmvfmp+8DIEc+cUbvjdyhyeeVlkoab278Zr8gTsD5w==
X-Received: by 2002:adf:a29c:: with SMTP id s28mr34700738wra.116.1634567324983; 
 Mon, 18 Oct 2021 07:28:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:28:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 0/9] drm/omap: Add virtual-planes support
Date: Mon, 18 Oct 2021 16:28:33 +0200
Message-Id: <20211018142842.2511200-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506; h=from:subject;
 bh=UU6BPOlg4iHte6Z0SQwKO9S7iu4F/v+orl4BrCXP76I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSDvJh2P7dCncuXx9XXB5XZq1TOiLt4NlmqYdL7
 ZjqbziiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EgwAKCRB33NvayMhJ0UZ3D/
 9IMt2RQ0aOt34ulcoQ3whtM/uULj4rGoYkjO8z6elwcZ1GMJlJMIPMPYSFffDsJMN7inPkjX2FLlhN
 9FB+qHap9O4b4Yne5iHd7IFO97kn8z5vDH3NmOChUJB/mDmJ+ZLnEvxPZ1OwvIJuPc+14rrdPS2+hT
 GyF7OVExSePxnqmgOOSI+1hsm0oIQe8+dWF1xD78Tw2YUmbBfOrF5iLOvL2x1rfu+lb9ZqPDctiaO0
 ckTDgwZINvQWk2BD2lKHgNc68Uvg7d5GiL2wGEJjk53XNTfn+932d0AQnG4yxAVujJAwIZzYW9Fqyl
 eQjjFuJ11R+BzXIJbWtTZfw3ehOtw1zm15MaHLOO331wO+08FqoJB8rlaEPlEcEAxjqOn7N8zQKdvQ
 O39d44UazaVdyf3omKzzQZmumTZ+RpkkmDfCoKguSkygj317BKTeP4k6NMVMvg1HZ+8uvB7PFrazya
 WM/MCfgagiwsrXZ3Q5jc8v5ZC4/ZdRIndefdyycRg3V4fH4NrdpVZulVE7yy0qHiqX15LJTTBo2XHP
 nhGmhOMp1jpkZHvkdB+EYPJjbs91puNu6DmWp1qnXcd5UJZonA4o15BARunAtlO+tfkDvzYcT1nLNm
 fCuGkQi+EwkcgXN/nEWNPI7J9SwvjtVmaBYjgIoaHwyTMuC7iDpHlheYTjVw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].

This patch series adds virtual-plane support to omapdrm driver to allow the use
of display wider than 2048 pixels.

In order to do so we introduce the concept of hw_overlay which can then be
dynamically allocated to a plane. When the requested output width exceed what
be supported by one overlay a second is then allocated if possible to handle
display wider then 2048.

This series replaces an earlier series which was DT based and using statically
allocated resources.

This implementation is inspired from the work done in msm/disp/mdp5
driver.

Changes since v5 at [2]:
- Patch 1: renamed width/height_fp to max_width/height
- Patch 2: no changes
- Patch 3: removed possible_crtcs stuff,
	added cleanup on failure to allocate,
	removed name in omap_plane struct & plane_id_to_name in omap_plane.c,
	switched all omap_plane->name to plane->name or omap_plane->id
- Patch 4: aligned omap_plane_atomic_duplicate_state the the crtc style
- Patch 5: removed glob_obj_lock & reformated global state declaration in omap_drv.h
- Patch 6: moved drm_atomic_helper_check_plane_state() from atomic_check() in separate commit,
	removed zpos change, updated debug messages to be useful,
	renamed omap_overlay_disable() to omap_overlay_update_state(),
	added useful comments for omap_overlay_assign() & omap_overlay_update_state(),
	simplified omap_overlay_assign() & omap_overlay_update_state() for actual use-cases,
	refactored omap_plane_atomic_check() changes to be cleaner & simpler
- Patch 7: no changes (except possible_crtcs print removal)
- Patch 8: Reformated omap_plane_atomic_check() & omap_overlay_assign() changes to match previous patches layout 

Changes since v4 at [1]:
- rebased on v5.15-rc2
- adapted to drm_atomic_get_new/old_plane_state()
- tested on Beagle-x15
- checked for non-regression on Beagle-x15
- removed unused "state" variable in omap_global_state

[1] https://lore.kernel.org/all/20181012201703.29065-1-bparrot@ti.com/
[2] https://lore.kernel.org/all/20210923070701.145377-1-narmstrong@baylibre.com/

Benoit Parrot (8):
  drm/omap: Add ability to check if requested plane modes can be
    supported
  drm/omap: Add ovl checking funcs to dispc_ops
  drm/omap: introduce omap_hw_overlay
  drm/omap: omap_plane: subclass drm_plane_state
  drm/omap: Add global state as a private atomic object
  drm/omap: dynamically assign hw overlays to planes
  drm/omap: add plane_atomic_print_state support
  drm/omap: Add a 'right overlay' to plane state

Neil Armstrong (1):
  drm/omap: add sanity plane state check

 drivers/gpu/drm/omapdrm/Makefile       |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c    |  31 ++-
 drivers/gpu/drm/omapdrm/dss/dss.h      |   5 +
 drivers/gpu/drm/omapdrm/omap_drv.c     | 189 ++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  24 ++
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c | 212 +++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h |  35 +++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 354 +++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 11 files changed, 830 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h


base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
2.25.1

