Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8742B9FE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 10:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31D6EA0E;
	Wed, 13 Oct 2021 08:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE076EA0E;
 Wed, 13 Oct 2021 08:13:34 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D7Gn17028774; 
 Wed, 13 Oct 2021 08:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=GNbtPbOvlaqdwqZpjkRYffboDtxY3BwlN2MQ1y51Z6E=;
 b=ypOrUxQKt51/l9M4SyNyqZm89Fb2+66dh1IDzRC6dA1ZsyW4hXaw4lfcIAwoi3lecBzx
 +yc1fKVLnO7z5C7Efbtm25EI0+PaSzbj+BHa3xniqB8u5pCiZ3D9+hTALgj/JHV7qF4H
 /tCKuC/diufajHg7YPMr0HnlpLLi/RLeRXOmZBwYMaa+yMyrhcP5PJuJ6FHqNomWcVNA
 f/dhxC8vK0qBvZ+CiULhLDERMCqnWYNcX3O93UyLZViCgMlCDtglG1jZDXctNNwPxCHC
 mJvoJSu03Em80hVrgm/IHPKnPuo5+KkdqTnfPca7gPQAyB/Z4IOKyccu6bUH7zmNeNq2 aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbh25hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:13:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D84l2B057870;
 Wed, 13 Oct 2021 08:13:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by aserp3020.oracle.com with ESMTP id 3bmae0cngg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4jGpaEdTcVz+Szdwaa/q1EGrRmsKNjp37nzyBgNPPltxdqLyGTUma4EldgUo20YoyUHFKWAg1FQfK3P+Ti3pOh24d0o6TjXjLKhTPhoJYJRy48oCGzBgkrZI1aiMzOqwXSkKh6QwhceMJKqd63r4eh6veFoun8YNBer6VT85h3M0O11vYDUwj5ZCLgrbHaGRbey9TqIbcJ5lwpr1XpZuINTEliSoblv7DVmMZhrpUYGVCQPS2zko2CFHtvYF90KVHPUr9pBXTqdTFr0syhVLQAnpPjHJWrcc873tNEdAQJ8RFWMOvCDjS57XynFMvjCZCIiyx6vzO/YjqmpmGyiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNbtPbOvlaqdwqZpjkRYffboDtxY3BwlN2MQ1y51Z6E=;
 b=RMOrE7SuumWFcl/inPiLDck3iXRFhTtGBWYW+syC09sXrFylPycmIFsjmpd/B8iqraWSTL+mL3l7s4FmcC/+r4mrRnKcq0ITsCFaGQmDIXCYvKcRsa3Rw1sz4Q5+QK50bNlXOyaU9hL8r5ZmaNUA0GX4wrLpYYHf//opfdnhjBSr2JHsEwtnHxD7OaXYuHXIqmfNnzJq/JWlkQyu5MW2lVXHiMBKlP+IfJCa1bgtfu5KDLg1e/03anqHzkqWkpsr+PviRrNjDK5bbPiktrr2RyWVF8n+MOT88ihvfuqAc/ruBYs5JS/FJ8+IwSmS+7HDeWLT7rz7hxPi/SDiXnnq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNbtPbOvlaqdwqZpjkRYffboDtxY3BwlN2MQ1y51Z6E=;
 b=tDOdkzuPpFvsC+xBNVi67Q6etvO9WUJXoTv+ljfggr8Ktdlu23jScn7LM84NG8SOw3CXxZ3za7drWfk3l6O/xnt+SMeW8CyXLnppoDR0YrBKj+0sawha+FzToL2TOOuSFJm/nRPDFJG6cyQMBAUQO+WNNh2fwXJXaD2yb6mxG04=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4643.namprd10.prod.outlook.com
 (2603:10b6:303:9c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 08:13:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 08:13:28 +0000
Date: Wed, 13 Oct 2021 11:13:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, David Brown <davidb@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] drm/msm: uninitialized variable in msm_gem_import()
Message-ID: <20211013081315.GG6010@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013081133.GF6010@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Wed, 13 Oct 2021 08:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5915c6f1-7f50-4bdc-7a6d-08d98e2155ee
X-MS-TrafficTypeDiagnostic: CO1PR10MB4643:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4643587CD00FDF6263D18D768EB79@CO1PR10MB4643.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQ5mTK/ridokeV1U68JNobz0uMrXr6Jr446P/rvZKEldg2W/81EICVBF5foBnICQoX9+s9GeBKhHJYwMGasAwq0sfBMT4zRlnlibIHTa2tYs6aORZ2jWXBm1R9j3PJqt+Syhz2DNZGwUY4w4j68Koto+mSCbl9UraaFfPBamHdmt995b5sLlYUtuHLZmmi+sfb78PxoLT8c9Vz8lY/JvKlPxyHlPpLYifXmiqye5FLtqTEwc0BChAGq0P4dQDLjnXpXuIjdGEupnx2GNpn1ENrsvVD8uK6J3D3VEnLvrFssOsX9WJdi/Lha7Y+2adCftdsTFIAFsyt/s4/vmoM8agT2kLoSRUfbRod+e4+Qw+MmdiuDxBek9xfx12ajfSInhKx8HH1RKe4vC9tEcQ0UA+VFfjZteHVEkf3AXwnWyTnt774C2qcsTAm3fDpY3F/qjuT33IZwcFLQbHj7iGZhcJ/XLhtTyKKhAkr79PXrqejrHnN6AWz8vzcgpaV/VW77GUczkxSKm4TLDNACyH280yuSWsXQ0AbVE5y76Ma14QIg3sJVghexVmJmY5TA8aFXi/k2gHAq/x41WjMj5buplb3KZfr1MUJB6CpBFPMUXGBdXc/uaVityFUFIJYsS9Tqf42GjRcIuxIyNAqbZgQQMOGfMxDdptLSGtGS67LlMUNWGyZJ9teXFj2roFtLwOceW5TtxZnKSAlhS/D7kvk9urw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(66946007)(4326008)(66556008)(6666004)(54906003)(2906002)(6916009)(956004)(38350700002)(33716001)(6496006)(38100700002)(66476007)(83380400001)(186003)(508600001)(33656002)(1076003)(44832011)(8676002)(26005)(5660300002)(316002)(9686003)(8936002)(55016002)(9576002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sh40HbT1XdcT4O/z7ER+pRHqvQwPieg16Zr7xzChYsNHAT6iAIn6HIjX4eIf?=
 =?us-ascii?Q?8T+8jqHDrPod9KtNeI2fKHaRHFRZZceF1mht4K18vRfw9Bma1yurYL08ubQH?=
 =?us-ascii?Q?/GHNqb/n6gD0pLJkddKlqTf5IJMp4rwIF6YzFtq0ComVHvXmKsQf5BIx9bro?=
 =?us-ascii?Q?zykih+WR18BdWdPDAKOyWlfmIdPyE2YnyViE2fJ07uB3Wd8N/+C5a8orXRxR?=
 =?us-ascii?Q?Pdi6qV6DVw4AbOV8miB3iiczi4dEc1KeTn9uIGetUjSOb6RGgSjPmKrc4Sqq?=
 =?us-ascii?Q?uaiGCr+BjthucT9pBat/wUNIWETSofHwMjTjZm3Z9+pVrQJgGW2Lud6yQhay?=
 =?us-ascii?Q?1lmRrHl3VWKnvAkVr8Yf2H5l9y8F3SDQQNtpF4lC+ROavbFhcrsGumni8GV+?=
 =?us-ascii?Q?tgD+AiG+012J2G/eR19dNutGyLnb/P+dK9+pucLYdgk2b9Xx9f6df/pA0Cpx?=
 =?us-ascii?Q?wD98BlOObt5VK504K2iDwThFI8zFfGXqMIXP2bRuP52u7HH8gw/jqtoR1ao0?=
 =?us-ascii?Q?w5cdtLPjn39TQwyPg8TlTmYfDWSO2OpFECbeD0C6C2urLUO88XJKA9UYQjQu?=
 =?us-ascii?Q?7k/OtI6conKFiHOjaggOohXRz+ZQ7ISzErMSEO3c48+aLlkHmzGT8OWsMx2G?=
 =?us-ascii?Q?iZB1Vu3FY6wL6vWFgG7l6FCbUaW7s3CX1k7Iw1iB7QvdlzXShqc9WNQDSEOl?=
 =?us-ascii?Q?wKF8r8rCELVO1m17vaJ7V6Jd4+dCH6rQ1ZIOAstW9VO3RDT37eX6ibEV71xD?=
 =?us-ascii?Q?ehvXbz+nwhlEOltkVznyRO3nXMt6kJBCfAS5J8VUnTD4B53N5kYGa/Jxq3ah?=
 =?us-ascii?Q?fCzNtPTsixXd/0KiLA6FWndNTMPZEABIQ3z9dpgqJBJUaEvCfKEWw86EaPTR?=
 =?us-ascii?Q?5V+XxBqeGK09Ir2I1R0lQmFFEZ3aoi8iLTz/pcNKc+b8nhAQRoJDrOmvEWDJ?=
 =?us-ascii?Q?G1vWnTjVyEBJsTdxuJ8Bb/mueOkMkc5/XU9RA5pzGXcrucrO9M7gyRvoriSk?=
 =?us-ascii?Q?/HBaLAF2DRHXfJ8RfU3jKs6DrdHsM6Tjgzrp7npyMzGvv9WvF5KdyZdBI7p2?=
 =?us-ascii?Q?S6wc9ck8T9HxReMWNULR7M5XTApfXam57H8njgqzTPqawdVG50w/b49NNt5X?=
 =?us-ascii?Q?1qpC3GBSPh6I3lgDx78slWPJ+aR2wzt32MN2HgHh9QAlf1at8N4e+npvq50F?=
 =?us-ascii?Q?vLvlYxLJEGe4PmXRBLlqQXE5IW9CpXncI0xDp6q+LqPv2DRzkcw93apUeEoQ?=
 =?us-ascii?Q?1bi6+jetJSCFTL5v+d7jf78xw3QycHlhSBGIg1NTVrL0pCtoI4ubzCIJ/t8a?=
 =?us-ascii?Q?/b7MRp4MJDeVfQ84e63AmUc9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5915c6f1-7f50-4bdc-7a6d-08d98e2155ee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:13:27.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEYyeVE13h9EM2J2k1WY5ZLvR4IN/ZPX/muoc8BrdqBNDW9wW40hieXKzYPaulZniJanHO50jMlz2ZoOy/NNWbdLJSJaZ0iuAMyI2x/WGVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4643
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130054
X-Proofpoint-GUID: 91Z246DJ68FjtarPmns-YIDYd-BDg6vU
X-Proofpoint-ORIG-GUID: 91Z246DJ68FjtarPmns-YIDYd-BDg6vU
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

The msm_gem_new_impl() function cleans up after itself so there is no
need to call drm_gem_object_put().  Conceptually, it does not make sense
to call a kref_put() function until after the reference counting has
been initialized which happens immediately after this call in the
drm_gem_(private_)object_init() functions.

In the msm_gem_import() function the "obj" pointer is uninitialized, so
it will lead to a crash.

Fixes: 05b849111c07 ("drm/msm: prime support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 49185d524be3..0e491cd21c53 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1167,7 +1167,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 
 	ret = msm_gem_new_impl(dev, size, flags, &obj);
 	if (ret)
-		goto fail;
+		return ERR_PTR(ret);
 
 	msm_obj = to_msm_bo(obj);
 
@@ -1251,7 +1251,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
 	if (ret)
-		goto fail;
+		return ERR_PTR(ret);
 
 	drm_gem_private_object_init(dev, obj, size);
 
-- 
2.20.1

