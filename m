Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E803F8740
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABA26E823;
	Thu, 26 Aug 2021 12:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 12:19:30 UTC
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114C6E822;
 Thu, 26 Aug 2021 12:19:30 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7165A22173;
 Thu, 26 Aug 2021 14:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629979812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H9RQiDxWvFG0IU5yJiqYwMEIyrB2lEpXizSuM9eNB9g=;
 b=VgkBCCO1Akw5Ckhvs4F7Frt26/4hxfGx88YzzZpjSd60JvrJbkrkIjwS/SEeEdpFdpyVUI
 UrcHCvvdk0GhuwFElitHyRoBF9KSAXLhEa+kvaDy5yIvgDr+FAEfrcWkHOVU0hxeXx9G99
 F4iQZyYOvfyR6Hr0K0xszVIQoWOtan4=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 0/3] drm/etnaviv: IOMMU related fixes
Date: Thu, 26 Aug 2021 14:10:03 +0200
Message-Id: <20210826121006.685257-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
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

This patch series fixes usage of the etnaviv driver with GPUs behind a
IOMMU. It was tested on a NXP LS1028A SoC. Together with Lucas' MMU patches
[1] there are not more (GPU internal) MMU nor (system) IOMMU faults on the
LS1028A.

[1] https://lists.freedesktop.org/archives/etnaviv/2021-August/003682.html

Michael Walle (3):
  drm/etnaviv: use PLATFORM_DEVID_NONE
  drm/etnaviv: fix dma configuration of the virtual device
  drm/etnaviv: use a 32 bit mask as coherent DMA mask

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 41 ++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 10 deletions(-)

-- 
2.30.2

