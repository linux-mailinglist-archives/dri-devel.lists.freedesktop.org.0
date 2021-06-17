Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CF3AB38C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 14:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900596E0CB;
	Thu, 17 Jun 2021 12:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Thu, 17 Jun 2021 09:54:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8CA6E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:54:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 59324D1E8B;
 Thu, 17 Jun 2021 17:47:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [111.207.172.18])
 by smtp.263.net (postfix) whith ESMTP id
 P5456T140566025205504S1623923255883568_; 
 Thu, 17 Jun 2021 17:47:42 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a357138165591929524564ebbd2486a8>
X-RL-SENDER: maqianga@uniontech.com
X-SENDER: maqianga@uniontech.com
X-LOGIN-NAME: maqianga@uniontech.com
X-FST-TO: maarten.lankhorst@linux.intel.com
X-RCPT-COUNT: 8
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Qiang Ma <maqianga@uniontech.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/auth: Move master pointer from drm_device to drm_file
Date: Thu, 17 Jun 2021 17:47:33 +0800
Message-Id: <20210617094733.8429-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Jun 2021 12:27:25 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qiang Ma <maqianga@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_file pointer clears to zero during multi-user switching,
so it needs to call drm_new_set_master for master pointer from drm_file.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2d46b7ac6f9..02431af6d0c5 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -302,7 +302,7 @@ int drm_master_open(struct drm_file *file_priv)
 	/* if there is no current master make this fd it, but do not create
 	 * any master object for render clients */
 	mutex_lock(&dev->master_mutex);
-	if (!dev->master)
+	if (!file_priv->master)
 		ret = drm_new_set_master(dev, file_priv);
 	else
 		file_priv->master = drm_master_get(dev->master);
-- 
2.20.1



