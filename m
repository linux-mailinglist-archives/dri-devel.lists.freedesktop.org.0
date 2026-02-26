Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEvEEkHqn2mqewQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 07:37:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856DC1A15BD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 07:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5310E11E;
	Thu, 26 Feb 2026 06:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1120910E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:37:47 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.233])
 by APP-01 (Coremail) with SMTP id qwCowABH72o16p9p0jzECA--.1348S2;
 Thu, 26 Feb 2026 14:37:42 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 1/2] drm/dumb-buffers: reference the ioctl interface for its
 constraints
Date: Thu, 26 Feb 2026 14:37:39 +0800
Message-ID: <20260226063740.2872016-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABH72o16p9p0jzECA--.1348S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUZryfWF1DZr13Xw1kKrg_yoW8JFy3pF
 4fKrW7trWkAasxtr1DAa4kuFy5Ca43WF4fuFyjk343ZF1qyFy0vFn5tw45XryDJrn7AFyj
 qrnFkryrCFyjkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
 U==
X-Originating-IP: [112.94.101.233]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:zhengxingda@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 856DC1A15BD
X-Rspamd-Action: no action

The current design of the DRM_IOCTL_MODE_CREATE_DUMB interface can only
promise linear RGB buffers to be properly working.

Add a reference to the interface from the document snippet for dumb
objects (which is included by drm-kms.rst document and will end up in
the built kernel documentation).

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e2b62e5fb891b..5d535b230aad3 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -57,7 +57,10 @@
  *
  * Note that dumb objects may not be used for gpu acceleration, as has been
  * attempted on some ARM embedded platforms. Such drivers really must have
- * a hardware-specific ioctl to allocate suitable buffer objects.
+ * a hardware-specific ioctl to allocate suitable buffer objects. The current
+ * userspace API also includes some constraints on the format and modifier to
+ * be used with buffers backed by dumb objects, see &struct
+ * drm_mode_create_dumb for more details.
  */
 
 static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
-- 
2.52.0

