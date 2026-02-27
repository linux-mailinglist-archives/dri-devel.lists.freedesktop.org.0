Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPnoCICmoWmqvQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D91B88AF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FECA10EBA1;
	Fri, 27 Feb 2026 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MFvErwEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D921410EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:13:10 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R5SXmR3478147; Fri, 27 Feb 2026 14:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=W
 nzD+Mqz10RbIBjtNxU1/ZOP6fPHxGt3wm8hxVeHwq8=; b=MFvErwEGIMSFnDRfq
 vblweF0ARZeFtogZh+dbYvHSKr365/cELom8ShED2lsPH8TRouOQ+DM283kt6C3D
 K8zH4flh64839Ke685AM6omEBpc4/KVVkO/nt0GMNMpledPB/iCNPYO0hBNrbrfc
 G2tBWpLoWBfdsqlWaXEfGEgTfEop+mErBKNPVSs94/pmaWQjBfLWqrTdmyeESNsJ
 7O0UWZDWAua1j7dqRUPO/ow4ZXy1in15jmD3pVidTIF/vRZVmyVYGEXcnrE7RVJr
 XzEKZF4N2QvNMv56iDXNwMkg7rZzPCTh+L6lCwWe8a4PEQxc63hJfOmQ4Kh5TJft
 /CExQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cjdvv9c6p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 14:12:56 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:55 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 27 Feb 2026 14:12:47 +0000
Subject: [PATCH 1/3] drm/imagination: Check for NULL struct dev_pm_domain_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-single-domain-power-fixes-v1-1-d37ba0825f7c@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=jBgKnCq+YL3th6PRa1/ELKZ0oCwTC2bVWQAhD/mwuOA=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQuXJbmyBhhPt+3V6xhvsMh9n3OpRXyXw6WF8jc5j/UL
 54wa6JdRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEzk8haGf1pFR584MyzzyU4p
 lo1YttfNpq3Gfe2+P0+y7F82p6966sTIsPOaAmuv7Cz39MzHrVKOPen3rx9L/3kg1ftYsIPTxWv
 7mQE=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=CL0nnBrD c=1 sm=1 tr=0 ts=69a1a668 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=qNABUOcEAAAA:8 a=r_1tXGB3AAAA:8 a=nMjM23kXYAJxtPFA7vEA:9
 a=QEXdDO2ut3YA:10 a=Ytm653ucTKQjCvbzLygB:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: yoOM3qXgbwvCmRiZ-6E3GQ7H8FxApYHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX5MHVgQesMRWe
 fjFBFpHWNgnVRe+U2qSaObrdyhBvsJGjzdiKuYnxAsyIO92/USQ+V8JAbNUZAu0tK0X860wbhv0
 rvGmFWT5s93VMk5WJK1UnvAYHhlYNtQB+qUiQXNiV6frBSlsZkgLev0Uu7y7fNY4mKBrs6efWyO
 ufJ4er1FNsLdgSYF+iY3U1VBgeUgiV8Wt61iKjGXjx89c3ZmiVMNs8pDid+GmnU7mcKArD+Jr+K
 it8YPzjDjLQxr62fLfGiDc9bZqs+KqfPJ1G2JOAeYjbdZAuqUK72kibUzPf0MhFVIC8pkqZ0D69
 /jYlL7Q7pD+BflUQGAKIzw9yggsmJ8MfoO+O+mz4hOu0um0PRylPIb3EH4t0+286o5G2qZIErJk
 mg2dE7cuW+qRWReDNBplCC2+yyrAMjjZMIaWEEXIqkYlSj56NjksUJJnYRTme9ImFLiCHEz28YL
 ixGd7rsFULCC/bRcKmA==
X-Proofpoint-ORIG-GUID: yoOM3qXgbwvCmRiZ-6E3GQ7H8FxApYHk
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
X-Rspamd-Queue-Id: 359D91B88AF
X-Rspamd-Action: no action

While dev_pm_domain_detach_list() itself contains the necessary NULL check,
the access to struct dev_pm_domain_list->num_pds does not and thus faults
on devices with <=1 power domains (where the struct dev_pm_domain_list
machinery is skipped for simplicity).

This can be reproduced on AM625, which produces the following log[1]:

[   10.820056] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
[   10.831903] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
...
[   10.844023] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
...
[   11.090162] Call trace:
[   11.092600]  pvr_power_domains_fini+0x18/0xa0 [powervr] (P)
[   11.098218]  pvr_probe+0x100/0x14c [powervr]
[   11.102505]  platform_probe+0x5c/0xa4

Fixes: e19cc5ab347e3 ("drm/imagination: Use dev_pm_domain_attach_list()")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk/ [1]
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 006a72ed5064..be8018085b2d 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -668,14 +668,16 @@ void pvr_power_domains_fini(struct pvr_device *pvr_dev)
 {
 	struct pvr_device_power *pvr_power = &pvr_dev->power;
 
-	int i = (int)pvr_power->domains->num_pds - 1;
+	if (!pvr_power->domains)
+		goto out;
 
-	while (--i >= 0)
+	for (int i = (int)pvr_power->domains->num_pds - 2; i >= 0; --i)
 		device_link_del(pvr_power->domain_links[i]);
 
 	dev_pm_domain_detach_list(pvr_power->domains);
 
 	kfree(pvr_power->domain_links);
 
+out:
 	*pvr_power = (struct pvr_device_power){ 0 };
 }

-- 
2.53.0

