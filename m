Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AE40FF74
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7536EE5E;
	Fri, 17 Sep 2021 18:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E86EE5E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ei+gahmdH9gKsAPMaQMbm2anHXBAYVzxXCnzYMvdwTjua3gIrEluRftihNHk1yCANYEKZj01eBC3A57u0hBVYj50rGF33wKXLDz44S73c6i3ewOS0kWwDY5YlYoqfKHSL2YAKz9kakkqDFirBFFvGLD7fvlZUPHkr84AF+Knh7SlGsvC/uwxha/dajKhLe6uV7P/ak6ZMAkTMhji/yD4EFzEwX5E+IbatgTxI9GK6UF0aZVpKRkdwbdSuEYUKtHgJyNVXeB8+P7eDp4AkiQ+Qzw/HzZYGwNUoox6QIsLFm8hG3sG+ekisD4q4pu3SbZr2QGOELty4RArPWSlicn/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=REcpOJ4bZCKWcgwUV7PN5OgFocPqBVgwAlfLZvc0hIo=;
 b=SXi4YdF0lW3cL8eqL5niBP6/uffRe7E4ENvEt+BN5M7x7rYfiKKdvhpGcrJn6Nv22GMTcP5+JevT4Kja4GJVOBpo3NnEuPz0cx8N0BE/fMWoXLFEpK22H6IyrQ0hNXQavTLwR3ApSA1IUOEH8zhEX6BFL797Y/ciQWNWnJo88kAddP492n9/zThGb/ghFRUQfHYBcF/VIvXR8qx1m98XbGxJmMNRaOuw3MyZDIKlw2SWCEJeNAflc9Z65kSYuEzZ5+Tu/DUiV9y1QFqCqIT0tuEqvLbGTCZVjNxwKveV+vrFluuetIm4xsNmtLScLPio74zSEqJquT1gO/8Nb5hnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REcpOJ4bZCKWcgwUV7PN5OgFocPqBVgwAlfLZvc0hIo=;
 b=gz6TuGjk7cGXhAaYz7uqk2l1ag8Ky2jrDRt8VKNc/GT0hav8hJlyvpPhXzm2/3PhlQLFGKFeBcbqllRPrY1D14X/91uyLC0yi1eV4PPuGh4XKXZhB41cUMBl6AfR+/rGPXtyPHHI7J+QGeHHF1w47Odu2cYH8U39+cPIrEzLmWI=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 18:34:34 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::209d:702e:6613:9d27]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::209d:702e:6613:9d27%6]) with mapi id 15.20.4523.014; Fri, 17 Sep 2021
 18:34:34 +0000
Subject: Re: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210917175328.694429-1-zackr@vmware.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a6a54db6-52f5-7c36-bfa1-837ce0105773@amd.com>
Date: Fri, 17 Sep 2021 14:34:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210917175328.694429-1-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:a21:4904:2446:825e]
 (2607:fea8:3edf:49b0:a21:4904:2446:825e) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 18:34:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c5bb4a8-b927-429e-daa3-08d97a09cbad
