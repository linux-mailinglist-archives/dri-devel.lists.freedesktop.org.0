Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204791539E3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B755C6E241;
	Wed,  5 Feb 2020 21:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24796E241;
 Wed,  5 Feb 2020 21:05:46 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3b2e1c0001>; Wed, 05 Feb 2020 13:05:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 05 Feb 2020 13:05:46 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 05 Feb 2020 13:05:46 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 21:05:46 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Feb 2020 21:05:46 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.103]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3b2e290005>; Wed, 05 Feb 2020 13:05:46 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 0/3] drm/nouveau: Support NVIDIA format modifiers
Date: Wed, 5 Feb 2020 13:06:10 -0800
Message-ID: <20200205210613.15658-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580936732; bh=tNDqn/Oy4pYTcTAMzx4ZFMESFi9g/9Xnhf92XeU8Zjc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=qYObJ0G4GmWS4uUylbzsQr+PQDVKhYRMlv5LOkjsVxODV7oPpnNBglE4CVA+9d9/Q
 V1YTB2Y+opILaGFATxn5ZCwi5C6h6L8GNDLzBuNptdTrkCbrOrtW43a56YnjXkdABm
 9H/ms64CvhOCTmoW2wVUyzJk6cQjXUhMHBs8pH+4sMG0UY11i+ueUKzNJ6k/5+s6Bd
 QXlRJwElmWknE5o/AwEuQVhwt4+rHltZb0mn7V2L6pKJmkOq/NOK0w+/pLoWgArDS1
 ibaR5zhGIGPwvd0Xz9LGdAn19q0RJYFdcBD98nWquNwP1pOxs2+ahDOK1/auQvdv2x
 idP3VsGkhE0vQ==
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
Mesa-dev mailing list as the series:

  nouveau: Improved format modifier support

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

James Jones (3):
  drm/nouveau: Add format mod prop to base/ovly/nvdisp
  drm/nouveau: Check framebuffer size against bo
  drm/nouveau: Support NVIDIA format modifiers

 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 158 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
 7 files changed, 276 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
