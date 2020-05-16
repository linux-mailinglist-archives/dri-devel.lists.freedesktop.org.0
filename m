Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645BE1D64BA
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094946E2A9;
	Sat, 16 May 2020 23:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ECA6E288
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665870; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIsUOHTqtqa7F5+gZuYIGs0fcUI70HLM4r/HBVMSNE4=;
 b=SnP/VdcTCWwehlzF6AxGZRQCTLuWnVWs/BS9LSnFHXVQLHPaC2YuH1GEIWfwNEqP9w/cMY
 vuaNQQe+1XNxJtuyzslQ3sTD5pcSZuPInly1z/qhU7uVOOQo6QvwgBIj+1XbsIhGiP61LR
 2TwnChhRIzWuT4E/EQAH2KA3rABiF9U=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 03/12] component: Support binding with no matches
Date: Sat, 16 May 2020 23:50:48 +0200
Message-Id: <20200516215057.392609-3-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:50 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support binding the master even though no components have been
registered.

This permits to support cases where components are optional.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/base/component.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index e97704104784..a9de7ee1677f 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -100,7 +100,7 @@ static int component_devices_show(struct seq_file *s, void *data)
 
 	seq_printf(s, "%-40s %20s\n", "device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
-	for (i = 0; i < match->num; i++) {
+	for (i = 0; !!match && i < match->num; i++) {
 		struct component *component = match->compare[i].component;
 
 		seq_printf(s, "%-40s %20s\n",
@@ -184,6 +184,11 @@ static int find_components(struct master *master)
 	size_t i;
 	int ret = 0;
 
+	if (!match) {
+		dev_dbg(master->dev, "No components\n");
+		return 0;
+	}
+
 	/*
 	 * Scan the array of match functions and attach
 	 * any components which are found to this master.
@@ -218,10 +223,12 @@ static void remove_component(struct master *master, struct component *c)
 {
 	size_t i;
 
-	/* Detach the component from this master. */
-	for (i = 0; i < master->match->num; i++)
-		if (master->match->compare[i].component == c)
-			master->match->compare[i].component = NULL;
+	if (master->match) {
+		/* Detach the component from this master. */
+		for (i = 0; i < master->match->num; i++)
+			if (master->match->compare[i].component == c)
+				master->match->compare[i].component = NULL;
+	}
 }
 
 /*
@@ -470,10 +477,12 @@ int component_master_add_with_match(struct device *dev,
 	struct master *master;
 	int ret;
 
-	/* Reallocate the match array for its true size */
-	ret = component_match_realloc(dev, match, match->num);
-	if (ret)
-		return ret;
+	if (match) {
+		/* Reallocate the match array for its true size */
+		ret = component_match_realloc(dev, match, match->num);
+		if (ret)
+			return ret;
+	}
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
 	if (!master)
@@ -557,6 +566,10 @@ void component_unbind_all(struct device *master_dev, void *data)
 	if (!master)
 		return;
 
+	/* No match, nothing to unbind */
+	if (!master->match)
+		return;
+
 	/* Unbind components in reverse order */
 	for (i = master->match->num; i--; )
 		if (!master->match->compare[i].duplicate) {
@@ -640,6 +653,10 @@ int component_bind_all(struct device *master_dev, void *data)
 	if (!master)
 		return -EINVAL;
 
+	/* No match, nothing to bind */
+	if (!master->match)
+		return 0;
+
 	/* Bind components in match order */
 	for (i = 0; i < master->match->num; i++)
 		if (!master->match->compare[i].duplicate) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
