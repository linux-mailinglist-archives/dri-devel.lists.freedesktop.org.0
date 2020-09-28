Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD027ABEA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 12:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853E89C13;
	Mon, 28 Sep 2020 10:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4491C89C13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMTvNQrW/DlFKrgsgTJdxDiIRpQMegaGegAn+zxm+pJyf4cgPGD+WOaGVfxLW+xHg3WuABWeyYIy265JBJyNFrfCbGRDVY2FWj+SxvFLy4brCnMZW3myUx89sF2OPEHBSmgi+MaO3lbMcOKIHfPmFFUJQwZcOj8fvxjbk5VYIELBr9VJwP9ynfQhS4ZY+YjNOoSHJ4VSUePlWrHL/+pQ9Oiv8HEfLj3eegH5cpDWiGeH7TRGCNgJWVYqb9Eji6/iPEEd/+qy1HalqcZgdoxSpm+6pAJufWAgP8TfcJBS2v8ckt6Sf6ZxE2N+9v63LaOM4HKrGxVIJpGpkx+HYTxltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrSly3puDlzDvL4VXOgN5Em+aIyhljJrVW1b+SG+WBU=;
 b=Dj+Y6dk5kz0Qoi8rb0Tq2kAzIy2MadLz58ac4So0cLaMjx2Mo8BI1sbn1twA8SxEI/KWkFJAKNQJ6akz/Py+8YcZbWdaRJxdmXAZ1rVf2FT8+4PYQPwIc5yJ+FSvrkywgq9lsmLkdoJm5rX4fb7klOw70DDSq08Gm9mS3GSUIDLD9K6dXLctWY+fFzQcC6PSAARsyZpIsXBKC4KCUWLCPbf06VUrCg+dKBMq6YjIodlBqLqj7oyxQr8aWf9UBmo71UMaHvp++GFOTmgS/0iUrPHTQ9K0noAcDxR4QZtFs+H6t03EOzt3tHUlcOHtwamuhvb1V14nikyGsdf7HzZNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrSly3puDlzDvL4VXOgN5Em+aIyhljJrVW1b+SG+WBU=;
 b=WnYOEWtDi/W+fRp6EVD9NPlQ1+vF6YjBVOr3YZl1tlPYOHlLzpnee8f1Y7vxbrFxCpAv0WU3tAVpEHG2mWm0j7w31vLp1B6F+AaDOmk8WM9OZg3H+//xl29xnbYz1V4CrBl8tNSQFoEr91mVzIiuqkDhOBY2qHjcCak335v/S7Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 10:36:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 10:36:55 +0000
Subject: Re: [PATCH] drm: prime: Potential Oops in drm_gem_map_dma_buf()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20200928090726.GB377727@mwanda>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a8ef41fa-9864-6159-5748-98d286ab22a9@amd.com>
Date: Mon, 28 Sep 2020 12:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200928090726.GB377727@mwanda>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:208:d2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Mon, 28 Sep 2020 10:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9592596b-56c7-4e20-721d-08d8639a6b1d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB443887C7E82FABBE6E651A1083350@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZOC2CHAkytiYdFqrdiaBwtb24I/TUPXFMxejxJvz9O+MvPwAop9msweTLusSwnk5xRxJhyHikthCuYmPHnmawC22ekwQbKgmcc8CwTfATl0oxICeT5Khpor9cnXShX4NK8HFUHRWyln4ZZxPEdnSYPbe1JsDjMSvwH0fqvhDU9eArjs14ZxLnoZJ1yLOMUgRh0X5t/+VOfRHw9xUvF1gO5cXvv6HSXmLiDA+ACi/4zs2EwX1nFhqG5drvE+3JrapmV3/TRdKpBtYhTCE7tFJaxW+N6NtiquObEntlaYqkJoIPRxfIqmOIhXC5zKRAm0nCGppvGXrZejg7buk6EO7jTiFzCXr2k3/Lz7GuFT7bPRjAyaTb1/PU1bEigyFJyxfQ0fdEdRK+rrtmEDMnyXG9KzM5t7DzY2laz1mcRaCrfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(2906002)(36756003)(2616005)(54906003)(8936002)(31686004)(6486002)(8676002)(110136005)(316002)(478600001)(6666004)(16526019)(186003)(31696002)(86362001)(5660300002)(66476007)(52116002)(4326008)(66946007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7kDvPcXLvo4WfYe8yg30bxL/t131EOQ425BTg273YVphamPvZy7nDslmuf3/Tx4JiEIbY5n2Iyp39Fx5skfcAIbFsQD3OvMMR7pUHXNeSsyqmnPfwZxVDyWG99B+SYC8TRIjaIQxlhKF14Df/haswB9/Z7j1oJTjoF4JTW3zf5Kgu1B+me2PZKZC4hfNiiqWAA86my7QPFE6gBx5s022oFwRxfXkzz28m2tVREyKHE0cK7gfYmXM3L5j9hH8N0I0jBZgmWJpAsR+kM1atY4aoubuwP9IM72o+i+lRsi37apYGZjaAJWCe5+i5TzHZXNHlp3Cmj+kpEPMAcnBKslc4Z1jcHXAToFCgSeU52KAKePaMOIgL1hwAEhNUI11DqFMTZ8KgZ1cWQBYdDGeP3XMu+tUQHJag3OZguhgLlHJhVVNjSlKAwl5K3V0YclxW7o/oKUc+Rhziz0vvRvap/TDXLq8TeffLivBIipAk8bBZdAWclESkKPe/dNsBeXped+EfykilzuiAV6DH9S243KkD/lC+KM7SLh5bPIcJ5fck6HH4hn7pMnc0SgUYKFsU5xE97hIOHz+2CgDzB++xMNdAJY0j13gi1IpBoEFgRiNUxbtZ65Xz1l+WK/dQ/uU2Eo6sqW8vFybHg4kR+VvNdI4wEMbWnWGAsJ7zGfHmIpyLkrABUqgU+3/Q1/KvQDj9/JUkQm0/SQXViprRiIrN+aQ5A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9592596b-56c7-4e20-721d-08d8639a6b1d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 10:36:54.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zQtrdlxtrFRM5D32y1o1JHlOHJUhEbnWGBIyMZvg9nfa3ip4XTxbGT0OZodRo1e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Am 28.09.20 um 11:07 schrieb Dan Carpenter:
> This code doesn't check if the call to ->get_sg_table() fails so it
> could dereference an error pointer and Oops.
>
> Fixes: c614d7e66c6a ("drm: remove prime sg_table caching")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

this patch is based on outdated code, please take a look at current 
drm-misc-next.

The gem_prime_get_sg_table callback was removed from the driver 
functions and the missing error check already fixed.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_prime.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 11fe9ff76fd5..1e2c7ff63f16 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -627,6 +627,9 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
>   	else
>   		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
>   
> +	if (IS_ERR(sgt))
> +		return sgt;
> +
>   	ret = dma_map_sgtable(attach->dev, sgt, dir,
>   			      DMA_ATTR_SKIP_CPU_SYNC);
>   	if (ret) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
