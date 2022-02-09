Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21154AF906
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99510E3AA;
	Wed,  9 Feb 2022 18:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76B10E3AA;
 Wed,  9 Feb 2022 18:10:20 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219HCch7008857; 
 Wed, 9 Feb 2022 18:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=tDRAJjWRDkzjOBT8Iie0acpYa/44x3BoTHDf+KqygiE=;
 b=Lg1/XHe6h22QXFIwB5pBs0ez4PNpWcrJ8VeJC0PM2T6yeXngY6jU8pgtshtUFeblVWQ/
 FaUe77YbZ2GuDVK+t8TCfey3JdZT4Fvt20a+S0SimPW9oKj8JOrI9cTthvF/PMjtRAj7
 ZWTHawlrSgy/pK65E8KfmfGxe/YFXuAZB7yQJ6S0tCWVpfNt2H7EAQ0myG4dR7YisI8+
 lULcjBrIP3ZAHYhaJA25sha0DhtwJFsMjc0+thEr0BNHPixYQ902nIvYFurVPn4Nrq7W
 u+iIpZR47Zb3SCtZsGjxYGFoVgN9x1ZnB/70ncTl3aqupRxHK2eRIQt3zBfZBa/du4SJ Bg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpgnhy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Feb 2022 18:10:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 219I1b0k104142;
 Wed, 9 Feb 2022 18:10:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3e1h28qjt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Feb 2022 18:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+Ioit7IpUgEaTGH2jthikXNjyE3sosX93MO9ESdEuXBZxRDe88ks4LEZb2R+lNxNV7uyyGUi7n1Vlvj/i/iOIqV/KH17GuB0iPFRs7fE7szGBHy1+nBdGQiN8u/RGBr4KFfwD7dbiTTwS8Vhu8R4XhdDFWaMAqU5krrt2B1qq5WWKXCfQYUGSEbZkdrcY3dp1qzZ7X58E8TNrNlf+oq9onhD8DmThv4plOBPmcZG0/wWGQgAt4w6LhPsteLM01Ek2aR2sOpUMzk2X1VkyrRKqpuVAK5u0pQJsM62dYnaH4JXcy3XTW712Kl3GhZbIXWbRPwVvANOrSMVl/E+PISjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDRAJjWRDkzjOBT8Iie0acpYa/44x3BoTHDf+KqygiE=;
 b=iUuKqC4NAlHzlAJf1B/hHqV/F9s/rnHSAfE6DvFjP9TOYdLw8Q4tZlcN2yz6ZqD4/iBbrr94mkbR0j1d593YSNVk4N7oO9dmWF14zWIGTg+A+dXtqedqQy/qf8kOoW6uYx4eCKjkKjE4ZYfF62CVaXPvuy0v6iCidEg6aBZ67ZtLDQ4mmmCO3tIL1xhiZcRe6jpX7596azSfKh5EwvsvEX1NgM15Pr4I6hDP4dGuCcmIruYuE/se5ycWQmNLXvIwQH8FgI71AKp4z1HZ74kiKgX6QF8hL/+odFvmls47XMYvG7V/to04IcV4kis/rxuiogYnFZPgbXoJjbJQ+4xgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDRAJjWRDkzjOBT8Iie0acpYa/44x3BoTHDf+KqygiE=;
 b=z81NLU+CLf/urMaJqJSpj2vSJBJrvmCvmt2X2UhpQX/80udP390FrFC5kMgBcXWO2bRZe0x20RObt4U07klQW34F+SFyAj+9r7zg3MtVUbg7k7+2gE2x3OPaGNXlUC+pnUBWF+gDhfu+FCsON7qYECix9WUFhLhNVjzKImQttVs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3353.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Wed, 9 Feb
 2022 18:10:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 18:10:12 +0000
