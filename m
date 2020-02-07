Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F8156078
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 22:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233536E10D;
	Fri,  7 Feb 2020 21:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5046E0D3;
 Fri,  7 Feb 2020 21:07:51 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3dd16b0000>; Fri, 07 Feb 2020 13:06:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 13:07:50 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Feb 2020 13:07:50 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 21:07:50 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 7 Feb 2020 21:07:50 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.104]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3dd1a50002>; Fri, 07 Feb 2020 13:07:50 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v4 0/3] drm/nouveau: Support NVIDIA format modifiers
Date: Fri, 7 Feb 2020 13:08:16 -0800
Message-ID: <20200207210819.15917-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581109611; bh=AqgyAZIfLWQSZ5/jMsjK9Kx1d0rF+v1Rmay+sIvOh1g=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=cLyx8TihMCaUaZ+dn9+2XYDEBL7HQiTvBzwIRLKhxdyf45vmnWYqEZW5VSHoLcEqw
 UDMd7wv4b0iMcj25grTsCuRJTF77lH+0kx5/YB7vGcYL30gETfrsyunQ5UcfCojI8v
 otYuVXOeccilE3aipEFDiXop1ff4xXWCr3rqVdMhixh2e3+NEER/K1n5AHbs4AhxNK
 ou9dFzcLZyz1+oKtmaP3DhdZ9FtJiOJ72IljxUX7W87PHZaIh9Fae4RJ0EWxQvQ1W4
 jaJqq2zj5HmjYEi9zVTOdic0Cl1J7CXe5lkifiAUk7GEcJxl2JgBhIFB1vpYz+Qzim
 caD/1/PFUuhoA==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series modifies the NV5x+ nouveau display backends to advertise
appropriate format modifiers on their display planes in atomic mode
setting blobs.

Corresponding modifications to Mesa/userspace are available on the
Mesa-dev gitlab merge request 3724:

  https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3724

I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
using various formats and all the exposed format modifiers, plus some
negative testing with invalid ones.

NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
Linear DRM format mod" patch submitted to dri-devel.

v2: Used Tesla family instead of NV50 chipset compare to avoid treating
    oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
    of compares with chipset number in the series were audited, deemed
    safe, and left as-is for consistency with existing code.

v3: -Rebased on nouveau linux-5.6 @ 137c4ba7163ad9d5696b9fde78b1c0898a9c115b
    -Noted corresponding Mesa patches are production-worthy now
    -Better validate bo tile_mode when checking framebuffer size.

v4: Do not cache kind, tile_mode in nouveau_framebuffer

James Jones (3):
  drm/nouveau: Add format mod prop to base/ovly/nvdisp
  drm/nouveau: Check framebuffer size against bo
  drm/nouveau: Support NVIDIA format modifiers

 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 +++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  45 ++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 ++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 183 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |   6 +
 7 files changed, 312 insertions(+), 9 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
