Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4C7FBA62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603D10E502;
	Tue, 28 Nov 2023 12:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DC10E500
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:45:17 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6460766020EE;
 Tue, 28 Nov 2023 12:45:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701175516;
 bh=Q1fClNxiy5uCbKocfPk587p66TLkQdgMv+lgueLRZgc=;
 h=From:To:Cc:Subject:Date:From;
 b=dicwJevDrgKOkdWNhibo40/NRp7chzmaLrhuk0GWI7Twtdk/HUktcvcbRPmqS6rDR
 yd7nEZsZupNiNwF7lkpPfnbxC45lnlxcRCtbF11knluuY7G5+Exq4LBVduuIFI5Tmf
 t8F+ccRtOOohPOMF3nob8jOQpcMTzVQR6DIT9x/PS9RjAZ5pV9xBmmauMjf0ADp5DJ
 KBSRBqmV5QUubdkDmCB5X2r/sOIMpiCvTKXAnCf5OPKcDhyXgFXZsxMmotU4s0ga6K
 c2+4TFQNX+bb4f1ELDTEOlbQARZWGnLo71tYEgwb9fVVXYIZOpBmxuu7mJvfyVpu4J
 X4Ti8TKlB2h2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 0/3] drm/panfrost: Fix poweroff and sync IRQs for suspend
Date: Tue, 28 Nov 2023 13:45:07 +0100
Message-ID: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, m.szyprowski@samsung.com, kernel@collabora.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains a fast fix for the basic GPU poweroff functionality
and goes further by implementing interrupt masking and synchronization
before suspend.

For more information, please look at the conversation at [1], which
explains the regression seen with the poweroff commit and the initial
approaches taken to solve that.

Cheers!

[1]: https://lore.kernel.org/all/20231123095320.41433-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (3):
  drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
  drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
  drm/panfrost: Synchronize and disable interrupts before powering off

 drivers/gpu/drm/panfrost/panfrost_device.c |  4 +++
 drivers/gpu/drm/panfrost/panfrost_device.h |  9 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 29 +++++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    | 18 +++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 27 ++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
 8 files changed, 70 insertions(+), 20 deletions(-)

-- 
2.42.0

