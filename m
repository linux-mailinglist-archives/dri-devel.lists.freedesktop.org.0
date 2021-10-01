Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA141EDFF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CCF6ECB6;
	Fri,  1 Oct 2021 12:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1AF6ECB5;
 Fri,  1 Oct 2021 12:58:21 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191Bdirh010002; 
 Fri, 1 Oct 2021 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=C6FJmMuoNsrW5PEdocipV3ovRfYO1UZBauuNvuZXMZM=;
 b=lzXDrldpJiAZfIu+uXix/ePyK+ET2jmnE5e5Uwu4K9JF9JSppcsfL8Us1MiB4VwlFtCq
 e12SmEgEG+vEeVNPDAPM6yrVNLGFfzd3v6MMRDf/sR1CzfHGDd+48l9Hr2Nq2/MsNnTF
 IyYxe2jNtM7Avc4/cY54lJe8tURs9lgxcLByt2kImim4Kk5U7XftC2uHnjS5X9He4Lrs
 mwmNP4/0t1HApQja+DJX38zkcmsMfB3o1JkrrQqQmMN1zcF3+QhG4HdGvxnI0ghPnPNs
 jMtawIi8UH/5QOhW9HOJ9MzljIb+Nalx8pDLS/XVaJTxpm391M5WEncDB+8rQ1huGinX sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdb2drjya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:58:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CuMxL151158;
 Fri, 1 Oct 2021 12:58:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by userp3020.oracle.com with ESMTP id 3bc3chf7hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsKNcF7OStYUCr/WChXoZd2RRlx2CuTOcLDVsjJTF1FOpps9gFcAiyATsW3K5IvUs4uyJRvwXVy4B6+/7P7fi1uj6c2TAhTGplJ2CzTHtVrnZADzkro6issMMNgcpz3CAF9d71bQle3rgWQzWimFewvHNed1IqhIQiG8UmZ8Jji3ogw598LJzTS4HwTpAM2kQoNFuHlWgc7v/54aVTGKCVCj1JT37Meck+NtJhDPwKJ15Yw0f800HWjViNbCEfhhwWL/uGg+0xdTCJxoFZAFrsBmi30BfyAjNoddcPcjPpcNwxajInRfGmPTdVhUXjQQJ+FZPBXL7+ZfO0nniyx9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6FJmMuoNsrW5PEdocipV3ovRfYO1UZBauuNvuZXMZM=;
 b=EQXuE8Lkjk9pDiQP3VpI0fgISAk3PSNpXo4LW+JZLA7OS3oX1PkfYioMyJs0v0ngqguIOsn5wbw0HiRjUbIgeFARmtPq9NupTwmMA67EoeT2YHGfALfeCi+1TyB5m8BLS4MRvCgQalmZ93wtCA/RYjAy4bcXN/xcdimwiFRVSZMVrEFG0WSJoo0MxcAkCxPGHjTMjZjN130SVTpi+xMGcGQlxMv2l0E0XTaA+1RbK+WmcOptJUuIUtApGkyTVFAYrH0JXIy4YAj41YT+8fdI2tA94I2kddmJQ6m9WmSbdvVu572qT+D9MYHra7HUvp6nkWlJxAv6BvYeebzHrea4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6FJmMuoNsrW5PEdocipV3ovRfYO1UZBauuNvuZXMZM=;
 b=K4lBBdklZNVDsnFzvw975R1RjbgOwEj0u3l7acLJ+2lXg6qWRDCiS6XprMkZODRWgCdC5vWxCQ8iANSBdwhzs040Jd4sKtNc0aKU8WibdobD+CluUY6wM4fBPLvV1T1xFhUHhtLKGoFL2dGVF9cSqgu2GvRolz9ckDWnFUqR5iA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5476.namprd10.prod.outlook.com
 (2603:10b6:5:35b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 12:58:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:58:11 +0000
Date: Fri, 1 Oct 2021 15:57:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/a4xx: fix error handling in a4xx_gpu_init()
Message-ID: <20211001125759.GJ2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 1 Oct 2021 12:58:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b79567-19d8-4337-fa62-08d984db1fc6
X-MS-TrafficTypeDiagnostic: CO6PR10MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54764E8A8142209FF7B8A1868EAB9@CO6PR10MB5476.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVcVAuFXAAQ6vhgP316St1BQ9ynbTj1WQhkP+Aj7I4oCDdWuA7ag5YJcpS0LkYMeYRaYLBzSo7umUNumKMkhb4bDpQekxMAL2Rq88hRfWM/D5wX/tn+CGA5+u89fASYoAnfMKnqIIXZROj39Itf8rvv4H3iPNA2kXB8jsyCRT8Qdk4Qbvun06rGOJGDvfVQ6aiphJPIu8ELZNphtTU5QvWLTn5J1IzAlpC38Kp3tK3PDVyMPTM8n/QgiddoEbVEqgDe/kqFr1v5NLzRxszH/jMPrvYBMrrRb+h0bMN1hl2upq36vNZYoe1b6Vstjml4/VbVL9nKGFpkhpXgsQdvM+fzSI8dJP8tPAj782TB72z3DVzHefG9eVK0qYsb8oehcGoAQQx+v7CzfdLpDRsT4oW4UDy3ZiYY08/GokXmduN0DhxWVdy+hg/pRU/uqQyr7EajYNeUxwTqb5R8kDwR6qyj1AGR/NEbYIh6YDVAIyn9l4UwdbbOg6jSW8QvGi9it8Fl2IZZ2CBN/3aRjX6xxEpfWcOjNV658txzLxiH1rVB0oMgGxrKYUUjDgno9mRrm8wCvDI5YZNFAptBk0IRTBjynvSdKXcZWNNQifu9nBwXRKBauB8oby8Syr6uSxi7rg1cYxDAZ08qf1KhDTzMWChRaYf/vtSzvuXywfhR9zwKR9NaXBJtqRqH+fzblaM1dPfjGlcWTcC8gJDBbCfwIJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(186003)(33656002)(38100700002)(38350700002)(83380400001)(33716001)(55016002)(4326008)(956004)(7416002)(5660300002)(86362001)(9686003)(2906002)(316002)(110136005)(52116002)(9576002)(6666004)(8936002)(66556008)(66476007)(54906003)(508600001)(66946007)(26005)(6496006)(1076003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQiXA9teAOab6p15+nOZQKQRP8aMqZxQXDWb3o3enEXj0SafJYNrpQ4AEuy2?=
 =?us-ascii?Q?DX0LnTSC1A0tu/2RfM40hGBQ7JVQT5QV535M88HxRWOJpFuZFpupjVfehjKJ?=
 =?us-ascii?Q?Z67XDWTN6OB8tSafJbJoNSKBQeyO38ZyUYiMwCVkmk1Xhd8U3tLe95C3F5ob?=
 =?us-ascii?Q?K82/wLzCop+HnG01dFZhFY+cw5TC4NGCMlZ+UzOMQaRgcovLpS6lmHXgaCBI?=
 =?us-ascii?Q?h3XoTqwomvp2qcR40CvUIXNOogbjphImbK834of/i9iSwzz9h7ZSm3J+liug?=
 =?us-ascii?Q?2VgKRUDYnRV1q1QZCpBhVkOoTEoaWC47b0Zj52OnM0IHLFJ3kIQMfydFvHK4?=
 =?us-ascii?Q?yA1GC2fvtVH0PAj4JIBtdjgFmAIXGu6jfRUwYHcdD4V7zZLapfvQN4+ddgtW?=
 =?us-ascii?Q?dqU1oPnkQ8EwF4l/lDNKrleDR3ryyiKGN6m+ee0waP6uAapdgpYOZwJx/cw5?=
 =?us-ascii?Q?g/kHC43aAzSsb2VZx7MrRZWUvhAPmP4Wi01r+1/pV53yYnGfk6A21S3+Gof1?=
 =?us-ascii?Q?Mwcr3nwN87pQ6/KTAMN0WzLoZQeaH2zYj2+yGkQSWmfWNRgu0NWdXQLMPCIJ?=
 =?us-ascii?Q?kI9zoaS6cPEc4Crr+6Tw7uhcvOufCVb9tMwqNfPHSP7zIonceph6Jpz+8CDx?=
 =?us-ascii?Q?syNZePPcFO5q8F99PbxlF4ckEb73HbCkY8Q1Wz/BBFWJ6kTuSQuCuQUy1rd6?=
 =?us-ascii?Q?sUu+USlsLJUSjqWUugjHgnD6siqKwn4Z43LEQiXaAL4M+rDc3b+Q+dKXs8AS?=
 =?us-ascii?Q?2vct/1hBL4yOpVqqZ6O1yAszobD1iqjYDAMPauuzqWfqilqEa6TugRYS4Ddj?=
 =?us-ascii?Q?Xss7NzS5IOY40Y+KeCWSMHLIWXYCK8TWRGjVbyIwA345HQTYx67+ps+iETD/?=
 =?us-ascii?Q?whff6Ky2LUuj2I5ItN1sAWgnMk8IEpF1Goe7q5wQ/4PmCOob/v4Ma4lNOv9M?=
 =?us-ascii?Q?l5MNqRxZ+kk8p7Air8qNRXLSVSv3LO1OYIDc3E20n3GTsvcGOaobvCMiwvcL?=
 =?us-ascii?Q?f8Y9mhYlfySCjY422SbYb1oTLwtZobopssHZQXWyXLUz991yhYwfrhKFS8u6?=
 =?us-ascii?Q?gENb/8Mn9pDGQ0n3zRXRQVLEduI2twmoZOMNbCNqUZS1+EFBnLj2FWHf8aei?=
 =?us-ascii?Q?7dRDRQ60xCyUv6fQSCix4jTwZ4LKy/Jposi5JQSsLiZUKih03phg8vNezEEz?=
 =?us-ascii?Q?NaAzCiJ/iNGp0AbuRpqU/opC/tWow0cJ9Mpgiyc2cq3ITWbl648j2mNx0GiD?=
 =?us-ascii?Q?IHtYGhxA2jzfYKheM1rgJEE+JC3xT18WbK5/ABBaOyP+ojtiyJ3Gz91029sL?=
 =?us-ascii?Q?ERUNG2+0csMvMh94ido95j+R?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b79567-19d8-4337-fa62-08d984db1fc6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:58:11.6573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrgwDyjm5M20QrhX/QfG4FXyWIV6Mbx1CKZCyeiokUOXHcj8Ggi555A1siGkG4RHFjwg9+pRDLRYNNuvOOg0ytCBr15OChvyMLLJW3Lkrrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5476
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010086
X-Proofpoint-GUID: Bx1qlmD_JuWUu3QsztnQqIXaTdkYNRh9
X-Proofpoint-ORIG-GUID: Bx1qlmD_JuWUu3QsztnQqIXaTdkYNRh9
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

This code returns 1 on error instead of a negative error.  It leads to
an Oops in the caller.  A second problem is that the check for
"if (ret != -ENODATA)" cannot be true because "ret" is set to 1.

Fixes: 5785dd7a8ef0 ("drm/msm: Fix duplicate gpu node in icc summary")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 82bebb40234d..a96ee79cc5e0 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -699,13 +699,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
-	ret = IS_ERR(icc_path);
-	if (ret)
+	if (IS_ERR(icc_path)) {
+		ret = PTR_ERR(icc_path);
 		goto fail;
+	}
 
 	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
-	ret = IS_ERR(ocmem_icc_path);
-	if (ret) {
+	if (IS_ERR(ocmem_icc_path)) {
+		ret = PTR_ERR(ocmem_icc_path);
 		/* allow -ENODATA, ocmem icc is optional */
 		if (ret != -ENODATA)
 			goto fail;
-- 
2.20.1

