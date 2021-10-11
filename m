Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F161428D13
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 14:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA689E43;
	Mon, 11 Oct 2021 12:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524BC89E43
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 12:33:49 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BCTrVa015271; 
 Mon, 11 Oct 2021 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vwKoxQxlP8cIuVeTM47I2HjcxGSOMOa5abQMh2kSpYc=;
 b=mREm8I+kNl6JQQXMw5d014sm2lwtHLMF/bGMv2vVltULgGzaqM4lhouMp/h1Zvs4ycFY
 6oHXgidUvkabWpS9kO4jbianKhgG5qh2DEo5w5E4K4CRKxqVe/PGZSMaoA0g2mgzu8Oy
 FmxaVHS3qIUnCc3EBj/H9vTaOxvvMtzMc3wSXMttjA93rrbEe5uThX7AXYHpZIpBIDgj
 ga2NGX+Ex1N19NG0R+l3u+nyl21nQmgljKl5As8uJ2XaS8HNgSTvq+OXp3SjnS5OKCZl
 nlJ9eWifcvNz5BCRHrSamF6y/GZrxk2AWSUBUPdtbO6RHTqDq56D9E+BGHALUK77t6tN Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh3vmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 12:33:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19BCUstK191037;
 Mon, 11 Oct 2021 12:33:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by aserp3020.oracle.com with ESMTP id 3bmadw6ase-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 12:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8+TqqWiIaLy7049iJTXZ1QIB0HKxxO83P6TXuogvKu85lC3HQdyVgCr0bqODJYlnvKcmRJQDZCrj8fle4PZ0Zadj1mk+eiFE0CssrH0OsHD//PrAJnz/0I3RXvY3RsjGaBjwkubqo36JuVgbtIf5Leth3RBYy9BV15JgjqyydhQqNPOnnMqYsJqANCeWH9VGcK+WnFOkYMOS3eE4RSorNEscNQGOuouQmRAD83P76AmwboE/ulbBQKEW7K4Nq4UvHfYfwdaexD/C810z3tjFI4X2X/MhMka6bjGlYj0OJyiNvC8rJxdYH4gooExgcf2o3bCD2+9iySs7BOM5CH+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwKoxQxlP8cIuVeTM47I2HjcxGSOMOa5abQMh2kSpYc=;
 b=KUbACcd0ibCN4Ot9cHDUl6TFMIt4Mp8vr4pqVRxuuGZm/IY4p7wNz5wzQRki3h+md+7U30aTZt7fmxddOWL3bTtetG+vdnE879qR31coktwOI7aoZR7aDcUuFAS50v9HNpnjNuo97AfvOw4O/i9tL74t413duvjKG9hdab2fbVA0Efz4+/R6ngkiIW7SUcjq4rQYEAldNIy4zacUk1XNPhnVtbjgwHLGgni+W33ZnlTpQaqgpqaIsIWyFxAa8JJycj5axJWwwuIajs4Fq8IWxvHeSLVcOsS5E4WGA47AMEvn33Iwzh0UmIKSJcRSLQrd0y28UjYKfkSEla9NoehJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwKoxQxlP8cIuVeTM47I2HjcxGSOMOa5abQMh2kSpYc=;
 b=hOw6hpu0WsX7dBbCy9CAnMBgegmBgAkzRbUIdxE6DfVRl9nTQ9IOh/iZ9ICFYk5rv5nIQ/FxgkKuvehmgM2Hun5xVzeT0Kv9viLPD/oCag4+VSmXwP/LG44J7yhwQlcEds/rpt4GqWgOmLIe6mRH6V3Q7XrEYdJ/XMDgR+SRHDs=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1773.namprd10.prod.outlook.com
 (2603:10b6:301:8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 12:33:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:33:14 +0000
Date: Mon, 11 Oct 2021 15:33:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/v3d: fix copy_from_user() error codes
Message-ID: <20211011123303.GA14314@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 12:33:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de19507-3208-4e2f-712c-08d98cb34b27
X-MS-TrafficTypeDiagnostic: MWHPR10MB1773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17730928A041DE3264C11FEE8EB59@MWHPR10MB1773.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhmQWxANPCwHmwkCGfADSV+o1ot1ua/zxTup01Xn0I413Ur9nQljMUnymwKLRgMlgfoOpIHeJo0zGj35MZhv/kRWa06Cn0CTsRgd+jC9xq1SUGjeBZf6fGUcZHiHA/wE0a7EmEzE/AomLIznNtMfjdXWd0mTIhdWO+l15fwgNnnMtPSM6jLjg/vN6eG6a9kxH9O7HjgmemI4ssnDiGxaVxAtaEBxA31L2anu14IKnLnNf//t6d7OOCOEktlFPGKQz94JwQEIT7385FoXKMdtv0PV62TnOfTCzcMhdokWerO/sMvqI+qURm1Dh0DCqv8YQmDH7tUVF9EVmx5e+f5oXoPS5pVZDgxTbyrq5/dBVWfFF4rQ9ZRJBq0aLTK/07/50Xuath1pUqPvTmmgd/BBHHISpFH+EgJ5h3+p+4RQI/eSFjH87jHmcGCWdnePgp3PZevkKh2Q4Pb6nxOm2qcI+bdWA7QAYqJYoMqlG3BPNkcBY/9xQOig+SG8FN5/1Wwg3qOwISqgBw2OM3/3Mg8e/+r6F4XPUjcwDWVcXtQHJRY2dc1nShxFqhS4El4YOZ1mHbH/qfptrnW7hdX4jviizNkUAvWkgUvb0OY6FawoDfoaT9H34q+39XZ9tyqATB8bYhOnnGSPxYAWUj32bjNr941C14Lg7XZb03cHpKsFX/P0kVybIdTnex62Ao2zQ+BsiZW3uAfWf39mRDIv1XLcGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(956004)(110136005)(26005)(54906003)(6496006)(52116002)(508600001)(2906002)(1076003)(316002)(83380400001)(33716001)(5660300002)(38350700002)(66476007)(44832011)(66946007)(4326008)(66556008)(86362001)(6666004)(38100700002)(186003)(9686003)(55016002)(8936002)(9576002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c5ZK8OzK9LO54RLqJnjbP7oQAvUtHFTOEeSveA3YCuf6Jtmm8CcA016h1S+Z?=
 =?us-ascii?Q?FA5/y4JrZQTKSQcDDKWtWKdgODQzw/S1FlELqYJH1BgKcSjUUyNJLb9QEbvN?=
 =?us-ascii?Q?qXHi2+NnGof82o9xxfxjZ5rJfRSwoUBY3Td8v2r3SBQ76d6qUppIDNe8NMit?=
 =?us-ascii?Q?Tkn3OxcJq24+jkb9X4mUoc1pJgHyYDqyGvWo6KXEA9V7tMgKrv2aGbDDo8Ew?=
 =?us-ascii?Q?74QYV6in91MDQuCLBG1wxQlWrjpaT7vigAqMhfEC2GwLjna7Pad/2GRlkOXR?=
 =?us-ascii?Q?khp01AyYtK8bzyW7DNU2gxP50WHd6E4gZWrpf7GLv0cP+1/wHDSAiErirGhf?=
 =?us-ascii?Q?gJAtT/jMgcTwh0RV/UiEaEuIpn8JHrkpnJqdZt9dYCIXwjzZ/l5Yq05rHMSC?=
 =?us-ascii?Q?oWeddjrHEGL6CXoae/zWsQIE5plaBoGEfR9K+1AdUq9YbRyurG8bFry0Hc3z?=
 =?us-ascii?Q?hNqC8yl6gDTO0a5Z59EKuLIr+h6w9Sit3GrINJEZUMf8YtOHMlog1mtp9owu?=
 =?us-ascii?Q?XvIL6gpS5KRXIq3hfrUtiC4jdhipgS/cuOpr1uZOUttdYCXzrTilXwydmSwl?=
 =?us-ascii?Q?xH9Nndj5gkP6vs2e7Y5yd5/oRQgWQ+CFIFzLZdzCNGf5EVA9TVCKYuAeFiBH?=
 =?us-ascii?Q?hx+Vc/JHGcYOpovb9zfqfMBBXmczDRFy5YeB/WM2kcxhadu2nmnWsvCYBe1T?=
 =?us-ascii?Q?SQ7KGJr/5fPJGewYGMa8vf5Yp4TZdl+w4wmwHdGd1gPgjkNS0qXpUFk6xQKO?=
 =?us-ascii?Q?kOMR5obBck3UT7RWFkN1TseRTkr1g+iirj2XGGMm+69IBOhWvzv7QO/Y9PEc?=
 =?us-ascii?Q?gEDgkzYWbT6vqRVRctVVfiuqhU6YgbFRotVisCCR1KxKG310A2OwkRcsV+jK?=
 =?us-ascii?Q?WDLyDLA7mwEf0wBISr5v26hMElVKa/1JocMeWJy1RN+tdmc7s3vSfgdP+1tH?=
 =?us-ascii?Q?/juGIqrpy4S8bOW0SCDKhUNq2k8g3CqLg9hM/HWQY5vNwSb/h1u0Ojhld41c?=
 =?us-ascii?Q?oWjWXtY4A/XTCjRkg7nLtZK02OJL/5CsbPX9sCE+yzrj0wsOP3pFzQALb3Pq?=
 =?us-ascii?Q?0Q4lshx/XBZ9RfdzDKa99PdEtznt+SQIkU0lwKxmFdoHuU7SN2l71lo7C6gJ?=
 =?us-ascii?Q?jqPC+EKz3NNq9flu4BQ8utQvabDpAppkyRKhOLitvvDfqoV2Wmk1JaM0dZar?=
 =?us-ascii?Q?RjEq/2TqVAcVqrlzIYirk1WdlfjzqyaUIUO1ggGnRQRXrugQiIT/uV+Ka5lN?=
 =?us-ascii?Q?npKwGvp3lq4lR/UPluJ7yleZqQog5MwScwyiBLUfKWRlbguK1lJCrR8xcPv/?=
 =?us-ascii?Q?3nMHOU7B/LBOm9gbNmWiDuNU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de19507-3208-4e2f-712c-08d98cb34b27
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:33:14.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFHP2xB9Ha0/XgTHHPUxQ2HzABbo7LIw53qMfm0Ru/ui5UADw5sMswT/DpWLNYrecY0VAYWESGcTJEF0XUH8D8GYVodJuwLoiT846Z2TXjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1773
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110072
X-Proofpoint-ORIG-GUID: 94frkVOvfycLk_FRx8wKeDoEOHa_am9j
X-Proofpoint-GUID: 94frkVOvfycLk_FRx8wKeDoEOHa_am9j
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

The copy_to/from_user() function returns the number of bytes remaining
to be copied, but we want to return -EFAULT on error.

Fixes: e4165ae8304e ("drm/v3d: add multiple syncobjs support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 6a000d77c568..e47ae40a865a 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -487,8 +487,8 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 			for (i = 0; i < se->in_sync_count; i++) {
 				struct drm_v3d_sem in;
 
-				ret = copy_from_user(&in, handle++, sizeof(in));
-				if (ret) {
+				if (copy_from_user(&in, handle++, sizeof(in))) {
+					ret = -EFAULT;
 					DRM_DEBUG("Failed to copy wait dep handle.\n");
 					goto fail_deps;
 				}
@@ -609,8 +609,8 @@ v3d_get_multisync_post_deps(struct drm_file *file_priv,
 	for (i = 0; i < count; i++) {
 		struct drm_v3d_sem out;
 
-		ret = copy_from_user(&out, post_deps++, sizeof(out));
-		if (ret) {
+		if (copy_from_user(&out, post_deps++, sizeof(out))) {
+			ret = -EFAULT;
 			DRM_DEBUG("Failed to copy post dep handles\n");
 			goto fail;
 		}
@@ -646,9 +646,8 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	struct v3d_submit_ext *se = data;
 	int ret;
 
-	ret = copy_from_user(&multisync, ext, sizeof(multisync));
-	if (ret)
-		return ret;
+	if (copy_from_user(&multisync, ext, sizeof(multisync)))
+		return -EFAULT;
 
 	if (multisync.pad)
 		return -EINVAL;
-- 
2.20.1

