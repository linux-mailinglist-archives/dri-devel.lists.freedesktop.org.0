Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VRGLNhgBpGmPUgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 10:04:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164C1CEF06
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 10:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACD610E0BA;
	Sun,  1 Mar 2026 09:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gpOINlyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F86110E0BA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 09:04:19 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6217mTGp3132848; Sun, 1 Mar 2026 09:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=992X/iYbXxruA7l5ZNf5i2+8tAYBy
 H13h9X3jVOg4Z0=; b=gpOINlybAPefiZOpjsI+Nlea4pixrlqlZjGpqPSKEzwYo
 AiN3FIKwqvaCAMgRYmapJs1/Ywa8FDzRR+vrEqyu4rXs7Qt6PLjol0sacO4cpT/W
 lXU+/kBidcvIHyUd9L5xyzUkCLtDkkF6qlnae+GWvUnN5/z0lJS7w42CZ/s23eQ3
 YeWIdpkwm1CcPr6GxCmAzg+CFtyZk9rPsdMN5TS3BphaPNyasu17FcA2BpDxb2kg
 p5dvi6J1rE9jUD4sQW8x69/oniRjncix2Uc888S+6qtL6cPuNAQIesfdZb/c2zqH
 HPuarmAKXCo3mF8mSK5s+NQfmNscZyrgK20+AqVuQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cksmdgxy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 01 Mar 2026 09:04:15 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 6217phhd037770; Sun, 1 Mar 2026 09:04:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4ckptc535n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 01 Mar 2026 09:04:14 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62194Et8025207;
 Sun, 1 Mar 2026 09:04:14 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4ckptc5356-1; Sun, 01 Mar 2026 09:04:14 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: robh@kernel.org, tomeu@tomeuvizoso.net, ogabbay@kernel.org,
 tzimmermann@suse.de, Frank.Li@nxp.com, dri-devel@lists.freedesktop.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] accel/ethosu propagate devm_drm_dev_alloc() error code
Date: Sun,  1 Mar 2026 01:03:59 -0800
Message-ID: <20260301090411.171060-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603010080
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=69a4010f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=Miv_XHlUCVH6uCUJQ4IA:9 cc=ntf
 awl=host:13810
X-Proofpoint-GUID: BbsLrJtVV-hGGe0XVAbRRV2d4WkRCAWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4MCBTYWx0ZWRfX24mDRFT/rteg
 Zl9kADN7O1r21GdyYGqT2KC+Fb6aUqcHGG22qP1V8pHlSJJfjtMQnc3/grbfoL9og1dmIfWO9Vn
 0CRassGMxrEb1+5pLYwcfjavlVDsPDCAQ3hu5jYHRQ4419zCxjLyekB1R1uuHLjjkJXsL1np+kS
 BtQM5cf8AYKFtLnlIjsdWiZORJUNSMeIs8BkrIZuObUii27+Uv2TuWDruOMmzhpNBmZwQwwPkou
 p/pU5MxnZlapeKcJlXCzy7Ow+Nr51hfatMVk1pbIzpLAWu2z4W+VaOPp/Ftdo59soZiABkYGcDq
 G7hkGQbwyiRDFC3hSXzfC0QnLsM6s3BBgl24hNXx9yZjPysEj2i6wgY8izpbJGFisq0OKv84bxd
 9d8p8E48JJF1Zt/30xYmCzf6xExqu45oiBWeet+vTVECKKPCg/eogeWV2zQaWpF50pu+DVJE7LV
 gUVHI8ivg+ROc0Qf2Xu5eBt1BqCzZbVV5pPviyok=
X-Proofpoint-ORIG-GUID: BbsLrJtVV-hGGe0XVAbRRV2d4WkRCAWX
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:alok.a.tiwarilinux@gmail.com,m:alok.a.tiwari@oracle.com,m:alokatiwarilinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alok.a.tiwari@oracle.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2164C1CEF06
X-Rspamd-Action: no action

devm_drm_dev_alloc() returns an ERR_PTR() on failure. Use PTR_ERR() rather
than always returning -ENOMEM so the probe path propagates the real error
code such as -ENOMEM, -EINVAL, and -ENODEV.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/accel/ethosu/ethosu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 9992193d7338..196871ec2a06 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -337,7 +337,8 @@ static int ethosu_probe(struct platform_device *pdev)
 	ethosudev = devm_drm_dev_alloc(&pdev->dev, &ethosu_drm_driver,
 				       struct ethosu_device, base);
 	if (IS_ERR(ethosudev))
-		return -ENOMEM;
+		return PTR_ERR(ethosudev);
+
 	platform_set_drvdata(pdev, ethosudev);
 
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
-- 
2.50.1