X-MS-TrafficTypeDiagnostic: BY5PR12MB4227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB42278BE90A64890FBA20E79EEADD9@BY5PR12MB4227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYO527f1EjdTLgurSjju5wAoMYOIpwJkZ9ikyxguZJnOK2b8umzzLWg/D/6l5z7UCUvO44db1Lxz6i8o2BrqbLiWVg40BvNr0CKQfiG/K7bm5EoplzBZTNBdn5H5BATfN3rPM0LP5MA6DsTUYSXwTV+yUUY/IGmgIS7UDKZBp2J98kKWP/1v2KJhElUG/NFq3EsZMQS4SCP1HMfuzHPURDYzgXVY7EF0o38SPXl6TXtLVscvG05421scgZ78A9peYF19tEwtFYvLImXmCJPFQTzHxAe0aOlZu3/HZiXi3egDPYR9VM8VX2FKCVxwyJkr59ktmu+//FgBuH2x8KoE6BO36mS2mPVQf8YhExt0lB483j6wu655Jo6D1j2C/dc47qVoUdhl270pgNSuUfMxO8TEj7+pEMiHkSOKvhoGKYVWYwhlHfjlSI0QYLH/WaJ2CwoNYh8baX7d9+GqFLL5gSuF5GbfJuntXrz8Jc5vg8bqC2wfDnAHH96nDdNxqKkQSyLxDOqxCFLJ50hSMouhTrgiMdopCs2ZDMzpPkMn73xCW0Q6WabS8khm+KVwtzJKp99Q7lcfDBB7/31abpNjFcIYbLguUuf06UlaUIUmuGexm9vJTi5US1TJ59WQQ1C8kenD9+3KaXoyq5IV5OFD0oy/XgJx75aobgUOgS9VRxbzGHR41WhWhnSU2hj/CQHtLMliLJ/wftcGNpJFwZsbJSLSp5WUJqg5NrwYWq4ZlYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(83380400001)(186003)(53546011)(31686004)(8676002)(316002)(66556008)(66476007)(66946007)(8936002)(6486002)(5660300002)(38100700002)(508600001)(2616005)(36756003)(86362001)(44832011)(31696002)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d012OXY5dHNUR0xVT2FlY3AzL0VpR1hQNm1OeDdHMTN6aHBtT1pxSVFIS2Zp?=
 =?utf-8?B?a0drbW1GNHJqT2Nnd2J1RWhiTWlQd1EwWmREZ203Wm1odHk1a3VjbXlnWHNL?=
 =?utf-8?B?QzNnc3hlVVBJODk0a0g1ZkZmbTRxMUIveTFVNWtHbEowUjcrM254QXNiUnRm?=
 =?utf-8?B?WVZWRHNsdWJ0cXVXZzN3SzFJS2h2Q1R2dkViSW04cjkzZFBtRlIrc3RvNDRE?=
 =?utf-8?B?NEcweUg2a0U3ZENVTU1iNlRIM0l0eS9FdndidUxZa01NMkxUNjJvc2FxdFFH?=
 =?utf-8?B?UHFIYWFLS2RkQ1ZveHJ1dFBEYTRjeXFSYVpJNWgxQXpHb1ZOaFdQMnloUnlo?=
 =?utf-8?B?OWhRb0FrMVRIci9taVFZQW1CQ25ZZVV3eFMvRGppWUs2RTUrYlA0NEV0UndI?=
 =?utf-8?B?ejRmVjdIL2tBUEQ2L2w1NlU2WndQZU41QTZJOGFKWVBtMjNMYno3ZTlNSjlT?=
 =?utf-8?B?dGdEbmQ1eC84S1VYbEFxVHZnWmJZMjJrOFRPVzNYUFQxQjk2NFJxOWJYeEQy?=
 =?utf-8?B?NDV5L0lFQkRuUzJnLzE1OGxZWUtjWjl1M00raUVxRjkvK0hPY3Z1VTVsWm5o?=
 =?utf-8?B?L3N1UDh5WFdpUnFkTzd3UDhIM0s1SG9hM1ZOZXpJN1BLbnBFVENjK0pBQWV1?=
 =?utf-8?B?MVlsZ3dRNkc2QU4rMFJaaHlLSkRJQW1NZ2IyQVYwcXdzZDY2dmNwOU0zVm5y?=
 =?utf-8?B?Q28rcjRaZ1RyS1RLZ20yTHdFU29YVktPNlRCMlQxNUlHOWRGQk8zbmVySUwx?=
 =?utf-8?B?b3pvai9Pck9XUXg5WFVDT2ZOVGQrdStTUldRMTJjdkpYWTVwT1BBcGd3MEl2?=
 =?utf-8?B?RDU3akJtZm5IZDRSbFhkZ0hxQjFMU1BwTjFuSEV2c3pYR2o5OTNOWUE0Wk80?=
 =?utf-8?B?QjJKWGhUMmt5ZEVkeDVpY3ZmVE1lSUk4SktIQlpFTFJ1L0xFOHUzZm1ONE1v?=
 =?utf-8?B?Q0hDbUJwSGhZaW44ZGpDL0ZKZ0RIUHUzNG5qY0dxZzRTcExZSWhnckNULy9a?=
 =?utf-8?B?R0ZuaUxnYW11Vi96TWIxTlFRbURxVXNObUs5aGM5SDBCR0Q5ZGdnVzlpbito?=
 =?utf-8?B?V2RmUnBDVU5nVnhiMHJKSENDbStHWHdaU0J1QlN6SUlaT0VrUENUT3I0Tzlh?=
 =?utf-8?B?Q2YrQUhPNE9QUytrcUtZTG1oZDltcjczNWpySXNsR1BmWFlub2lrU3dBWktH?=
 =?utf-8?B?emZ4N21sUWVpYnArVm5CcHhEVVVEOWJFOThLWVFRWk9QNFplS1V3cDF5Q25s?=
 =?utf-8?B?Z01GMmFHRFJKMmFUQWlmdXlqQUNXUmUrcXZHSFVBZlQ1a1dORXJITkVMaGVM?=
 =?utf-8?B?dllrVTBNcjJ2dyszR3k2TUY4dDI5cjFDVDRCbDRzWnFWY1h1NUhaNUI2OFVx?=
 =?utf-8?B?bml3YW96amo0bjZQOUJ0YjVLbWtVU2o3bGFwbU45eXg5RkJsRmNHaXNiYjdG?=
 =?utf-8?B?QlIxaWRqNzRmTTRmYmJVeHlyc3JBd1lqUUdpd1RPeTJBZ3I3SEJ3NnJtVUJa?=
 =?utf-8?B?dnZLbC96UGxQbng0L3QyQU5MY1hoMm9TVS9BZEEvcEJqZGExN2lqOE5LUzBn?=
 =?utf-8?B?U2p2U04zbUhZcitOYlF2Q0FZUDRvOWpDd2hWS0NsdC85MldyOGlHQ0FLeFo4?=
 =?utf-8?B?ZXczb2hjam41bWk1bTJXcnJ3aXNKemJpR1VIeGZnT0UyV0k2aXNxN3FGSW1W?=
 =?utf-8?B?MWZoU2RnSTE5akpuTXY5SzJmbGZWUlFLMklxYk5OajloMnM5eFZkVWJsR1BZ?=
 =?utf-8?B?WldvcE5hN3YrbUVuNlY5NCt2d2NmdW1aY2ZtcHhSWFVRR2lyb3FldGFWZDdZ?=
 =?utf-8?B?NnU3VGQrVkpqdWtUb1dISkFRS1BuNnpqaGxrUitUVlU4bXQ3dVBzbS9IWjJo?=
 =?utf-8?Q?1xphBH5A8Dupf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5bb4a8-b927-429e-daa3-08d97a09cbad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 18:34:34.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS6F/JsiPsSTukDnxxdfCP8N7iqltAPkWTI9X3lP0pQNbwE6UAFiEMdsWNFeGStBwQekPTvbm3NPGkXfeBb6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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

