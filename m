Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E640B91CB40
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 07:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0310E1FB;
	Sat, 29 Jun 2024 05:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="g9FEdqjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31DD10E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 05:23:18 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1719638592; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B8ny7U2fot/QheCyb7QbFouManFbpgrbbx4nrLOFktDhIY4QIvJzWrM/6LmkczCd2e7M4g3foU6EVkK2ptlk9ycnkHSBpAgNUih59iUyxk+gKEcvIyPyXOPcwi47s3R+dGbn2kemlr28oLKmCyHVx9bTiUWtMUSTYkg10An4Fak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719638592;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nEsIO0/bRYNax82CMmpXkU6vaStGTkFxGmHNhc3PsQE=; 
 b=I72E2nVNo0sPp9DSCChZpsbnj4+Y55gZLuRHu13SGsv5davs7/I1yyvf01+kyZ19+dwxSSgwdSL4Y8YYb2ZaNibBpx4WkSvkmtq0vGGyCrRCPeU8KKFPEZUbHCEVhd8hSjf68bTUaned94GIuL/v7TOvmPwE6oZ4nb28uHoi/iY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719638592; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nEsIO0/bRYNax82CMmpXkU6vaStGTkFxGmHNhc3PsQE=;
 b=g9FEdqjsErMLEr3aIuM6TAYS1MuqVTHIjjx+StbbJIRwK+57usSihxCvvLQAV2ru
 +FQZw6wfVbY2kgbN84ctUIfuwwWjn/wnrsjw8+IwrcrLfZltyfxY4VvEDctK8rTqsF9
 brF3V4nn0rw+g5m73twHGI7b+Zao3PkVEBs2BP4oIYdBPPsNS2aGqXwh/hMlD/FsTxl
 9O5StNdNhovbXHpei7UnHQJZ22czMQQ3m+2P5zC9L8C26Nyes/TF+Y9rozY/xV7UK72
 9CruVTrCfu6HaGWUIJ3yysojiuyfNGWLB1/XpSze3rzjlyyCIlNLSoc0cSueKireKCY
 NgPREyZ+xA==
Received: by mx.zohomail.com with SMTPS id 1719638591260119.47155784716438;
 Fri, 28 Jun 2024 22:23:11 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/2] drm/ttm: save the device's DMA coherency status in
 ttm_device
Date: Sat, 29 Jun 2024 13:22:46 +0800
Message-ID: <20240629052247.2653363-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240629052247.2653363-1-uwu@icenowy.me>
References: <20240629052247.2653363-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Currently TTM utilizes cached memory regardless of whether the device
have full DMA coherency (can snoop CPU cache).

Save the device's DMA coherency status in struct ttm_device, to allow
further support of devices w/o snooping capability (the capability
missing on at least one part of the transmission between the CPU and the
device).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 ++
 include/drm/ttm/ttm_device.h     | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 434cf0258000e..b923c14861c1a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -237,6 +237,8 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	list_add_tail(&bdev->device_list, &glob->device_list);
 	mutex_unlock(&ttm_global_mutex);
 
+	bdev->dma_coherent = dev->dma_coherent;
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_device_init);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c848..9daf7f47d6507 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -225,6 +225,11 @@ struct ttm_device {
 	 */
 	const struct ttm_device_funcs *funcs;
 
+	/**
+	 * @dma_coherent: if the device backed is dma-coherent.
+	 */
+	bool dma_coherent;
+
 	/**
 	 * @sysman: Resource manager for the system domain.
 	 * Access via ttm_manager_type.
-- 
2.45.2

