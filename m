Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D374F797167
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 12:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA7E10E06A;
	Thu,  7 Sep 2023 10:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Thu, 07 Sep 2023 10:02:41 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F67D10E06A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WtCoctKqrOuNL7YPM9mYObCf6Hdm7ApMb7s6UV96VRg=;
 b=HPx166wijMpi0SuqjYCYznd1XBpiCUbrQLc/PO/UMyEq3ZEUYTobIRDo
 3Rqqz8tTf3ziWlg9eiO0gtAOEfHBNxrgu+g1iTCYRdavySvFpyxmeL4HB
 GFAsE9lOiSmMbIKRRI/H8INxUF7Ej0oMCIoW7c5cwML7MMfndJw9rsVW5 k=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; d="scan'208";a="65324651"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:29 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:10 +0200
Message-Id: <20230907095521.14053-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mediatek@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mmc@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add of_node_put on a break out of an of_node loop.

---

 arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
 arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
 arch/powerpc/platforms/powermac/smp.c                |    4 +++-
 drivers/bus/arm-cci.c                                |    4 +++-
 drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
 drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
 drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
 drivers/soc/dove/pmu.c                               |    5 ++++-
 drivers/thermal/thermal_of.c                         |    8 ++++++--
 sound/soc/sh/rcar/core.c                             |    1 +
 13 files changed, 46 insertions(+), 14 deletions(-)
