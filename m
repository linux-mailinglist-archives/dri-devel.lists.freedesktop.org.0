Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F460EA53
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 22:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0110E087;
	Wed, 26 Oct 2022 20:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FECB10E087;
 Wed, 26 Oct 2022 20:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK0AzdV1QwL/GUgZ/gkybMN8KdWHvNwDOCA22MFUK3OcxQVt0oulyjM67peflQPpYyq6kDbMdR+Og7tUQ4wzePmIzY98egcWnrhMCa4rGSqTvXprr5mco9osQuJSAk93L6e8mEM24PEskfJNXVJNLA2KERtKvs8MykmIFOdoysRwJKyZwcjrKylY8OPBYEric2OByqW8vhQh4pMsRtQWfp++uvU3EJSEpOahTQzUXluhqld3OiBKuifSVgtdhMbe2rPglZMeZK3RAmRyaRQyuZylUMBn+ObNHC50inTCYmCDH/9JI2ekL3KjJHbSrh/ea/FH1UPrPTYPl2J0HVOBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqH7ktciVqAaOQoQCTYhPrVVtI3DtT4Dryb3Pgh3TtI=;
 b=kNOPMbV3YTkUijM27AwXnkRfHUB5lAmRsPThrLjBkEfkrEcSgj/VAB+8P5OQUqDOJIEs6bY1RfyQiMeLJY4CX68/tUOC/0A6oFKceha6rvc9d7ztTgnXbEEW3kYftQmLN02bukJuiuPrZSHtBOQWbzHcBZlfein5sCtKWaOUQRDIxlAa0giQuJGwDn5lnl4lNAkPgQ8eKqC87WexTlBsfTL/kE1IhthwxQYukH1+mHAUuEzhcqCOM/yS+JGc04TPwllAU92wMnz6Yj6DgQfwuDhc6yeRqz93JVQ2CqXhSj2N/PU3TM0eHl2vpA3ndA83Tp+ZK2kDPT8TDiloD4jA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqH7ktciVqAaOQoQCTYhPrVVtI3DtT4Dryb3Pgh3TtI=;
 b=Cgnog/zYBvLJmoj95EmQtagPU3P/fFDTMRKpLhTMIDxeZnV42nLjkCT05KS5b3T+f85jUfaix2fWXYYNOf31d0qgnayPpW12Rp3YAFZXEAygbWNieOCIUlj7udaLivaBsdLeY/kaN4te/lqk+v1aTs68QlNuCarTJNpkni/OTmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 26 Oct
 2022 20:37:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 20:37:49 +0000
