Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E003BA827
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 11:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5462C6E1FB;
	Sat,  3 Jul 2021 09:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F376E1FB;
 Sat,  3 Jul 2021 09:46:46 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1639k0s2010419; Sat, 3 Jul 2021 09:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=Gx7xi/V9Mp2S1H2kNr+ypHdVbT/GPk6E6g2Azz/+3fY=;
 b=W8Km8kAJPwO7XOewqrtmFYLvXyAAgVxvWnZLgPCdoJGkng9pL8N7DAhOW1AmuvuPO41z
 GasHLd4o94M5Z4xeCJsvoXU9FYFQfaYM0sBDgtE+AgkWYHUC03nX4TRKqSWKwgvc6M+H
 DFjRs7PhdIjGJ1FI1Mr9r8sM0KSzhGaaqOprBbQrsXWV/2DFjiI4jFvDyLZvHoC2Fz6i
 5OFf2lWVEnnS4hS3zOmtW+7x2q2Bf3DyrdWmBBeOPSD5FXpW+PkUmyrVAHt+YB8+y6ba
 72bmUaRe35Xs1GDdcvdxizTDiONGqU3VMsUpI99E+q9fHFa+SXkDDwTWZjiOhivifMRH ZQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39jep1g9hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:46:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1639kFZ9097512;
 Sat, 3 Jul 2021 09:46:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 39jf7kepx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifQeVoEMz0ND5ta/KoDD8BrHEixYD8N5aQPBfKpoBsbiFPEC7j9Ld5qmZG/PV9v0Fd/ZjmxnFcdtpcfKGBp3z8fATViH8QkIhxY3SNdkUqfPTnLXkAEUCJqo+eTdu0rmINCWuSycDvqgSEA9PL7hpW8DdEfvda29hfMBPjyanZqJCtQVf49eHyaT2C32Iv1NnS4DtgZ4Z4HhvXXqOXPcRHstJo/0+qnZwkm8LEnS7oGjY1nBupx6COMtMFfs30fh7/E2ZdbPYdVa6PHNp0UTghU9RW6ZaYdpqaEYfSInGyGLwrjbQnVZF5BlaqZjRMixskdJBNQpYovwzytXvIx5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx7xi/V9Mp2S1H2kNr+ypHdVbT/GPk6E6g2Azz/+3fY=;
 b=SNGLFI45MyWagIZaUFxWiJEBnZ5F8Cmyga5wI4DxFLbraN4qwFqqLWhmEmMtqERmgs9kksEsenJWM40bQ1rfbupmGtRKmuZ/wgNDujKdZsCvrHPVk0SBnOD1XS5fQjzUWMDxY5E3bNmWF8vBrZasc0P3gcAUcMonAYSBCNSr/lKVbqwj7JL2t8lHyzJqLa0+cLdJa8ngE2M1IcpEW4s2rrN1VfpqXUKQOlU+WUz3aQuBJBrw8eRVHB08XV8V6DYEuSErT5Ei3XpfMTz0RICpGkZN7HOTYvjlvE+/V7PIacG/JC2uoc3fAeDetI4oeC2N8i0wvn24fjWrhwy2xRnjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx7xi/V9Mp2S1H2kNr+ypHdVbT/GPk6E6g2Azz/+3fY=;
 b=kCp4oChpi1/6sHl2zGRcWLBIh7xp5pqpIWrI+AHVirkhgDaSC14z4Jz6Cd+SXdPBLqucYfbO5EPnKUuXU6q5BMLJ6PgpgiHiBqBfKLafzRUWz0/soLolNnNWIdySFDipQ78JsFY/1sj7pH7b2dUsEqmBs+NmfUt1QBlzViD9nb8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4628.namprd10.prod.outlook.com
 (2603:10b6:303:6c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Sat, 3 Jul
 2021 09:46:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.030; Sat, 3 Jul 2021
 09:46:41 +0000
Date: Sat, 3 Jul 2021 12:46:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: return -EFAULT if copy_to_user() fails
Message-ID: <YOAx7IX04CMOaE/k@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOAsdyWeZAHF0oll@mwanda>
X-Mailer: git-send-email haha only kidding
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JNAP275CA0008.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by
 JNAP275CA0008.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Sat, 3 Jul 2021 09:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e4a96b9-64ea-4606-57c8-08d93e07758a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB462896C37471A825216160928E1E9@CO1PR10MB4628.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PSNDENdj5KlwSkkjZrteWJWE+Hg8cLPSUP7FJm8LrHULvs+kzjyTETxNixtD5iuoQCbPclHxjTGjneCaKvJ79bZawvkR927Fx6CtIaN4XIjCx/UgG11MSTT+Kt6EWLit1mS3Jxq3GcXZOhCAoe3Tcoas3TOyyCbhqv3YgX+5AjnrWcTM1EXD2YX0SYLIg09O+i0/u1sudWqmtoKYzFt7gSX7+wb96+6ap2jVUw3fG9r9QoCJruw5YYsBAZtFZAtMWfzxZRuKbv7tOEbc1fW3HPoC0U5bF+H6MfLvenbRIntNSq1OUh2QGdEsqoacGQrAP2o+bDX2OidaqLBcaV4duqiTjZZVnCfguA1JhKa3/feI6GpZTKsIMEb0k2WSPMUcTXYwEBYB699jZXqAyimFWfMo0FxscE/nLoOFRB+hPvx89J92Bj5v+hNnbnA5IMNCkrQTiRqB3W31NOLT3pt8/rOUBP9Jc4l2dEK8ivd9MWPnODVdl8GUUJHZ7N1xGXkNGrXqfYKrODCu+Jbgf3Uzbo1ME5gOQnFNwoASas7zvCP+KDzUyTnfQQNQYrYAEu2F07hAbdh0d2Lm7qct1ybShlf/3+hewbgfDpjvufH84wIWbscQAH1LYjlRWk1WnK5/r6w0tfg8eis+sal5XBypvQRZiZ+1GMN4q4jYZkbMO71+NCXgfXUlKzaqPjqRfGV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(136003)(366004)(346002)(186003)(26005)(54906003)(316002)(16526019)(956004)(38350700002)(5660300002)(4326008)(38100700002)(66556008)(110136005)(52116002)(7416002)(478600001)(6666004)(6496006)(4744005)(2906002)(66476007)(44832011)(33716001)(9576002)(55016002)(83380400001)(8936002)(86362001)(66946007)(8676002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wg9hRYQiQUO/gTZLLWFENkATY7DJzZxKZRGoMRXt7DyMAvEqN0/vnF8Xo3DX?=
 =?us-ascii?Q?RA2ZNenEtiVKy7HGK8fHJv/ELBbXiJHc4CFFql6ev86Zbj+boQtlmeswEGMR?=
 =?us-ascii?Q?2eR793l4LCHXN9PPbheGwmRHHW/fid1reO7LiXVOkQVQJ0X7Og+DtMCoEmJB?=
 =?us-ascii?Q?cGTtkpfvfloz5gQXjyILVPz6PkXokbPwTl039MTQZpz60bHssJa2/1ai0qfd?=
 =?us-ascii?Q?m6sQDBPOOZ1quy4IwVhLp4vlUFDLSz76wMU8tAqSvtb849No7bxy+k/4Lfqe?=
 =?us-ascii?Q?qDrpLe+4g3Kv7QVoSPyrDuVyEgL6uA5rfyfKo6XwrDhPqnzsaXrnWsQaOMJV?=
 =?us-ascii?Q?S+4NkgTFt3qKRfx7aeP3etxv//Np0reFHwyPveaSfdWRQ1McSefdhqd8f/wV?=
 =?us-ascii?Q?H04mAYO6ktoqoHp2pNLxOTKXi3HHB9X8LizGxdUC0xmaJRxqV4L9fvmd6UAT?=
 =?us-ascii?Q?gsCK9fz4MuJy6bnxpb7b63OY2n9Y8rmJKw77UmWdi9TAHA+eN8LD7xPuVx9Z?=
 =?us-ascii?Q?4hKoNPXoJcMHKXxxZZr+IwFZUHWHZwONv+176NNNZ/r6LrVBRHUenW8+bOqg?=
 =?us-ascii?Q?pC7Bev088lcEHEdOIOgOUrl/ZcCOHNIFB4cPdzsVtfvRP5SNQ+LOGnnNme7e?=
 =?us-ascii?Q?cehFGsCmvCDto99NsFT+QxItayfw2lfrQgBVZpDy4ck6HF/W65V2Y39pcDQn?=
 =?us-ascii?Q?9bZc0HuqdfUoU1llvbD2En2aSCV7iWyRxEt8Qcg/4HSpazZ2ihalbw9b45xC?=
 =?us-ascii?Q?s8vkfuTAVYdeizd3u+lgBdPvYzFFrc8v1RXm5DG52jPHNRS6hxcC9dDCZqyG?=
 =?us-ascii?Q?oLuOZ1epJYdDNZ8ZxJpQoIPpJY+8evcEoYwYoePfmLSMa6To0v4TK93gbMCE?=
 =?us-ascii?Q?zE5WJ6KUsqLlAdHrTFUd9HKguC28Zo62VZZcQQEWj6EJ4ZXGJqHOsNn166FN?=
 =?us-ascii?Q?qGUi/0uspv67DnWN69wwYUkauonWviFbVIocislvJCznaIpt1n5cs/HiZBzu?=
 =?us-ascii?Q?SjtGgI2XBC2Y2YYWGm3CFyd0PNXf4QWnvQsxj42pMyf0Xo1BZnX1JV/baXVp?=
 =?us-ascii?Q?vozAoEMmuK8Bec5K8CvkfMHeRgtrVtpD9N+/As7F2FQ0B9mjX6kgeU4qxC5j?=
 =?us-ascii?Q?ezy4S8i5i3bIpaKGPF4LoUPo4CE5Xz8qdiW81Lfe4Apc4uaqtrCKRMrQ/fTy?=
 =?us-ascii?Q?vJAjAAvDqcSA9Z26z7Yxf0HRj8yy5BACSfvv27f6FWMvUth/+U6DdFyUSn5T?=
 =?us-ascii?Q?WfKEIOIw4F4o6V9lGGq7OW68FrO7Gf6IcYZ3td4v6EZsdWzZYorRjG32CCJa?=
 =?us-ascii?Q?SSgTsXvTIxr31IfcXV428zmu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4a96b9-64ea-4606-57c8-08d93e07758a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 09:46:41.1847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGMuytPbY+9HONN/0DCfqtfm//XWjmZAOFrO72FvQaIHAR304VX35LuJ7/3eK3whAjtQGEXv5ZJMYplOQIu+cMW76aLlV7+ET+Y0kCPi7Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030060
X-Proofpoint-GUID: KUGGDl2aPhVd4CU4z5Ds4zIpBWngLlK-
X-Proofpoint-ORIG-GUID: KUGGDl2aPhVd4CU4z5Ds4zIpBWngLlK-
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If copy_to_user() fails then this should return -EFAULT instead of
-EINVAL.

Fixes: 9b790694a031 ("drm/amdgpu: RAS EEPROM table is now in debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 3e33e85d8dbc..d2e5b2567bc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -771,7 +771,7 @@ amdgpu_ras_debugfs_eeprom_size_read(struct file *f, char __user *buf,
 	res = min_t(size_t, res, size);
 
 	if (copy_to_user(buf, &data[*pos], res))
-		return -EINVAL;
+		return -EFAULT;
 
 	*pos += res;
 
@@ -950,7 +950,7 @@ amdgpu_ras_debugfs_eeprom_table_read(struct file *f, char __user *buf,
 		res = min_t(size_t, res, size);
 
 		if (copy_to_user(buf, &data[*pos], res))
-			return -EINVAL;
+			return -EFAULT;
 
 		*pos += res;
 
-- 
2.30.2

