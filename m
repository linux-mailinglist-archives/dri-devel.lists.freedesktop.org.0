Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A492BA912
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86BF6E8CE;
	Fri, 20 Nov 2020 11:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D57D6E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fMJF/+k3zpk9u6+rh/fo6naTrLRrrE4PquH0RJQFQ8g=; b=Xku4MQQGBtO/JioWxWhPydlxw4
 qhgBZIuSOBkLSs2IthEYxfUotsUMIzbvfvU1cklfDxx6r8egkPKzqJxJ7OaSssjB3EiItz56Bc4ei
 Pou0XFnbNH5GXvEwIGbRtTvtiJsQKXuTNXzg6dt3ANjI5F2FHFNeHbuENTTUJXA4JraFVyqC6QiUE
 jtvnidprfRz+iMH8fGsrg76jmBPlnQRV5+UIhy0y4BrLLSva2nf9nVBuxl5KqbMBl4CH9sDcAZ570
 frJqhWr/1OsM+xFFS/wPfOgWalWcVIDZhjBCe38kkVLnxaieRiLzFFSYZL3Zi/Ruz+HUT4hpDI06U
 FpTmqNlQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kg4Yq-0003lG-EQ; Fri, 20 Nov 2020 13:26:40 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v4 02/21] gpu: host1x: Allow syncpoints without associated
 client
Date: Fri, 20 Nov 2020 13:25:41 +0200
Message-Id: <20201120112600.935082-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Syncpoints don't need to be associated with any client,
so remove the property, and expose host1x_syncpt_alloc.
This will allow allocating syncpoints without prior knowledge
of the engine that it will be used with.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Clean up host1x_syncpt_alloc signature to allow specifying
  a name for the syncpoint.
* Export the function.
---
 drivers/gpu/host1x/syncpt.c | 22 ++++++++++------------
 drivers/gpu/host1x/syncpt.h |  1 -
 include/linux/host1x.h      |  3 +++
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index fce7892d5137..5982fdf64e1c 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -42,13 +42,13 @@ static void host1x_syncpt_base_free(struct host1x_syncpt_base *base)
 		base->requested = false;
 }
 
-static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
-						 struct host1x_client *client,
-						 unsigned long flags)
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  unsigned long flags,
+					  const char *name)
 {
 	struct host1x_syncpt *sp = host->syncpt;
+	char *full_name;
 	unsigned int i;
-	char *name;
 
 	mutex_lock(&host->syncpt_mutex);
 
@@ -64,13 +64,11 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 			goto unlock;
 	}
 
-	name = kasprintf(GFP_KERNEL, "%02u-%s", sp->id,
-			 client ? dev_name(client->dev) : NULL);
-	if (!name)
+	full_name = kasprintf(GFP_KERNEL, "%u-%s", sp->id, name);
+	if (!full_name)
 		goto free_base;
 
-	sp->client = client;
-	sp->name = name;
+	sp->name = full_name;
 
 	if (flags & HOST1X_SYNCPT_CLIENT_MANAGED)
 		sp->client_managed = true;
@@ -87,6 +85,7 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 	mutex_unlock(&host->syncpt_mutex);
 	return NULL;
 }
+EXPORT_SYMBOL(host1x_syncpt_alloc);
 
 /**
  * host1x_syncpt_id() - retrieve syncpoint ID
@@ -401,7 +400,7 @@ int host1x_syncpt_init(struct host1x *host)
 	host1x_hw_syncpt_enable_protection(host);
 
 	/* Allocate sync point to use for clearing waits for expired fences */
-	host->nop_sp = host1x_syncpt_alloc(host, NULL, 0);
+	host->nop_sp = host1x_syncpt_alloc(host, 0, "reserved-nop");
 	if (!host->nop_sp)
 		return -ENOMEM;
 
@@ -423,7 +422,7 @@ struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
 {
 	struct host1x *host = dev_get_drvdata(client->host->parent);
 
-	return host1x_syncpt_alloc(host, client, flags);
+	return host1x_syncpt_alloc(host, flags, dev_name(client->dev));
 }
 EXPORT_SYMBOL(host1x_syncpt_request);
 
@@ -447,7 +446,6 @@ void host1x_syncpt_free(struct host1x_syncpt *sp)
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
-	sp->client = NULL;
 	sp->name = NULL;
 	sp->client_managed = false;
 
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index 8e1d04dacaa0..3aa6b25b1b9c 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -33,7 +33,6 @@ struct host1x_syncpt {
 	const char *name;
 	bool client_managed;
 	struct host1x *host;
-	struct host1x_client *client;
 	struct host1x_syncpt_base *base;
 
 	/* interrupt data */
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index f711fc0154f4..099eff8a06d2 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -154,6 +154,9 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
 					    unsigned long flags);
 void host1x_syncpt_free(struct host1x_syncpt *sp);
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  unsigned long flags,
+					  const char *name);
 
 struct host1x_syncpt_base *host1x_syncpt_get_base(struct host1x_syncpt *sp);
 u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
