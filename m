Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7446C62CF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 10:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3916D10E45E;
	Thu, 23 Mar 2023 09:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B63D10E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 09:08:30 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BEF066030B7;
 Thu, 23 Mar 2023 09:08:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679562509;
 bh=FrNqR4ku0iKICaEUucsD1iDyufd8gS7yQCcBq8NLjCk=;
 h=From:To:Cc:Subject:Date:From;
 b=UoiSqZAJ+OsBLSjFthKrc7M9zBYhSaip5DgHe5wwELvBcjsM32KCPOrA7w212f/zV
 BlHbVbKrvnqe//C/9LuPRrKo93J7AFcRskLwwtej/qr9N4VoFL4yUTIwiG94YmPiXz
 u/1Hl805zVAVQ50Sttvq/9Ygojol5mFGMl9TNSPDpKTPJ129MGO+eYGCMbst4gX9wU
 iCQRoUmBOpVW9+ff9ch3fszXBGR3rJ1OACE9joDeyGwgG7KVJa5Cz5M22dScnF+6mH
 Pf+SDZWvLy1eq5txEGN17CAiCU0f8i5UlMQZuFmtV62lCgnruFJQOmLVllcLCmagLi
 VmOZlujSTW9ig==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v1 RESEND 0/2] Panfrost: GPU Speed-binning support via OPP
Date: Thu, 23 Mar 2023 10:08:20 +0100
Message-Id: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP framework supports binning through the 'opp-supported-hw'
devicetree property and some of the SoCs that are using Panfrost,
namely ... MediaTek, are actually binned.
This is especially seen in MT8186, but some other models do actually
support the same.

This series adds basic binning support by simply checking (and reading)
speed-bin from NVMEM (eFuse arrays, usually) and *if and only if* that
is provided, adds the read value with devm_pm_opp_set_supported_hw().

This code expects to receive a value that is compatible with how the
supported_hw checks work in OPP and it should never contain any kind
of platform (or SoC) specific code, since Panfrost is a driver for a
GPU that may be tied to different SoCs... and this is what this series
provides.

Cheers!

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Document nvmem for speedbin support
  drm/panfrost: Add basic support for speed binning

 .../bindings/gpu/arm,mali-bifrost.yaml        |  7 +++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   | 30 +++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.40.0

