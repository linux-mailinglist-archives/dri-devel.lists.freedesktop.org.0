Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED1AEB015
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B82F10E389;
	Fri, 27 Jun 2025 07:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ArVd+/YJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 917 seconds by postgrey-1.36 at gabe;
 Fri, 27 Jun 2025 02:32:18 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FFA410E310;
 Fri, 27 Jun 2025 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tc
 /BQSujfSpTkh1XCLZ71AAIXQedB9w+B7U5bWFPNho=; b=ArVd+/YJjqOEl66hJG
 eLqr/NhAjPpoMnBVbPy7zUY/D2/tgh9Rqy0NZ/Ay5INPWCn0b5GFR/2819UYOXls
 M9xtp6ZYb0qWku2buk8ocLTfrdIx/Ap6IIgc+Pp4ckf5XmXPs+bMzJXPmwvX5LvU
 P7LsG8zERshCtfvqRcSLT6tdc=
Received: from 163.com (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgCH50IR_11oSw1RAQ--.45226S2;
 Fri, 27 Jun 2025 10:16:51 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 chenyuan_fl@163.com, Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATCH] drm/msm: Add error handling for krealloc in metadata setup
Date: Fri, 27 Jun 2025 10:16:43 +0800
Message-Id: <20250627021643.58426-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCH50IR_11oSw1RAQ--.45226S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWxWrW7CFWftr18AF43ZFb_yoW8JFy8pF
 W7Gr1SqrWqvwnrWw47Aa1fCFy5G3W8Ww45CrZFvw17Zw18KF1UXFWqyw40yFy2vFy8J3Z2
 van2kFyfXr1qyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEWE_ZUUUUU=
X-Originating-IP: [116.128.244.171]
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiNxB4vWhc+8Rt6wABsu
X-Mailman-Approved-At: Fri, 27 Jun 2025 07:30:52 +0000
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

From: Yuan Chen <chenyuan@kylinos.cn>

Function msm_ioctl_gem_info_set_metadata() now checks for krealloc
failure and returns -ENOMEM, avoiding potential NULL pointer dereference.
Explicitly avoids __GFP_NOFAIL due to deadlock risks and allocation constraints.

Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f67..993502a86d0a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -551,6 +551,7 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 					   u32 metadata_size)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *new_metadata;
 	void *buf;
 	int ret;
 
@@ -568,8 +569,14 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 	if (ret)
 		goto out;
 
-	msm_obj->metadata =
+	new_metadata =
 		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
+	if (!new_metadata) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	msm_obj->metadata = new_metadata;
 	msm_obj->metadata_size = metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
 
-- 
2.25.1

