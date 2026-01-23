Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCp7D4GJc2krxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:45:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE277387
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE010EB1A;
	Fri, 23 Jan 2026 14:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="IbO472jH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D210EB10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:45:17 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NDKDws1038859; Fri, 23 Jan 2026 14:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=DdTMT647qwDSy2XxjxYS1cD
 TiZiosrChRC8yZHrG18U=; b=IbO472jHZLAbD0QCcwoSTRIjXQ/2i0uYhewiCub
 pp/gDR4a6NksokgNuQoMvUjLN/539X0BYUVluhRjb4Ehycj15wZhzCoMvYTDIzxQ
 G96dZM19Dd39uLzP1o3o+iSCMrzkNDV1pLmSgX9x96iyFPTa0gcQi07m7GI/uv7Q
 qw3TRSBtq9KwPyceeDGHtlzhevWsWq4p4d/F/AnHs2W+yKvhn2jf+nePo5Ff8ndS
 o6dPuJw1Xoi+lAhmZ2Ukk4lS40EkafloGkeJMhRHWgLvDukFYGhbv4qO8dx6oij1
 Nq9shbSI3AuYtPkGQX4StFpFbptsEUr1U4bO2YDt3n+3IEA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4btnawhx6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jan 2026 14:45:07 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.28) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:45:05 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 23 Jan 2026 14:44:50 +0000
Subject: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAGGJc2kC/x3MwQpAQBCA4VfRnE2ZicSryGFagymWdjcpeXeb4
 3f4/weiBtMIffFA0MuiHT6DygLcKn5RtCkbuOKGuCI8d5yOXcyjpCRuxc1iQp1rdcTScUuQ2zP
 obPf/Hcb3/QD9KEndZwAAAA==
X-Change-ID: 20251201-pm-domain-attach-list-ef4ec12a9271
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 "Alessio Belle" <alessio.belle@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Matt Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6382;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=T/2yOTyU7RuYTjc6p9REE4wtSh9ES10BClfJR07tOwQ=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQWdxYGhev7tO70W30kbUriCjb9dfv55550X5z/sbbtc
 cPLX6/OdpSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEGoIZ/kcw/Y223rbfTmSu
 wy+xDgsDk7McZflyr7YzVLw2Y2o6NQuoQtVXJ5DJdFGFzJTnvp6TcxklouQX14ZvvCHhNK2WTZ8
 ZAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.28]
X-Authority-Analysis: v=2.4 cv=bYRmkePB c=1 sm=1 tr=0 ts=69738973 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CzDp7rjNS_MA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=3YyE6xVfhT4hD00o0wYA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: ZRPms88zt4ctGhFC1AqY2DPbFVn_F7gg
X-Proofpoint-GUID: ZRPms88zt4ctGhFC1AqY2DPbFVn_F7gg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExNyBTYWx0ZWRfX8mOM3d/btyhQ
 sxC7K9Wt72UqyP88/0ELh91fzWdueMqA13tzQ9FrdGBBf4U2H5i29yIaeExZzuaDjqr+gsGYW/E
 0l1M1SVu7EtlKfRTDaGx5TEyScfqdBTqzfY7nN6miXr7K2XDhMMxZjRugEo+rfXkI/BIznknOyf
 eddw1ZN5xcxXOR9fYht1Zlje21eBDYJDCJQooTfWLyM43nQj8CcY4eI2X4iYWjMBdUESQovvRVR
 RI0PcrYd6pKYwM+qOjEL4RH6p8Sj8Xv2P/8pQ4ZYwZM6pAPiu0WIYk9Xph+Yp5vfQfEK04TouSQ
 pxaX0Fz2wYHmlafzkFoYXwfvN2IrRvm9nWBrkifQTjr3OAWNkk/zilrLhIGHtfg5gyDf9VClo7d
 E7WP7bdFH9UMrZCw2B30pITn5UV2uLStCy45tL9J3uMcBmZeCsgH/RdkmiZmUyqKyEn1N+iD5Jp
 /AOx/xwvG51WNe/4S8w==
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: AFAE277387
X-Rspamd-Action: no action

This helper handles the attaching and linking of the entire list of power
domains. Besides making pvr_power_domains_init() simpler, this also lays
the groundwork to simplify supporting the varied power domain names used in
Volcanic GPU cores.

Note that we still need to create the links between power domains to ensure
they're brought up in a valid sequence.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
We've had this patch kicking around internally for a while; it's been
held up by discussions as to whether we actually need the dependencies
between domains for the hardware to behave currectly. As it turns out,
the answer is yes.

Geert sent a similar patch[1] yesterday which didn't retain the
inter-domain links and suggested we just send this one instead of
reworking his. Thank you for the kick up the backside to progress this
one! :)

