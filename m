Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1C3BF5C8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 08:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250D6E04E;
	Thu,  8 Jul 2021 06:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7E6E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 06:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROz4+LIEGgow1LYnhrs64jZ1thpWN8B7atDyEIAduDQCq/YfGKzoZb1YEsO9MobHlbopi0TzClyM+qf3pg77zbF93K+Tu1gkrPuj1Zf1D+hFQJaWl3OLsnGRpgba7ygBjjWd2yMGL3JP7QVcb33GGJmZ1aOyJutbq0bATLzsRuBF4JHm9G7CY6+YRvxKXQxGtJdWK9654nCVX8DmeUa5jl/Utcj++DwRPsQug/iXu8rWhFHVAFslhXRchNkO4Pddsh17koiWUy687ynARF4TZi7Ft0NoiZT+GFDaQXu/JbxZ67rKJkcfDby+pJvlf7XLqgG5RP5EOxtARwHdWrNr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUGuvGBq7ytnkb6yl57/WCjcPmCbXNUjoc+P9UvtzV8=;
 b=aeMed2qI/RSUEbP6Ultn/Ie+jEtzXcltSaPz5DJ0lKPv0njP8ReGrsZ5R5bOrngZMSKriiTSkGYBTSSOdoSyjCqcE+QEX0Udgk1xvxULyW2Zc6i17G1jDbkown0qHGX3LaJ8rsaxuuOaTpUB20zG2qHtEoNTPykGHJP1ZiPDFZkpGBGIpB/kfek7nE1mEVtoFgJk/anzUMmRO0/tDPsY+xQOXIM1x7D3ti8/xyoOdQhdTtLEkztHuzsECrZdO0UDg5kCtV3niWSM6H9ntLcpJD2SCPAtCrfJWNSgKZbm18Eq21b1v4LAGVbmRNglYtfVbnR3K9CJJtvzxWe88ueCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUGuvGBq7ytnkb6yl57/WCjcPmCbXNUjoc+P9UvtzV8=;
 b=1M3Yjeyw9IuqfwNIf9cb8jxxhDOD8I8V18aI45tcmZeGOaQArKyEGUQ+f9jOzkHAUYO7MIKz2W55inCiaU4r1EP5Du+jY2P2lmdke9AjqghwfZAcwGasppxaoB1vrN+qMMsOI3Donpdt7AXOD5/v8B+9tAPhUqjkR1zCJsh6Qbk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 06:49:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 06:49:55 +0000
