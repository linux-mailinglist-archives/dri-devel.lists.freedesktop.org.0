Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D913BEDF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9775D6E92F;
	Wed, 15 Jan 2020 11:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CF6E92B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id DFEFC3F401;
 Wed, 15 Jan 2020 12:53:48 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=UG5u/k8f; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHvZH4LaBIoq; Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 38E413F3B6;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 566C2360315;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=Cg4e8WGjuAkL3ap0RiytVynjJcudVYrlibS5R2qfLSY=;
 h=From:To:Cc:Subject:Date:From;
 b=UG5u/k8f48SB6yYWw0HEADdbmw81uqE1r+TFy2gGQiStuzyTbWHIFKh/2pbaX9YDy
 3HjaHeyVFkMp/VwarHVa2Sn7SOpxD1Xne29q+4SAxatRhvJsGpo3aI4520V6EnOjxf
 JIDILoYGH12CImiewkBpey1RwlIRK3CvZmVTR8go=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/vmwgfx: Don't use the HB port if memory encryption is
 active
Date: Wed, 15 Jan 2020 12:53:21 +0100
Message-Id: <20200115115329.2836-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellstrom <thellstrom@vmware.com>

With memory encryption active, the hypervisor typically can't read the
guest memory using the HB port, since it is encrypted using a key known
only to the guest. In that case fall back to processing 4 bytes at a time
using the ordinary backdoor port.
The other option would be to use unencrypted bounce buffers for the
hypervisor to read out from or write into, but given the limited message
sizes it appears more efficient to just fall back to the ordinary backdoor
port.

Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index b6c5e4c2ac3c..d63441194249 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -28,6 +28,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/mem_encrypt.h>
 
 #include <asm/hypervisor.h>
 
@@ -148,7 +149,8 @@ static unsigned long vmw_port_hb_out(struct rpc_channel *channel,
 	unsigned long si, di, eax, ebx, ecx, edx;
 	unsigned long msg_len = strlen(msg);
 
-	if (hb) {
+	/* HB port can't access encrypted memory. */
+	if (hb && !mem_encrypt_active()) {
 		unsigned long bp = channel->cookie_high;
 
 		si = (uintptr_t) msg;
@@ -202,7 +204,8 @@ static unsigned long vmw_port_hb_in(struct rpc_channel *channel, char *reply,
 {
 	unsigned long si, di, eax, ebx, ecx, edx;
 
-	if (hb) {
+	/* HB port can't access encrypted memory */
+	if (hb && !mem_encrypt_active()) {
 		unsigned long bp = channel->cookie_low;
 
 		si = channel->cookie_high;
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
