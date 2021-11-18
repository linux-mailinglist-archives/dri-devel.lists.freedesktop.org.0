Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC314559CD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74316EB33;
	Thu, 18 Nov 2021 11:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45CE6EA1F;
 Thu, 18 Nov 2021 11:13:32 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAswxF019269; 
 Thu, 18 Nov 2021 11:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=EfccXJsH71kRKaqF2CxSPwCr4Bwcq8bB0LyCf/CvObY=;
 b=moQhR29BPg8RPzqTNOvL91LX+x+xgxbD0V4vVqcmSnYvdISPxM46Av/Ag+J+HP18PNKe
 Drv0cx/k7WEr8rPzGsMf++fu84r53wpUHatTaX8sP1hN1h69/fpYvCy07xwxM7msxeEn
 TZXU3HQwEX1GSPGacqgnnA4fg4EZ8gU5KaQ82u3cXlUT1DcGVynoR3CMS7mth3H2zZOn
 5d9QsW5D/uobyhRpgzXCUT0PDDJOEs1jzX9H2eBEnNp08Q+96IhpSyzkJAavWnBKnOei
 midkxGfzf15EsmShkmVNRM+as3k7rAJZk9w8m1AiD+QBNY3sLLSdBb0wRGstjIX+eucx /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w8x7fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:13:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBAj3g160654;
 Thu, 18 Nov 2021 11:13:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by aserp3020.oracle.com with ESMTP id 3ca568dte8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NH+n1SG2QMg2qZa9mLYfoUMqeZuRMoid7d3kOWO3zDhP59lpQO6p457LqjWugjTwVGAvq7nI4s3j7tJmyHpy28TkE7JEaJh1P8hAj7Sr/G1pbxltcYoCvjgOC2shD2l4nC1psi9I42DM841D4OVGAhJYAQ/YX9OSPchCCcY9Nh4Hm+Z6ZSnkMKUy6aeMCugUfChLEfIbkdi3OQlvMRbNIB7refa7RXzW9778zlVZvJ2mmJ/57fGRLkCg2lkUOT6ZTcfcndME1wmw9G0LWsSjaH6SSDjM1uMPeFaYnbBw5e05ZAife03KCiffKwZB5Oe3JfhPIxZkd/ewJ7q+7YFjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfccXJsH71kRKaqF2CxSPwCr4Bwcq8bB0LyCf/CvObY=;
 b=EDRQJU6LA5BUKtKM59X+PT9CMnGBx9uxANS7zuQ1efF7hd/HMc7tXp0bIcHFy9E2gr6tLhi7SiPqtRtd/MAKt3iIqNVJZWWQTdhOO8ASX7RzpOsxZePNBXCSJe0nxVDWQhLUJlDNz8/dLUDf/rwrXIYgqaHUt8dBU9U5iJsVsyR5GSltjnoR0phHVYZ348akXZmZ18IsJxyfGtaP0ENYZ9QPwiRs+dotTcxVwGMnx9licIji2cxgN+n1SeblkIsgPVb5/+JbDJvifwWW4YBnHgCxU+SRrR4bxdAaWOyqHV0iIaM6oJRUK/LGvGtrV/BNvCsBx1u7J5D33/LB71MF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfccXJsH71kRKaqF2CxSPwCr4Bwcq8bB0LyCf/CvObY=;
 b=waQNB1P/hjNWSJHfJkuguHyMIUFWOb2Pp7XbUYgenLC3r5gkUD/kv01mGhKf1BSb3yj8L8JSTapJG7x++RmxzpfTfVyNEkT3hkcLeksDwL+RELUtpInYjGnGTHeLUTgvBB1Ws8pYMov50zVfLeuCV+5ALIufkEaBj9c+dCNrdJk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 11:13:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 11:13:27 +0000
