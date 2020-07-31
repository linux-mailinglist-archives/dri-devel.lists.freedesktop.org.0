Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79B234810
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 16:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D426EAD8;
	Fri, 31 Jul 2020 14:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED126EADB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwlZGjNqCeKr2v4mgeoXhuY0azgqhESLWEdYc4J81eg9v7oLGGwrOUIA396f8dK5FAVbjIDnzjWAykJ4ua6J32gG6/gmfZpVSLRiTsqM1ZGp+bhfJXPYXvYWMjVm5xMK7/TWiaWgvtqdO2dO5+i+ViA+yo0m/1/XsfR8qXtxCUm7+NbdbKP3k/ep1Q0GLT2A9domI2pCM7wF1/2jkQZfeNklqYQNvRsZTkKe2UzfelIC7IOQYjChSxgtOroU/+VW77e1TZwkNmkZo/ulSy4atuAFmhJV2fv+R2WLgtY12dpAcDeti+DnF3XOl+H/ls28jKFN8yMyWhWoY93ZnLTPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7STvWS3LSQMTKR3rir3CyrMSKXMqXyFyIrpdDM1/lus=;
 b=LEH4Ao8Aai9pV0wCCIUN9NHoP4K+0vLoP9K1Nf01yfkRgjeifVKSS5nOVEmxSJtDl9P+os6XZaOyU4BIXl4V9dNKnDwLDqzlwQ7hzEoNPfP1QbcQ4m7c7WFV5WfgK2o82N/4QIvh0BY3PjD07v3zSyFG3K6DC7xfJ8+8CuDIV+GliJiICoTKq6T2ATk9OmU/yq9eWh4VuxHA0D93V26WeI/PLFqmpF59vLFSlugPTQi7eQxaA4gqX4krHhg+3ulg2iWv+lJZQtSFGqo0NK2sSnffsO1IfV10prBC3a+G4WynZaYJ1KXyugnpLorouIqNnEzBSjDz8hNIPTfo/JcrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7STvWS3LSQMTKR3rir3CyrMSKXMqXyFyIrpdDM1/lus=;
 b=jPYHafGnD1DF+ysvYnqQGcXLgmTzx6Fwff+t/WIVCZEYPwE5fy13z5ZfruQ5uhJMs1skyi6AU19uQ0W3rd1qlyEmtS4vGnhCNwG5jCPbHRF+nQrBeKcFxGrHvG+y94mpLGGwuCUsGBhAarygZI12gfYZrc7XpwGyvjS9c1o3RQo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 14:57:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 14:57:12 +0000
