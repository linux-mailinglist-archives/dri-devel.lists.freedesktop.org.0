Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5098D45D64E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 09:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961386EDD5;
	Thu, 25 Nov 2021 08:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2FC6EDD0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:37:09 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP8CqgB028327; 
 Thu, 25 Nov 2021 08:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Q/jpjb4FeSLnzV/XTZZ5EpvNeFaKhiT5WoO1NWVDAD8=;
 b=zAksC73Ncx7BNtxaCNQIBX2+M+S/S/oiTlQ6o7xZe0xUoM4lTO5YcONuligRCBvZkkwB
 38oFdJ+n8JUz94138I5F7+XMzUZpMQW4W6RfSqabPE6glAZCOboP/kgf6N7oQGYRD0jb
 LyE7MOkY9V4DKB7j7Qd57EWb99//vfCTAo1wbypfyLUrM9P2kYkSTlsyUMlop5+x1Tm1
 mWDD60W0P9934rJbHDB724COS8dc16TB4JwtWgrf/qQCHZ3tgqXsf+m/j+GaTTNDZq7A
 KzVHFgM/PXPfqzltOBLdztDg5WfaEe1a0m+1xNKSVDiLL893geT81uzK+KY/VereZC3R aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chj7g6987-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 08:37:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AP8VZHs004187;
 Thu, 25 Nov 2021 08:37:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 3chtx7fqeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 08:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W727dtshsjUnBNCHqp2sapUcAW/WVZaSqgFy0/ligSgzXBW9Z3r/NMdN7VTaJU7moemRrmhsXl1UBVparh8XchykSDn5sBa6yXBhF+q8CT2vArdFuzorgC+a9J+5+rnqJvX9JCvwHWc26UNmSbhHcCm5RiXDD2ksxMkIwl1dmXe8Qp+NDZT2o90ETAIYwTYHDZr7ud9axWzW4gZuZ6J5ILMXpu/sxQeA9GvcH5UICudsXc1CfMLBNJpR2AxDEWPmhpZ8xWT59HaUgkorKmnYT2RuAVNfsWyqgdohs0eq6YWgVkha20nIgLV2+BgOtPg5MsmU4r9TypeDOGfDkPLfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/jpjb4FeSLnzV/XTZZ5EpvNeFaKhiT5WoO1NWVDAD8=;
 b=IHKGwtI4vhd2F0pTK4iyXc01fUr93SwJfDb1i5jPBZZlFgWh5J5uACSh4ttTliRhEt0koo7EVBvFrEnmZdDT2AeYoSTQjz95UEMgvheCq8ucidADcDk40yR24L5d9Cd3VMwjZ/hDdEpxcRDFRVNgM7oBF0uzYWW2ZP2DkDhxv98P730Rbm8qMJYdjJBT0VuR0GP3VY9Yy4BTa6EPQvCUNnDdELjHzD6YZNlnhXqACeyST3RdOPOSt3dNiY2uY9Pg4x+MKs3dwMyl/R4G0s3KurbnCm1abk/8nhVSX+hh1cT7PIij6WQ8B45cLQQweLgDGRAVD3yCGjBlSPxCi4LMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/jpjb4FeSLnzV/XTZZ5EpvNeFaKhiT5WoO1NWVDAD8=;
 b=V64C2b7sv4ZdgrwsQpWqz+Du1dWDWAYkjh98i7Aqu4kN0+kZ9cVHEQi2Qdc2YLTUY7+2ghA8D0lydQzPIDZHWh9OXGDUACqvbewNqTqWm9RpGk1i77Jm9+/iHf8zOF2vqitm7uUCjoW5t+4g1LP3m9HMyp/MkFoqtGPOlAN+OhE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5678.namprd10.prod.outlook.com
 (2603:10b6:303:18c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 08:36:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 08:36:59 +0000
Date: Thu, 25 Nov 2021 11:36:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: akhilpo@codeaurora.org
Subject: [bug report] drm/msm/a6xx: Fix llcc configuration for a660 gpu
Message-ID: <20211125083644.GA6382@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 08:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e2a93f9-458e-419b-a437-08d9afeebeee
X-MS-TrafficTypeDiagnostic: MW4PR10MB5678:
X-Microsoft-Antispam-PRVS: <MW4PR10MB56782BD4534767FB7A2190B18E629@MW4PR10MB5678.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Flesx2i0RfSCjtnsTuEtZkkJOxbMf8RRiF9vD8T/em0NxwQe00kcnYPgghuCATk2by8VcNy7ga+xAAxrb6xOd2oFSIgx5hgpAc2urw0gUvXXl9HQ3d2RG1fIvTRbigtW0uPxwgGsDPMsO9fypRg2O/NHL9bIu5c3HfHVx0Yw55cV5LCFjKtmcMng7kvfZcWIrp27zVJxirko7/ZS0MSDa4a9YlkRbWUqJrj6IogWQkFY9ldK5IM7K1kX9T9jEYcUO6yymlon8XCkU/ruEAjz7rwPV5JHtfRczDbf4tMflbDYUMnNzR47vF1QVpvUMP+B9wxd7SmiAafyWUJgRF+yFP8MBDNanG/i8g60XqsXr9ZlmeJYcCcIZaOBUbdNPGKV5+xj0JAUt+pHJdD5yVX2+Hfp3+Ao5e7HwQuwCyry8c6e4tOuBJx75ujH8M9LSI0SG6YO1kVukGVCgc0MFaNVZ245a/9dMTov+Aw/JiedOHjFo4vFBcf3gQcYw5gPr63FmdMynaULvPYSyGLk20lfdVuriJQp3u+w2/yP1HJr4brmQYMNobKso412WrDBf48rRc8jxCvDhZWt9c7G9qorTUdtTfITe5bBBTffi0Z31bW8fZGaW4aoITUZfUvRMftTcz3NoV8ec7gKiaRFSMLTxBXouzztnNlds6I6hrgqIpGhSbBhwWkonmixgQpWdJBgFVkbPYSMPnZYVPvxxaulfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(26005)(66476007)(1076003)(8936002)(316002)(66556008)(186003)(2906002)(38100700002)(508600001)(38350700002)(5660300002)(9686003)(8676002)(33716001)(956004)(6496006)(66946007)(6916009)(52116002)(33656002)(55016003)(86362001)(6666004)(9576002)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?humiwyEFIT67zc2fTEGgh31wA9xSOesXHsvs5BOdZjKpX9woEQpSb6S+XSfH?=
 =?us-ascii?Q?nEu0wYD9QjxjYWPguND91WNGQ2FNDsVRdzYBW9AUZrhCy3J78eWerKxQc95M?=
 =?us-ascii?Q?KJa0PXQIXJAg554LFI3wpxz35DxFjcWmZPs2EjezBp7bKL5YDHyEqYTfsCbt?=
 =?us-ascii?Q?QpsyYbj9KxGi4dm1jhX5OjaYULWF5qC47U0wQbCkCK+umR2WD7QaLJStxdYM?=
 =?us-ascii?Q?fcB5SM/11c7emHyG5MSYNaV+l06Jse4Boq0d/EcmAM5/QeeMRSWcmdkzDwW9?=
 =?us-ascii?Q?aMsoiPaGWFl12XDb2f67osuX80lW9CQpWMi9lYBL6k7QmzWgVOQkA1mWR8Uh?=
 =?us-ascii?Q?OAT7+DzOBc1owf41MzEH2UYqKrXAcaDd3j754hUYBRzlNL6kK1dFAfQV2oOI?=
 =?us-ascii?Q?8JoKakwPUzBxXHshdFV2oVow6euroyl+jfRAcOgSMIhYwLYHq6KcDsQREVFP?=
 =?us-ascii?Q?mGPmB4WfvyjBBDLP0CLI+B03kluhUo++xJxN8x803Z36FFTRYdN7yzL8NJGr?=
 =?us-ascii?Q?h1JDorcoSvxg+mpl4tVOQRY6wkty9ilxdeB5JM8qiJ68mv2VXwaLBeepWzM+?=
 =?us-ascii?Q?k/oVW1qBFCVcFf7gzI4REMI3tXtEHMJk/fzXSHP1z7BJ3904dwvfUwaGt6ZO?=
 =?us-ascii?Q?fLmdGh+sVUuSXSjFWdFcFqOrEp5dukcZqki/bJfDUqcnXzQeSwJ3mFSrNjou?=
 =?us-ascii?Q?zLTawqX/n/cTKAyWxF0R/MhA497Kow2wAVLTXV/EBTj7KtwBe29GuGbuMkvp?=
 =?us-ascii?Q?JF9cFGjFqKoL5n/Ds/6Gnrj7IuBCh7nAsCEIA8u9Xr2QdXYECuNEBkvN6vnN?=
 =?us-ascii?Q?pCEPa5oofQ7DNm875hUUvqTZcuFF7F1cZ/Yy3Rstyt4o7TOP/tatxo2HxKg8?=
 =?us-ascii?Q?x5xeV1UTJUXoJyyn4L9QZz86mtVfRhHaxY1L5lL5s0x2LpTGzz9a79k7LELT?=
 =?us-ascii?Q?7L1zbIrKFaT71HHKge2VblagyMyGKqiRWfabauV7VqTT92W9CAznEPAaQd5M?=
 =?us-ascii?Q?EUsYsW4LV0+6MkmzzhJQstql9xLv45JyBVcH/Hy3nC7Czfb6vdtSU73SFepz?=
 =?us-ascii?Q?jsfvseFFOg686MadByg3PXSHAvaTpqj1PutSnQHN6TmMUfcAo/gahpXvIIkA?=
 =?us-ascii?Q?EKjjlmmO6sNY7rrkDzM8+VLuTRr/DCDpU54BEsS0JasNs5Jb8cjen898unL1?=
 =?us-ascii?Q?ZQDVVRo4cR3jWFg6IeIakHLfnLbHtHNaXc0WV6J0RLfIcj7XTDN6Y9GRJxBP?=
 =?us-ascii?Q?LGSds64YFWPiObf/ULQiac1Pxgl98iQwsyfGhZtqbB+YMGmaaQGibvgHAqBM?=
 =?us-ascii?Q?trCJtcErjLqbv9NT/hbaq92f7IS/JQC4z37CnlinJAuETkj6nhh3JbJeSdwj?=
 =?us-ascii?Q?pHEyGXvunDzMOKPbo0QiKPH9o7MCwldVdanApO38jfW/Cr8kHHDsxJ5fp+U9?=
 =?us-ascii?Q?m0EqaTXVGAnSJiSIOSd/yb6C93HinBAa8AeTl3CI4uhU7gRtj2wk834xz/oz?=
 =?us-ascii?Q?61pSEwX5zYOvZQKE1l0gGA4stZOp6mOIJq12+XsvheMz2YnXSFFVnKjvE0Gx?=
 =?us-ascii?Q?3t0NupaPmcrOL/+yOchcI6SHuL9Yy4UAOttMzYizsaZumyvBng97JB+VzakJ?=
 =?us-ascii?Q?NY4PJXajjWsW/yTohxM/zKk8HGuYZ2Kz93/I9dX0FmKHPCgexjqNjy1L3A5D?=
 =?us-ascii?Q?MHFbFUklEetJCx26mReFHMldRHY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2a93f9-458e-419b-a437-08d9afeebeee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 08:36:59.4950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3f0Y3a3NwP30YWuW3aDO6nIskF1yiELwITDtB8nSSnil2StwMQr1rSqNfe1xZijGngohl1Wd+SAyLBG7cOpA3u/QVhf0YUtfuBsuCBMJVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5678
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10178
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250045
X-Proofpoint-ORIG-GUID: u3bWE8hruY7WWQS_JZMxe6tbcxjyEWU7
X-Proofpoint-GUID: u3bWE8hruY7WWQS_JZMxe6tbcxjyEWU7
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Nathan, it turns out that Smatch has been broken with regards to
  uninitialized variables for a while so I'm going through my backlog
  of warnings.  No idea if you already reported this one.

  - dan]

