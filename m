Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB2lHCU3lmkkcQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:03:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4515A8C3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09410E626;
	Wed, 18 Feb 2026 22:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Knw2L7S1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1338210E627
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=4XFFuoOsWpLPrzDAC/fYwo+2tbrwanNtYfWlQGixUvc=; b=Knw2L7S1DSKHkL
 heCtVOyOltjeWKQl5CpiTLMYBU8Lt1wHgU2sAxxOLyDR6Bkyq5vX4S5UTEdd8L5LuKx9PAuoX5lMq
 iurRPFfDyZTu9hfbaKdcQms8nf9mu7VgjfBt0IqVO9TzWpX5XbSmQCdcb82zp5VMzovQxyLXD4Fkf
 Rh8xkn3Vos48c9nDB/p7mLgv4ghTxxAJ6T2KYSksfbichbqPdmvIwZIVUWabBNTSkT69c7j4Wll4B
 OPSlC4+EjgJ+FVmkV/ZIeTQWKBRSxyqp75x9JUcQq2D7fEY9NAmFcSbwkBoZ8luTaC7Ia2Asd0xlW
 OFUwDan56f5AkWIhPTIQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vspdT-007v15-I3; Wed, 18 Feb 2026 22:03:07 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vspdT-000000057Wf-1G2I;
 Wed, 18 Feb 2026 22:03:07 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, james.thomas@codethink.co.uk,
 robert.mccann@codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC] drivers: base: component: these can be part of more than one
 aggregate
Date: Wed, 18 Feb 2026 22:03:03 +0000
Message-Id: <20260218220303.1220560-1-ben.dooks@codethink.co.uk>
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
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[codethink.co.uk : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap4-20230908];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:james.thomas@codethink.co.uk,m:robert.mccann@codethink.co.uk,m:ben.dooks@codethink.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,codethink.co.uk:mid,codethink.co.uk:email]
X-Rspamd-Queue-Id: ADB4515A8C3
X-Rspamd-Action: no action

Sending as an RFC as there is still a couple of todo comments and
I am not completely sure this is bug-free yet.

When dealing with newer qualcomm devices they can have a gpu associated
with more than one display controller. With each displayer controller
being an aggregate device only one will start with the others being
held as they will never find the gpu and thus never get bound.

To try and sort this out, make each component have a list of all
the aggregate devices it is part of. To avoid adding more structs
we add a list node to each of the match which can have a component
and use that to avoid adding a lot more code.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/base/component.c | 93 +++++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5d1eb5d82462a..f9e1a6ecf3143 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -37,6 +37,7 @@
  */
 
 struct component;