Date: Wed, 9 Feb 2022 21:09:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Subject: [PATCH] drm/amdkfd: CRIU return -EFAULT for copy_to_user() failure
Message-ID: <20220209180958.GC18385@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0166.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b11c283-df02-404c-df45-08d9ebf76a6b
X-MS-TrafficTypeDiagnostic: DM6PR10MB3353:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3353D66A119042B773F66D378E2E9@DM6PR10MB3353.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+XRrVGuFc9QRvJZv0Qa0Q+6832IcHV5bGhc3t6P5VuYx2fFoSionm/fwQRyQPFeC717tHHkXqVfHr6OTH3cOs0+UzUSnMoiyvUuMsWvXtXclSyTJtWHATAnlC9peS5cql665CuQax+1z9nd9TeCbG8v0CZsZiRnz0fobKDlbHx+pfDunpUKCdCICF/RNaNy6co++01RsGyxz2IIx2SZjgjAThP/MO0b6ixRwTxGT1mlWLINKv/dIXs69zqyAjyXL3CzqjsPBAOj2YEJHSVOsxHq7pD2BVBkPGragOMVW+PvNdQ/EkhJZxMTFzbTjP8VIw5i2k9uxOa2RxbmJCOcR2UoiCmSeXqKPUuHIm7SLwesExBX6Z29KYAppX2w6IBfkD39ksRvmzj92WlR9sBjaR2Chn6ToaDrfFL4sOgvppf6GxQ8w0NgejPtnTNeVZoDlzkiUmPx/o9SkW6lXzNqnSkXdAzVRPh7wx0LGSoTcRwMKLJgkSc83ikMiYhbGpx9FwV/LPT7/Xc+0TYLfJWgGKgUF8Qwa24AO20ZeMtkRoQWZTJIVc+54SwbVLjf2Uqi2CQan34LEZvOZkB1WQsVezP8rS3MsVweF9IVg6xlsnSVpVVIBn6F29zBSJ3AjLg+rQjwoUTzPrqVX4cr3O1gDd06U/L1ZKo3xaGx1zBmK2gNuRzrGxyt2pUX2AOAS0iIvIefymU5bazxBZKAduAxPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(9686003)(66946007)(186003)(1076003)(54906003)(8936002)(33656002)(52116002)(7416002)(6506007)(38100700002)(26005)(66476007)(86362001)(6512007)(38350700002)(83380400001)(4326008)(6666004)(8676002)(66556008)(316002)(4744005)(508600001)(44832011)(5660300002)(2906002)(110136005)(6486002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pw9f2GX3BEKOPRWW/69Uew5H0l7BlAZiV5fAU45GcgnXuWvgnbmQsofjEDoc?=
 =?us-ascii?Q?jN0azz5cuiwN1TeupSP4F5M8tBbdz8MwSWFjWgxarKgI6hMqSaTLYkNH8Bn0?=
 =?us-ascii?Q?2bm07rSxJgtUHOMrC9xVl3L9xfqKvB9NuwVnR9MVShMygEosrHHYbOBXMvl+?=
 =?us-ascii?Q?Nuo5OmwYYRVSGw+bgxtdtDhv8Nn/ZNEAc6HfqSREzN8nmW3fpdUntvLFhOIc?=
 =?us-ascii?Q?A2XnN/WSj1P7n4g1qThlwcPW1t7wpA6EmGft6Z/VIh2bF9x895ihk73AxFn3?=
 =?us-ascii?Q?oxrV4JDK7gjSAuqbYyD51V8jIdeQCUljb7evio46FFzx4bdm+MJHFlskFY3T?=
 =?us-ascii?Q?qERjswCX74wSGbbtFvdDC+wdxvt9xAOEkzJmS9SV6BtjFhlinztpSM7fwdjO?=
 =?us-ascii?Q?6PgoBfHYC1RZVxIrScLt2PuwXUFr53CADl61fASAig+Mj/twtRwGvEWGWor5?=
 =?us-ascii?Q?FGbJrQgTM5kqkDB5qjAVV1oTLrsEaVk2ioPaEqI97QYsBlKWxcnGHMNz6xIM?=
 =?us-ascii?Q?Qp/ZYmRKT7cmElxqq7JAps4F/BYPb0RClH5LATclAtWIhDvWhWFdkKt1CgKU?=
 =?us-ascii?Q?gJfgU/KRm8abNu3c4Yp9jO28iuJjprVoQinqM/oYFZ0/sS12waXUPGFzXkmX?=
 =?us-ascii?Q?yMx9sZiET4IJZxf0OcPUxPoWFn/spN6EKcu7r/guzOxD1eGWQe91/TvYgfHr?=
 =?us-ascii?Q?rw4ZhB+GpGs1OuTghYmfbLF4XEIwq2DjouIBt6zlkWPCbjQKZF+ypSJU6onk?=
 =?us-ascii?Q?sYc7yffobRDdDfbH+5wCGUkLqT4qNUBQ1QFgdC422KV3QnBvehLUbhW0kLoP?=
 =?us-ascii?Q?J+5EBYrHVchiB6tiknXEiBND+Df7SZWDcARFjrMMUUkUcEV1d6WT5pUtXdjg?=
 =?us-ascii?Q?mwC3G2Qbp7AghB7ZzXU67xAZZwtHke2aAPzwzwkqSzlPvW42QHaGuzj03L+b?=
 =?us-ascii?Q?tc210y0jflq5gx5ww222dZq9cPfDzatZPE6xULYHCk6R5NRJWaNtX5gp6qBi?=
 =?us-ascii?Q?fDnv8KL6B8fp8pPu+eqRdFvTX9c9kM7uv+tuqs7GU8qNCzis163J+PCmq5dd?=
 =?us-ascii?Q?J+R6+IFJoAiUDxDHbbcTjP+WAjwKsQcGVj/8OGFVHLE/op2a3nCol6pEMiZq?=
 =?us-ascii?Q?yYo7z+bCt0mblxiOXEmdNoEzGFphoOYV855at49caIDaorCQrzDJB/Jvt9pq?=
 =?us-ascii?Q?RNr8jzg+Rsr8zKm+/HPSH0TpvFK5bUok1OH6K5Vz13DKWgxgvZhTT4qzO7zZ?=
 =?us-ascii?Q?N1Bnedcfm/rt3wzN0VAH0MFe3j8yrvanV11zqZ4lEo458qth0nIbq+NqSfJy?=
 =?us-ascii?Q?PUKvVtDPg5QulMt7DTLSU8lGadRnnWPf9PKC7ArzzENfzRaiUj8jaU/GyJ1K?=
 =?us-ascii?Q?AWU2BSEQy2n1A+p/7mKeUXWKL5acRYnYM8sVlljY71eJ9/MhHFVTRFZYf6eX?=
 =?us-ascii?Q?tMSxjYO7Dnf5Sj/htMEiVXVMyPZXodUyPjl2HgQE7ehdDrNiyQ15korrLR6k?=
 =?us-ascii?Q?glhxQ411blhAUjKM4U0zDQ1pMiay9nAYEJ00mYayfr9ile9zZwyRO/70Wq9g?=
 =?us-ascii?Q?VGEt46r7MjeA6cnIOrhrM7Qp9H9ufT2yN7C2O3If4IqeuNsFqfsSxbD+hESV?=
 =?us-ascii?Q?ASKM77RuWR90UyR5/gwJGhDC8WiWKm7NThjGP4tlIi1x7C647mvL2+7zKS2k?=
 =?us-ascii?Q?VpG8Rg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11c283-df02-404c-df45-08d9ebf76a6b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:10:12.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVNrEIOMrRa+cMW+ucfDSPpP1tQnTw9c6WWRmuMmTbsymq+J0+tvqsFvxz9HUj1h0FCuiYA7+Y6r/modexY4idGifCp5uc3nvjNyG9Yf4QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3353
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10252
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090097
X-Proofpoint-GUID: wLSUt1Z1RyC6QbRFYn8m7S4ERB-ICh6O
X-Proofpoint-ORIG-GUID: wLSUt1Z1RyC6QbRFYn8m7S4ERB-ICh6O
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If copy_to_user() fails, it returns the number of bytes remaining to
be copied but we want to return a negative error code (-EFAULT) to the
user.

Fixes: 9d5dabfeff3c ("drm/amdkfd: CRIU Save Shared Virtual Memory ranges")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 41f03d165bad..38a056fd0966 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3775,10 +3775,10 @@ int kfd_criu_checkpoint_svm(struct kfd_process *p,
 			goto exit_priv;
 		}
 
-		ret = copy_to_user(user_priv_data + *priv_data_offset,
-				   svm_priv, svm_priv_data_size);
-		if (ret) {
+		if (copy_to_user(user_priv_data + *priv_data_offset, svm_priv,
+				 svm_priv_data_size)) {
 			pr_err("Failed to copy svm priv to user\n");
+			ret = -EFAULT;
 			goto exit_priv;
 		}
 
-- 
2.20.1

