Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PV2Mk8HhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:22:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20802FFB0C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EC710E0EA;
	Fri,  6 Feb 2026 15:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="saQNwTSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672710E0EA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:22:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6166P2a23365304; Fri, 6 Feb 2026 15:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=9oZWQ90f8Znx4+QfgbJnJ/P
 BmzuORBxJttyvLTtiYdE=; b=saQNwTSzVxQExpslpfnBD3vs+ZhV4Stf1ftsqIJ
 xvfaRl3CbejTjI39GS/xrawXjVY0ShKgTlBgoHQQNljT2vq2y1Xu6RK2b3SwyMCD
 WXbzXVdSPDPgNa5iyBKD4/iDPzVc7ZnWHRgNa6XPc67ii+wNDVeThz1MOeISi5wf
 4KQOG+3qBCnfppRlE7RmgJy9v8M6UVWpMm12mhErmQ/9lNQW1fqLREUUGrAzwY4N
 AdH0jmK5nHBoDJgSYLsQUEROO6SZM4B4e0wloef0hMwvaJpPy/xws6U4Qs26yqyz
 q4GhMl7ZJE4tr8BNzzbCmkV7dJoN1PYFk3PF4/wBiIzH+tg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4c4je3s9k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 15:22:37 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 15:22:35 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 15:22:25 +0000
Subject: [PATCH] drm/imagination: Correctly check strscpy() in
 pvr_gpuid_decode_string()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-gpuid-strlen-fix-v1-1-238144ce306e@imgtec.com>
X-B4-Tracking: v=1; b=H4sIADEHhmkC/x2MQQqAMAzAviI9W5gFd/Ar4kFdNwsypVMRxv7u8
 JhAkiGxCicYmgzKjyQ5YoWubWDd5hgYxVUGMmQNGYvhvMVhunTniF5e7C3R2nnnzEJQs1O56n8
 5TqV8kp3doWIAAAA=
X-Change-ID: 20260206-gpuid-strlen-fix-5622c1fdd0b2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Alexandru Dadu <alexandru.dadu@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 "Alessio Belle" <alessio.belle@imgtec.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=/uWkP9PRboKuarSSP8lQm3aJ6iCyGPv88mOWL97eiRA=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS2sVvfyCniUNF4+L7+bfSjaPNN1ffOpOqK3jr2ZKbYv
 Cb7tK/2HaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRSdWMDB+srGdsz0kqUeCM
 23NpCs+MfR/nTS8I3C/Be8Xq+vKmhZcZ/lms+9/f4W5wX1N8YVRkff++T6vNfDQN/xjsF7vyl/v
 nRyYA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=TpLrRTXh c=1 sm=1 tr=0 ts=6986073d cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=r_1tXGB3AAAA:8 a=gkP2uFfr1Wp6lTKQhcoA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExMSBTYWx0ZWRfXzkWz5bSrtl31
 QeuhTjzZ4vq0w4ZEyLnP/pZ9HM1sHPv1lfulAPdgmQ7GPhuHQWsrQTvSD8eg0zHi27rV68tpIiN
 5w66NZLX3w84QEov0UIupx7XxsjIzNGyW/zR/pycaMzse+97086RiRvE7DA1r20kRgFDj7yLycX
 reCJ1rsfF8vfmjx6/4FQ7Lux0DopkBLkOy0X3QeO34rmS1qcgIgJZKj88be6GAMzmpyuUCsmZHV
 hwD7mhal8qUbNQlcsUhp++Imqm4pxFmp3luVOEAhoFvRR7XdQI6OtLFWlmDijMtBkxWeEbTpIF8
 D3Nxingj5hTNapaZvp5i9l+kFdUWcJwm1QwzLVJJAq7J+ve0qiUw4hdodcQrWfer2rsy0GTeUOn
 Ti5i6mou53+Fc6zQmD4fHjZYwH9pQ7czlCeEfcTbUqCbKzigyC/YFVURljKNpDpqaZZYINrzppz
 ohH/qGEKV6hyoUYi/lw==
X-Proofpoint-GUID: IlOLAvp_9SlgfSkiAgXsBlRx2ELJEcRq
X-Proofpoint-ORIG-GUID: IlOLAvp_9SlgfSkiAgXsBlRx2ELJEcRq
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:alexandru.dadu@imgtec.com,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:dan.carpenter@linaro.org,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: 20802FFB0C
X-Rspamd-Action: no action

The constant PVR_GPUID_STRING_MIN_LENGTH was defined with a U suffix,
causing the return value of strscpy() to be promoted to unsigned before
it could be checked for a negative errno.

Fix this by stripping the U suffix from PVR_GPUID_STRING_MIN_LENGTH (and
PVR_GPUID_STRING_MAX_LENGTH for consistency).

Fixes: 3bf74137340a ("drm/imagination: Add gpuid module parameter")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aYXvElClUKW_DY_I@stanley.mountain/
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index cfda215e7428..d742d7c1ec93 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -39,8 +39,8 @@ struct firmware;
 /* Forward declaration from <linux/pwrseq/consumer.h> */
 struct pwrseq_desc;
 
-#define PVR_GPUID_STRING_MIN_LENGTH 7U
-#define PVR_GPUID_STRING_MAX_LENGTH 32U
+#define PVR_GPUID_STRING_MIN_LENGTH 7
+#define PVR_GPUID_STRING_MAX_LENGTH 32
 
 /**
  * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device

---
base-commit: 69674c1c704c0199ca7a3947f3cdcd575973175d
change-id: 20260206-gpuid-strlen-fix-5622c1fdd0b2

