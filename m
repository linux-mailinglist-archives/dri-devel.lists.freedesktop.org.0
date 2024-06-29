Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED091CB3F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 07:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1681610E1E2;
	Sat, 29 Jun 2024 05:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="R+/lIPx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C179110E1E2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 05:23:12 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1719638586; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fhS08vbqW3H4/k2q3naZ+EGyPNDga3CC7UZ/McCvXn3UVpxK15JJBInCQlscPJzjLdX9l6wVh5bl6P8DNFMuDvTqvlKCo6Qr92feFJieIEpvuuKXvdjDBNcUgH8oQhIclJlr8wwYKxhUllfi9adZYv6QQOVB3HDqZzGU2w+B2QU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719638586;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8ELiCFvmKeq7yctdOzbA7uFe3ZHMTxmd1PiqaEMmYic=; 
 b=nWZ8Xeu9gRDAs6lD1zvhKUwbIr12onDLLbK3D6wpJxEz467ABly4HDI8iqMjVFsr50QrqJhuL6xyB6HMga6WW8owY1N8yojO+Vb6vav+e60cCDGeweeumMdZyLP7GUqb553owOAeepfbInShnlEaRmJoZJr5fpIWQ93WXRyYv4s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719638586; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8ELiCFvmKeq7yctdOzbA7uFe3ZHMTxmd1PiqaEMmYic=;
 b=R+/lIPx60Tf7TUj4EV69MAqn2XUvDEeGTve+HPuBo4Q9qViZsmygytBIs9+C28A7
 3ScH0kyIY7JyEKE8tcmu++dYs9Ch7/PZ0hxZUgGwTUv80fUtES3yHhInecmRj3magyE
 xhy6q9yCt9dqRieJyDJcK+AYgL7BA2yAuiku9QqLfiTI89lQSUiagAraV8sARJN4MWL
 4y7TH+sAhXuJ+Yo4NaXwxiUmlD87rcIGWyY9CDPQISqcrfO5ZcFK6sZbV+8iOeGpvXT
 YbnDrzjxs9kTnMm3p6UKboChtI2PnoisSpy5svBxUlRNqgEo7hy/KLPwsCtzCS2soAk
 nHoXOGrhjA==
Received: by mx.zohomail.com with SMTPS id 1719638584701382.1484552031518;
 Fri, 28 Jun 2024 22:23:04 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/2] drm/ttm: support device w/o coherency
Date: Sat, 29 Jun 2024 13:22:45 +0800
Message-ID: <20240629052247.2653363-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.45.2
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

This patchset tries to make TTM support devices w/o full DMA coherency
capability (usually due to part of the link between the device and the
CPU, esp. PCIe controller, do not have full coherency).

The patchset itself looks quite straightforward, however I don't know
why this isn't included in the kernel in years, so make it a RFC.

Tested on Rockchip RK3566, which has a PCIe controller w/o full
coherency with an AMD OLAND GPU (R7 240). Mainly radeon driver is
tested, but amdgpu driver is tried and at least OpenGL (glmark2) works.
(The board used for testing is a Quartz64, which has a PCIe slot that
can directly be seated with a PCIe graphics card)

Icenowy Zheng (2):
  drm/ttm: save the device's DMA coherency status in ttm_device
  drm/ttm: downgrade cached to write_combined when snooping not
    available

 drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++++
 drivers/gpu/drm/ttm/ttm_device.c  | 2 ++
 drivers/gpu/drm/ttm/ttm_tt.c      | 4 ++++
 include/drm/ttm/ttm_caching.h     | 3 ++-
 include/drm/ttm/ttm_device.h      | 5 +++++
 5 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.45.2

