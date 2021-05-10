Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83002379705
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621A6E8D2;
	Mon, 10 May 2021 18:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885066E8CF;
 Mon, 10 May 2021 18:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGL1zq25QUnIyyhYy2uy1tniCvbN/lELJjCjvSIZJgBFxAoW8aLzZ9ngmnK/ZzUf2xjAeLWaETZs2nClbYoe0Mlx89oa2piKxJjqqkz2oxjpJTr2aH3jFhtVlSjAPemtgTIkM8PkzRQgTtjMtCEZ5Dfy+aMVB2vGRNvjtCbCiM3RrEgXVurSvxNAiyRO3BA8sxYRpm83Y2BSNRyPBsbUWwdIZViH9XG7A7cATf3PBmIAhPWlim4dUbgB9/2CoDgkVukPrJct03IOmmEyv8zo48OJD+Bw5LH0kRdVNxK8vIk6x5mda01HaUuPzp3KHgXwQjquzGmsXCNEzsgUWuIxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiTCv/Mk1JO2vCONhveoFEMgTSDc/3RnX2x44BNkCFc=;
 b=h01xGvjHz4NLU1/DmbpaloEdvxr22UuFiQIGMZ7UeQ7WbOjE5ah8gokGKUPJ+JqcU/ux6S3heJrROZGIvm7NKTVX0UFyrDr3ERRoQg6Knpb6yiDdZKs4imJe8ie+vmb4D0AFsp6oYq1QXqlvuTbc6Y7cRparY9ivnQ2QFP6iBqXgzruQLIEUMl1OiGPU6gK0b8N4kFuNZB9XN7DIqlS0bBd0unzoqIoX7B5WYkHgoStMjQUoRIzu8VOvdIYd+dK/5ryAFXsY9SSvqaJ5KiELokK5X3ThTqJCTxjS9BlwDIc4ZFrFxZ6OLtvmDxj+3lqCda9lCeGB2NLaZvtvsHVz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiTCv/Mk1JO2vCONhveoFEMgTSDc/3RnX2x44BNkCFc=;
 b=cvYoUgqdGgfHZ1bd/bTMH6F1T1Luqvo/rkDPOjM9VDXuHbcHjIQ8yqnALhopKUGAgijwzn6gGTKmTC4tif6Fiedn7JngxnaBN8FkjFk7MOhyWIcXC2O4Sv3ulnGbom7eBflqHFK3D1MLIUzYrkauHwq2HBxI9DHHILk/fDTmrCs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5241.namprd12.prod.outlook.com (2603:10b6:408:11e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 18:27:27 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 18:27:26 +0000
Subject: Re: [PATCH v6 02/16] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-3-andrey.grodzovsky@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <01afeedb-179b-d105-4e96-139c9bc654ef@amd.com>
Date: Mon, 10 May 2021 14:27:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210510163625.407105-3-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Mon, 10 May 2021 18:27:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c64769ba-6055-48cf-62a9-08d913e1433a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5241FFEFC3ECB1803C7F2DD092549@BN9PR12MB5241.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUsTR+3as1vffrMw7mp96FGFJiDRogcl7VvANLHe7sthF4s0Jqf8D47yN8Q9NNHnD2O07fnWJTB1Z36wZqkVp3B/hfJIroe0Ezoon9bc1DMaDJpZgWw0TcWQw0X+YIHYmf1OTORntkdz2qTdiCf76hcA5j6uXk4CXy+iKPE7mR357b5me+RUc4y4SgV3INbIkXV+EwMeyD2qSJkv03BQ2Zugly6pque+uYlAr188ULfOxi0Uts5Iwi8S17l2wJez365suVSsmqAwYUmVHz8sOZJAARzStp4CZK5a6PvSdYsaGGt7pZ9CjDCAjL+S0kL8M1lbFhlgVJ+lmIes3SrZ5jAFhHSSrIG7AeuoHeoxU0+I23CQPm0g5UoTuRRPNFDtXa/zL4EUNmM+2Py7yb/AaADgIzqzZsIFr0Ukp1MVzp1JM9yQSYRUNcIpFbpgbiMynfTVnW9FYCByFrP86R0oVzI9YyxkYg84qEPoJYxYgELbaiZ0ag5kb37Xesy9h3U/6L7WVMzsfsEYiObX4/RliAqxiiZBws7IJKB3uypzXsSMj3gV28xnpvQaW956KovsGKSc4PPXlWnLtDyJmg/TvHYOphXAxNK7SEcwXSkOOB591RmGX5Kbqnv3U6oLK4En+lTPxDYQ/KyM/kLBX34TQZNnsvlJHLiqNfwSP9U+aaNyUffIVv4h10ffFRqxuDCQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(26005)(66556008)(6486002)(4744005)(16526019)(186003)(8676002)(31686004)(31696002)(2906002)(4326008)(44832011)(956004)(2616005)(8936002)(5660300002)(478600001)(66476007)(83380400001)(36756003)(86362001)(16576012)(316002)(6636002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azhYbVVEYmhKakovVEtOTjl5UHovcnYweTlKdWR5dno5WVdoRmVjM2NHKzhu?=
 =?utf-8?B?b28vOWtIS1lYZUQyd21QN0x0M1RFeWZnaHZBMUltWWpDaStsS1dSQUM1Z1Av?=
 =?utf-8?B?Q2w5V2VKcHVQTjVEeDRQOHRKT0VxdGtiVmJ4SXh5YjBna0JiMFpabDg2T1dD?=
 =?utf-8?B?U1ZtY2N0aDdtV3F5Q21WVmJwRXU4WVFIZzgvU3ZYS1BUNDRtWUl2aWM0YVhB?=
 =?utf-8?B?UVRXWFFJcisxbGViRCtxUHI1aTlLNzd4akt0S0ZNZm5TbjJvNnNjb3crWDhX?=
 =?utf-8?B?b09IMURoZ0tnRENaVFkyZmJ6dDBSbENxSGRpL0o3TEkveThRSjZuSDNQTHEr?=
 =?utf-8?B?c1hGN2I1Rnhad0k0a3ZEZFlhc21DMTIzdHlYcGprY3JuYXBKQStIanJiVkw2?=
 =?utf-8?B?cWZQdUo4UG5YdnF3UGhvUURDNEZIaWNWeW8yeFBoZXNMclRXd2JPcmJnQ3p6?=
 =?utf-8?B?eWFrQXBGT2NXOTRGcUxCdlhoSXYzbC9idmw2MGlqMjNUOTBOUDN0R0p5V0s1?=
 =?utf-8?B?a1dmQjN3eEJoaGJBZDFqQzlNOGFsUXpZUFlIWUg4ZHN1MUYvdk04OHpVUHY1?=
 =?utf-8?B?dzNBaWJZVW5wSllwVExoODRmZStQUEUxdmR3TkttYWo0aEptWmxwbjVTK0Yw?=
 =?utf-8?B?bzdNUWNVUytkejd0WERCcU1oRU1XMzExVFUxL1J2a1VXOHg3bndLOEcwMWJ1?=
 =?utf-8?B?TXA3UmNDSDVMSHhDcWdyMjdvMUNEalAvSjZGRW9STDFvaWNNeFNLQXRrRE54?=
 =?utf-8?B?M09Kc1V1bVdQUUpUZzFwbnpPRElXeW1OcTJ3bzhwK1ArUkp1MjYxbndQOXc1?=
 =?utf-8?B?aUFsOUkxSi9lT3BjRENuUlRPeEFFUWpaWHZqaGRGd3FKNkk5cGtpdzFidWgv?=
 =?utf-8?B?eHk2K1A4ZUVFcks1YmtmUHdMamFPelpEa2k3TjJlZzk1U21GYW9EM3ord1l2?=
 =?utf-8?B?VGViT2tIaWVKeHEyZ1BteWRZaHFLMmVicXV2S3NZR0QzQ0VaOTQyTjZpWmMv?=
 =?utf-8?B?MlRrZ2tVSlBQeUQvNlovQUlCeUEvNWFEYkEvZnhiWWlLYXJpUFJnd21sdk52?=
 =?utf-8?B?c0RNNlMzeisvVCt6MjFWSktURkpFZmptS2dTNkFyMVRvUDZ3M3YrODIrZ3lG?=
 =?utf-8?B?RjJvVElHdzZLQXFVUi9MdG9mcFR5MFdmU3VDbzlWdmk2TElFSkV4NEZPTjF3?=
 =?utf-8?B?Q1paZnpmNkVIY2UweitWdENMVUQ3Z2ZEOWhoL0xOUE5ZMzBzN2ZkZ2NFSVhK?=
 =?utf-8?B?a21kT0gvckVQbVNCdEMzQmE5b1RmaHh2UXc3ZU9VdGxVWFcydFRzYmQyMmtT?=
 =?utf-8?B?a0dvV1NlZk1yNm5KYXFFd005eU1mcnErQ0FFVmpyVXFwWk5QYnJnSHVMSjFq?=
 =?utf-8?B?L2xjSC85cmlnSDd4Rit0dkNPTjlIbjNBdzJGODFBWnlydHZoMHlDT01GM0lw?=
 =?utf-8?B?ZTBkQVg5RnhtSWZIcGRTV2d3Qk5ITC84ZUR6TllNMkpTVjNhd0Urb1BObCtl?=
 =?utf-8?B?anpGWGU3Qlg2R1J0Qnl1dFhDS3J5WDNpcDRLa2FvbThLS1YyWUg1UDVRaWU2?=
 =?utf-8?B?QS9zUHE3dVZpWEFLdW1JMlpzQks3UGp3TlBmeW4wbXhITVNMMEZKYUtmZXRm?=
 =?utf-8?B?OExVYW5pSithdWpXNUJtdzNPUUxtU0FyNko4RGtwMFk2MDA5M0JRVWJ2NlRl?=
 =?utf-8?B?cjdJNUl0Z054cjdycVFmNXZVRWFscmhqUFBFSWg2S1FBWlJ0OVFLM2VJNGRH?=
 =?utf-8?Q?Fa5sndPEnZM4/NsDMUndZTPqUIeMJGno4uN+daL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64769ba-6055-48cf-62a9-08d913e1433a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 18:27:26.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJiXfXdwLoRvxWPdYF+j3bgoWbqo6wQxuMFefMITBwIhoZ7QfO4H5L7kiWzoqxoqImCNP7OFHyOxctI2eJr5yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5241
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-10 um 12:36 p.m. schrieb Andrey Grodzovsky:
> It's needed to drop iommu backed pages on device unplug
> before device's IOMMU group is released.

I don't see any calls to ttm_tt_unpopulate in the rest of the series
now. Is that an accident, or can this patch be dropped?

Regards,
  Felix


>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 539e0232cb3b..dfbe1ea8763f 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -433,3 +433,4 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>  	if (!ttm_dma32_pages_limit)
>  		ttm_dma32_pages_limit = num_dma32_pages;
>  }
> +EXPORT_SYMBOL(ttm_tt_unpopulate);
