Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4541ED78
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE446E49F;
	Fri,  1 Oct 2021 12:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301526E49F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 12:31:29 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BcZT9019576; 
 Fri, 1 Oct 2021 12:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=SuNxNLlxLZrFZi28a23upqhyC9BLgv14tA2weF6MfdQ=;
 b=jjPKl0t+q6WExE4+o43Kg+giBtJmSOY8+AOCwKnNdBSW+r0qL5Yz058ToCyBASOXUGOw
 cWNJG/DyB6bYOF3/OcmTvb14u9S1k80G/LNS6y1cORJM1LGLlI6TW3GHIvZmeJR7q8H2
 mCuyrcDBpUsE7TmN27ASQisUrpu68uxM24pSc5OGh0fn23M/mDBgcHtA2i0VVF3uIFo8
 dR18YIFJt8MNQ7GILX8EhyIknwbc7g1giY6sFtGw+8BbTfOzyTsU5l9qwBzDPWCuNrgn
 DV703e3ovcx16RZbBAbVMTaKyzp46FV6ji5KfV8OKb7Dw37w1ijQ9eUsBZeIKuSWLm+P 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bde3cfbyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:31:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CVIYn120691;
 Fri, 1 Oct 2021 12:31:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3bd5wcky8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMyYFWzzRjiAJvwYdr1f1znXt7hmvRfAtLDMp5f8sTDXp7Jlf62VdoV/qmuA4FREPb9uMaV+aJ6HmHZ8UVaVNMKdjlefCT+z22XFcZwt8byCwcOS7Kh/Jze7mY/miLH6WLF2oiY9qmJXCJteFbrQzWqlzyCa4nzpQn1HSfpaXrgu5mSYyWiLPh9q5DIfQQmmOPnoki5c3D48CG/1zO8n2w2yBAHfJMkPV7rXyK/pghsbFdwQDLexBTx4SNnHpokSKt+mhnFGoBjbFyxYwE1l6Z9P7Zuf6HdKa6KTbKZF7Zp7vdrsN/BfJfH8QnRvIUwRtdY8zeffoTgWn1hHgYZOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuNxNLlxLZrFZi28a23upqhyC9BLgv14tA2weF6MfdQ=;
 b=jwXUl9hQLJLQEs+B7VA7W7K9N54Kb439srtJPYfR8alE+1L+BVsICIWTiBGmwrVhO7bX/GbEvFAWhaZ+RVs0dScXTu/1RArlKmM/HUlQ8P+gImDzdWbO+IZX/0VpD9o9D7AW6vDx7DD5yfiSeNnkJq96SYht25IQei2VNvGcC3bx+5zyOka/6/W5sTq/lfbpGlgPZarVQGsc1qRlFMGUFQNmHRqNEsAa6PTcTLPmRCANyi2augihvbetCV7SXAQoUJLDkoiBAI/2RBXsHBvE9mWZQnBL8JwHr5UVvYrn7X1LzmmheUGYBCYyWU7+qGxcSYsM/vWs/UiEL9XsznCJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuNxNLlxLZrFZi28a23upqhyC9BLgv14tA2weF6MfdQ=;
 b=sbQ0YzGqoXNenxDc6GIPhHSlejKgfYdJ9FqzS50XY1CG81yBoVWS6B7l2WhDUhroCGRJ0IViQHF/6uH9c/YRwmnPW6wJMU4LJAf8i3yCXnZNPPyBNbEPcYwD1hgxvZ4XpW5rwTWugdx59NezpxjTZQLoHOQNj6U7tKfGgQorX+k=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5425.namprd10.prod.outlook.com
 (2603:10b6:5:35f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 12:31:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:31:24 +0000
Date: Fri, 1 Oct 2021 15:31:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: seanpaul@chromium.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Message-ID: <20211001123115.GE2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 12:31:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a2487f-2d9d-4610-371a-08d984d761d2
X-MS-TrafficTypeDiagnostic: CO6PR10MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5425015A49D828C89AFCE3D18EAB9@CO6PR10MB5425.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IawfFQ4zzvq6tHzJD0hbyybmkId6leU96AlmvKXTw5QwsqTO2vGVi8gYEhTrlJme+W14KpdpJ/whR7J7eRFgBH1ofDrarNUl2dpW1saUrMzO0DQDc0AQ9kE2QGac7nfs/5+j8HMLWpfdUl+rhU6LpxVRzFJrd3+CTZ6c1BmxH4bV5IDPwHHZGs7ZTYLvfA1GYsiO3YbOMI4gk4IBrmbt61n1AVgA04lOpzp/k4ItQIIN3PlzM6SU43L6bSr9pS1I44kCp+jZhUZr4MhgwRPeLt1ejpW86LOyxohoPaY5RmgNCHgZzk3lRr0lZdY9UqeoOf43hx4rDenk6J216l3h9uuXJX0UrbwdVBS0mgWRaHf5zuSSDi8paAIqHzUMTcltb36PGHlVRdvlSliGf22pDHcIRYX94JKyJFR2V89tVqJweE0LOMXNnEuTXrNMvvTuELKD4WunYQA34Zc5b7in3gJqWFNHYP/53iOd6GvJNimv3M/BXpXOPd9k09h9bnT7PfsPe3Rg5txHSxzibvzPWE2+qMcy5K61ylcNyWsLXis0FVcXqw5EPO6lWPFlHI6kgBV2l9C1Huop0zGMOhZXDB7JpX7E4C13zHqaBFDoxW4RPbixD0FXXW86ogUxTvazu+gbclDTuCbMimtj3yhqM/FnNWKd+kU0c8iR0CvSLYxXa8GfiNj2i2QkK4ESGyt/Ue9fTcglgrlwpCSRQqBvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(9576002)(508600001)(9686003)(66556008)(66476007)(55016002)(6496006)(316002)(52116002)(956004)(26005)(33656002)(4744005)(44832011)(5660300002)(2906002)(186003)(66946007)(33716001)(8936002)(83380400001)(1076003)(8676002)(6916009)(4326008)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FeDF2mm9LJQOgy8cuUku8Ez8RZeCGWcvDWDeIkvYydRIDdXzH+CdSPH55qrz?=
 =?us-ascii?Q?CrCS4RLoLHSAoVo2+D3nPtjNFXC7yGvT7x2CuZVFBo+vaFKiaVofUErVwl9w?=
 =?us-ascii?Q?z0P7Ngr2j69FR/FsnmcslLteAgH2scAZ8IhdNbqsjIQJWptga5HaE+oGEnNQ?=
 =?us-ascii?Q?Dw8TuEF2435zgweTFG/TGm+ROAFqdbTe5xqzWFkbqwowV7i0C8P+dLZdwyFU?=
 =?us-ascii?Q?kZQcEeLOyvLVeDEi5z5x3yry6vKOHJm3o9OJ/pel6gLjTZLZxeYRt73NmNyY?=
 =?us-ascii?Q?KDQ9Fbxzgo3072Bra2ce6x6oFOhFRlI0oTwi2YNyklD2X+RIT80hEK0LXldH?=
 =?us-ascii?Q?QXp03NB9zC3GRpgxj8l7tpnXViDA6jGrD2pEzMsWceuCs6jwmxKGyHbXiWWz?=
 =?us-ascii?Q?hR3wjzlTm/YWJbBn1xmxO8A/QVH95z8XDFJ2JHRDEmlQu4gtk60twAcIa6Nb?=
 =?us-ascii?Q?cZO0ztpXJvLDPFD7tCGxNOrpMAAEogzU4fhgJc++tGFR2Un6K9HHTLjOq/bx?=
 =?us-ascii?Q?zwR0orKtSA+B+MIlT3G3HZLnPEz9uZ/bUJw0EZaF9Pk+AHGypJ5OPhDpQXbF?=
 =?us-ascii?Q?i5JogqYmGrrw1d0yIRe45SWCgfS7U33cm3bYqvoWkDJpLz3ZOzEPBCiy+2I5?=
 =?us-ascii?Q?Xe+ve05ZHb2sMP6L/wt1oJYkyBzrRWRCjoI2UftUVlqp2/vNaN6z0gLsKBJ3?=
 =?us-ascii?Q?AfPwijq00hNSBWWLlhbC2NNDnrNmvrtmjCJS/T2ClH8JTYvFEIqHwAm22Rgu?=
 =?us-ascii?Q?wNEUd4rxBxBm661fOn6EB56nYQilSWYd14cpPpqnhYZDEsQHjMgA3eIXY7oh?=
 =?us-ascii?Q?F+8LD+y87b0qjwfQfLrY7jfgTEiWpoh3j6wF4ReFo+o8FcwgxrsQ420MTOnS?=
 =?us-ascii?Q?jAetqAiIPHt4xbO1anhvkv7ddCuwzfzJ8DBgYIy+KDNe+Ku48hAHO6WABpwI?=
 =?us-ascii?Q?s3TQyMPT0czcufeI7sHfNpM86rr9XNZFJ+oZvuhqJuno75Ftff+k9l62cGJ5?=
 =?us-ascii?Q?GenjfNKZkU8ZXFwE/wGDrQUvSZQqqGk82oxO1H9ad8MLoXNPJepGPvh3CSUq?=
 =?us-ascii?Q?0VdMlyyrgk15pozd8/NOmViV+0NbVgYW6y9oLxdC3KQxcsdaOGAFdGYuH7F3?=
 =?us-ascii?Q?0OUlM+uBgyH8ZVMhp3luB6Ok5DRoG6FjCbXb0Bg7pJAd39yh/rnyUBYHwGAx?=
 =?us-ascii?Q?MI6r26044wrdAacy48CKA00B2BvVABsA+5O0GNpbueHs9J1f2QMGDB7hU0AR?=
 =?us-ascii?Q?HaAjeKzgKuQZ9PeoGch6Zvfc4c59xRB2ZiCG+M7EchqybEz3dCTp0EcS8Aai?=
 =?us-ascii?Q?4QwIaB1qbVrcNYcs9YC9JzWk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a2487f-2d9d-4610-371a-08d984d761d2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:31:24.4696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTO53ej1vT2XMoAB2TC2LfSowoeFo/cP6awPpcHKey8eBTrKyu9K6osXHGMeNojoc1AfXRu9GoUbBxZVq5z6THqP8ivTD1o6jPGjs5mQs+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5425
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=754 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010082
X-Proofpoint-GUID: _elLPb5DNzzzi40JDU59j0Qi9redZVs5
X-Proofpoint-ORIG-GUID: _elLPb5DNzzzi40JDU59j0Qi9redZVs5
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

Hello Sean Paul,

The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
well" from Jul 25, 2018, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
	warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')

drivers/gpu/drm/msm/dsi/dsi_host.c
    721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
    722 {
    723         if (!msm_host->mode) {
    724                 pr_err("%s: mode not set\n", __func__);
    725                 return -EINVAL;
    726         }
    727 
    728         dsi_calc_pclk(msm_host, is_bonded_dsi);
--> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
                ^^^^^^^^^^^^^^^^^^^^^^
I don't know why Smatch is suddenly warning about ancient msm code, but
clock rates should be unsigned long.  (I don't remember why).

    730         return 0;
    731 }

regards,
dan carpenter
