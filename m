Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM5DL32moWmivQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0911B889F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855AB10EB99;
	Fri, 27 Feb 2026 14:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="eJqcTAae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA910EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:13:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R5SXmT3478147; Fri, 27 Feb 2026 14:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=A
 0JjkVhfrOJXIb6+ST0rwukaf25muO07fqksCDvaZyg=; b=eJqcTAaetOOgYU5dj
 xxxiPeRF/nj8Mujh+1MdxsTGlvlatsjF4a9kzV5y56cEQcGPToqyrWirb/KjmZkm
 93MEVhDeu3T9mgTavZCkgZu5lb3m7fINc694MPYGTxnp8BL07ZWWzy4Bs5nml02A
 hGga+BQ3Hkbz/9al5vDjazHHYuA3nbRHwqKZ+acV5RJGjWF65LyY2wYcLtpubQ8E
 RaA+6HusQZ3iLue0cCs3HaEz9XV++VO5q6C4BWzD9Jw/0CY0JY5k64hEwtFP/ftJ
 PuLJTS8k59nHqoTEOLLC971PWl9b1ZmiufDSjuMLf9G1usJvJSZAeMPWos8DK62q
 6Dakg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cjdvv9c6p-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 14:12:57 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:56 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 27 Feb 2026 14:12:49 +0000
Subject: [PATCH 3/3] drm/imagination: Ensure struct pvr_device->power is
 initialized
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-single-domain-power-fixes-v1-3-d37ba0825f7c@imgtec.com>
References: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
In-Reply-To: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2862;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=CTZ8p65aNyqfbC60o557B+s2G3xiBfZ/LVJaYgYYgJY=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQuXJYmtfDRFr9DC7Q/fdyz8dHHhOyF+xJUH1n8/qKhe
 6Ihp6C6p6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmEraH4b9TUIb5vZa5mZvq
 DlezPljkIWwSxdQQ0lRl+u/qRPek+7sY/tk9i3ThPOcSH/zx/Vyvpww//rsLf75/cZ5x+6ofesz
 lImwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=CL0nnBrD c=1 sm=1 tr=0 ts=69a1a669 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=rcCXANk18YU-WH22cxUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: sqTZOR1PcrG47CWOXpSqwpRgHV4GCLtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX/4FHADWe9Dvv
 fy4KVOcxwUFxwuqZeoElDClzO5YDUSO08Ep+ccBKNnH75E3humujRpwbjsboHjGqmsJl1eHaVBT
 kt03wAz3T6wlQ1aFnIAPnHPYOnmKI42QAuxaE0jUMeAGRN8haOuKp/TfrdljRBFPJBIAC8YSI5G
 40aZJwjzPPUTy5tfnXggxbPIKjkPkgvcDIqYT84k45SIbfINdIfQV6g94mDk+8bf2WLg1K5dzQf
 wjUE9GYcBKLCBSKR/AMDvdQLzIwVN0HbDp4kQthzWDg1J78FZwYtw0VgPbfLAuyA4r3jYZ0CcEO
 CDIDYwy0YTnBo8E/gh+J81FtOQB+kebVvGG57L7ADH5AlSBpOOpRwtvJs11onu06y8YHFAS1R5X
 Ko4z3qMwsIEJfqLUmR8pL96MjJNvQi4l+Dpb8gJCSzKxpyOVNk9ImQykYRhpWcVziYKcWYdFJVg
 QMFeL+YiJ191vr+HYMA==
X-Proofpoint-ORIG-GUID: sqTZOR1PcrG47CWOXpSqwpRgHV4GCLtA
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:broonie@kernel.org,m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:alessio.belle@imgtec.com,m:brajesh.gupta@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5E0911B889F
X-Rspamd-Action: no action

When pvr_power_domains_init() handles <=1 power domains, the content of
struct pvr_device->power was previously left uninitialized.

Fixes: e19cc5ab347e3 ("drm/imagination: Use dev_pm_domain_attach_list()")
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 44 ++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 5a1fda685f2c..7a8765c0c1ed 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -598,8 +598,8 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct device *dev = drm_dev->dev;
 
-	struct device_link **domain_links __free(kfree) = NULL;
 	struct dev_pm_domain_list *domains = NULL;
+	struct device_link **domain_links = NULL;
 	int domain_count;
 	int link_count;
 
@@ -608,23 +608,30 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 
 	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
 						  "#power-domain-cells");
-	if (domain_count < 0)
-		return domain_count;
+	if (domain_count < 0) {
+		err = domain_count;
+		goto out;
+	}
 
-	if (domain_count <= 1)
-		return 0;
+	if (domain_count <= 1) {
+		err = 0;
+		goto out;
+	}
 
 	if (domain_count > ARRAY_SIZE(ROGUE_PD_NAMES)) {
 		drm_err(drm_dev, "%s() only supports %zu domains on Rogue",
 			__func__, ARRAY_SIZE(ROGUE_PD_NAMES));
-		return -EOPNOTSUPP;
+		err = -EOPNOTSUPP;
+		goto out;
 	}
 
 	link_count = domain_count - 1;
 
 	domain_links = kzalloc_objs(*domain_links, link_count);
-	if (!domain_links)
-		return -ENOMEM;
+	if (!domain_links) {
+		err = -ENOMEM;
+		goto out;
+	}
 
 	const struct dev_pm_domain_attach_data pd_attach_data = {
 		.pd_names = ROGUE_PD_NAMES,
@@ -634,7 +641,7 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 
 	err = dev_pm_domain_attach_list(dev, &pd_attach_data, &domains);
 	if (err < 0)
-		return err;
+		goto err_free_links;
 
 	for (i = 0; i < link_count; i++) {
 		struct device_link *link;
@@ -650,18 +657,25 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 		domain_links[i] = link;
 	}
 
-	pvr_dev->power = (struct pvr_device_power){
-		.domains = domains,
-		.domain_links = no_free_ptr(domain_links),
-	};
-
-	return 0;
+	err = 0;
+	goto out;
 
 err_unlink:
 	while (--i >= 0)
 		device_link_del(domain_links[i]);
 
 	dev_pm_domain_detach_list(domains);
+	domains = NULL;
+
+err_free_links:
+	kfree(domain_links);
+	domain_links = NULL;
+
+out:
+	pvr_dev->power = (struct pvr_device_power){
+		.domains = domains,
+		.domain_links = domain_links,
+	};
 
 	return err;
 }

-- 
2.53.0