Message-ID: <010a38ff-591b-b1b7-8f81-0b580a41b69e@amd.com>
Date: Wed, 26 Oct 2022 16:37:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] drm/amdkfd: Fix NULL pointer dereference in
 svm_migrate_to_ram()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20221026020054.57114-1-yang.lee@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221026020054.57114-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:610:cc::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f511aa-57fe-45b8-91b2-08dab791f262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCblU3h1L8TAq2AovpcfExxI3YoqT5AwPQvSjwZKv5apmmF40T+2Suj6ge+VKW3IXGr65meczKKYf5xB8Ct3hdj1Ai9yz2bIwqD5rOAmI9dd7E99UGm1uvdTgnl205gOGfLknQ3s3mjwGiEqXQyKSB/X1M0Y7KFoolbHvyxuCVg9LB+dk1Uk36yqOPjS096OoSqRe+nWyGh/KSqyBjCdOlDPehz6K6vwYKUnGti4IYW+KWaJxv9nGVYpLGuZcPMknWA8w9Flky+oAF0NjkRlKmozTyefWpHIFy0DmP3ju/1VwJabUfF6tbeO3kbYimgQ0DwR6FHo3Ft4qdmEcEXoZvnWyPaoCvvxEHa9adnVbRMpGa7BDAlBm6mvT1JGWk6q8UTZ/7C8Ens1ga39ApIHkqtyrP1+9hoa+1uSoagKz8fKAJ1IweSt0rt9hpSFaxRFa69CNMCNoPbMOnbinn5y3mkge6EI+hhEL9xl4iw5h1bdANkvF8kn72a8TfEckEL3/jJfphDgc34w/Y5xIHYd0xEGwVoOY2MRf455hi/yBtEQiWbel5pJhd1NO8aJyZzbUJqRpbFjiM6Lr7z0z8v9SJS0KQVcQVZSzmZPXOSvKiAIPJrihUqV8HaWtzFfuTO2oWxCO1sJLJG+Hel2airFxs3FgZI91Gfp4ntBnsXfdgbYVuwdP+7StMOLUGJJ+dRj7IBywf75Pp3867Xa5OalOY4vZeZ443Pg2Rjgv6S5PRzLp/bD6WFuOnUZYYkg3YXK8Sfwwan11ZZvX6UUdLCnMl+gnxSb6A8uD2JbDaxnmfuhIoHCgyqgwJDhTOZNHcP6FrhZeT6JUVeQlqoXnoFyYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(66556008)(66476007)(4326008)(6636002)(66946007)(36916002)(41300700001)(26005)(6512007)(38100700002)(44832011)(31696002)(186003)(86362001)(316002)(478600001)(53546011)(2906002)(8676002)(31686004)(83380400001)(8936002)(6506007)(4001150100001)(2616005)(6486002)(5660300002)(36756003)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRuc1Y5VlJ0WU9LOWZYR2dHUDdqKzFFVVZkazdVVHh3T0ZCWnhGeFV1R1Q0?=
 =?utf-8?B?ckN6THdVRWg1TXdLMzUyb0NqSm45cjVhT0F3ZWJPelZRZVpaRFBMOVlFcHM1?=
 =?utf-8?B?QURWbHN4cXh4eHVWSTlXb1ViZUpiRTArMWgvY3ZaUlhMR2hSM0owVkZPUjQw?=
 =?utf-8?B?RjhrcXRnb2ZyMXJYcEF0eUVxK2k4VmhPTmNuOWJsUEV6V0wvbmJGenRzSy8v?=
 =?utf-8?B?WTR1Zlc3UElxRG4xZUZ5a3pKNzJVMEJFLzB3MEpnck1lN2lVUTJnQ2hQRFdX?=
 =?utf-8?B?V092M0xFZ003Mm5qZE8yU1JIVHV5YmZrMmR2eWQwa0VsZW9FTjVSeWdGbzZT?=
 =?utf-8?B?WVpacnQxSXpaODFxbGxqZ2NqajJrbTNqZHVaa1dmYkRWeGdac0ZzV2lJRm5N?=
 =?utf-8?B?TCtoZng4WkFtT0c4K2g3eStDeUVWM1JMK2pwNFk3cUNLRGpFYndLa3BmU3k0?=
 =?utf-8?B?bklPanNVMWJ2ZXZPVGhZUno1SFpkQmV6QVhIaC9sTFQvc3pXblpnNDUyeTNZ?=
 =?utf-8?B?aDVtc0hrQ2hSd0xsNkVndnpROVBQM2dFYU5ualltcmNEbWdoU1RQWGZLSFZP?=
 =?utf-8?B?dmY4OG5IODF0amxVLzNhQS9EellHR0tnNzduakRHNmVOck9vR0Z5cC9pYWtl?=
 =?utf-8?B?TWtoMTRnZUZzbGdHOWxYY1NzQnlqTUZBbWpFV3lFRUNuYXZmMEd6YS9Dbk1O?=
 =?utf-8?B?YlVab2ZsVHBFVXp0c212Z3dMMjlIOUNzS2ZJdk1ETDg4YXg2UDBqdnN0Q1BR?=
 =?utf-8?B?Sk53cHMycFFaN0dCaTFpYVZJanI3UWxFUnFPVDJTTFIrSDFYNlFKMzU5NzF4?=
 =?utf-8?B?bFYwN0xtUjNxaGp5R3RCRFh5NlNvUDVLUDEyOG16VnN0cHU2eG9tSVoreEkw?=
 =?utf-8?B?MVpqcWV6SlI1dlFGckV4RzdtcnVaOUtySTFWVEl3NHZ3dVpPVHJwbHBndWIw?=
 =?utf-8?B?cVozL3haaXE4b041d3dRcGVQTzBhak5XbmM3Z1BDU0FqbjR5MlpqQzVNbjYx?=
 =?utf-8?B?QURWMGgrbkJwQWE4aWxlUjRnbml6Q2RseFByVHdObEN2QVlOYldreUJ3RWR2?=
 =?utf-8?B?c1FlQmcrZHpCUnFYRkY5aG1tMjlBRllLQ2QzZVV3U2RRayswVXp5N21zYkVN?=
 =?utf-8?B?SHU0RHZYUTk5bVI2bzcvUHR6bzh3R09iQmo1NXIyMDhCbXYzM3RoUjhuR2xF?=
 =?utf-8?B?cHF4MGtjcW1NSVViOHJtVmJYNGpQbGVJejFZcmt3dDJPQjQrY2NrVEhhTTVZ?=
 =?utf-8?B?M1Jva3ZVMjdjNUp3ZTZnZXpYNGtYbmd2MVFmc29KYndSaDdHN0J3ZlEyVHcw?=
 =?utf-8?B?STBBMitZSlFCUGRmZVFFR0swV3ByMW5EV3BBZzRUSkpBSTRBMENzTWJ3Q2Uz?=
 =?utf-8?B?U3VWYlRmbis2NEVIelhmSGc1T1BHNlBLNmFGUjBSYXlnZjRlT1o2RTIrelNS?=
 =?utf-8?B?NGJKekZUMkVHTXFrdUhIa2I4UUYvMnliRjlETjVoTjNESUNPai9LekpMWDA4?=
 =?utf-8?B?Y3Q4dkdPRWs4ck1ud2xvYlViMFg0eWN1ckx3YWgxaEZ4K1NoQjh3c3VLckdH?=
 =?utf-8?B?V1NYM1Iveko5RlNNTVhHTVFlT0VXd2ZpNTkxMytTME9kTzhzcTRnc1FTbzlJ?=
 =?utf-8?B?TnFpY1daTWRZcmpVQjBsMkh2MlB3VUVNZC9kanpadmFJVzg3OG50cFMrOGZW?=
 =?utf-8?B?SXBsakd6YndBdlIvbkFyZldmTTRXdVRYcjdXYTBaWkFPeHI1VGZZQkxUc2hP?=
 =?utf-8?B?aTlpRnpoc2dRT2VhMjhDRHJCME12RGVDOEpjVjFIcWFSTHhHVW5jUWhrZ0g4?=
 =?utf-8?B?b0FoaU9RaituWDJsOEIrK2RnbUFCelBmZGN5SC9DRFphOUljZmVyYWRjVG1J?=
 =?utf-8?B?YlBHQWxwck5sbHpNRTFlbkdkcmhabnIwcWFCSFJZT08zalpIdElPYlB2QTVq?=
 =?utf-8?B?VkJWb3lzdTg4Ti9scFFsOE5VWUIwZ0U5aG5zSkcvSGZqZFJSSVZ0ZmVSK09L?=
 =?utf-8?B?UWlWNm0vZmh5NGVWSjVhZmR0MVJYUFRiaVFDRGRSekJReDdibHZ5enFrZFVx?=
 =?utf-8?B?RWtUOG5EVmZISmZvZ0xWSUMzRWNObnlYcHVIN09uSGY2Q21XaEdwcEN4cWVJ?=
 =?utf-8?Q?fQTQRkW+HhIAVobqdHalZbeom?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f511aa-57fe-45b8-91b2-08dab791f262
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 20:37:49.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6TgBCz49NTiSMrt2uS0xxkm+o5SGNVz7lTgm7uoHAIVk0RuqEZ4fB/nM7aIvYThIvnKV95v96fIOVoy7R+Gmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-25 22:00, Yang Li wrote:
> ./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:985:58-62: ERROR: p is NULL but dereferenced.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2549
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I applied to our amd-staging-drm-next branch.

Thanks,
   Felix


> ---
>
> change in v2:
> According to Felix's suggestion, move the pr_debug up before the kfd_unref_process
> call.
>
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 20d6b2578927..b9c8d29d95aa 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -978,12 +978,10 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
>   out_unlock_svms:
>   	mutex_unlock(&p->svms.lock);
>   out_unref_process:
> +	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
>   	kfd_unref_process(p);
>   out_mmput:
>   	mmput(mm);
> -
> -	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
> -
>   	return r ? VM_FAULT_SIGBUS : 0;
>   }
>   
