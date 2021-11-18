Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992824559DD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DFD6EB51;
	Thu, 18 Nov 2021 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193B76EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:14:34 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIB1qii019322; 
 Thu, 18 Nov 2021 11:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=0I10lW8cLqbOYmvj4TOwqEkTm9LGK3e+HON4IPUhPS8=;
 b=SkOd41bh0ukY3z0hPpv8I3bXrWFyV+aO5AIpvZLf7ybJ9nVAJM9x0B9DMaLpmfbncWiW
 Wp86Mit28WAoTESnDn8QzCkX7QG24S+O/AsJ39LILXiDXlWaxtwSLwJXGvT6rMxTARqd
 7hDFRfMSJqSJok7GRKsD96oQaUNgiCuoU5xaIqoamtcgwVqq09pK6pINZxED0Vxjq7k4
 xxuGh6B8EJoKOeUjLj+sdza/KM5+MF/CQ4n7hkS8/SsRmdybIDMAi3UoQVfnYd+ro+aQ
 grhvBHbqXcHTAeQZ6eC75RX9AKJasn0ZAgrz7ACLh/vrNZ9LKIYEraExZFFtMPlasTW+ ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w8x7m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:14:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBAJUo053818;
 Thu, 18 Nov 2021 11:14:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by userp3030.oracle.com with ESMTP id 3ca2g0b4rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBZjMAkPioQq142ytM1vptE38SV/ISsA316uOoANDJsYi5GHATtQwGGyQpneM3xOPvqpA86srknrwiChH4kaBDvNhqiITuPkrVB4Oe6S+vYZQmwDg5pSghobobRadmIGhbCCSrSPUjfQXDBIhoFECA+TGPjJloZTmN4RBa6hn2tiRFwqaw4eHlf27XnIUwV/dSwuStVP0BdRfFcA/dGK0stF1SrO8v7kY3BdnOjl0tPda0hEXah5cMXUW+PByA4LOwxJ2NlPslm+ih1QcDmUzVXg/VQAgOqLaw91pnV5JIYN8o8mNUwY9UkFbRbK6nTiFYAJ5CXnNu5ffPwm3aef/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I10lW8cLqbOYmvj4TOwqEkTm9LGK3e+HON4IPUhPS8=;
 b=E6CJja4JaNgJxkHLJkulSSYsNLHLDDqo5wF3HDH8Z2VAP4EI92qpUUC2mfXSGJde73VoBH8bUautn6Z16/OFBpyfEoPVRsspFFZoL94CpjbFLxOHffgRhP0r++Xo1fzpkaIq7pA1o4FeuHZBFRriIZHITkstQcTee5MKb6czrGOW7lTuq41PsRmsDmysJzHJ87EzEj+Qad+r+b4Z1i7XcNnTVN9v1cnM/C1hwUwDDJwc5w+p0C/i5/qzvll5zebEKv5ZLRSeO2nA4fp4X1i7hBXMZKt4YVBOYkk0jz0q4pZGAQyoRqzaONmXzcJZeWacFtCJHkGlAir2u4KoDas57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I10lW8cLqbOYmvj4TOwqEkTm9LGK3e+HON4IPUhPS8=;
 b=uag6UeYu2IoUGGhXeHqMgnj2A4xXsVPypOfEjHD1yq68C34LHqaj+0aceyduUYP7+fAHzUaE6P1GqG1hhNNFfWxfjSegwt4HW7Y9qTOfVw4uGn5HNArM8275K3CrX/f2KAqtNaYgaOE0vv4X+3OddJxqoIrH1MECsVBxZyvjTZY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 11:14:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 11:14:27 +0000
