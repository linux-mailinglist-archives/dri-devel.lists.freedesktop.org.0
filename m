Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ADCC78C51
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 12:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEDE10E84E;
	Fri, 21 Nov 2025 11:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eqZMuCt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FCC10E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 11:24:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F376E44059;
 Fri, 21 Nov 2025 11:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06EAC113D0;
 Fri, 21 Nov 2025 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763724287;
 bh=jdJtsYuqXaicdXVMWm0tMN7CbHJmNW9uyT/z2e52K9A=;
 h=From:To:Cc:Subject:Date:From;
 b=eqZMuCt32a7QZcHGcPht9J7OwEn7F+vWIWM1O5mls7C8jmIGhmIEsGkcBUqkG3U2P
 ZpPowEuh+eI4FvIINX4Fi0WaIuYiL2ImTF+7RzXvVIRQreMAxsJ1JpN1ocJQKPDh1o
 24RXagSvQah4pNH1KAwXKcGjzY10qJrXhqOpHhOQA3U0KsfzHsPCQSqAmFr7Oi3eT5
 7O9cdWcZw/rdDfzrkP6fZk+OxWmgUTHj/TNNgVW/SwVarbid560GhjxPYeL6NxDyoZ
 gcis7khhLq62uflwoQYlIlNcFG55QvpumWePXPXpsn+dk2sThOoeBQHMy9yrr/d4oi
 bq8U9AG5vQRZA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vMPFw-000000008Rv-0Pgw;
 Fri, 21 Nov 2025 12:24:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] drm/tegra: fix device leak on probe()
Date: Fri, 21 Nov 2025 12:24:32 +0100
Message-ID: <20251121112432.32456-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
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

Make sure to drop the reference taken when looking up the companion
device during probe().

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: f68ba6912bd2 ("drm/tegra: dc: Link DC1 to DC0 on Tegra20")
Cc: stable@vger.kernel.org	# 4.16
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/tegra/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a..7a6b30df6a89 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3148,6 +3148,8 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 		dc->client.parent = &parent->client;
 
 		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
+
+		put_device(companion);
 	}
 
 	return 0;
-- 
2.51.2