[1]: https://lore.kernel.org/r/194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be/
---
 drivers/gpu/drm/imagination/pvr_device.h | 10 ++--
 drivers/gpu/drm/imagination/pvr_power.c  | 80 ++++++++++++--------------------
 2 files changed, 33 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index cfda215e7428e..d51c57cf93323 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -152,15 +152,13 @@ struct pvr_device {
 	 * @power: Optional power domain devices.
 	 *
 	 * On platforms with more than one power domain for the GPU, they are
-	 * stored here in @domain_devs, along with links between them in
-	 * @domain_links. The size of @domain_devs is given by @domain_count,
-	 * while the size of @domain_links is (2 * @domain_count) - 1.
+	 * stored here in @domains, along with links between them in
+	 * @domain_links. The size of @domain_links is one less than
+	 * struct dev_pm_domain_list->num_pds in @domains.
 	 */
 	struct pvr_device_power {
-		struct device **domain_devs;
+		struct dev_pm_domain_list *domains;
 		struct device_link **domain_links;
-
-		u32 domain_count;
 	} power;
 
 	/**
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index b9f801c63260c..a0834c550a852 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -593,14 +593,16 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
 
 int pvr_power_domains_init(struct pvr_device *pvr_dev)
 {
-	struct device *dev = from_pvr_device(pvr_dev)->dev;
+	static const char *const ROGUE_PD_NAMES[] = { "a", "b", "c", "d", "e" };
+
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 
 	struct device_link **domain_links __free(kfree) = NULL;
-	struct device **domain_devs __free(kfree) = NULL;
+	struct dev_pm_domain_list *domains = NULL;
 	int domain_count;
 	int link_count;
 
-	char dev_name[2] = "a";
 	int err;
 	int i;
 
@@ -612,46 +614,33 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 	if (domain_count <= 1)
 		return 0;
 
-	link_count = domain_count + (domain_count - 1);
+	if (domain_count > ARRAY_SIZE(ROGUE_PD_NAMES)) {
+		drm_err(drm_dev, "%s() only supports %zu domains on Rogue",
+			__func__, ARRAY_SIZE(ROGUE_PD_NAMES));
+		return -EOPNOTSUPP;
+	}
 
-	domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
-	if (!domain_devs)
-		return -ENOMEM;
+	link_count = domain_count - 1;
 
 	domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
 	if (!domain_links)
 		return -ENOMEM;
 
-	for (i = 0; i < domain_count; i++) {
-		struct device *domain_dev;
-
-		dev_name[0] = 'a' + i;
-		domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
-		if (IS_ERR_OR_NULL(domain_dev)) {
-			err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
-			goto err_detach;
-		}
-
-		domain_devs[i] = domain_dev;
-	}
-
-	for (i = 0; i < domain_count; i++) {
-		struct device_link *link;
-
-		link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
-		if (!link) {
-			err = -ENODEV;
-			goto err_unlink;
-		}
+	const struct dev_pm_domain_attach_data pd_attach_data = {
+		.pd_names = ROGUE_PD_NAMES,
+		.num_pd_names = domain_count,
+		.pd_flags = 0,
+	};
 
-		domain_links[i] = link;
-	}
+	err = dev_pm_domain_attach_list(dev, &pd_attach_data, &domains);
+	if (err < 0)
+		return err;
 
-	for (i = domain_count; i < link_count; i++) {
+	for (i = 0; i < link_count; i++) {
 		struct device_link *link;
 
-		link = device_link_add(domain_devs[i - domain_count + 1],
-				       domain_devs[i - domain_count],
+		link = device_link_add(domains->pd_devs[i + 1],
+				       domains->pd_devs[i],
 				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 		if (!link) {
 			err = -ENODEV;
@@ -662,9 +651,8 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 	}
 
 	pvr_dev->power = (struct pvr_device_power){
-		.domain_devs = no_free_ptr(domain_devs),
+		.domains = domains,
 		.domain_links = no_free_ptr(domain_links),
-		.domain_count = domain_count,
 	};
 
 	return 0;
@@ -673,31 +661,21 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 	while (--i >= 0)
 		device_link_del(domain_links[i]);
 
-	i = domain_count;
-
-err_detach:
-	while (--i >= 0)
-		dev_pm_domain_detach(domain_devs[i], true);
-
 	return err;
 }
 
 void pvr_power_domains_fini(struct pvr_device *pvr_dev)
 {
-	const int domain_count = pvr_dev->power.domain_count;
+	struct pvr_device_power *pvr_power = &pvr_dev->power;
 
-	int i = domain_count + (domain_count - 1);
+	int i = (int)pvr_power->domains->num_pds - 1;
 
 	while (--i >= 0)
-		device_link_del(pvr_dev->power.domain_links[i]);
-
-	i = domain_count;
+		device_link_del(pvr_power->domain_links[i]);
 
-	while (--i >= 0)
-		dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true);
+	dev_pm_domain_detach_list(pvr_power->domains);
 
-	kfree(pvr_dev->power.domain_links);
-	kfree(pvr_dev->power.domain_devs);
+	kfree(pvr_power->domain_links);
 
-	pvr_dev->power = (struct pvr_device_power){ 0 };
+	*pvr_power = (struct pvr_device_power){ 0 };
 }

---
base-commit: 15bd2f5d52de890f745ac0c60a44cd27d095bb0d
change-id: 20251201-pm-domain-attach-list-ef4ec12a9271

