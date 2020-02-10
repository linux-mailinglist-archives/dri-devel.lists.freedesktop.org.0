Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C415860C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 00:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5526EA12;
	Mon, 10 Feb 2020 23:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149F16EA0D;
 Mon, 10 Feb 2020 23:15:25 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e41e3f10000>; Mon, 10 Feb 2020 15:14:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 15:15:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 10 Feb 2020 15:15:24 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 23:15:24 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 10 Feb 2020 23:15:24 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.102]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e41e40b0002>; Mon, 10 Feb 2020 15:15:23 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v5 0/3] drm/nouveau: Support NVIDIA format modifiers
Date: Mon, 10 Feb 2020 15:15:52 -0800
Message-ID: <20200210231555.3316-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581376497; bh=vI4MQY+h3foLhpIHZJOs7s1ZWfTnl6LxR9ZQ7uSoEsQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=ik7xjBUSqYIGq6/MwiNBM8R6SJd5ARR1uoAPfOwCpXSLU5iZW+HZck0a0TM6bEf28
 N82yvhjsQ1siwf21hzHtxeCKOc/h5VwxxdhGiddJMMbgicgLNgfl882oG27uyzrww1
 bI9p1k/tpjy3jxvux+ItrZhJTozwJg5kinPT0rJssPKkHAB3WNxMECtCG3IFhNcGTN
 Fov0HTfHmmgBS0oKzWZ/ORfkEfjwb+jd5VndsRjqNbG3p1tSl9FUpWx5qp0BYAXQol
 x50D+ZwW7G8c5+EPJw0vsukNIuZQeAxmGNV68RdiKnuG0PlBJcnaMb+auvphMnUqEf
 dHePDlZhPpv4w==
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

v5: Resolved against nouveau_framebuffer cleanup

James Jones (3):
  drm/nouveau: Add format mod prop to base/ovly/nvdisp
  drm/nouveau: Check framebuffer size against bo
  drm/nouveau: Support NVIDIA format modifiers

 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 +++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  47 ++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 ++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 183 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |   6 +
 7 files changed, 312 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
