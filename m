Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8C485CEB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547EE10E540;
	Thu,  6 Jan 2022 00:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED210E53A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:07:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC6D8B81E60;
 Thu,  6 Jan 2022 00:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA08C36AEB;
 Thu,  6 Jan 2022 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641427648;
 bh=7e7h7G+8Us/sLyTD6q0Hif8nF7Obr/tfz8j1T8HZEsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=doFh3KTAdOd5jn+Jvk+pzEuWyAOL1Yljo/Vh7gIdONaFL39/5LbRzNUCbkX84Acei
 wEOfSkWls7+rv2IyhAVIMGuolNkX+rMxFYlU6UIe/pOjjYJyyqKpcnsr7duiz2P+sn
 qfBOU0QyO3zizcwV/wfLhdON2AezyOaoppAGTB7gdG5FXMfUv5cIDIhFvOxzOGFDQQ
 yvpPNxJsFeibTXQPF99RFXQ5zsUd3pPZJKEaWw01qXvAmJqNdvRp9Wd0Hnb4ezUZqY
 +tGGdK5NThKQVR8pivTFmk0cIJXnFo3vRlgKXCYjbf9UBaq+3GTGNcwYg8tUXDOy1+
 KucPswP+8lHqQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v8 09/10] vgaarb: Use unsigned format string to print lock
 counts
Date: Wed,  5 Jan 2022 18:06:57 -0600
Message-Id: <20220106000658.243509-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106000658.243509-1-helgaas@kernel.org>
References: <20220106000658.243509-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

In struct vga_device, io_lock_cnt and mem_lock_cnt are unsigned, but we
previously printed them with "%d", the signed decimal format.  Print them
with the unsigned format "%u" instead.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index b7e6c1228fff..95e37817074e 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -1156,7 +1156,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 
 	/* Fill the buffer with infos */
 	len = snprintf(lbuf, 1024,
-		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%d:%d)\n",
+		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%u:%u)\n",
 		       vga_decode_count, pci_name(pdev),
 		       vga_iostate_to_str(vgadev->decodes),
 		       vga_iostate_to_str(vgadev->owns),
-- 
2.25.1

