Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E87A7A148
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5222E10E214;
	Thu,  3 Apr 2025 10:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gDiS+LNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51510E1BE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743677264;
 bh=krVSqUMcdIJm0l6D8vCcbNrCt6hb1FXOmk01RVoxGgI=;
 h=From:To:Cc:Subject:Date:From;
 b=gDiS+LNWako3Yd4OZmxHJpbbQH24gPo3P7AJpjH5rPQQSYCi/aTFkSG5zooc6fazC
 2l2sQJ9ByJfzScLHLeHRx48qcuokSKnvopPznQaaoIfx5xewQk+T9spIXHrWeEJkpw
 bpKuqH4Ckro4vF9Xv2Zk+nRivlZuzDc0HpiTct15XKroXv4iJrPm5oX6oM/qrEs/QU
 MUTOq+FRkRN1PPc8JI0rZ+POhoxRu+N8AK5p51gbmtubkk2QgXKqbs+unl3oRBpV4J
 Macve0O4vLxKgaGRsiZILjto1gDlZ2ohY0Fp3n4MzNkKRKfy9ccqmET6shy6f0Pe6P
 pY5zacfHULYgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 828FC17E0702;
 Thu,  3 Apr 2025 12:47:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 nancy.lin@mediatek.com, ck.hu@mediatek.com, djkurtz@chromium.org,
 littlecvr@chromium.org, bibby.hsieh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
Subject: [PATCH v2 0/5] drm/mediatek: Cleanups and sanitization
Date: Thu,  3 Apr 2025 12:47:36 +0200
Message-ID: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
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

Changes in v2:
 - Fixed typo in description for commit [2/5]
 - Using IRQF_NO_AUTOEN in devm_request_irq() instead of calling
   irq_set_status_flags() to set flag for the same functionality.

During probe, the mediatek-drm drivers take a bunch of kobject
references for the various component sub-drivers and for the
mmsys/mutex handles.

Unfortunately, the refcount is not correctly decremented in some
cases, and not correctly incremented in some others, leading to
refcount_t overflows *or* underflows depending on where the code
fails during platform driver probe or during component bind.

This means that if mediatek-drm or any component of it returns a
probe deferral, and if this happens "too many times" (where too
many equals to around 3-5 times, and that's happening especially
when outer drivers are compiled as module while mediatek-drm is
built-in), it creates a whole bunch of badnesses.

This series sanitizes the freeing of the acquired kobjects in
mediatek-drm - especially in the multi-mmsys (multi-vdo) case.

While at it, this also moves the ISR enablement and disablement
to the component bind/unbind callbacks respectively, while keeping
the ISR installation to the probe function: this is done to avoid
leaks and to avoid entering ISRs for OVL/RDMA after those are
unbound (as that'd be dangerous, other than useless, because those
could access memory that doesn't belong to those drivers anymore,
as pointers may not have been set to NULL...!).

As an example, this is the reason (if not one of the reasons) for
a boot failure seen on the MT8195 Tomato Chromebook, pointed out
by KernelCI.


AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
  drm/mediatek: Fix kobject put for component sub-drivers
  drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
  drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
  drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 20 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 31 +++++++++++++++------
 3 files changed, 56 insertions(+), 29 deletions(-)

-- 
2.48.1