Subject: Re: [PATCH 47/49] drm/ttm: drop list of memory managers from device.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-48-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <78e6327b-6b72-2ef2-f8b7-77e6515bca99@amd.com>
Date: Fri, 31 Jul 2020 16:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-48-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0099.eurprd05.prod.outlook.com
 (2603:10a6:207:1::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0099.eurprd05.prod.outlook.com (2603:10a6:207:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 14:57:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91e5bfb1-5ced-430e-d0cb-08d83562017f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3998B6C4A0A6C4B7137B4DD4834E0@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INXXe8JxSw4KV56M5JxJBFZYtMye1XP1w+/AVMakOAN3dS+akxeH6gr+uGyPcNOigAAp7IGVen3GlRHU93bQSJgjJSeTrxf7p1FhUDh1ND6pZCWBMQ9wwtFXUou3qUCaHRvWGnz5dwmk1JB3CwlY4OsjQh3rheuFV8BzrHgGR5iZMR3xm9t5UJ/GfjJ5qKWRjPE3dIai2O8Z3HxdyBhib3z5c+tWUCvRNNz3z/H2pFMgeP+8qCIEDXSmkPavBXgy62NaMSeazcgXhOHfLZlnZI8oX0gh20F7MnFWtaZG+FKV0263o88F77cNomKKv4IwMvqeE+Viu3HqSAKklcqFYIxZ5eUK0WG/0v1uWNgXe+6hy0k/PYxtbvm45Oskks3Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(478600001)(186003)(31696002)(16526019)(36756003)(316002)(52116002)(66946007)(66476007)(66556008)(86362001)(5660300002)(31686004)(8936002)(2906002)(6666004)(4326008)(2616005)(83380400001)(8676002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3DJ7mpv+88XkRj+LYYlTzOAO1l8/hcm2SBEhzB5wcGyZoi9nF1kNaUotXBCqYCwdJ1AxR4I3/sXavB5ZlvXMMZ7tN4m61sbxNqa6uduG+4jwHURFoYovVyk5kL1MPODD69K48kTJAl68hoS4QrhRY3sYvc8Nq2NCsIqrEzuYkfQ4KAsf/HEA851p9DdHRueoKkP3G5g/w3+icS22S76Y6DrOltxHIcTooRyJ7fkIevpNofznaYtXZz540GfIBaTzZehANT3Pg5VLo3VRyrZPMHOsj4imzK9Yg3Kzqrgu5YnXL0zUq1X3kMYvnjM2P1JrnK831Sjublc/ZncnA+/Ln1glfckNZVVSrpl/MWBqiBPelyQJs+s5qUS43NYib42vKaBG+Y97pBMzgbdugNAGF8TgYY7MoCuqFPDvBK2iVsGGBF816eOy7iQuYt2m7mzBM1jaD0jUyk78nOC23nNK8VB0BkkUyFcxfqauj+eHaqrHvmAQYQYLrvsW3ApG4sfT5t379Cppb6qo/YPiBzRO/xqEcCiNN3oizNsBP/uNeSPyRWp5xUuyfKCk03Uv9O9vYHd0nI1f+7lkeGS/xnJZJ3CF6124QT5eSBjmWLYnta5WmvOz/2hVtMJg72EtnvdySdzgq3EUSw6gPhLixduUdPHWZO8uxaqGj4qga2HGXpGEUBGIOUmw2nb/cjfTKJ2nrM1/xmr+j098JMBjwIMAbg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e5bfb1-5ced-430e-d0cb-08d83562017f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 14:57:12.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibQBu/HnGjzU+RkRvFje7j17oSWiTh0WVUyfkRjUACLxGCJ3Bf53LYawq/glWj6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 06:05 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> The driver now controls these, the core just controls the system
> memory one.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 2 --
>   include/drm/ttm/ttm_bo_driver.h | 6 ++++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f2b41c4d7d51..f35548ff17e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1608,8 +1608,6 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>   
>   	bdev->driver = driver;
>   
> -	memset(bdev->man_priv, 0, sizeof(bdev->man_priv));
> -
>   	ttm_bo_init_sysman(bdev);
>   
>   	bdev->vma_manager = vma_manager;
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index bfc549782775..b2ffeaed94e7 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -414,7 +414,7 @@ struct ttm_bo_device {
>   	/*
>   	 * access via ttm_manager_type.
>   	 */
> -	struct ttm_mem_type_manager man_priv[TTM_NUM_MEM_TYPES];
> +	struct ttm_mem_type_manager sysman; /* move to global */
>   	struct ttm_mem_type_manager *man_drv[TTM_NUM_MEM_TYPES];
>   	/*
>   	 * Protected by internal locks.
> @@ -446,9 +446,11 @@ struct ttm_bo_device {
>   static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
>   							    int mem_type)
>   {
> +	if (mem_type == TTM_PL_SYSTEM)
> +		return &bdev->sysman;
>   	if (bdev->man_drv[mem_type])
>   		return bdev->man_drv[mem_type];
> -	return &bdev->man_priv[mem_type];
> +	return NULL;

Could be simplified to "return bdev->man_drv[mem_type];" if we just 
assign bdev->man_drv[TTM_PL_SYSTEM] during driver init.

Christian.

>   }
>   
>   static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
