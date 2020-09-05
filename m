Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EED25E6F0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135E16ED42;
	Sat,  5 Sep 2020 10:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCF16ED40
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=80UL8AOrmi15avfI4BecbEfzyt/yEv+160kOfcy5fMo=; b=ezWiY1V1AZ9//6+BILu3R0DId9
 ykcFqbk5RMx96p7dYfRSf9YtT15ef/Qu2FT/LcPz5IK6NVu3efz9BTiImZSp9j4k6j8ymWeE4X1jc
 F2rSWCVM0mZDANZtDnJTcRlzq/i+Urfnkzk3NMQKrt57FQWLaatZQS4hIjqgBjK149QrK3filoQIf
 L/aowVbuFRi/pYM6gyW0F601DY5bEYW2pfM3QSgcHeF6Fn/BO9cHIXysUNE3NLwiw9h5XUO9QXM0n
 7e7j99qxvyTJ+ajNLuU1Vx+rtD6hvCSQ1zCyaMdvXwRxUE8VDCNg3TRuV232sH3+//Gp5+V5Dhodq
 C9731bRw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXw-0003SS-Kg; Sat, 05 Sep 2020 13:35:48 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 02/17] gpu: host1x: Allow syncpoints without associated
 client
Date: Sat,  5 Sep 2020 13:34:05 +0300
Message-Id: <20200905103420.3021852-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
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
 drivers/gpu/host1x/syncpt.c | 8 +++-----
 drivers/gpu/host1x/syncpt.h | 6 +++++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index fce7892d5137..7cb80d4768b1 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -42,9 +42,9 @@ static void host1x_syncpt_base_free(struct host1x_syncpt_base *base)
 		base->requested = false;
 }
 
-static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
-						 struct host1x_client *client,
-						 unsigned long flags)
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  struct host1x_client *client,
+					  unsigned long flags)
 {
 	struct host1x_syncpt *sp = host->syncpt;
 	unsigned int i;
@@ -69,7 +69,6 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 	if (!name)
 		goto free_base;
 
-	sp->client = client;
 	sp->name = name;
 
 	if (flags & HOST1X_SYNCPT_CLIENT_MANAGED)
@@ -447,7 +446,6 @@ void host1x_syncpt_free(struct host1x_syncpt *sp)
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
-	sp->client = NULL;
 	sp->name = NULL;
 	sp->client_managed = false;
 
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index 8e1d04dacaa0..77e7206cc316 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -33,7 +33,6 @@ struct host1x_syncpt {
 	const char *name;
 	bool client_managed;
 	struct host1x *host;
-	struct host1x_client *client;
 	struct host1x_syncpt_base *base;
 
 	/* interrupt data */
@@ -113,4 +112,9 @@ static inline int host1x_syncpt_is_valid(struct host1x_syncpt *sp)
 	return sp->id < host1x_syncpt_nb_pts(sp->host);
 }
 
+/* Allocate a syncpoint. */
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  struct host1x_client *client,
+					  unsigned long flags);
+
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