Date: Thu, 18 Nov 2021 14:13:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
Message-ID: <20211118111314.GB1147@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZRAP278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 11:13:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 139de77a-fcc4-41d8-5314-08d9aa84721b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1247D663B45E7943E3EDF5E18E9B9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UX8yZKfddzCrisr4zeeV61tbQqAf2pEpUZqmdc6ZmxdkQVxfrYP5xqgerG84WFRkNiYc1dvz9wjoSSr4tJuD0gQ3lKwbI1m73aifJQ15BEucxcEdqf5KiGRL/kcog/GFBIE6HtRVcbwXNjUAbgX/hmRzsKTimLGmyTeniI/tA4YFUZxvkVg3PX40vXmbrosIXjy8jZNe59xSBGPSnSDUA1e4ngEQcsAdFxR5YYqjbZWM+vNp8oZhSaXiBjZ/vBlrKUbkY3grMWZauu15xHHuN+aSSFiXhVHFV873EvPNm5saCtPzQ/TD3v1j684AZhzh9xQFPMpY65m9U9ssoKev7FFhgIQySvIBMoqgRnXsJzXfGMuYnpGI8PyhCPvH1cfErmX1owaUBYKLtzuWxyRRoznkfppEmxTbxGvpwLgcObFVcEnM9ifyUHod0ad5LFhM3Y34QMeNLm0dSYSq1gG+vHeFz0kMEuB6NJxWJ5GixCcI43jhQdpBJ/zNoglDYBt5OqnO9RDA4RtV6nqoff92YxSVA9jNxLAeHhCi64Ztv8uY4qRD1AwQVwH8OpWpMXGE8Qg0lFL7azMwZy671sceeWCqfNhGq+r5EiJ7ShKo5GflGzhVZWtHNGVWsvpGcguWR/3dAuymLJR3xB8hec56Nb5OU6bNJs4saw/iiWrJ8xmJrqeRt4R6hsI/OpEeIVR2DpsH5gOUSbRqu5de+d87A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(186003)(956004)(38100700002)(33716001)(6916009)(8936002)(508600001)(9576002)(52116002)(55016002)(54906003)(4326008)(8676002)(2906002)(66946007)(66476007)(6496006)(33656002)(6666004)(316002)(44832011)(9686003)(5660300002)(26005)(66556008)(86362001)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxvJkMD6knHIoYspYMvDOVroER2GfCDTIPUOpDP9ClTk/CpnpvNBDoKWfBJS?=
 =?us-ascii?Q?Uc5znbsql3e6ojL+l4syApYZi4ysuXKDf5BvCgR/bWA+jbBlCv+Mq7aJnq0T?=
 =?us-ascii?Q?sxG9feLvXcR3QhBLlWf3aUrJcuGGOaoAg/kvXqQeROOWgcfR4l4UkBptItei?=
 =?us-ascii?Q?5R2R8OWgBcZmmKK5Xy5IG5W0PkNWYvJGIHZaNMm/ndtnGp11yx3vvAPAK1YN?=
 =?us-ascii?Q?VLVy5RAoHrWFjDxcbbzEasJ2C/fvG+9UZrbDY6nBiVzqecL1l2vrJ/E4fKWa?=
 =?us-ascii?Q?0sKu1fm4Mr/mjy26X6sD8EHlMtYKAVZPtpZJZXGGvkLZt4dcacJNGZq38HKA?=
 =?us-ascii?Q?xTyMlJrhe3UhRs8FA6NTpyVL8KJ4Wb3DWXEWn55kwcVYC+Z95jC1zDnMctWs?=
 =?us-ascii?Q?Y/EwnOxL6bGdMGbO+llXBlQEcb99rCCx0Bt5GkRoB0ty7eBu05ootFRHloNC?=
 =?us-ascii?Q?RuGOfTt3MItOz9kMlgcZyCVwAF5Q8Il/qutcTw+68zOsf/u8FCXhctjkad5h?=
 =?us-ascii?Q?u4XWFolrwaHadYLf1+b5aksLiL/knrlc/cDhxkHijuiIyZlEtGYsBEKCLIjE?=
 =?us-ascii?Q?AsA0M30X5VFxxCoGQ9uARzQ0zyqJErofYDydAnklchYVOp6s4Zw4X3fhrboq?=
 =?us-ascii?Q?mgYb1Qodd7m1jqoLMtIefBCYedY8pD9olyrjw4QwigKpQjCVLieXKcqNZBUu?=
 =?us-ascii?Q?0J4eYWkzu/4k2g9NG4RzJCGhZbjOpZRCulyGbFAoblz+xcCz0f9YwUWLoD5i?=
 =?us-ascii?Q?VLAma9xGXbAt0hhedUsndU1s9RvmTuJ0bu9EZZl4gqR3xI1A+fUcUU+IeQCe?=
 =?us-ascii?Q?+5XzLp82NrNfoXrX7K7oC2acts7VewzeWEQba3QCESir5WJQFSB09RF2nETi?=
 =?us-ascii?Q?d6kdYWymoHgbbM63dyBBBV/m+aVVZxuDyyi/QC9E761oBK3FE1dog/UEMDf1?=
 =?us-ascii?Q?C76QziNnJAR0pnVKtmx24nzo5obmKjc45YiQKFA3BWFn6aeFm/Fqbk2892Z2?=
 =?us-ascii?Q?MON/CWo+93y6QrTc0ArT9oWsygkKdKKzsM4/1GE59SVD1iJUnJ0QkSk6ZiaA?=
 =?us-ascii?Q?nWF7HBPfX6xAk+atAExAy6jHm19pUOCMKxQ+OOWLnflTXyWWtfKJUN5ouf3C?=
 =?us-ascii?Q?1ftJBGXczpeI/opHKWITEeFB/YzfBjHoc1vLJ/AYLs8mHC3DtKhrvBRWC06S?=
 =?us-ascii?Q?LPh9wisefaM8Oi6j9by7seTAkInZrBe6SqxYuBk2k/KGt5I5TS8vSn4JFz1K?=
 =?us-ascii?Q?Qt8F/ICHVa8d+njQCvNfFLiV16U3wrMZhfHnGDVm00KALo72Pz6Bj72F223X?=
 =?us-ascii?Q?Dml//Kek/SED1B9YZ9SkoMhKYdcLlNaJv1Dz6PiOJxW1+5IbnD3AcSo9G7Eh?=
 =?us-ascii?Q?lI+qrn2t9Am5IHg4CDtxWLFatJVqDYA2SUr5fnX8//IX6Et7xF6lKlBJfYT3?=
 =?us-ascii?Q?ucdkqgW2ny063jn7G5HzxIXeDKJX95C23wl2xLmmO3N2jY7FhbToRBatPc3I?=
 =?us-ascii?Q?c4iMThk1KX/ixg+MW4xl6BczlxVgVLVpbuDDyT52xkm1NYu5rH1mAZFEYaXK?=
 =?us-ascii?Q?9kQbo8ha732ts4NXt1N/+GnnN+qP96L5ijwu7HZcgnHpeWjlMy1nt6VgM1Rv?=
 =?us-ascii?Q?DCih1MSXyfZ9GF2mdPzT5yEAVc3difMqVjcRBGqLkESariBsnPp5Ur7QNgGG?=
 =?us-ascii?Q?Q9IPSmYXvTwFeLewVBcEkCf6bBU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139de77a-fcc4-41d8-5314-08d9aa84721b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:13:27.7413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeRsz7/28aF6UUjEOfUYWddKXBZMxQ0aFGbZCqvGNxhvf57cG3YkM/r1GjTE/ldrk51g+POLl+bgehESRZMUMWXvLG8UDcQO1eaHUMYnTy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180066
