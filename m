Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47B7DBA8E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAA410E0D7;
	Mon, 30 Oct 2023 13:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C9C10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:23:06 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 46B82660297B;
 Mon, 30 Oct 2023 13:23:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698672185;
 bh=TxpERrHKvTXLv7m6DqA8hS2RM5V93+V2vFmeraHSOl0=;
 h=From:To:Cc:Subject:Date:From;
 b=MgC3ld0hp1ucNJ8hYE/CQB6rOFdkGUDdh5aNHd2Yf+ZDPyfrt0QEoyArU9WLoirI3
 dO3j4ke8OcVsxL6DZyMGBJs1tjnk3pZs2I7NAc8aVCis5bzn/V2iiqmfvxNKn1D9xh
 6EXM5NPAlIlVBdjROTAgeaQ26D6X1RxJB+zjhbV7xgdYPwlFoKccoEYZ3K9egQfRQc
 PSSWjG+eIhcR3qqn/bSI+4Wk3LmXfwStmus2Yh2lVpsQvZAhjhuqhE0vTww5FyoM9I
 fjuEgX/yFxSnjAGQU1xrkkVRlLQkh/RFV1GcBXXE2oMf8rrCFuPYCxbvM46xDDLq2p
 AMhuZnN1yMRdQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH 0/4] drm/panfrost: Turn off clocks and regulators in PM
Date: Mon, 30 Oct 2023 14:22:53 +0100
Message-ID: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least MediaTek platforms are able to get the GPU clocks and regulators
completely off during system suspend, allowing to save a bit of power.

Panfrost is used on more than just MediaTek SoCs and the benefits of this
can be variable across different SoC models and/or different SoCs from
different manufacturers: this means that just adding this ability for all
could result in unexpected issues and breakages on untested SoCs.

For the aforemenetioned reasons, turning off the clocks and/or regulators
was implemented inside of a capabilities barrier that shall be enabled on
a per-SoC basis (in the panfrost_compatible platform data) after testing
of both benefits and feasibility.

In this series, I am adding the ability to switch on/off clocks and
regulators and enabling that on all MediaTek platforms, as I was able
to successfully test that on multiple Chromebooks featuring different
MediaTek SoCs; specifically, I've manually tested on MT8186, MT8192 and
MT8195, while MT8183 got tested only by KernelCI.

Cheers!

AngeloGioacchino Del Regno (4):
  drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
  drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
  drm/panfrost: Implement ability to turn on/off regulators in suspend
  drm/panfrost: Set regulators on/off during system sleep on MediaTek
    SoCs

 drivers/gpu/drm/panfrost/panfrost_device.c | 78 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h | 13 ++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  3 +
 3 files changed, 90 insertions(+), 4 deletions(-)

-- 
2.42.0