Subject: Re: [PATCH] gpu: ttm: fix GPF in ttm_bo_release
To: Pavel Skripkin <paskripkin@gmail.com>, ray.huang@amd.com, airlied@linux.ie
References: <20210707185108.3798-1-paskripkin@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f4bb7b29-3abc-a056-fc24-4e91b5de8d74@amd.com>
Date: Thu, 8 Jul 2021 08:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707185108.3798-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 PR0P264CA0083.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 06:49:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d67188a-75f5-435c-96ed-08d941dc9878
X-MS-TrafficTypeDiagnostic: BL0PR12MB4963:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49636F4700F76154173B925483199@BL0PR12MB4963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIC2Uj6g7FRXDNApT5twcvdpCckag3MJk/yLjuyAS9PQrqf3JD7kyNijr3rjIYi4g25WMhQ/u4wCKNHFliyWRTOLwc5NJ5QM8RiYl+GzZV8bV4LtGVhnRSx14JEjKUwa+NAaU1DYgEnPiwGBmKXc4WHbL/16Iupq1ZydW/nkiVxRqE0XckHKbZcYaa50DXe8aShcb3Eq4pGDV3QHKzO607yPxmO07qwF9Un+0+vkG0AiJKd8L7AzJxOsz9mdiUWWhhY5lJhXV75haHkjs6O3jDk205KhTQyHwiMxroQZH2gsDH5saxpeLrFflOreOiBMK9HdMuAKnGsPHTgYzltV2hGL1s9uEVmBOWu9zI2+CZpTMH7FvDH2CH6dDuQ26g/UUbhXt/ch9/1yHF69TRVoxwkLlajLk9CA/ZpRMsf4Hrhc17ibwYWPywx4Xw12p9yOM/bKgEX1jhUoe8MDWgoULwddwoBs9Pp851Hnp8DyzWRz/4hJmMHihl7ZGDle5j5P7fDcmtDJLl8cu03fEgH5JKF8iti1ihB9hfe7q5wDcHoeAuBDVPiIaXPVGINuutiEWthq2BbRp+G8AvDYhwpDVcHY0ckHC9tbMErFqjJoiAwMtdtnZS4VCvqYzyKl7UyNkXZeglgMynmYtPPcnARjvip15rYnpWZKt+Lg7Vvo6ov9GkZyQ97UUA2WiXkq/5btXONmJSxXr3Br11ICUFo/nGqYuwWBoMa+UmuCXFwTIIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(66476007)(8936002)(316002)(5660300002)(31696002)(31686004)(186003)(6666004)(6486002)(8676002)(66556008)(83380400001)(86362001)(4326008)(478600001)(2906002)(2616005)(36756003)(38100700002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3VQT0tqMnlsd3BZUVh3SVZiK1BVaWN1ZVdDUUZXanFJcXZDWE1PVGd2c1Uv?=
 =?utf-8?B?a1lNSzFQVDg0emVPL0U3ODIvZVIxZXpaN0d6WmRQR0xxTE9HU1ZmelpBS3d1?=
 =?utf-8?B?ZEFZajZJeGtmdjZmM3NuWW94TU41MjloV2xZV0dub2NKZitScHRqK3JXL1Ez?=
 =?utf-8?B?dkdKenZMVjJ2N1dveUhaVnFBZDIyamxVd3RKbkdWOEdyQTM3MC9tc0JTV2Ra?=
 =?utf-8?B?dzdNRUZWY3BGdGtqc0JTL1ZBTDBYNDVCNk9MMjJlWWV4UkRudUllL2VIcnlt?=
 =?utf-8?B?MEJESDA2aDlRcmJEZ1JZQ2NvODBuRnZPK1JNaCtIbml2WnlzZmtBVXEzcENR?=
 =?utf-8?B?M0V2WnUwSGtrbjc3N1dIUkpEMGVtb1JDOXl5RWdDVCtxM2tOZEUvQndtWExF?=
 =?utf-8?B?MnUzZVpVMHFWczJFRWxpSHhkNkFxWUdBeXpzMmZqRVdiWVhzZUZVb3Nobkxv?=
 =?utf-8?B?S3hUaEJ2STFCemJJaWpYYUFMZTRuZndsa055ajZPWHJieHRLeG5JN1c0OURo?=
 =?utf-8?B?ZDdNL1VoNzF2V3JKYWIvSTF1cGV4MkpiOVNaV0VtUnFUTm1KWVV0cTJBeVVK?=
 =?utf-8?B?N1A1QnVHdTdZMUw0dHJHTTIxZmpVUGRXRHZubElkdEl6ZmcwSjlydjRTRmRi?=
 =?utf-8?B?K0lZdjRmVEZqWGREY0NZRFVoc1I5QnVmSzhZUUhFb1dlUitvZnJHYkxSV3hT?=
 =?utf-8?B?MUdxZS9ZR1dCS1UzeUpPRjc2YlV2OHZ1TEVSbmQwcTFMeXRFV3NqTStJZVpO?=
 =?utf-8?B?ZXhpZjA2RkhaQ1ozV3JFb213bjRyVmQ2ZXRoZWI5N1ZXaFM4eXk3Z1lpTkNT?=
 =?utf-8?B?WXlzOHVEQzNzb2krRXdVZGpYTzNNd05zbExVSHRKazMxTjN3ci9wSkpaQ0Z5?=
 =?utf-8?B?U3BFbFZhYmFNcnppMUlKblNHMktreTBuQmNnZkRVdmprMlZ4UnlEaHc0L1di?=
 =?utf-8?B?SmUwSEVRdDBSWTNxNERVQXlESDIyNEdBWlBPWFVyeCsxV3VUNEJVK0Z6cW9p?=
 =?utf-8?B?VUpCR3hTZkRLeW9RenpSM1FjUXluTWZBNjZXb09Ia2U3WHRMM2d4dkVLSmJ4?=
 =?utf-8?B?TUVBczN4K0JnMHhoS0JmaHZPU0QrRlIrL2VvMldGbi9leldOblY3c1hpTTAw?=
 =?utf-8?B?aUdUcWFlRW42a1lCVmZjY0kyNkhzdS9ETEVkZS9OTDBSUmMzU2Y3WERWN3I3?=
 =?utf-8?B?K2w1TzNjdCtnVWNkS1ZLb0xRdWpSWjFYb2czSE9vQnVhb3RXOHMxNG1NS1Uv?=
 =?utf-8?B?OVhnMTR1ejdVTnp6ZFBaUWtZeVBPWDVoR0lkNEgxRlNRRGs3aXRKUU51ZGU2?=
 =?utf-8?B?RHNITUxiUFFSK3luT1BCN0cwWVpVUDI1WmVEblprVkxRNVFLajF3cm9KUXl1?=
 =?utf-8?B?bU9mcElrUC82V2ZRS1g5V3pqaW10MFFnZHZXQkkvNUJiV1dQeW9tMUFvR0xT?=
 =?utf-8?B?QnNtRFZZdGJzOWRZQUNJcFdpdGZUQUYvcHdlN2tJTXA0VjFnYWhqU1ZBNk1F?=
 =?utf-8?B?K3IwL1pKVWFybS80Z3NyamZjQjg1UGFwczhOUjY1TU8vZ3RsVVk2djNzTDVS?=
 =?utf-8?B?dWFZUU5TTTRCUWNBeGdDWm4vY0o5Q0tZMFhJQ0ZkRjBhOE1vSG5XbzFKRVMr?=
 =?utf-8?B?K00rZ2tUWXJub1VMWlBjSW1BNnBZc2VTK3BjUjFUM0JWcFNRKzN6NmxSZFl2?=
 =?utf-8?B?YjRPbjBlSWxKRGpQd250cmFWVEp4Zk82MHo4STdONDdqTmFkLzdmemdzNlkz?=
 =?utf-8?B?WHY5RnpFd0lPK2Y3NE8xU3pneGFPdXB0WmhEVmVWV1Jvb3hSTVhVdjFQMVhh?=
 =?utf-8?B?R0x5a1g1YUxtanhWWDJCVk9ST0xncmxNc2dzUk1CaitBNUdTVFdDMDk3WFJl?=
 =?utf-8?Q?+gBIJkTrUaQi1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d67188a-75f5-435c-96ed-08d941dc9878
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 06:49:55.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Afe9t9IkcS/qkDcihyXIumHh98yOTRtkJm0zQa55TgtcQKWJlt04eXqPk14jI3H3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.21 um 20:51 schrieb Pavel Skripkin:
> My local syzbot instance hit GPF in ttm_bo_release().
> Unfortunately, syzbot didn't produce a reproducer for this, but I
> found out possible scenario:
>
> drm_gem_vram_create()            <-- drm_gem_vram_object kzalloced
> 				     (bo embedded in this object)
>    ttm_bo_init()
>      ttm_bo_init_reserved()
>        ttm_resource_alloc()
>          man->func->alloc()       <-- allocation failure
>        ttm_bo_put()
> 	ttm_bo_release()
> 	  ttm_mem_io_free()      <-- bo->resource == NULL passed
> 				     as second argument
> 	     *GPF*
>
> So, I've added check in ttm_bo_release() to avoid passing
> NULL as second argument to ttm_mem_io_free().

There is another ocassion of this a bit down before we call 
ttm_bo_move_to_lru_tail() apart from that good catch.

But I'm wondering if we should make the functions NULL save instead of 
the external check.

Thanks,
Christian.

>
> Fail log:
>
> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> CPU: 1 PID: 10419 Comm: syz-executor.3 Not tainted 5.13.0-rc7-next-20210625 #7
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a-rebuilt.opensuse.org 04/01/2014
> RIP: 0010:ttm_mem_io_free+0x28/0x170 drivers/gpu/drm/ttm/ttm_bo_util.c:66
> Code: b1 90 41 56 41 55 41 54 55 48 89 fd 53 48 89 f3 e8 cd 19 24 fd 4c 8d 6b 20 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 2a 01 00 00 4c 8b 63 20 31 ff 4c 89 e6 e8 00 1f
> RSP: 0018:ffffc900141df968 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc90010da0000
> RDX: 0000000000000004 RSI: ffffffff84513ea3 RDI: ffff888041fbc010
> RBP: ffff888041fbc010 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000020 R14: ffff88806b258800 R15: ffff88806b258a38
> FS:  00007fa6e9845640(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fad61265e18 CR3: 000000005ad79000 CR4: 0000000000350ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   ttm_bo_release+0xd94/0x10a0 drivers/gpu/drm/ttm/ttm_bo.c:422
>   kref_put include/linux/kref.h:65 [inline]
>   ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:470 [inline]
>   ttm_bo_init_reserved+0x7cb/0x960 drivers/gpu/drm/ttm/ttm_bo.c:1050
>   ttm_bo_init+0x105/0x270 drivers/gpu/drm/ttm/ttm_bo.c:1074
>   drm_gem_vram_create+0x332/0x4c0 drivers/gpu/drm/drm_gem_vram_helper.c:228
>
> Fixes: d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1b950b45cf4b..15eb97459eab 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -419,7 +419,8 @@ static void ttm_bo_release(struct kref *kref)
>   			bo->bdev->funcs->release_notify(bo);
>   
>   		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
> -		ttm_mem_io_free(bdev, bo->resource);
> +		if (bo->resource)
> +			ttm_mem_io_free(bdev, bo->resource);
>   	}
>   
>   	if (!dma_resv_test_signaled(bo->base.resv, true) ||

