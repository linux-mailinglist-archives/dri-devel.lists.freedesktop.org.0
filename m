Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D325665C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5A46EC13;
	Sat, 29 Aug 2020 09:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E936E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 02:08:17 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 4B918481954;
 Sat, 29 Aug 2020 10:08:14 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/ipu-v3:reduce protected code area in ipu idmac get/put
Date: Fri, 28 Aug 2020 19:08:07 -0700
Message-Id: <20200829020807.6568-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTBkfQx1OSx9CTEhOVkpOQkNNTU1DQk9PSE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzY6Fio5Gj8qEipDGQkXEixJ
 GglPFBdVSlVKTkJDTU1NQ0JPQ0hDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSU5CSzcG
X-HM-Tid: 0a7437f8ec2f93bakuws4b918481954
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change will speed-up a bit these ipu_idmac_get &
ipu_idmac_put processing and there is no need to protect
kzalloc & kfree.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/ipu-v3/ipu-common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index b3dae9ec1a38..8b3a57864c2e 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -267,29 +267,30 @@ EXPORT_SYMBOL_GPL(ipu_rot_mode_to_degrees);
 struct ipuv3_channel *ipu_idmac_get(struct ipu_soc *ipu, unsigned num)
 {
 	struct ipuv3_channel *channel;
+	struct ipuv3_channel *entry;
 
 	dev_dbg(ipu->dev, "%s %d\n", __func__, num);
 
 	if (num > 63)
 		return ERR_PTR(-ENODEV);
 
+	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
+	if (!channel)
+		return ERR_PTR(-ENOMEM);
+
+	channel->num = num;
+	channel->ipu = ipu;
+
 	mutex_lock(&ipu->channel_lock);
 
-	list_for_each_entry(channel, &ipu->channels, list) {
-		if (channel->num == num) {
+	list_for_each_entry(entry, &ipu->channels, list) {
+		if (entry->num == num) {
+			kfree(channel);
 			channel = ERR_PTR(-EBUSY);
 			goto out;
 		}
 	}
 
-	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
-	if (!channel) {
-		channel = ERR_PTR(-ENOMEM);
-		goto out;
-	}
-
-	channel->num = num;
-	channel->ipu = ipu;
 	list_add(&channel->list, &ipu->channels);
 
 out:
@@ -308,9 +309,10 @@ void ipu_idmac_put(struct ipuv3_channel *channel)
 	mutex_lock(&ipu->channel_lock);
 
 	list_del(&channel->list);
-	kfree(channel);
 
 	mutex_unlock(&ipu->channel_lock);
+
+	kfree(channel);
 }
 EXPORT_SYMBOL_GPL(ipu_idmac_put);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
