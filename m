Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08B602F3B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 17:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3E10E90C;
	Tue, 18 Oct 2022 15:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765C10E904;
 Tue, 18 Oct 2022 15:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKtw0mtzcGfNeXBP+jsgNNHT6R4X5GOeVBC81wly9B2Pnv5FRQyOUHkN92cGoXnIXxiWaQgFtPjiwy++vrAqUkAcwwaCrwixU+EAWJqD2R8dohS4T0Rl+m78iXunnS1JyG+O6FJDIMAVyBM0iS3rykv9a119wekxg3TInPJGNPhcJt9wFSSnFl73EzqLSG6diM71ffdc10r4UEYD9pbqCfQBFKzc5vWhC7DXDCKa74PL/c8V7QoVIGQuInTnPM1yKGB5GKeQZi8l/gMQvsM6Nd3Dy6KAnnM90IHJSvTzNyy/xKa3YLcCZGGLgm9MPenedyzduh8jYZ48VA+miXt1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMw1GqcmCdKpWi4LDN019v59G7Q39xJNikMRuvEfXBE=;
 b=l1GAoc8fBCLXI8HPvGn/yxN+PXSrLjnTeLTivWXBy4Z5WiDGdre6eCUTnmis3qXmWoe5aX6jCHfv/pKHhgF0HCBKUkUirB27zltMHH6L/uNfQrjlaQbqDptb+pBAVyskHFIVy03I47qnbj2k/aw240M4JBa5/haGz7Eq1JUHc7CH9g/EmkZjVbQkyPI4bfNV1yWElV7XZ8DDQB/otc8BYPEgCz3HB6O6F7PSZy9b7wjIBJBtV17ag4MNYnW30PoK3I6UWFjlHFxWZH8STiQRklzV6RrXWOr5yyjnp0vWTL3YvnfxJ0GoBNWBgN2NfDPqgNd/lvZBG1/Y8oqgAPP4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMw1GqcmCdKpWi4LDN019v59G7Q39xJNikMRuvEfXBE=;
 b=FHLzPJw6NDAueqxEHeUcNX8wAAAXiVm7+EJIXhtK2+/fJws3sLgYZ+uFBZAEwrY6YY/HDgs593D8wRHUnAusIlEpzSs7qvIyX/WUSBi+ZTUmqF9g+WgzuMZmVUa79jMQ9vgoGTqwwYywAowKDDCJMUUn1N4TkA7H9r1d4ajo2j8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 15:11:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:11:10 +0000
