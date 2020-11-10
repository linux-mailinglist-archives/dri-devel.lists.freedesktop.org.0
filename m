Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4822AEA77
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270D289ED3;
	Wed, 11 Nov 2020 07:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FA189A98
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:47:29 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVngn1Wfqz15Tpy;
 Tue, 10 Nov 2020 20:47:17 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 20:47:20 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH 0/4] drm/omap: fix reference leak in runtime get ops
Date: Tue, 10 Nov 2020 20:51:04 +0800
Message-ID: <20201110125108.3827430-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series of patches fixed several usage counter leaks refer to
pm_runtime_get_sync. Many callers forget to call pm_runtime_put_noidle
when pm_runtime_get_sync failed, and we fixed it.

Zhang Qilong (4):
  drm: omapdrm: dsi: fix-reference-leak-in dsi_runtime_get.
  drm: omapdrm: dss: fix reference leak in dss_runtime_get
  drm/omap: hdmi4: fix reference leak in hdmi_runtime_get
  drm/omap: hdmi5: fix reference leak in hdmi_runtime_get

 drivers/gpu/drm/omapdrm/dss/dsi.c   | 8 ++++++--
 drivers/gpu/drm/omapdrm/dss/dss.c   | 8 ++++++--
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 4 +++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 4 +++-
 4 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
