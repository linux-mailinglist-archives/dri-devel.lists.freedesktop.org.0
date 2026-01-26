Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGsnGipgd2n8eQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:38:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A2885C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E0F10E1D1;
	Mon, 26 Jan 2026 12:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="eIYxit/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jan 2026 12:37:57 UTC
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com
 [101.71.155.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7D10E1D1;
 Mon, 26 Jan 2026 12:37:56 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3200b3fcf;
 Mon, 26 Jan 2026 20:32:51 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: lyude@redhat.com
Cc: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] drm/nouveau: Fix memory leak in nouveau_channel_ctor()
Date: Mon, 26 Jan 2026 12:32:48 +0000
Message-Id: <20260126123248.164621-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bfa4ae47903a1kunm8f0cf292523f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT08ZVk4ZQ0NNHUtLSBhJGFYeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
 tZBg++
DKIM-Signature: a=rsa-sha256;
 b=eIYxit/y6p7SWGy1pZggvAgPpjfT1yrX9pCvMl5xLYgipmJ7vVBgm9r5z5PikCiPWeLH0CXgahoKqAWeVepNqmPD2ySRBP1WJDBTK94v4U8omj5s4R19PfHr8Jst+EKMUGJM8L8MhSm0bjGkrrLBUZZhFh+q5WrNIDTVCZz3cXg=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=8uzYSpMQ1AKqTcHbWZbcyjdl+RkqVx3ltMWWymBf5O0=;
 h=date:mime-version:subject:message-id:from;
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,redhat.com,vger.kernel.org,seu.edu.cn];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zilin@seu.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.836];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,seu.edu.cn:dkim,seu.edu.cn:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DF3A2885C9
X-Rspamd-Action: no action

In nouveau_channel_ctor(), nouveau_channel_prep() allocates the channel
structure. If nvif_mem_ctor() fails to allocate the userd memory, the
function returns without freeing the channel, resulting in a memory leak.

Add nouveau_channel_del() to the error path to ensure the allocated
channel is properly freed.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 06db7fded6de ("drm/nouveau/fifo: add new channel classes")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b1e92b1f7a26..a421c32fda02 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -322,8 +322,10 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD", NVIF_CLASS_MEM_GF100,
 				    NVIF_MEM_VRAM | NVIF_MEM_COHERENT | NVIF_MEM_MAPPABLE,
 				    0, PAGE_SIZE, NULL, 0, &chan->mem_userd);
-		if (ret)
+		if (ret) {
+			nouveau_channel_del(pchan);
 			return ret;
+		}
 
 		args->huserd = nvif_handle(&chan->mem_userd.object);
 		args->ouserd = 0;
-- 
2.34.1

