Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786DE15BE52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 13:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92CC6EB3D;
	Thu, 13 Feb 2020 12:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC946EB36;
 Thu, 13 Feb 2020 12:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FujAZIoposGMMvOg431Icg/pAtDVM8+1fesSBGP5Hm9JA+PjhtKD6aWqv3SDKn65WycWvJ7AtPA7vtOM1dS5R/liJ6PQK/kmZPUZepjv9FAUHq3CyiZxIYN+6aGf5lmusKkld0wI2Ep6r4xdfgA+dn0f1o8ZgF4rquNWymBhzuSWrp4SjfUiT7xxEjz8hTCRGAHisAl/QqGM6P2Gr/QBge477IIl8D012YheJo7ps8bc+Pt1pvdMn5dzxtrSMHiV4IkVW1Jp/qkM0tAXsA8ZAL0bgjAy35zQB6pmO6HRm0sZFsMzxPMlEoTuaAeXXcDnAlMqc9AOP+IMctAgXQBEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PCHKVKsgCBGzMceI3BDX3dEcvk0DVhzHv9Sn7VQ/Jk=;
 b=P6eBbQucW+07VfZ8GrdOoBb1/pLoh4BDW2Mma5mCzuOdVCA2y9/tkVyOfhjVZ/4MBKz+YS7TZzetcX/Zjph4Xple1Rj236Gz0eWCvqJc75+tVHHz6gUeN2asxUWRviSk1PSjDzv4iIzaWfcNFgmWdXMI4r865aekh9H+x6EwOcJpAPgr7rE63LFztnmqBeLDCazE+7E2FIp7xcpN/pfDUrO13dJUDHMabyar56fqT0xmS5UXdnAGRgZADmSoy7141mspGYCd6Ce90fGwehRCs7Dyg3qst3WcwNKjGMRpjEZPxQw2G0pcQHZ6JqbXDftqlaL06pwyby2A+b/ZwKxqGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PCHKVKsgCBGzMceI3BDX3dEcvk0DVhzHv9Sn7VQ/Jk=;
 b=2wWANrYzXKmVHPM056MQM4fJhAnsR2bEsocCq/450twsfZVe8Gh4f9O7iUqAyuKa5eqaf6KyZJQtj8zhiWXEhDHqfijdOky7HTs5SW9Af+Q6BXrJ46KfI5p+GrSpCLEhFUbXta3i3aEUSa4fMr/A22xzf1Wilgn/t2Xe3lHD3bA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1772.namprd12.prod.outlook.com (10.175.85.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 13 Feb 2020 12:18:18 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.025; Thu, 13 Feb
 2020 12:18:18 +0000
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
Date: Thu, 13 Feb 2020 13:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200213120203.29368-3-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:208:55::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:208:55::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23 via Frontend Transport; Thu, 13 Feb 2020 12:18:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 612d997c-ada6-4d17-3347-08d7b07ecf08
X-MS-TrafficTypeDiagnostic: DM5PR12MB1772:|DM5PR12MB1772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17725CEE9CA785E342960DE8831A0@DM5PR12MB1772.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(189003)(199004)(6666004)(8676002)(2906002)(36756003)(31686004)(81156014)(66476007)(478600001)(52116002)(66556008)(86362001)(66946007)(31696002)(81166006)(8936002)(4326008)(186003)(16526019)(6486002)(2616005)(5660300002)(316002)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1772;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrbKCszmcwCqC7vPyr/PxDKZh1W4I7YRS3jgczRldc2jQxG9M+99u+vtB4aydu/Cc1IKednF/I4mvmQo2F3zwgvzAJJ3FJCrxTbTBNo32m+xTPXuty0cE1rY7J9Sh/yyBzt6HM5wGnaRIToQHMO4SHonCxlDx1xV2J7cgSRjX0Q/f7wyAWtYpK7u085NF6qomoUSJeBHWXtpEMw5iThh6Bc8Pj3Y42+NwSrJzFF/cH5kyx40yPezOL+tfeVi7GGZPQd3q7OcbE76FBix0ElhsE8PSd9dYkzqNdFg807+2C4P+uc+TlgJz/yCa7G9FZz/ZO6jeg3QwaArplNVriRoz1106QasY7N72Udw4ZJW93/EiKtFMKwMZAvlIeSiyL31aEHN36xyxLXkViA2waA8js8EMWYkknYttnEmpWx8zHB5nsNNJRSyYECQF3DfWGc3
X-MS-Exchange-AntiSpam-MessageData: KWpiNm1I06jgmUwfPo7Jhv0ZTGTmPK5ORwkInoI+bqWgbjOUkS5jKhUrDVMu8GfADf3wEQ9+FFBkIzprvFZ/EzwqVj9Ouzr2VQzkOK0T4sSkhVaDGOcFbxUSHapDvz9NZQe8P/Eiws5WMKZqIpxQpN+ehyX87gfri3/ZdBCLZN8A1QSqfuDv+DQyxwpo4AHsDG32b2l5iGwbuXvQZYuUTw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612d997c-ada6-4d17-3347-08d7b07ecf08
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 12:18:18.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuaSBNUoWOL+T0ftw1qlTTC3n7PHPAGEVEhPESYevVEJtc1m/UM+sFBxhbgiZGDp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1772
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like most of the patch is missing?

We should have quite a number of uses of the BO offset in radeon or do 
all of those go through radeon_bo_gpu_offset?

If yes then the change is much smaller than I thought i needs to be.

Christian.

Am 13.02.20 um 13:01 schrieb Nirmoy Das:
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/radeon/radeon.h        |  1 +
>   drivers/gpu/drm/radeon/radeon_object.h | 16 +++++++++++++++-
>   drivers/gpu/drm/radeon/radeon_ttm.c    |  4 +---
>   3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index d59b004f6695..97cfcc2870af 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2823,6 +2823,7 @@ extern void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size
>   extern void radeon_program_register_sequence(struct radeon_device *rdev,
>   					     const u32 *registers,
>   					     const u32 array_size);
> +struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
>   
>   /*
>    * vm
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
> index d23f2ed4126e..4d37571c7ff5 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -90,7 +90,21 @@ static inline void radeon_bo_unreserve(struct radeon_bo *bo)
>    */
>   static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
>   {
> -	return bo->tbo.offset;
> +	struct radeon_device *rdev;
> +	u64 start = 0;
> +
> +	rdev = radeon_get_rdev(bo->tbo.bdev);
> +
> +	switch(bo->tbo.mem.mem_type) {
> +	case TTM_PL_TT:
> +		start = rdev->mc.gtt_start;
> +		break;
> +	case TTM_PL_VRAM:
> +		start = rdev->mc.vram_start;
> +		break;
> +	}
> +
> +	return (bo->tbo.mem.start << PAGE_SHIFT) + start;
>   }
>   
>   static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 098bc9f40b98..b10654494262 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -56,7 +56,7 @@
>   static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
>   static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
>   
> -static struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
> +struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
>   {
>   	struct radeon_mman *mman;
>   	struct radeon_device *rdev;
> @@ -87,7 +87,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>   		break;
>   	case TTM_PL_TT:
>   		man->func = &ttm_bo_manager_func;
> -		man->gpu_offset = rdev->mc.gtt_start;
>   		man->available_caching = TTM_PL_MASK_CACHING;
>   		man->default_caching = TTM_PL_FLAG_CACHED;
>   		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> @@ -109,7 +108,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>   	case TTM_PL_VRAM:
>   		/* "On-card" video ram */
>   		man->func = &ttm_bo_manager_func;
> -		man->gpu_offset = rdev->mc.vram_start;
>   		man->flags = TTM_MEMTYPE_FLAG_FIXED |
>   			     TTM_MEMTYPE_FLAG_MAPPABLE;
>   		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