Date: Thu, 18 Nov 2021 14:14:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Emma Anholt <emma@anholt.net>
Subject: [PATCH] drm/vc4: fix error code in vc4_create_object()
Message-ID: <20211118111416.GC1147@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0059.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0059.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 11:14:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7fa5c59-bcb7-44f7-ad83-08d9aa84957e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1247FBDF511B03E5DEE18AC98E9B9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6km0LcnuQlguFVnFPXNYzFeGn2DT/YdfKRk0MNAaoM4XiVsX4MUMTYE0CMQgwviAY3aN+Ah0OthxcsHljP1qyiOtG/vA78k1HoZChZSC0yhxVMRxkDiJCzA0UDTA0UxuOhg0ixXiCgTBM9WaTSTG2QWUxNQBsHzOvh1UupRq/rLJUhF1mmyoR3djMk7GkL82HhlYu4t19wqv+i0E2iTdlbJbxiE8K0u528842BlijIB8bX3LJ4edhKLJqrrSwHD4yqCJ49I+eVEqSVY1RQY7EflYFQXzWUlHq1zRwpvnPalcQXfuidpT1rKn90XMI776na7LUkbAO/4dGfM+VQuE3rh64h12+ml58wy1cxi1g4kI3JgvJjIPEAXqPHCFQB0rHc5bsfgTLoT4XXv+0d0aqm+DUa125UUzddhpZswqIJpIFPLB9Zx0dpzt5RBvSnSAWM8He7ngDMXRbk8/DDRDhmcl5xPQbzpGTJC7M7N7EVyjTecFpbmeh1mpXS9AlxqB3SeQe+WV7/af/ZT/r2I1UUaMDPImMDWaP3HbNNH/Nu1EeFDNWV7kP3yujbJZW23OG/98WGCAZW83SOJ+7XBEql1OjxqFr47ZmUYTio6jri910rqY4hbHnTb31hdxTJ/ud6vYsv8zEjA266FmQDER/u9LMivi7DpS0YdMVPHojzKIS3YCh/YwU6ieaOc1ccg2wZKauYmGag3Tu8OQ/m+39g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(186003)(956004)(38100700002)(33716001)(6916009)(8936002)(508600001)(9576002)(52116002)(55016002)(54906003)(4326008)(8676002)(2906002)(66946007)(66476007)(6496006)(33656002)(6666004)(316002)(44832011)(4744005)(9686003)(5660300002)(26005)(66556008)(86362001)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4PdbHAWtyeiKrzOMr/oMEdFnCJVo/GFP47lb6FCVv8CkLG7Q7owPjvc38Uw?=
 =?us-ascii?Q?Z2XyShgTBXE6UJ35fmqo+ZvliReQAjUhV1DPfxY8RxEf7+/rSCFjbhg4h/Sn?=
 =?us-ascii?Q?orpv5Z/OgoCxTVhwDQjPbcGxaNCaAGFQQkRiU1TFrtmhYPCbwFMmQtiO7wJa?=
 =?us-ascii?Q?HxHfCfQmTYhmnM3Y+EyKH1C2Y/ekuvzMigEqDa9Eg+rglZKhmeLlDjfH3tMe?=
 =?us-ascii?Q?c6h6wxr3L+SL3lULf/bcZkBLbvYfHjHgYaFlA8yTrc8+cjLNR1W3DSEhIlji?=
 =?us-ascii?Q?g8mt/1IZTFLeTR4Kp5FoW2I+pJkHEc1Tq9tj52Kru5gBhISmpdwdQ1U5ZwY7?=
 =?us-ascii?Q?MXXIYPLWpZwxHqH/x7f/GExub4lPHQ8jX2VCskJZ0RIMylH5pYItMR6k6wHY?=
 =?us-ascii?Q?u2EB+/Xh97+cim5+xvFw8gxncrw7PiwJfjlXkiT/4S03YpVtwqqVN7eQclOT?=
 =?us-ascii?Q?6xyd8kZZBIxQwH9kQRoBUNRU82yrCGpZcjw6uNMnnI21hkZzth/OT/FW2Hre?=
 =?us-ascii?Q?2vStb+pPEf81AgWuin7NPpzLup/yYPBcXwksH5vHMdzMARROfSMixZqCd6sP?=
 =?us-ascii?Q?PzCl2cBbvfAAoy4JhzcNXrosBbugsqpzN+hFTt3x56+r4/IrGwEBKlCulX24?=
 =?us-ascii?Q?k+Oiue38EWdg4kVA/g36qwU48wE9ajg0UGm+Bfh6iAVOmjrFSpWXR0VPJ/q7?=
 =?us-ascii?Q?dEfWfMorNDuiAGOVLGUgaxApzfB8E1IwlJZQ9gA+Sh1basisHBo7IX3uxpuJ?=
 =?us-ascii?Q?4C2ZjQnZWbjxm0qCSj3BHC5orPe1YGqGUK1ga+DAFctN/3JZcR+Iqhfy/2nX?=
 =?us-ascii?Q?rabidpbCRIm7s1FnDY2V7sy1hC+SlRN4Mp3aO/qVi2foR6Ry9CBHGxEvD/Xs?=
 =?us-ascii?Q?izJOnj7jh1St5NxDqAitsiTMShygL9CBUM2nVrFaisyz2OnKkSdqmATZsFUQ?=
 =?us-ascii?Q?0b0Tym92eBJxn9Fub5jMjo8j3uUvwLGCQ/LnvmpDCNNH+QM2ZZJm/PaFJTSk?=
 =?us-ascii?Q?daspe7xOheO6XDLuI6/Jck8EIRPosg3p8q/JsxO6hIinUUANVJbbmULEkFa3?=
 =?us-ascii?Q?kgWRi05Q9QdweubOiHQYg2qO9eFeDDsGTKZJvAcmsgKiUzQqY8QWMcfWcxWx?=
 =?us-ascii?Q?T+IRPx+TnjjivOe/qnS8Ji71O928SBMd4XMOClJH/0/RpDexGnAb2hSTNFjo?=
 =?us-ascii?Q?LuGrhcC7wO7a8TSKjo+XnX+dY0veD/e7xBJJX9YG8KKiCPW8mrDY5JDGAEYS?=
 =?us-ascii?Q?yepD6b5jIGyDZA3xuca+WdKlmtuGAVQPgk4puAEK+hVcgfYDQbEwwFwAdxk/?=
 =?us-ascii?Q?2bzBaxfzIxpN0pTcjpH7ADRIhkYS6bI8D6DJ06npa1Pr2gDBZvhuezZnySxu?=
 =?us-ascii?Q?iKtzDF/0jSwV7xL7rZv1R523dshMLZhBYcaMBsxwnOgtxDBsDumnWvWriQMT?=
 =?us-ascii?Q?kdgKjXRJKkDsIcD0eTTZmz2QM+g6+hsN9TDGdaGSsSfnUhKfNAFByDWO+Zmg?=
 =?us-ascii?Q?eBrh0Kuq/vxEHl0BxARAV9z6vG8pWH97gI2ZWSKdlyEZXRjU9aWkGuBMdpv+?=
 =?us-ascii?Q?VKwVcNbIz2NtqHhH+6pgHlkREqr4xj3+RAg6TF7UtRO4zX8dZi60fN4Z1D5G?=
 =?us-ascii?Q?SRoy1ySDL2QbvYtRiuqvYOvtu5mnU+dNdwTZ+wG+dkd/PhvPOyK1NaLKdaZJ?=
 =?us-ascii?Q?oSa3kFoFQyoxWh8bdhXyUkTgdVQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fa5c59-bcb7-44f7-ad83-08d9aa84957e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:14:27.1317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN5HExALh96v4atLyQrNEgMahoM88gWcnuKXSR7t6+h66PaVXNmHGYikO3KdLd+CLUt00f0B0qev+NO9WKBtAWgg2+lXT64Xuu1mjER5Xo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180066
X-Proofpoint-GUID: Vtg1HJAPRDEYUeLmZlF1jtCZrOPVHwN6
X-Proofpoint-ORIG-GUID: Vtg1HJAPRDEYUeLmZlF1jtCZrOPVHwN6
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ->gem_create_object() functions are supposed to return NULL if there
is an error.  None of the callers expect error pointers so returing one
will lead to an Oops.  See drm_gem_vram_create(), for example.

Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index fddaeb0b09c1..f642bd6e71ff 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -391,7 +391,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
-- 
2.20.1

