Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB6B91197
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C8710E457;
	Mon, 22 Sep 2025 12:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="encnEY2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDFA10E457
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 12:21:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56DCD403D0;
 Mon, 22 Sep 2025 12:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9EFC4CEF0;
 Mon, 22 Sep 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758543663;
 bh=ViEQLBan4Shyr+1aYZ9y/fzuOhYaRstrxknRLRm0rGA=;
 h=From:To:Cc:Subject:Date:From;
 b=encnEY2oI3pkWuxyAegZ3o1uxvsHR3E3/cPqc8+frAtqwQXBKwNYjVwVv6/0+zsUP
 STOfoN9NEi3sbeverjAzNFEShAsmT+1+f9nKLCgJaOClGtmbch2RdO+1PPooZFd+um
 r6TWlWp2Gwf8HqMXcEuQNBvnYEeTZB3/cO8nACwL4Lb8WEM/vGgdFw56tcIR1Xv1Rc
 QQpcTzj37r0SE2ddvS69P/nDDx0EX9s6pmunPi/T+nwcH74Z2pKTciIQNrj5hq7Dr4
 c5j78Oyg1rGKuztmrtpMc42INM8ZZdDygoslJ2tk33Aa0dBVMfuftviMb3xsx0IAJM
 ZrRwNMGbe1vnw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v0fXL-0000000078t-1O9R;
 Mon, 22 Sep 2025 14:20:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] drm: sti: fix device leaks at component probe
Date: Mon, 22 Sep 2025 14:20:12 +0200
Message-ID: <20250922122012.27407-1-johan@kernel.org>
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

Make sure to drop the references taken to the vtg devices by
of_find_device_by_node() when looking up their driver data during
component probe.

Note that holding a reference to a platform device does not prevent its
driver data from going away so there is no point in keeping the
reference after the lookup helper returns.

Fixes: cc6b741c6f63 ("drm: sti: remove useless fields from vtg structure")
Cc: stable@vger.kernel.org	# 4.16
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/sti/sti_vtg.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
index ee81691b3203..ce6bc7e7b135 100644
--- a/drivers/gpu/drm/sti/sti_vtg.c
+++ b/drivers/gpu/drm/sti/sti_vtg.c
@@ -143,12 +143,17 @@ struct sti_vtg {
 struct sti_vtg *of_vtg_find(struct device_node *np)
 {
 	struct platform_device *pdev;
+	struct sti_vtg *vtg;
 
 	pdev = of_find_device_by_node(np);
 	if (!pdev)
 		return NULL;
 
-	return (struct sti_vtg *)platform_get_drvdata(pdev);
+	vtg = platform_get_drvdata(pdev);
+
+	put_device(&pdev->dev);
+
+	return vtg;
 }
 
 static void vtg_reset(struct sti_vtg *vtg)
-- 
2.49.1

