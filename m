Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C389874F083
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDA410E397;
	Tue, 11 Jul 2023 13:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-33.mta0.migadu.com (out-33.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82CD10E397
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:44:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689083052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3CqUWHTXt9YKLludIAE9Vu171FOQTMffySfHpYiVKE=;
 b=fcBxJpIJRhiscx1vIK5FMhSholu/3p1hXgZdlU86GIbegLlF9G850UJbnAlh8vANzd4fqV
 5jprtVv2MLw91RL8jmD71CiyJc3VlyD5cbrlfluy8NLW29BHMoptpNXsO4kUBtoZzM0t+L
 Y2z1WOMp0CDuW52i3c0+kTnp1Y2VXaU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sui@freedesktop.org, Jingfeng@loongson.cn
Subject: [PATCH 1/6] PCI/VGA: Use unsigned type for the io_state variable
Date: Tue, 11 Jul 2023 21:43:49 +0800
Message-Id: <20230711134354.755966-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230711134354.755966-1-sui.jingfeng@linux.dev>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The io_state variable in the vga_arb_write() function is declared with
unsigned int type, while the vga_str_to_iostate() function takes int *
type. To keep them consistent, replace the third argument of
vga_str_to_iostate() function with the unsigned int * type.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/pci/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..c1bc6c983932 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -77,7 +77,7 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 	return "none";
 }
 
-static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
+static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 {
 	/* we could in theory hand out locks on IO and mem
 	 * separately to userspace but it can cause deadlocks */
-- 
2.25.1