X-Proofpoint-GUID: YNYNsg9YULGR4J8VRwmIAbsmz95X_qls
X-Proofpoint-ORIG-GUID: YNYNsg9YULGR4J8VRwmIAbsmz95X_qls
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nvkm_acr_lsfw_add() function never returns NULL.  It returns error
pointers on error.

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c | 6 ++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
index cdb1ead26d84..82b4c8e1457c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
@@ -207,11 +207,13 @@ int
 gm200_acr_wpr_parse(struct nvkm_acr *acr)
 {
 	const struct wpr_header *hdr = (void *)acr->wpr_fw->data;
+	struct nvkm_acr_lsfw *lsfw;
 
 	while (hdr->falcon_id != WPR_HEADER_V0_FALCON_ID_INVALID) {
 		wpr_header_dump(&acr->subdev, hdr);
-		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
-			return -ENOMEM;
+		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id);
+		if (IS_ERR(lsfw))
+			return PTR_ERR(lsfw);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
index fb9132a39bb1..fd97a935a380 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
@@ -161,11 +161,13 @@ int
 gp102_acr_wpr_parse(struct nvkm_acr *acr)
 {
 	const struct wpr_header_v1 *hdr = (void *)acr->wpr_fw->data;
+	struct nvkm_acr_lsfw *lsfw;
 
 	while (hdr->falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
 		wpr_header_v1_dump(&acr->subdev, hdr);
-		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
-			return -ENOMEM;
+		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id);
+		if (IS_ERR(lsfw))
+			return PTR_ERR(lsfw);
 	}
 
 	return 0;
-- 
2.20.1

