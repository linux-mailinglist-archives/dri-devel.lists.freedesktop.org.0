Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0920FEF5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F416E448;
	Tue, 30 Jun 2020 21:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2BC6E34D;
 Tue, 30 Jun 2020 21:28:53 +0000 (UTC)
IronPort-SDR: q2nnG+bDDy6NziAkrZKDeEjKXca4NwM0EJoBN3nJu05VqpMTSfMhyfJiF1ioCHhTqPJgms/qdG
 MvQCzE4xhyfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846935"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:53 -0700
IronPort-SDR: GjuOyMESSaRdAQMMLdnOGgQGmsdfU47eFA2lJp52AVqDrMtneI2B9ZWpACSEJUKrjepZzoT8Ms
 R7nQLoXTTJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066817"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:53 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 47/59] =?UTF-8?q?drm/kmb:=20Don=E2=80=99t=20inadvertantly?=
 =?UTF-8?q?=20disable=20LCD=20controller?=
Date: Tue, 30 Jun 2020 14:27:59 -0700
Message-Id: <1593552491-23698-48-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

setbits instead of write dword for LCD_CONTROL register
this was inadvertantly disabling the LCD controller.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 1990e8c..d87a3a2 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -178,6 +178,9 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
 			LCD_DMA_LAYER_ENABLE);
 	kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
+	DRM_INFO("%s : %d lcd_ctrl = 0x%x lcd_int_enable=0x%x\n",
+			__func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
+			kmb_read_lcd(dev_p, LCD_INT_ENABLE));
 }
 
 
@@ -476,7 +479,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	 */
 	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
 
-	kmb_write_lcd(dev_p, LCD_CONTROL, ctrl);
+	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
 
 	/* FIXME no doc on how to set output format,these values are taken
 	 * from the Myriadx tests
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
