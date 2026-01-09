Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7A4D09EA7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431310E8AB;
	Fri,  9 Jan 2026 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="fq0jZREY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DBA10E8AB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=hX1Km62k0Ac0PW8TZ4V0r6fxrORu8UscmHNrKhm0Yyc=; b=fq0jZREYVDBx68
 tL9HhNnFxq8AgKORl4gSzOyP4wSayyWLaH5MOF1cR8Yt+6SF77jQMVg+RG0y/1vMt6mdrhOvnQ6rf
 yPprxdnbyggsnPywVDaM8IouxoAWQAMQ2IgB+eBtVOe6sgKnyY288tma0P8D0SI4Xd7ghmSfpYMIH
 2tf1x2BxDcnF4E/AyntE6qDezVser/bLK3iM+u1zgeQfiSFwQGI6TWnzxIr9nVdXmUDo9RYp+/7iF
 DI5fSpRG9KtpYEEPlwNAQurJK94rtFp6BBSzc96PTrBj5aNUtvatrPytsxK6hQijtDw0KAGMZqYnZ
 ma6g3quWEN/W2jmJe2Hw==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1veBrY-00EvWe-Ss; Fri, 09 Jan 2026 12:45:08 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1veBrY-00000001h1z-2c3p;
 Fri, 09 Jan 2026 12:45:08 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] gpu: host1x: fix missing 'host1x_context_device_bus_type'
Date: Fri,  9 Jan 2026 12:45:07 +0000
Message-Id: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
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

The drivers/gpu/host1x/context_bus.c does not include
any declaration of host1x_context_device_bus_type, and
after including "context.h" it also showed that there
are two definitons in the kernel, so fix those two

Change context.h to include the correct definiton of
host1x_context_device_bus_type by including
<linux/host1x_context_bus.h> in context.h

Fixes the following sparse warning:
drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?

Fixes: 3d70eb8e60c6d009c988 ("gpu: host1x: Make host1x_context_device_bus_type constant")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/host1x/context.h     | 3 +--
 drivers/gpu/host1x/context_bus.c | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
index 3e03bc1d3bac..5215922905ed 100644
--- a/drivers/gpu/host1x/context.h
+++ b/drivers/gpu/host1x/context.h
@@ -10,11 +10,10 @@
 
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/host1x_context_bus.h>
 
 struct host1x;
 
-extern struct bus_type host1x_context_device_bus_type;
-
 struct host1x_memory_context_list {
 	struct mutex lock;
 	struct host1x_memory_context *devs;
diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index 7cd0e1a5edd1..89f61b1f7d33 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -6,6 +6,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 
+#include "context.h"
+
 const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
 };
-- 
2.37.2.352.g3c44437643

