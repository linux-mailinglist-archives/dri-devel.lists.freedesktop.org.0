Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IlVL3ymoWmqvQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BE1B8890
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341EF10EB97;
	Fri, 27 Feb 2026 14:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="b7bP4MbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8310EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:13:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R5SXmQ3478147; Fri, 27 Feb 2026 14:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=xymqSY5AA9TXyOPIoYUARKJ
 XydJ8Um1Bew/N9xbgz+A=; b=b7bP4MbUeSvOwrmHh8hlReoqW1uPF2rC8wJfZp+
 Laiz+LpbXm5sO48UFL/infX7vaEAQ7jVaqYd6mKCP0uUshsDJ1Gdo+drvYSr20eP
 DNJ8JyabFGqwQlbie+Kjoj6X0YSdRw3SZRlolgs0gf2jyKTyyRlz3v0LC0ZvshFR
 12EugLiWNGHPo1Y026FaboScAnd7OcR4jG9cc5B+B0CT0vKrcDFjFSeX6XVNOBfs
 6aHYM0GJCHJGz5DyyiPq2GK/pUVnNYWNuIKHj5CagXUkszsA8y2b5H2bh+8ki4xM
 +VLHzxs0Opx8wU4z3XpVc08yDlZW2ovV8cUBgmEvGBnGYlQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cjdvv9c6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 14:12:55 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:54 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/3] drm/imagination: Fixes for power domain handling on
 single-domain devices
Date: Fri, 27 Feb 2026 14:12:46 +0000
Message-ID: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6moWkC/x3LSwqAMAwA0atI1gY04vcq4qLYqAFtpQEVine3u
 HwME0E5CCsMWYTAl6h4l1DmGcybcSuj2GSggpqCqEUVt+6M1h9GHJ7+5oCLPKxoqSVbV3XXmx7
 Sfwb+Q9rH6X0/ihcX8WsAAAA=
X-Change-ID: 20260227-single-domain-power-fixes-d272d53589a9
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=matt.coster@imgtec.com; 
 h=from:subject:message-id;
 bh=I6i0AGlgSQTSmEeDsRARghOzX3S4Xp/NpyXJBCZzbvY=; 
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQuXJZqGXfQ4WYEX8Xei/tfOnVH+R+xfvW59YmEzsmVv
 3pc/q3t6ChlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJBL1kZFi/706hh/zZHVdN
 5MXqLsyyXzo1K9J6uWf+dl6VR6nbpyczMlyJnRh779E5tf/MzUotXyf//9G0+qHd68C9+ZO/cj/
 3vMgAAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=CL0nnBrD c=1 sm=1 tr=0 ts=69a1a667 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=3QGlPl2_AlyXKjrm2bUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: ZIWAvLcBbJFT5RPkAfjbn6rKaT5qyq8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX6jAHnXoHtGHz
 MSFK7St7md+tbRt8dw3fQqbzCMaBQhYswRQPIN+adb5fi6l3TrS+Hu6G9ZRLupaWZmm7v+BTENZ
 Iwxoyi4ukw4l1j7NApOlEqsI0Cz3Rud4OIgYgSQhuLAtgaUeCCNC6ofpeJ95Thz7omxkz85HTs4
 BRUr/u4kTVOGfom63qfwgKqtZW1kk/xU1zXgf0wL8wPtQ8JJS0GNrWli3a81pZT67NK/LY8h9pS
 P6lZfLqYwP22voo2l53D1fhY7sV4eqedrNAVNr7wMgY1S0/Gw6PAwdHXezJRXs/8vHVkguuibdS
 7O0fEkf+d80cBKrFqAAy8x9Po/1KaiXUzdNXJD50Rgi+4EoPrIIn3pwpjxbLFRt8a8of4AEc4Vj
 EW/1nhNq1FROL5F7oiadP2ymg8rLQW5CDYNJ8Ba+ZU70/otcst3ESngqOA+/ueANz52foYTNxuB
 eKNCVM7NXh5eb1B9q8w==
X-Proofpoint-ORIG-GUID: ZIWAvLcBbJFT5RPkAfjbn6rKaT5qyq8d
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
X-Rspamd-Queue-Id: 143BE1B8890
X-Rspamd-Action: no action

The first patch here fixes the exact issue reported by Mark in the
linked issue. The remaining patches are related foot-gun-like issues
that were discovered in the process.

Although entirely fixes, this series is targetting drm-misc-next since
the underlying commit e19cc5ab347e ("drm/imagination: Use
dev_pm_domain_attach_list()") does not yet exist in any other trees (to
the best of my knowledge).

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Matt Coster (3):
      drm/imagination: Check for NULL struct dev_pm_domain_list
      drm/imagination: Detach pm domains if linking fails
      drm/imagination: Ensure struct pvr_device->power is initialized

 drivers/gpu/drm/imagination/pvr_power.c | 52 ++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 17 deletions(-)
---
base-commit: 5ea5b6ff0d63aef1dc3fb25445acea183f61a934
change-id: 20260227-single-domain-power-fixes-d272d53589a9

