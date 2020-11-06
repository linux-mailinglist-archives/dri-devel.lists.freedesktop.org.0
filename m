Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85902AAE04
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0621897BC;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBA76EA87
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 12:57:08 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CSL4m4MqfzLv0J;
 Fri,  6 Nov 2020 20:56:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 20:57:01 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm: omapdrm: fix reference leak in runtime get ops
Date: Fri, 6 Nov 2020 21:00:53 +0800
Message-ID: <20201106130053.2335460-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. If runtime of the device has
error or device is in inaccessible state(or other error state),
resume operation will fail. If we do not call put operation to
decrease the reference, it will result in reference leak in
Moreover, this device cannot enter the idle state and always
stay busy or other non-idle state later. So we should fix it
through adding pm_runtime_put_noidle.

Zhang Qilong (2):
  drm: omapdrm: dsi: fix-reference-leak-in dsi_runtime_get.
  drm: omapdrm: dss: fix reference leak in dss_runtime_get

 drivers/gpu/drm/omapdrm/dss/dsi.c | 8 ++++++--
 drivers/gpu/drm/omapdrm/dss/dss.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
