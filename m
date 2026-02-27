Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEPrG3qmoWmivQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FCF1B8880
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5D610EB98;
	Fri, 27 Feb 2026 14:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="HVvYYrI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4475E10EBA9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:13:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R5SXmS3478147; Fri, 27 Feb 2026 14:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=1
 UcLPpIZ6vY8x/Gzvls+GkPpApysdkzPLTtIeVGTsUU=; b=HVvYYrI8MYgH8h1en
 h9GE+Lr7mL/wyWgbpeFbxelf44dSKYd8qOem2peQ678nISNgTuiI493E6PYIDf+0
 islX7cA8eYYBhEef0dD1Rhc/SU/ZL4GhtqUyITRoXYGmBzCeAdFj8rS1H/+2pjFg
 BiyESHHtQtrNwheKgiGgcZqj0CiF6l9Vn4OYohOjTbY1QToJKL7MmhWd29rTpr38
 xhC0qdqHGl4jm6bFVYJxohVRWdBfhBA6T6fDAEro1iKsht1c+9NvLu5bCU9KbNHl
 3z/aytdRp+5zX4YlyMpk4BFrJ3EY8SVVDUmvvkIh4OhrwR5cYbTE4iqYcyaRaY+V
 jZXbg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cjdvv9c6p-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 14:12:56 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:55 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 27 Feb 2026 14:12:48 +0000
Subject: [PATCH 2/3] drm/imagination: Detach pm domains if linking fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-single-domain-power-fixes-v1-2-d37ba0825f7c@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=matt.coster@imgtec.com; 
 h=from:subject:message-id;
 bh=m9V0bxbKRVB3O+Zl+TeUVN0NGhAD01mkVzf97aIRnJk=; 
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQuXJZ2LrdpyhVmS9nmFbcav9/Rq+Z0ucqa9k2S3/Rb3
 b77y7mSO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAi4lMZGd50nu9pSnnK5Fd5
 NMpp/+emN1nM1sc1Sl7IbRKoVf5fcI6RYYbuRp+18c2NExv/HJ8Su+ros5qZC2UWNsstW/jkZUa
 hJB8A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=CL0nnBrD c=1 sm=1 tr=0 ts=69a1a668 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=OlRkcSivOKHRo-lWOosA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: d30WGYlod4H8gWsHgClqP5cz_nKfFjl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX0urmr9NopPzb
 gjO+WeEAFaUP6MnfU5S/IeG44fB+0h6/dU8MYJ6gNlGc8e6qe1uwNb998mZhgXTAqlT2sspmdtG
 5Xk+6NqQs+ysB1Qy+tvZ8QWFrUAoMZJxu2S5vZ6IZaXFssrIs4rSG2E32aOWidvHGZ8CETrJ13S
 mxNHTHq1SpvBayYap4P2vp1v0b4rKYxMzib5qnnP9giYxBi9pNl47kANlcoe1h3LqFJrXFTdEHC
 1pdlHOUIOiBJk3jl+sgdepm9YuEAGgpNLTpJ8WM7SPngyyitpPEJLbM+7ODRwTApU4o0Zxzz0Nr
 Y4xvlJ7tQkIenH4qklpIAcNwXMkMGJWlcaSUz79wlwIlmXt6INzJIN5nIPwT+KoMic4tkN34+BZ
 wqBs6SPVVLPlX+E0B2viOURxGa+8mLCHZooc/dzpdW41V3+AcUsvAv+qPC5B7eG7P0LCynAISPo
 xBX6DzVjJ/vlz/IPXtw==
X-Proofpoint-ORIG-GUID: d30WGYlod4H8gWsHgClqP5cz_nKfFjl8
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 83FCF1B8880
X-Rspamd-Action: no action

There's a missing call to dev_pm_domain_detach_list() in the error path of
pvr_power_domains_init(); if creating the second stage of device links
fails then the struct dev_pm_domain_list will be left dangling.

Fixes: e19cc5ab347e3 ("drm/imagination: Use dev_pm_domain_attach_list()")
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index be8018085b2d..5a1fda685f2c 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -661,6 +661,8 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 	while (--i >= 0)
 		device_link_del(domain_links[i]);
 
+	dev_pm_domain_detach_list(domains);
+
 	return err;
 }
 

-- 
2.53.0

