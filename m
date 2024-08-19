Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B1395649F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF51810E1D2;
	Mon, 19 Aug 2024 07:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="pORCxdX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CAA10E1D2;
 Mon, 19 Aug 2024 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724052399; x=1724657199; i=friedrich.vock@gmx.de;
 bh=kD1mzW9XwdiktYVDjXCx0qkP4EfI8HS8Du/h2wgjo9w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pORCxdX5djNZYmrw5dr3EsYvpe7Gagk4EpNwj0Ytr7GtJ8G/WgN6dxAZLjQQKm9W
 MTGR3MhQFsTvCl7c/4lt51ZAd8xq6lFfWVllrUEj3uOV3UmuvfbkciKWhzGaBOXC7
 wFFMcmSWPus+55mOM0pmJ8GjnGvwdBvPSh88dRjqjxl9hgxwC9UKr3LT57Qi5t48X
 5rCwmQC15XGGj05iwJ8p2nzoOAwVneF0O03Rc6TFhpGlI/W2YfL4doOhcr/awnWnf
 t+DJIKgSpt3SymzzxWB6C5SAmaW+TloGYr3ujAAk4Wl95AHqazHECfhMcIpPwW6kI
 S5/ODXKTI2unyT0A/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from rizzler.fritz.box ([213.152.114.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1sZFdw4Bku-00XBtC; Mon, 19
 Aug 2024 09:21:29 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
Date: Mon, 19 Aug 2024 09:21:07 +0200
Message-ID: <20240819072110.108715-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zs7/21Qymz96TxYlbqkCBK4GiYT5dZhSavv5MrA/QKEbKgzFunk
 lowswZTGk0dRkAm2OgpjQHzg+Uo5nAy42UHD2uywKqMIIrDd2rPAzjQGOMdOW0rAXB8yd2S
 2JmLNsaMYxlUAMvRAzgCH9gz5ryrMrpQ3YyRYVxHh1xUOGs8l/IQ0AvaHCIiuVfD2nQPgv6
 8jfB8FFAP+KfjswWR1qfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BBK00gyy1gs=;O+iHkd4XEoWtygtm+g7MljBrLHw
 XKwFp/dxm8uL3+PUnx/vqPVJVjR4sKBZQlREP48yeZGkPPun0Lo4IPs2wTgn42QL47bwUEFq6
 XYm5SjsvzyVV+A4GV6Ik3FxlWGzE1INoS4SUrqh5oWrXhSURK3YTB77xy/NiXof0IR91B5gir
 6euqaA3/Hb4zlHy/NmLWHUybvCI1UlfBWxHtNUxoEUbE2DCG2wDKJ4O4H1RSEqT4AQxiXfSoz
 VYqr1NclQ7HRH7u/WzhD+n43ZZQIRCaqXMTkyZizwzGf5rIBG1jKyxf/U92b+2IzwX+eYk92l
 wO0/xN8tThb4BV7msS5iOeyThBunIAqJ37pIqz0TLVfQ2fx5YSfrmLOZz6t5PQtpTGbcgSFrV
 WqXgNzFXf3C+gQpHwwe36s1yVfuCBKZ5zYcMjg1DSM+RtyPSASbGh7jHGBV8OMyCXOJSNWo9a
 gscSVF9lGhnHAGo2/qJy/oEUc2vMYISD64ajJ+STkKS5OcNz3kGyhSrx+qFCj96ApMF6vGnxM
 cAq9sQ7As3u14Jx1mH5j+A+ZULf97MzKugfJ3+e/jEFO4mbpIPKaT5r78CuLN2GvAmf3FsX4R
 cMp7D4hYVmSfyl7Qp6zdreb1vihwNoq4y/QSBfEOqHJHtfJ5dJnxQWRSLa3R4yK/wMlyplaGa
 FnuQdHiz04o49Fe++T0fPBJTPPrdxoUp9lxTWIuJ7XbgK9UIdicq/4jfkNd3VtA6ijuiyQfck
 PXQfsIGvNazIPkQ3G9yQeplnsTiJgV9isukYFJQ2EqLjYy4Q6NdYAF370IB1tZnRs7LsOGs2D
 OeZyf0yKiW1cwFSCk4nECa6/e4I3PBIqQ1qOosjWzmebQ=
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

In Vulkan, it is the application's responsibility to perform adequate
synchronization before a sparse unmap, replace or BO destroy operation.
This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
that happens on sparse unmap or replace operations.

This has seen a significant improvement in stutter in Forza Horizon 5
and Forza Horizon 4. (As games that had significant issues in sparse
binding related stutter).

Userspace changes for this new version can be found at [1][2], and a kerne=
l
branch containing these patches can be found at [3].

[1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-explicit-=
sync
[2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-explicit=
-sync
[3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/amdgpu-vm-=
explicit-sync

v3 changes:
- Rebased onto current amd-staging-drm-next
- Added option to wait for drm_syncobjs instead of executing immediately

Tatsuyuki Ishi (3):
  drm/amdgpu: Don't implicit sync PRT maps.
  drm/amdgpu: Add optional explicit sync fences for GEM operations.
  drm/amdgpu: Bump amdgpu driver version.

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
 include/uapi/drm/amdgpu_drm.h                 |  7 ++
 14 files changed, 194 insertions(+), 66 deletions(-)

=2D-
2.46.0