Message-ID: <c8585fab-6e8d-de4b-eb2a-e8bff6e3fde8@amd.com>
Date: Tue, 18 Oct 2022 17:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <Alexander.Deucher@amd.com>
References: <20221014081553.114899-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221014081553.114899-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0057.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 92641e65-e760-4d9c-b5ed-08dab11afd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDL6qLamtlA0coicwhiISeLuE0mWnDfoBHArnIUAI0R3RKQIfUJktCiMLki2VGviiot/eE0HekTm9iGoVS52+Aodbh9b+6bYseatKtl+dRKPSX3zJa/SBYzbBeR32N6Zu0vp9UEFCNu9+LMBvy9i72HNN2wYvOdngGbYYS2VVSXAE/EDwqxONR9ZpYCy+miHN45/Dp+AyHr8AsC3iTI074mQbgg/4n8HGaWr1JZ3Nc2l6aCLgKW5uDyCRCqX5I2e5oCBJPDkGuiwb5xR+Y/EBG5ytKAdpZbo0CxL8ToEnVpS7LYk+X47uE2KPrxTaOMf4i9YkWGhwabVDmBpQOf2r6wg4wQmI6I8kz5YbRIj0ePazLYEuPJPZNbHjB3O4TrbxfvrZkZ5WiqkWadMr0C75RspXguzYp/WcW/kSOFwP1eOWWkDFeeJaablodHG1os8lL0MuZbmiyr4fPGneasTiZdcKmC8kn2c97E/yNbjRA8+5DYYww9/L25lMyVbqzJ8hTkuQMCJHVz1Ki521Wr9T6pKTMrlXzKFhSM+sbkvmFcLOGOHGVClDwYfDtpDsHluzr26pe+RP5nvu7errUBQvbFK8sbO3b+TSaeOld8TLbPNZsTBT1Ez8DTUvOCIBy2rzzkSjOM4pLP95JfWTPIkSupC/ADkbvoEc+I5Ox0R7COO1X3asOvAspa1fTUfI9qnY6gMVDXkAAUt7e4eEwLGGaIci/ocvHZ7SOZ/ivxq/I+EBggZBRRmQJTF3pVVP1TxmntcldeIlZJwWCHEbzXM7V14ZKsnorPjxa3dk/ZkJ9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(110136005)(31686004)(5660300002)(8936002)(6666004)(66556008)(6486002)(478600001)(6506007)(66476007)(186003)(8676002)(2616005)(2906002)(41300700001)(66946007)(6512007)(86362001)(66574015)(83380400001)(36756003)(31696002)(38100700002)(6636002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdIT2M3bXRZT054UGJ3R2RVZnR5Zm1VdVpDMVJPU3dadVhSWGtjTWw2Y3lX?=
 =?utf-8?B?elI3Rkwzb294TnZpdlFOczRIK0psSml2Z0RZT3d2bE9BMzdBTytQNEl1cS8r?=
 =?utf-8?B?KzJKSldZTjJmelAxTjRSQ0NyaFNnQ1E1RFVuaDc0QmxQZUJlWjVPbzhIbGlj?=
 =?utf-8?B?YTNDb1dKRkp5bCs2SVJDVmdLRE5LVVRIVG0yUG5LeTNjZVBVTkNoODZWWE9y?=
 =?utf-8?B?L05XTWVkbjN6ODhyQ1E1TkFJN3NMb1Z6NFNoQnZRMERvN2JsbzN6UXN0WE9I?=
 =?utf-8?B?Mjh0UzV2VUVSbEF6K29sSE5HSVFtMXRpNG44eCtVc3g2Qmtud3pxSEFaN1Fk?=
 =?utf-8?B?MmdKcnVrc3lrODNkTjZoUDdpT3pRQWtaT2Rvd3NRUVV2d0g0UlA0MWh1NEJE?=
 =?utf-8?B?cGpZUWl3WmFkcGtHWDU2ZXZ1M2hVRm0zejh3ZFRLVCt3OVBxaEJFNmdGREQ3?=
 =?utf-8?B?RTVULzVLbm5Gc2ZocDdmbWhMcHBhMWNuYytkMjB0TTA5dC9SK210VWF4a2VV?=
 =?utf-8?B?RjJmcXFJbGFVSllrNThjNXIrZE5oWi9Ba1JSZzFRYUNnTlI1SUpxbGhZSTlR?=
 =?utf-8?B?bm5qekxXTklpelZpOEVCOHl1d2NYMGcvMk8waVJ0VW1EOW5rQUdIemZkZ3Nw?=
 =?utf-8?B?dmtwVElXSHNMcHlURnhDb05YRlFOYWlNMDMyTktMbnBJZXcrbU00dUo1OFNW?=
 =?utf-8?B?Smh3MzlJbERicHU4RG9maS80ZVRhejh0eUdJRjRxOUY4N09NQVF1L0ZzOFVY?=
 =?utf-8?B?MDRlVDltUm05OTIvZElPRmd3WHl2N01hZ2dtcmN2dkZYUGloTXM1RW5HRmJX?=
 =?utf-8?B?c1pBZjdvaGhwUHhCK1A3cWhna3crTHhlZVpSTWN6U015b1BCSmQ0c2plZW9Q?=
 =?utf-8?B?NFhpc0h1YldHdXRxRnFZL3ZPa1Z5YXI4SVlONG05c0JRRWpaVmtwLzJjTlJR?=
 =?utf-8?B?T3FtUGdwVnQwSFhuNWk1cm4zUUFXUWZJYkF4aFNQUGdvMEl2bTgrMEo3NHl6?=
 =?utf-8?B?OUNaQStxYUNmelFqbGg0Y2N0aGZZd3dxZVpJN1RTeTRObzJBMFptMlpyRDZC?=
 =?utf-8?B?aGdJM2F3cEtZQ01pUkZzQVd2QXNWT3d2Zlg4UFlQTjRCOXZSK3hNc1RlK0hJ?=
 =?utf-8?B?Q2xLZDU1dEZhSmJQUE1pZCtuQVBzZ1J2Mzlpb0Z6L0tmczhBNG9IRHlWa05v?=
 =?utf-8?B?T1J6MiswSkM0cTN4Y05BTUg5ZWUySjRJZEFiWGU3aHRCT0ZzaG1CanZOYVNK?=
 =?utf-8?B?alVBaW9lcDRrOVhZM1ljN3k4eEd2aUkvWGt2dkRMMlRDNUhBZ0p0dGFXSUJL?=
 =?utf-8?B?VU1PcDVucnVMbFA0b012WWMvYm9zQUZMOWVlTlBQU2VrWklCV1dXMlBqZytS?=
 =?utf-8?B?M0FISjZCTlVvaEZaWlB4eEJVOHlBaGdTdUJyN2hpU1hXVmk3ZWpVNnVUZm0x?=
 =?utf-8?B?ZjRSRjdmM2g1MEg1OWROb1hWM2J4RzBpVFhjZkZPZU9heDlxVGc0TEdrSWwv?=
 =?utf-8?B?SWdXMkpjMU8wQUtLK2VtRGJNOUx2Y05FYUF0Ykc1bFBEaWx0MndibjdUc2Jz?=
 =?utf-8?B?WW5FUndjWTNJZnRROHQyU1VseFFzaHViT2dUNmo3dmdmdmpETnFKVU5uRThG?=
 =?utf-8?B?Yk9kK0tSYlcwbXZXbzNjMTNYS3dVbG51QnF5cnh5bmg2WTBRYk9jRjRrYU15?=
 =?utf-8?B?c0x4eU54c21lU2pZcVNQOHJqQk1BTmJXdnhTN3dlNWRpbDB4KzZRWVlqVmlT?=
 =?utf-8?B?OWt4dUVHVVhVWC9DcjF0L2dEd1VLTkZSay95UXI3QkV6SGR5NWMvWVpGMEdZ?=
 =?utf-8?B?czN3bTZPMk4rbjlWUUpMYUVLUlNLSGxPMkxoUFZyTC8zSmROV2NteVh4RXQw?=
 =?utf-8?B?cHVXdUF4L05MQW81MDkvY3lqby9LcDFnUDdsNVNEOFEzdW1vR1RsNXQwTmVh?=
 =?utf-8?B?bVJ3UlhVYmJhRlpHWlZXN0FvbzN2dXFWaDJaNkZlT0FUNTJoVndMWTl1T3NQ?=
 =?utf-8?B?ekppT1JnYUZmaXZWZFpESzNnLzhUY2ZGMWI5Y3NtWWZ1T0lTcFZjU0VvZ0xK?=
 =?utf-8?B?UHVzMjlwTkJ1MUxCcjNEeFQrNVUybTNEVlZzLzhYcHIwd1dSMFVHRmV0TUY0?=
 =?utf-8?B?SllrR3BhODU5cFZCOFlSR3JmZXZjV3pQZFBXYTFnVGM5U3JaRW1Hc1IwYWUw?=
 =?utf-8?Q?hbtC2DRFbTM0TYJkxSQvJnRgR0+GCT04pfEaIPgCCwSc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92641e65-e760-4d9c-b5ed-08dab11afd6f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:11:10.8069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxsy9AD/n6XHpM6iiQTYHcBqE0zM7RPQM58nugreEnPKNQ50THskIJXbzQ1Zxzvc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631
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

Gentle ping to others to get this reviewed.

Alex, this is fixing the TLB flush errors and I think we need to get it 
into -fixes ASAP.

Christian.

Am 14.10.22 um 10:15 schrieb Christian König:
> Setting this flag on a scheduler fence prevents pipelining of jobs
> depending on this fence. In other words we always insert a full CPU
> round trip before dependen jobs are pushed to the pipeline.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org # 5.19+
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>   include/drm/gpu_scheduler.h              | 9 +++++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 191c56064f19..43d337d8b153 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -385,7 +385,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   	}
>   
>   	s_fence = to_drm_sched_fence(fence);
> -	if (s_fence && s_fence->sched == sched) {
> +	if (s_fence && s_fence->sched == sched &&
> +	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
>   
>   		/*
>   		 * Fence is from the same scheduler, only need to wait for
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..f01d14b231ed 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -32,6 +32,15 @@
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> +/**
> + * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> + *
> + * Setting this flag on a scheduler fence prevents pipelining of jobs depending
> + * on this fence. In other words we always insert a full CPU round trip before
> + * dependen jobs are pushed to the hw queue.
> + */
> +#define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
> +
>   struct drm_gem_object;
>   
>   struct drm_gpu_scheduler;

