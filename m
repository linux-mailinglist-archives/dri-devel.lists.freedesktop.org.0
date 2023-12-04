Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF48031A8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 12:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937610E352;
	Mon,  4 Dec 2023 11:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7531410E351
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 11:42:21 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C8B166022D1;
 Mon,  4 Dec 2023 11:42:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701690140;
 bh=dbT7V5enXDJ2E4Ob+hkRHh7p0dTf0R5FIQCB96fHlnU=;
 h=From:To:Cc:Subject:Date:From;
 b=hlLELGOEebvyBZU2AmACx0+OAov3VNPKaCF2qNWCYXRjLgXjrv6EOkbY4oHMKTGZI
 QL9QOl7uWoQmYz3txyzs8ZgGh4uJlrbticuPa/pTVrWy50IDRWYV4xKDC6zvjIUh1V
 T8hnH4MdNYN5sl2xv7zETskiHmKSI5JjsfAgzkijYCtI9jC+9+dQZFsvdxIPILtVsm
 IkE0XAhRrqbrxBQisA8vOchvjhmnpa4lLVA0RlkHVc5xBWclRIq1S3s/vjiLK8baVP
 I2LH4iVQqEB1j6Cmr9FDEkBwyfIbCzxjMsPJO+IVYKVt0w7jU+qslNJh/coHPsGApF
 XapZhwAqE1ELQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v4 0/3] drm/panfrost: Fix poweroff and sync IRQs for suspend
Date: Mon,  4 Dec 2023 12:42:12 +0100
Message-ID: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
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

Changes in v4:
 - Added checks for is_suspended bits in hardirqs
 - Added GPU suspended bit (and handling of it)
 - Reordered panfrost_drv_comp_bits entries
 - Commit description fixes

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

 drivers/gpu/drm/panfrost/panfrost_device.c |  3 ++
 drivers/gpu/drm/panfrost/panfrost_device.h | 10 ++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 40 ++++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    | 26 +++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 32 ++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
 8 files changed, 91 insertions(+), 23 deletions(-)

-- 
2.43.0