+struct aggregate_device;
 
 struct component_match_array {
 	void *data;
@@ -44,6 +45,8 @@ struct component_match_array {
 	int (*compare_typed)(struct device *, int, void *);
 	void (*release)(struct device *, void *);
 	struct component *component;
+	struct list_head component_list;
+	struct aggregate_device *adev;
 	bool duplicate;
 };
 
@@ -64,7 +67,7 @@ struct aggregate_device {
 
 struct component {
 	struct list_head node;
-	struct aggregate_device *adev;
+	struct list_head agdevs;
 	bool bound;
 
 	const struct component_ops *ops;
@@ -156,9 +159,6 @@ static struct component *find_component(struct aggregate_device *adev,
 	struct component *c;
 
 	list_for_each_entry(c, &component_list, node) {
-		if (c->adev && c->adev != adev)
-			continue;
-
 		if (mc->compare && mc->compare(c->dev, mc->data))
 			return c;
 
@@ -170,6 +170,38 @@ static struct component *find_component(struct aggregate_device *adev,
 	return NULL;
 }
 
+static bool component_match_adev(struct component *c,
+				 struct aggregate_device *adev)
+{
+	struct component_match *match = adev->match;
+	size_t i;
+
+	for (i = 0; i < match->num; i++) {
+		struct component_match_array *mc = &match->compare[i];
+
+		if (mc->component == c)
+			return true;
+	}
+
+	return false;
+}
+
+static void component_remove_adev(struct component *c,
+				   struct aggregate_device *adev)
+{
+	struct component_match *match = adev->match;
+	size_t i;
+
+	for (i = 0; i < match->num; i++) {
+		struct component_match_array *mc = &match->compare[i];
+
+		if (mc->component == c) {
+			list_del(&mc->component_list);
+			mc->component = NULL;
+		}
+	}
+}
+
 static int find_components(struct aggregate_device *adev)
 {
 	struct component_match *match = adev->match;
@@ -183,6 +215,7 @@ static int find_components(struct aggregate_device *adev)
 	for (i = 0; i < match->num; i++) {
 		struct component_match_array *mc = &match->compare[i];
 		struct component *c;
+		bool duplicate;
 
 		dev_dbg(adev->parent, "Looking for component %zu\n", i);
 
@@ -195,28 +228,19 @@ static int find_components(struct aggregate_device *adev)
 			break;
 		}
 
+		duplicate = component_match_adev(c, adev);
 		dev_dbg(adev->parent, "found component %s, duplicate %u\n",
-			dev_name(c->dev), !!c->adev);
+			dev_name(c->dev), duplicate);
 
 		/* Attach this component to the adev */
-		match->compare[i].duplicate = !!c->adev;
+		match->compare[i].duplicate = duplicate;
 		match->compare[i].component = c;
-		c->adev = adev;
+		match->compare[i].adev = adev;
+		list_add(&match->compare[i].component_list, &c->agdevs);
 	}
 	return ret;
 }
 
-/* Detach component from associated aggregate_device */
-static void remove_component(struct aggregate_device *adev, struct component *c)
-{
-	size_t i;
-
-	/* Detach the component from this adev. */
-	for (i = 0; i < adev->match->num; i++)
-		if (adev->match->compare[i].component == c)
-			adev->match->compare[i].component = NULL;
-}
-
 /*
  * Try to bring up an aggregate device.  If component is NULL, we're interested
  * in this aggregate device, otherwise it's a component which must be present
@@ -236,7 +260,7 @@ static int try_to_bring_up_aggregate_device(struct aggregate_device *adev,
 		return 0;
 	}
 
-	if (component && component->adev != adev) {
+	if (component && !component_match_adev(component, adev)) {
 		dev_dbg(adev->parent, "master is not for this component (%s)\n",
 			dev_name(component->dev));
 		return 0;
@@ -494,7 +518,7 @@ static void free_aggregate_device(struct aggregate_device *adev)
 		for (i = 0; i < match->num; i++) {
 			struct component *c = match->compare[i].component;
 			if (c)
-				c->adev = NULL;
+				component_remove_adev(c, adev);
 		}
 	}
 
@@ -749,8 +773,21 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 
 	ret = try_to_bring_up_masters(component);
 	if (ret < 0) {
-		if (component->adev)
-			remove_component(component->adev, component);
+		// if we don't bind, do we have to remove all masters from component?
+		// todo: also do we need to remove in reverse order?
+		struct list_head *ptr, *tmp;
+		struct component_match_array *mc;
+
+		list_for_each_safe(ptr, tmp, &component->agdevs) {
+			mc = list_entry(ptr, struct component_match_array, component_list);
+
+			list_del(&mc->component_list);
+			mc->component = NULL;
+
+			if (!mc->duplicate)
+				take_down_aggregate_device(mc->adev);
+		}
+
 		list_del(&component->node);
 
 		kfree(component);
@@ -822,6 +859,8 @@ EXPORT_SYMBOL_GPL(component_add);
 void component_del(struct device *dev, const struct component_ops *ops)
 {
 	struct component *c, *component = NULL;
+	struct list_head *ptr, *tmp;
+	struct component_match_array *mc;
 
 	mutex_lock(&component_mutex);
 	list_for_each_entry(c, &component_list, node)
@@ -831,9 +870,13 @@ void component_del(struct device *dev, const struct component_ops *ops)
 			break;
 		}
 
-	if (component && component->adev) {
-		take_down_aggregate_device(component->adev);
-		remove_component(component->adev, component);
+	list_for_each_safe(ptr, tmp, &component->agdevs) {
+		mc = list_entry(ptr, struct component_match_array, component_list);
+		list_del(&mc->component_list);
+		mc->component = NULL;
+
+		if (!mc->duplicate)
+			take_down_aggregate_device(mc->adev);
 	}
 
 	mutex_unlock(&component_mutex);
-- 
2.37.2.352.g3c44437643

