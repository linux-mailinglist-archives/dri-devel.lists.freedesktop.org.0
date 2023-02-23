Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F66A00AE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72A10E1F3;
	Thu, 23 Feb 2023 01:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E9310E477
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677116143; x=1708652143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KCrWkhEgSMX/g4sjTiSwnDZzTiu7fbvUZv0pm+Ui4tg=;
 b=SZ93elBZYgTUb4USdHCFa9dCJZqRzx3jI4S0cCraqd1HxN4GhV36sFMJ
 JmCZT73sq7wM3xfVLWruAmaoeBlnsMcRGLpGTxNQkfu5gjMGO3I3d785+
 EJFjbdgicbveEnZ2ubduAaYXuy9aFxA/wNSbGPNwgnDaFlO1jx91gA3+W
 c7PUTcXA7Jze2UU/cM1/3OdsKYEs7dtuZwc0bKIi2clHXQ7lpOmTmP5os
 JKrCET9Bupq+RCimbyEofxy3MXWML0NxHXv9YbgDwlDHcv/9ymET9uhnj
 ytiyGlQFomUNtOYFKG4R19VLD3sQ3AOEsxhfQErRH95MN4jz/+v5ySJSx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312714886"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="312714886"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 17:35:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781684650"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="781684650"
Received: from jekeller-desk.amr.corp.intel.com (HELO
 jekeller-desk.jekeller.internal) ([10.166.241.1])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 17:35:41 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: use struct_size() in vop2_bind
Date: Wed, 22 Feb 2023 17:35:33 -0800
Message-Id: <20230223013533.1707706-1-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f83
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jacob Keller <jacob.e.keller@intel.com>, Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the overflow-protected struct_size() helper macro to compute the
allocation size of the vop2 data structure.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: David Airlie <airlied@gmail.com>
---
I found this while developing a coccinelle script to detect potential places
where struct_size() would be appropriate.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0e0012368976..3e5861653b69 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2655,7 +2655,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 
 	/* Allocate vop2 struct and its vop2_win array */
-	alloc_size = sizeof(*vop2) + sizeof(*vop2->win) * vop2_data->win_size;
+	alloc_size = struct_size(vop2, win, vop2_data->win_size);
 	vop2 = devm_kzalloc(dev, alloc_size, GFP_KERNEL);
 	if (!vop2)
 		return -ENOMEM;

base-commit: 4d5a2cce47a8e1e7119a881a4714f0eee557c1cd
-- 
2.39.1.405.gd4c25cc71f83

