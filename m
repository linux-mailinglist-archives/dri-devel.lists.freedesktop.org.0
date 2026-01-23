Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPRiCSSAc2ncwwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:05:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4276A1F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069C10EAF1;
	Fri, 23 Jan 2026 14:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="BUOYWMcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BB810EAF1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=3o/V+pItf8hTOU7BXv1sPYSeVAiOjt+faqxkDYxjzE4=; b=BUOYWMcGgpeoyy
 s5OX/n1bWzfWr0NJfhX/X0X1QCf3K5WGPLMT8NhcQJgbc2yz4ad16eq0jY4LmHR7YCSvRDkDCmQmE
 JOlEJGtzBK9RICBYjHbwK9Zeqt3i/K20j6dAKPHK+ejYx6CiVtUMknruLmO9v76JIM9n251voSNhI
 uh1QvV0VXhlrwGeI2fKGiZ6XeHNhRukpkDIl50b4TYQNmJqpetycIAbdpFe+aYJrdjIsSHm8rT6+J
 PIF2cOz5cTpTW6ytrOFa1c1pxSglaIvGTVYfmYY2Ip4FmSE0wTgikW4igJgn1urRcXhV6Ld6SKnkp
 /cM9Qj2fNOK7zse8fn0w==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vjHmj-00BGgw-BW; Fri, 23 Jan 2026 14:05:14 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vjHmk-00000002YTU-0IBH;
 Fri, 23 Jan 2026 14:05:14 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2] gpu: host1x: fix missing 'host1x_context_device_bus_type'
Date: Fri, 23 Jan 2026 14:05:12 +0000
Message-Id: <20260123140512.609167-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[codethink.co.uk : SPF not aligned (relaxed),reject,sampled_out];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap4-20230908];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.freedesktop.org,ffwll.ch,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:linux-tegra@vger.kernel.org,m:simona@ffwll.ch,m:airlied@gmail.com,m:mperttunen@nvidia.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:ben.dooks@codethink.co.uk,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	NEURAL_HAM(-0.00)[-0.223];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5BC4276A1F
X-Rspamd-Action: no action

The drivers/gpu/host1x/context_bus.c does not include
any declaration of host1x_context_device_bus_type, and
after including "context.h" it also showed that there
are two definitons in the kernel, so fix those two

Fix by removing the definition in context.h and include
<linux/host1x_context_bus.h> in context_bus.c

Fixes the following sparse warning:
drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
--
v2:
  - removed fixes line
  - changed to include into the c files directly
---
 drivers/gpu/host1x/context.c     | 1 +
 drivers/gpu/host1x/context.h     | 2 --
 drivers/gpu/host1x/context_bus.c | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index a6f6779662a3..476e8c5e1297 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -12,6 +12,7 @@
 
 #include "context.h"
 #include "dev.h"
+#include <linux/host1x_context_bus.h>
 
 static void host1x_memory_context_release(struct device *dev)
 {
diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
index 3e03bc1d3bac..78bcf08cc90a 100644
--- a/drivers/gpu/host1x/context.h
+++ b/drivers/gpu/host1x/context.h
@@ -13,8 +13,6 @@
 
 struct host1x;
 
-extern struct bus_type host1x_context_device_bus_type;
-
 struct host1x_memory_context_list {
 	struct mutex lock;
 	struct host1x_memory_context *devs;
diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index 7cd0e1a5edd1..c0ba0433c686 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/of.h>
+#include <linux/host1x_context_bus.h>
 
 const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
-- 
2.37.2.352.g3c44437643

