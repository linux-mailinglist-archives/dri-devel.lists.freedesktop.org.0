Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E423D8910
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DD86E169;
	Wed, 28 Jul 2021 07:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BA66E169
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:47:10 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16S7kdWW024144; Wed, 28 Jul 2021 07:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=YaQ9q29aMD1mtanWm6j1+j0nSCyMbsXjpuDJMJuUzD8=;
 b=ilgKfl4S7yopLRZfgvTzPOig9j69LKQemtj8saISKeCA10bMfaTFA2NKb9ouRYXchiDB
 CN7wPnn3PEK1a6bI6j+XS1qU2T7lQUYh1X9T+n+DYwzVpPQ8PZua5xFWAAbz47qu7yso
 6ZGFsIIqweUCdoIavx+bKoxhOLAGa2aJp75XtT+RvzynH7f4vvDvJwonJJ+e5EEgEi1Y
 aeUx6C2nSfsE4Z9PpFBlFhB29daUuk6rVQNQFYcgNVVpDo1p5JESViZw21Dh1J63a9WB
 j6ZrBN96p1zvbFYbNSFd8hCkCbKW14wuY6d/RWwa3bT+cexdbTrCtImNeAFidHnvVZhK Kg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=YaQ9q29aMD1mtanWm6j1+j0nSCyMbsXjpuDJMJuUzD8=;
 b=q2T1sVlF8uXjtrE794w6VetGEs1LFrwfuHv3ZKe3O0tKPGVHOcQMKIn2PTzIKLftD5gQ
 FMApqBoCsRH0JluTc2E1daPFRroJz2kGOnOYQ7EkcQTdspIPE1x3ZeVDuo69KbgTELzA
 dl1no726ZG4uJKwxDzGrWx8LnhwZQm8wXSoRBu/JXKnjxkxGx+qKMeLo+F2WOeugSJuz
 VF03Rlun8XeirpYRpmzyV0pKiTJfU5jDYbWM2VxjiFoEvKJNFTRYnacXuXgouRtnFYaW
 0Tn9G5BWLv2NZ7/7K+JnHJEplDcJcfTplwZw3WDmm2rOopu9BIGZM7I+I74n20jhVnCN eA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2jkfa0yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 07:47:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16S7jVfi192935;
 Wed, 28 Jul 2021 07:47:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3a2349nsbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 07:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfqKTj7PIzGtZ0A7rV8llHPHGjrEX6AcsuJdC8cz3uZ3813Qsph9/ZyPqi0n8sVnV2uDiCpGTJPI1BuSOzTdPiVfMuLYCFAptqoon2eTLCY2y++tI0uTBdOBd4Sk7MWuMIDb+jlQdMXfAhpSkitp9N80hgv2MSNQn9mrO8DxkmacRw9ODHR9Wlv3ObT4mOAdU7P6Q7J3R3bMDbEV47Rw1w6v6UZLVL2mG58URygg1PSxkMR4d0dYoG/2qjq/7YVJ9YmDnZDDiuL5fmQBJTIq5PGbD4UAJMmulj9Lqw4sjrT62M9RSNyI5qxp+JJeeEhs4jDtKdYKwxibMNI/7Zc9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaQ9q29aMD1mtanWm6j1+j0nSCyMbsXjpuDJMJuUzD8=;
 b=Qd1uEIYBkZhPAobsQ6UxTZcEE+Hf+MioCYJNKSK19kF+spE0pfpFHtZFoPdIY1HB+sXY+9q0/JHHaAfXTrSZXPodPuI6IUZgTMb/STapWRncsugFv1uSo70z8V+/XYlBAMe4U/2uKZASLbxx6iHadAfUNwhO1jncDwPlvxbB/tlArFVqz5tgK6gU9DDrzln7MifIyZ7T0hi7C3I2MrOj6foPzKs6YYaRasJ9G+WQV7JwX+ArxdlXrmmYU5mvXUX1lcJ3G5JC2uKfCd/wnEAhX76c5cNa6LeXzTaahh/AUd8IMWnT3s5myF6E3oO2MUEYDww2j6gs8tByYCem6tf7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaQ9q29aMD1mtanWm6j1+j0nSCyMbsXjpuDJMJuUzD8=;
 b=ENg1Xxl4aJn2OJn6SzPiQQthJVKDKGmSeTAUJKBd33RBR0oz6htV5t119QwdTeK7gQn7d7tPFD2MVJoAolf44PGj/tl9WGJUgPIogVcrrxU0rpg8NfUFXocZnTHUTfvGiafU5mnHoNB1TEhG9bcHFPMpfIq9uFA8NWIwePEcjlw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4721.namprd10.prod.outlook.com
 (2603:10b6:303:9b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Wed, 28 Jul
 2021 07:47:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 07:47:06 +0000
Date: Wed, 28 Jul 2021 10:46:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
Message-ID: <20210728074648.GS25548@kadam>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JN2P275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 07:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e4c487-e636-4734-644d-08d9519be55c
X-MS-TrafficTypeDiagnostic: CO1PR10MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB47212568255D6ED194F5D9928EEA9@CO1PR10MB4721.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ywk1HuH9GM7RZV1pr/Ds9V+HM/SJyUfV2kQjglDolDqdhRNM+0N1V7xh98J9yUsAC2PYlHFqmtaSJiVCqLHlGHxgOV9fPVsxe8rMcW9osuGc0AS7F9LuIwcYv3iqA01h52U3b/RZHUU/FznPjAzbjcnkXzxrvkJ+hIdS9+3f4i8UMNuR4ybpOK7bGxASKMPzR77tZ/UHLsjoj8dpEh9R8xCOFkxc1a9yY4ntMr41jLhq3SaremQbUho7MUeGx2wsxpu/PfAWwH99SID+H5yS8ghQ4BzaAUAfgf1GshYbuqUo9zVwM3WyPpdhtke81ZNlsnWU9zo4GpmmDvepPzssfoeyt23rS0xM/6ZlZ7LttMZlt/Z9dt1Lq8T5bawyJwh1fMjj4QjD3A/W43Yd6CVJZWegHSPOeDeXGTPGEFl11+UF/ccoDspL4cAKO/rLSK7b4nbU9c3pKpLumaIMgjXRxQrKzf61tjW24zaa5ej1JRkbJFNj3J5RBQopG0jnm4ai+tYWqNswt1oThx07tMEnDG+rlvHShUSHHUqXw9NYCDXo9srEIGiQY2k5VJ6aRjeIjozGiyQPQ8GzFdKe72nm4Q2AJVYONDpc4nl1o6Tg8dWjfvDBzaGTfurPBWoUKPnDa9z0l8lRvt5E01oQ6DfsTxooy0MyWsmGIC0jBmLgeME9WVfez75KUffjBokzOuIYTHQrEioKjn1z/6WtttXU+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(136003)(346002)(86362001)(38350700002)(4326008)(38100700002)(9576002)(2906002)(8936002)(956004)(44832011)(6496006)(52116002)(83380400001)(5660300002)(6916009)(33656002)(316002)(186003)(26005)(6666004)(1076003)(478600001)(66476007)(66556008)(55016002)(66946007)(9686003)(33716001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s09mAZLNSjOge1CSf3zrkTXnuGtLRF9Tk8yH0WAdOmKoamDGIUXVLaThzwo3?=
 =?us-ascii?Q?4TE5GL2WrJMO5Lo3ZxatuoY0bwQm+lb6rpWPMZ1748MIeDVN0WMwzi/7UV7W?=
 =?us-ascii?Q?QeNu1xHezZe2pW0ikJFj7rPE3aYGgdn2AZU8DafzlAFOtXMszM4WwTwNbvCQ?=
 =?us-ascii?Q?oCso5wwhuuvlYaTNWSWeoOBHEBiDGt+szWdymN1ZH78yHEcqwL+8uuoVhqPq?=
 =?us-ascii?Q?9Fd2hyT6uonOvTukisYc457/BkfU0aSa3vRBC4gjh5HbIUW087kjnPHWp+6E?=
 =?us-ascii?Q?2S+gCa/joA4fB+DTKncv8gsUPUOIEtL0kuyWLQChF6pZB+XnbWyifo1fFe4G?=
 =?us-ascii?Q?Nev0VgsaORor2UMY9ogKvsfBaEqED/v6B1ozQmP335MdvevGVviwmGSC98Yn?=
 =?us-ascii?Q?TtNLCSX44WZO4zC1y0OHJoQnkMw2yOw6bPJUaH2Frgg0lMkSBdFIUar7gcD4?=
 =?us-ascii?Q?L0SrLPKD1GMy+PRle9yeNFXpdmTY3vnjKMGWXX86bMIrk0Urudp9bnchxaTQ?=
 =?us-ascii?Q?s56jkWb27H3aNN0xkUvEmL+HCpg9bkERm4b14R9Beal/a0CI4CCHy4urHYtq?=
 =?us-ascii?Q?1Lo8cUiMdSSARf6M3rRPRnCY3ga01lA+mL0FTHBiYAJVvcHLO0jXLKSOwC91?=
 =?us-ascii?Q?yjLKEHKj2TeaQn8bo0Y89Ouf8jX/b5NnO7GgmTO6qJJKKVEFct8BIyoQwANR?=
 =?us-ascii?Q?8kmOXO6SxcWFa9nRKK1Hh50R1l8Y6ixOIj20n5IjfTy02dW6DikgcwR+gCmW?=
 =?us-ascii?Q?PZ2OOHdduJB5CiiuFbl8sO8oq2pBuZ2GSVS77Vw4m899C1dfsaBj9be3CrXB?=
 =?us-ascii?Q?ywksGHuJRlNWRThW5XL4Jdbaf/71BlJpTnNwYMe8FiDzBtQxvM9cfsd4PNQr?=
 =?us-ascii?Q?4DMGLhoMoF8/VWQFxr+LUqkhiDYnegkiVreN+RPw9cy2LY2iLicC/zjvYYOm?=
 =?us-ascii?Q?O/7WRymwJg9aws398yhPovcOJwo3VshFUA9beKUwNSLC9WueEWwgoAIBIAAr?=
 =?us-ascii?Q?QU2+bSHKCNFwBTgw9MIMdd3XkqzUKUZL4VDFNvjsFIZNkQv/ksHlDppqNObW?=
 =?us-ascii?Q?uYgTIUsOu7S4rB9y8QtasA4YCdk8UTEBiGW2Vz2M9CcH94XH2pQ186ZDNcrc?=
 =?us-ascii?Q?yGtBzA2lQxhiyPZYKpNFF6HDcmoyP+mCTVExJBoSCHDNawZbXmE8zYIUmMjw?=
 =?us-ascii?Q?RJ/viuwXWcI43vVzGzczQefqbRc8Y1VgdXmtj4xRPe8xZhrPJVhkWCUOTVqz?=
 =?us-ascii?Q?Uvl43I4WR0YY+HBf25cduXlXDbhpJr7r+EgijlMf+Iz1RQZRvGqe8UVe+Vek?=
 =?us-ascii?Q?UTAmz+xn+H5q+WeQ6BfTYjAM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e4c487-e636-4734-644d-08d9519be55c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 07:47:06.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6vcZB+xXRvmlekbXsQwJDPDEgwyTysIaNxYXNPiVEpAj4j8vE9leFaton+dq9kichfnf4/EniCFHIwfJ9+gzluHJwR/Kz2wvmVz2fEy+NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10058
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280043
X-Proofpoint-GUID: QQoDE3zLe1Ki4WzB63g8Yv1siHTgJH1P
X-Proofpoint-ORIG-GUID: QQoDE3zLe1Ki4WzB63g8Yv1siHTgJH1P
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 05:31:24PM -0700, Anitha Chrisanthus wrote:
> If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> This can potentially result in kernel panic when kmb_dsi_host_unregister is
> called.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 9 ++++++---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++----
>  drivers/gpu/drm/kmb/kmb_dsi.h | 3 ++-
>  3 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index bb7eca9e13ae..12f35c43d838 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -454,8 +454,9 @@ static int kmb_remove(struct platform_device *pdev)
>  	dev_set_drvdata(dev, NULL);
>  
>  	/* Unregister DSI host */
> -	kmb_dsi_host_unregister(kmb->kmb_dsi);
> +	kmb_dsi_host_unregister();
>  	drm_atomic_helper_shutdown(drm);
> +	drm_dev_put(drm);
>  	return 0;
>  }
>  
> @@ -519,7 +520,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (IS_ERR(kmb->kmb_dsi)) {
>  		drm_err(&kmb->drm, "failed to initialize DSI\n");
>  		ret = PTR_ERR(kmb->kmb_dsi);
> -		goto err_free1;
> +		goto err_free2;

Don't use numberred labels.  The label names should say what the goto
does just like a function name says what calling the function does.
The existing label names in this function mostly use "Come From" label
style which is not useful either.

When you're writing probe function keep track in your head of the most
recent successful allocation and then when an error occurs that's what
you have to free.

	a = alloc();
	if (!a)
		return;  <-- nothing to free

	b = alloc();
	if (!b)
		goto free_a;  <-- good name.  a is the most recent.

	c = alloc();
	if (!c)
		goto free_b;

	return 0;

free_b:
	free(b);
free_a:
	free(a);

Then copy and past the error handling and add a free(c) to create the
release function:

void release(struct foo *p)
{
	free(c);
	free(b);
	free(a);

}

regards,
dan carpenter