On 2021-09-17 1:53 p.m., Zack Rusin wrote:

> On some hardware, in particular in virtualized environments, the
> system memory can be shared with the "hardware". In those cases
> the BO's allocated through the ttm system manager might be
> busy during ttm_bo_put which results in them being scheduled
> for a delayed deletion.
>
> The problem is that that the ttm system manager is disabled
> before the final delayed deletion is ran in ttm_device_fini.
> This results in crashes during freeing of the BO resources
> because they're trying to remove themselves from a no longer
> existent ttm_resource_manager (e.g. in IGT's core_hotunplug
> on vmwgfx)
>
> In general reloading any driver that could share system mem
> resources with "hardware" could hit it because nothing
> prevents the system mem resources from being scheduled
> for delayed deletion (apart from them not being busy probably
> anywhere apart from virtualized environments).
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 9eb8f54b66fc..4ef19cafc755 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -225,10 +225,6 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned i;
>   
> -	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> -	ttm_resource_manager_set_used(man, false);
> -	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> -
>   	mutex_lock(&ttm_global_mutex);
>   	list_del(&bdev->device_list);
>   	mutex_unlock(&ttm_global_mutex);
> @@ -238,6 +234,10 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	if (ttm_bo_delayed_delete(bdev, true))
>   		pr_debug("Delayed destroy list was clean\n");
>   
> +	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> +


Acked-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey


>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		if (list_empty(&man->lru[0]))
