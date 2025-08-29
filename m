Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C122B3B6AB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743E010E076;
	Fri, 29 Aug 2025 09:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fBN6Le+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA2210E011
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9DE36013D;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E453C4CEF0;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756458333;
 bh=b+WF2J+qrsGcj8cAU4xgyNrWdpj0Vz5yotbWDF7MJQg=;
 h=From:To:Cc:Subject:Date:From;
 b=fBN6Le+Yb27NYeFRI19Y7gZGNyEtfoOuSZzaNR2cmjGTnaKutu/HJD8nCm6/GsVUa
 rR9O3eUga4N7eRJfjlBsLuCtqQ5MPN6bj/ITh73AWYxeK4yWWJR49rN6uERc2APZ9q
 3dfWYSY77GOtTqsw/+vR2DftiEpoNrAXzAZbtwtKOyCcFtbbbLag7k94imaopEsLkw
 wIcc/EBMeC2wL/F+XH9Ykp7KC0qknZ4Ax3Od18tnE026uz5++x46UJ2s00DmulsTCh
 5N3xLbdo6D76GPqs/MWUlH6FdoO8no2n4FeIA7A2apktDSKw/Sq91EKztrmZW6Xr9q
 BU7wZddFlmYSw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urv2x-000000005WD-04un;
 Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] drm/mediatek: fix potential OF node use-after-free
Date: Fri, 29 Aug 2025 11:03:43 +0200
Message-ID: <20250829090345.21075-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent change (included in the drm pull request for 6.17-rc4) fixed a
device reference leak but also introduced a potential OF node
use-after-free.

This series fixes the new OF node reference imbalance and drops the
unnecessary gotos introduced by the broken fix, effectively reverting
that change in favour of the minimal fix I had previously posted here:

	https://lore.kernel.org/lkml/20250722092722.425-1-johan@kernel.org/

These should go into 6.17 which (soon) has the broken fix, which was
also marked for stable backport.

Johan


Johan Hovold (2):
  drm/mediatek: fix potential OF node use-after-free
  drm/mediatek: clean up driver data initialisation

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

-- 
2.49.1

