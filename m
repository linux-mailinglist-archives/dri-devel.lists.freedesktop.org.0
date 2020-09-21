Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5541273C74
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4EC6E7D9;
	Tue, 22 Sep 2020 07:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB4D89FD9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:12:34 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id BF0911A37F3;
 Mon, 21 Sep 2020 19:11:57 +0800 (CST)
Message-ID: <AN*ApwBwDVasgemZb6*hx4qM.1.1600686717774.Hmail.bernard@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?W1JlLXNlbmRdW1BBVENIXSBncHUvaXB1LXYzOnJlZHVjZSBwcm90ZWN0ZWQgY29kZSBhcmVhIGluIGlwdSBpZG1hYyBnZXQvcHV0?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.124
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.124) ] by ajax-webmail (
 [127.0.0.1] ) ; Mon, 21 Sep 2020 19:11:57 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Mon, 21 Sep 2020 19:11:57 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSk0eHUtMHRhDTk8eVkpNS0tNQ01MSkxDTE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo1UToLDDkMPy0aCBweFiEZTVET
 A08KNlVKVUpNS0tNQ01MSkNITUNVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpOTFVL
 VUhKVUpJT1lXWQgBWUFITE9NNwY+
X-HM-Tid: 0a74b05cfb5d93b4kuwsbf0911a37f3
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