Hello Akhil P Oommen,

The patch a6f24383f6c0: "drm/msm/a6xx: Fix llcc configuration for
a660 gpu" from Jul 30, 2021, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
	error: uninitialized symbol 'gpu_scid'.

drivers/gpu/drm/msm/adreno/a6xx_gpu.c
    1423 static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
    1424 {
    1425         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
    1426         struct msm_gpu *gpu = &adreno_gpu->base;
    1427         u32 gpu_scid, cntl1_regval = 0;
                 ^^^^^^^^^^^^

    1428 
    1429         if (IS_ERR(a6xx_gpu->llc_mmio))
    1430                 return;
    1431 
    1432         if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
    1433                 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    1434 
    1435                 gpu_scid &= 0x1f;
    1436                 cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
    1437                                (gpu_scid << 15) | (gpu_scid << 20);
    1438         }
    1439 
    1440         /*
    1441          * For targets with a MMU500, activate the slice but don't program the
    1442          * register.  The XBL will take care of that.
    1443          */
    1444         if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
    1445                 if (!a6xx_gpu->have_mmu500) {
    1446                         u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
    1447 
    1448                         gpuhtw_scid &= 0x1f;
    1449                         cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
    1450                 }
    1451         }
    1452 
    1453         if (!cntl1_regval)
    1454                 return;
    1455 
    1456         /*
    1457          * Program the slice IDs for the various GPU blocks and GPU MMU
    1458          * pagetables
    1459          */
    1460         if (!a6xx_gpu->have_mmu500) {
    1461                 a6xx_llc_write(a6xx_gpu,
    1462                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
    1463 
    1464                 /*
    1465                  * Program cacheability overrides to not allocate cache
    1466                  * lines on a write miss
    1467                  */
    1468                 a6xx_llc_rmw(a6xx_gpu,
    1469                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
    1470                 return;
    1471         }
    1472 
    1473         gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
    1474 
    1475         /* On A660, the SCID programming for UCHE traffic is done in
    1476          * A6XX_GBIF_SCACHE_CNTL0[14:10]
    1477          */
    1478         if (adreno_is_a660_family(adreno_gpu))
    1479                 gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
--> 1480                         (1 << 8), (gpu_scid << 10) | (1 << 8));
                                            ^^^^^^^^^^^^^^
Uninitialized if llcc_slice_activate() failed.

    1481 }

regards,
dan carpenter
