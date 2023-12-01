Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEA8008A3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 11:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46910E0E0;
	Fri,  1 Dec 2023 10:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB510E883
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 10:40:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D4B5660739C;
 Fri,  1 Dec 2023 10:40:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701427233;
 bh=0ug+U8+oATYsYs/JNbMT9HWVGshpUjmLXOajcBgeZ74=;
 h=From:To:Cc:Subject:Date:From;
 b=fqg8YB6RGLAsGa67XEUsNhDp8AHj54O5bU0RVByN0367O1tABKjV9kZy1ejTTwgV8
 9kMQO7/BNfnkoWB9tT9sy+5aejcGWn8vT0OpFrZbDwhAPxA1tC8Jaxdx6ybkHIYslo
 REwtYtxhRRe3r6xjMuGH82Ofe4zSf+3SxjMnxaea93o4ROSiZKFhi38y/n3oLpCB8/
 icYHMkQ16LYYje6YYoRhmZqvGJhqlRFxcLBe6malYYF1sW0WwCfobZ+F6x9bBsH7u7
 KNkq3CdqRAFbHpFBNE7NbQxZOWc4UcN4UmNTkpfMx5IF1eyF9C8Vdtie+zIJAEluwD
 pGOzObXQyMsQw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v3 0/3] drm/panfrost: Fix poweroff and sync IRQs for suspend
Date: Fri,  1 Dec 2023 11:40:24 +0100
Message-ID: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Changes in v3:
 - Removed useless GPU_INT_CLEAR write in suspend path
 - Changed to clear suspend bits in job/mmu reset path

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

 drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
 drivers/gpu/drm/panfrost/panfrost_device.h |  9 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 28 ++++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 29 ++++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
 8 files changed, 72 insertions(+), 20 deletions(-)

-- 
2.43.0

