Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C329917B7F7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ACD6EC95;
	Fri,  6 Mar 2020 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2686E326;
 Thu,  5 Mar 2020 13:25:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 6so1579587wre.4;
 Thu, 05 Mar 2020 05:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hf57ZWbzGz0/ZA0CujT6ZtZrPpo0PWVJ7rLwbtjZR+Q=;
 b=L5F2zA1sBpLo/s4BUjDbrvW8dKaffD5GngntuAyZT41ZQzOhcbNjeGYUMD+SR3v/nk
 HV7W4S1Y3a2wF0zepuj73n7wDE/62OCL1PQoPFTWIVGmwjsHDz8yFSP2SRMoX5rDZPCa
 ir0zbZqYklnY31KLL5yRBDmdqaWUaKafVWWe0GMvu97CzzNcse09OeXq4GU5otOXW1zv
 zZ9q2fq3s79rb8JFxswxRfoRBwUzRdN9yle9K8bXutDwmjKA9NucqXbbJrjVjTl0zMl2
 vwBjEEode07hVgtZCZbrU051BmcmJuQk7ffaXlmYCVUC2nbCKlIYiAWdMZ6vMmoZDjkk
 v4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hf57ZWbzGz0/ZA0CujT6ZtZrPpo0PWVJ7rLwbtjZR+Q=;
 b=QhkmvkWx18GrDeXAw3Rwt+YjEHagwpz77NdKXQ4k2KnOvzYanMIcgRedYgsEmw53Mc
 /tUdI9yyFGewJcQNWN7rUEK0edAV9r6jqzJhzDpV8MD8jwZU0Hucj94i2QG0+OZURMfm
 wCfrrrJ2JnyBkU5fcOQGzOce2lHZbyWOHXgh+Dlgp5yptZF1vvJ8ef6Y+lKRUCokhzSh
 HkmYmSKpzcPL8N8zh3JdYHTAJA5p54OIesgDVGSMTZfuaQDyhK1H5lpV7swwC+aj9oM3
 jcI0vfNqnqIvTScBtcTJee9clWlImbsSzjfAeq2m+Lx6FJgEJtMHJf+z0sR17yhYJX9a
 W47g==
X-Gm-Message-State: ANhLgQ20KUT0Ajr6e5s5Wtu+GzKSxK06e51bLJDsL6qKz/+4pTdEWffU
 +jGpBBEBoRdVCVjrnTFa1cI3s5Pv7LTAkQ==
X-Google-Smtp-Source: ADFU+vvQA5DD9hCI0PRjtCPeFANo6q/s0XK1v6KExx3zPb5U0shGjlCVgKmOVT9bzkax+PRvZGwI4w==
X-Received: by 2002:adf:fe84:: with SMTP id l4mr745727wrr.1.1583414748253;
 Thu, 05 Mar 2020 05:25:48 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:47 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/8] do not store GPU address in TTM
Date: Thu,  5 Mar 2020 14:29:02 +0100
Message-Id: <20200305132910.17515-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this patch series I am trying to remove GPU address dependency in
TTM and moving GPU address calculation to individual drm drivers. This
cleanup will simplify introduction of drm_mem_region/domain work started
by Brian Welty[1].


It would be nice if someone test this for nouveau. Rest of the drivers
are already tested.

v2:
* set bo->offset = 0 for drm/nouveau if bo->mem.mm_node == NULL

v3:
* catch return value of drm_gem_vram_offset() in drm/bochs
* introduce drm_gem_vram_pg_offset() in vram helper
* improve nbo->offset calculation for nouveau

v4:
* minor coding style fixes in amdgpu and radeon
* remove unnecessary kerneldoc for internal function

Nirmoy Das (8):
  drm/amdgpu: move ttm bo->offset to amdgpu_bo
  drm/radeon: don't use ttm bo->offset
  drm/vmwgfx: don't use ttm bo->offset
  drm/nouveau: don't use ttm bo->offset v3
  drm/qxl: don't use ttm bo->offset
  drm/vram-helper: don't use ttm bo->offset v3
  drm/bochs: use drm_gem_vram_offset to get bo offset v2
  drm/ttm: do not keep GPU dependent addresses

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/bochs/bochs_kms.c           |  7 ++++-
 drivers/gpu/drm/drm_gem_vram_helper.c       |  9 ++++++-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
 drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
 drivers/gpu/drm/qxl/qxl_kms.c               |  5 ++--
 drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
 drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
 drivers/gpu/drm/radeon/radeon.h             |  1 +
 drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
 drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
 include/drm/ttm/ttm_bo_api.h                |  2 --
 include/drm/ttm/ttm_bo_driver.h             |  1 -
 35 files changed, 118 insertions(+), 76 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
