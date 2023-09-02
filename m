Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE4790864
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060F10E032;
	Sat,  2 Sep 2023 15:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586B10E032
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 15:22:18 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id cSRzqoXOCUaEwcSRzqaRzL; Sat, 02 Sep 2023 17:22:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1693668136;
 bh=yjDI6etd+k4oOa2FG7xcDg5/IuMHAnQLiXRlOSm4IIo=;
 h=From:To:Cc:Subject:Date;
 b=L6KSI2Id8suQcDx8BCJvdaSOTHrmcA/V6FokPsR/KDUblTLpNEasdMOhZMotfdGzG
 J9yZTCOflaCm/lsUzAeVLcwvSNRTIE1vMcV+2fHEfVPDgFvA5QkK50NFoox9lysS/t
 iz4SOVG1VnXJyuy1i0tNimLk4uuO8OH+UCGVlpOlk8F4if0egol/sRZ/jRtzx6BmFh
 D8DougwFq+Tmvgz58J0yyEk+GBcbkfsVbbXlh408B80kBcjBzpIi2QETTTwNfqaPlO
 QIjgwPI6+35FmBW4VIFkdc0+r/wNYB0uWYwO1NNLH8eVGPkSPzYNmsw0s831ivbM9O
 8jrQz+2Or4VtQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Sep 2023 17:22:16 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com, digetx@gmail.com
Subject: [PATCH 0/6] drm/tegra: Fix some error handling paths
Date: Sat,  2 Sep 2023 17:22:07 +0200
Message-Id: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the patches are retated to tegra_output_probe() and missing
tegra_output_remove(). Others are things spotted while writting the serie.


Patches 1, 3, 4 are verbose, but some functions called in the probe can
return -EPROBE_DEFER, so it is nice to correctly release resources.

Maybe moving the tegra_output_probe() call would minimize the changes, but I'm
always reluctant to move code, because of possible side-effects.


Christophe JAILLET (6):
  drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
  drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling
    path of tegra_dsi_probe()
  drm/tegra: dsi: Fix some error handling paths in tegra_hdmi_probe()
  drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
  drm/tegra: rgb: Fix missing clk_put() in the error handling paths of
    tegra_dc_rgb_probe()
  drm/tegra: output: Fix missing i2c_put_adapter() in the error handling
    paths of tegra_output_probe()

 drivers/gpu/drm/tegra/dsi.c    | 55 ++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/hdmi.c   | 20 ++++++++-----
 drivers/gpu/drm/tegra/output.c | 16 +++++++---
 drivers/gpu/drm/tegra/rgb.c    | 18 +++++++----
 4 files changed, 74 insertions(+), 35 deletions(-)

-- 
2.34.1

