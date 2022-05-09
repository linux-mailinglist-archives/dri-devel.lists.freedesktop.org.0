Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F4520099
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6C010F21F;
	Mon,  9 May 2022 15:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863C10F21F;
 Mon,  9 May 2022 15:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNJCV7jBgM+gSQZ+fWBHzXg7jVx8mmY1g5hE96nSjXDAqdLEQzPuO4R8CRLhkXH59jUDIB0GYxE0FFimi6P3ojvQbo/Dwelkqd5HC7Dv2ndld5G2ONwJ3aZgTFvo7XCnTJB1sfCkr/M+qUreLVJT4HwrsM0eHFAfbe7RO6ANEVdFocUBg1TJCoyTjIky5Gb4qbevYDnBkEY4/AQkeYuDdkDua7hK3MyGpu2eTrXGWBrju+wKa/H6dmfRs35vkoemHLdK5SC7VPnBLDi/Zfsr3bWxBJEZfD7O+ZOxb8HuNKZwPj48442KeeIl4lCkg+goMLxgmjKcAORlr/ZVYIImMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raoap66GAfr5cxggWwnyJ+2wl0syAXza8XzOpuTMCjA=;
 b=mdTuE2jN3UzH9FLjtkWki0mYIU9dP8o0HrYn/dilYNTTWQxV6lGHm9031RQ7W7alUE17v0NZcPogbYyoVYPMHhfddCRyFyB7ftB0ON4jbCwnIE+nwh8+PBfDLueFV5WGXmKg0ieyGGZVh7fbgf3GQdm7ALwxglPIomdnOE2S4gwVjjxhGq9/XJkfbAZJ1dB2AS8b5Yven6kHDp/ufo7S6IKsIjqLja3MUl4gA1WxnM/kIhKFhbqNPjFF+ZKkebeTlJFsPxq8/rHHn97hmfVVlrQgwRuKIfv6HCS+71Y5e4Iv1l/hqLe7oXbWCKoQCOxH/DJkxbMzqBx2+cCuB8PZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raoap66GAfr5cxggWwnyJ+2wl0syAXza8XzOpuTMCjA=;
 b=aombAbqaAgjELC+/BwfUDuEb8s8rJbJxwkCNjUx0ns9WzPDqFEsT3sAOGMixsiDuTeQ7FgejnM94cohwR0CXoB46MHBLTnrtEZ2X32INOquzK8pjqiMyl1BAvsPavvsBAuYO48uhsKm09f0u+WgTuYYty4zhjxvE21ahiCq9BT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Mon, 9 May 2022 15:02:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 15:02:17 +0000
Message-ID: <0d1ea5d3-3624-e9d6-3dfd-9b0186ae757a@amd.com>
Date: Mon, 9 May 2022 17:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 8/8] drm: move ttm_execbuf_util into vmwgfx
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-9-christian.koenig@amd.com>
 <YnkmLI1C7yc31eW2@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YnkmLI1C7yc31eW2@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0095.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::36) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d045d5-d6a9-4f95-61fe-08da31cce863
X-MS-TrafficTypeDiagnostic: DM5PR12MB1355:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1355C37182ECC2F19B6AF49B83C69@DM5PR12MB1355.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68VFB+6ccX95LjCQPxbn6c3gZF2pPXDImMm6XfHDY4vxk6FcVDeNumZV0PyQVrng18K+OEdh5zHRQ4SiSWlAnNiKk8l0QTj+3wZWUZDV9i/Fpct8KhuUpjagzQ5XtRSHlBYGfSSCG8XJ0qi8gDGjZBHMczFSVmERgffyoTiH9IcFGOMnhbmWKFZ2mFnClq3ZeNApcIzYJ9Hu3iDuCBzPgtW6tPR8KNaDSiCI9RWI89vbIx4zMehuO0ll8L4CVowXttnIROmmrdRnvnAvDaObvjh9g3Rz0NvfW5LruBEVpNj0qRpWLPMK0IoAsgcbw83Uas+PwtCgL/XnhPVhbYDHheLvi5/KtV/eSNkzur4PqUOabzkWb3iEAjq4O3MkuD6gBbZHNyqy/bUgHiEe2TTKNw4MRL+YaIs4MsERHlsfDdxxvYFKMhEPrmgcUu+Kow7d2k+lLzI+5sNsvnz1T67yLZXqmEI/WQioqvG2Azes8/bufttlDAjLiUkTHxoAyQzWDETxd57vM9vPswVqmGk0w6EeMPf6Az1qyZWQz3VCu6GhHgXtzOQdwzh2ETmFyyVDb2uxOA0YqVlP8wNs0p7T7I8oWn9fR+hwsglG0Ru8OhC4frDKKPt6EVLlDWWAewK5KurQbF9W3hGEOHVGJRBUcLScn5vKJcoBDwlkJzOETRl/aA2TJoKkNfWBQ12V8Y0Z5migcAyfCiz5QVxq1TgKNbkdVh/4TYggh6TZ+TmaZWw1oH3OsfFTcDyS0ZR0v2l5qmToZu+TzybwnwQa2xWj3iuCLguHlhc9vwSt4aYNFLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(6512007)(66574015)(5660300002)(38100700002)(31686004)(8676002)(4326008)(36756003)(186003)(66556008)(110136005)(66946007)(66476007)(316002)(508600001)(31696002)(86362001)(6506007)(6666004)(2906002)(6486002)(8936002)(83380400001)(17423001)(156123004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlxWWFmVGR5bHMwODllUUdvWXFWRG9PenQzQjJ1MWxGbWNhc3hCcllFeTB1?=
 =?utf-8?B?MGxvNzNBVUwzdW1QN3NKVlcxek9GWjFMSDh4MHJBOG1sWk1mUFQ4MnYwc2xH?=
 =?utf-8?B?L1NDYlBQdGROMGk5eDByVjJSbnZkUDlkSzFac0QybWxGKzd0ajNLdHFWRTZ0?=
 =?utf-8?B?anNjQTdNajJXQkd6Sk9RWEdqM3g5MUJmaXRTUTJkNW1yblN1dkc5bTJsNm1i?=
 =?utf-8?B?VFhMMkFjVW9rUkk1Y2ZadUVXYTJ3OE1lVHkvcUg0ZDVtWHdwZENRK0lWa3hV?=
 =?utf-8?B?bysxNG9hNkNmOEI3ZHhyTldkOFVyWmNEZ1duZ0V1bzJyMjBMYVBTTWdTNDR4?=
 =?utf-8?B?OEFnTDhoNWFUTlRmemhrdDhTK0dNODBMR1I5OC9HcXhnMFpxelJRN29aeGZC?=
 =?utf-8?B?ckNQREw4THliaWZMaEVPa2VtTTd4cXU2a1VqREJ6OWNramxSeVE5d0xYa2sx?=
 =?utf-8?B?bzU2UWtzbmRJQmlWSHFkbG9JZXRySXA0QXExQ3FvNHRtbmJaejJoT0ZDRFJ6?=
 =?utf-8?B?M2x2cGZrZ1FOTVlsRXhpOGN4ZHN0SnVPZUF1VXZCWVhSUzVvMnZuVTYvOTh6?=
 =?utf-8?B?TU9oYW5Yakc3RkJPWTYzSmFsZTYvL3FPd0xtU1VmM00xMnJUTzJJYmFMZEho?=
 =?utf-8?B?TlhlZzlhZnVXUjgvaWY4QURHclNvd3d0U3RsVzdJbmFJRlhYOG43dlh6N3JQ?=
 =?utf-8?B?NENxOU1MS05xVkVTMmZ1SktOL0NBM0VkcmVZbU00b243cEpOUE9HOTF5a2tq?=
 =?utf-8?B?Z0oyUGtKTDdtU1lIYW80VERvR1RtTkU4ZG1XMEVZZFFvL01GTzduaWgzNDdF?=
 =?utf-8?B?RXdvWGY0cTR6OTZGTnpGdXV0cTBpeGsrMWRYTnU2VzhlSUNWa1pjT3Fmc2xu?=
 =?utf-8?B?ZWw2UW9EWUFsMnFFTC9OS2o4a3ljRVpRYjEwaE5IdzlSUnVKT0EwcHM5U1RS?=
 =?utf-8?B?Nmp2M1VubmZWZkxMdm1iS3FkSndQTnR3dVdFWWltTTRMcTQ5VzJFaERENHli?=
 =?utf-8?B?RUhZWmFidjFuSzJHSjF2dnJ1UVRxYUtTOGdSNEJpbTU5WUR0VytuQlZtN29G?=
 =?utf-8?B?dG1pWllDajZRaWxiblh4M1VRdEhDSVdGSGZSajV0N2N5UmpXdkE2dVJTNTd0?=
 =?utf-8?B?dkZyY0FZcWtkcEdOUVVVVUNHWGtrMzFzbytCOWFnbDJJOGYxNTdjK1N6bVJD?=
 =?utf-8?B?QUZPT3BlMlhVL2h0R1I1SXZqOEpZY2lsV3FNUUlJZ1FYVmhDQkFIN0ZkMXNL?=
 =?utf-8?B?MEhUcm5DL3VzeUZNTzB5QjdyVGJjRDBmZVpmOTdmSy9qdzM4Wlcvc2pCeEdS?=
 =?utf-8?B?L1k4MllKclVCY2lJRytyTXY1YW1vclp4bEZlQWJuZUhMZjFtM21RTWw5dXhh?=
 =?utf-8?B?aUVYN3lnalR6NWlFelNEOGpnQUs5c1l5NjQxSXZWc1RCNjFrQ2h4eGRxSmNG?=
 =?utf-8?B?aVBPTnR4emlCTUtaL09hcm1TZEdTbzk0WlZOUGY1NkZLM1N4MHpEQlNBZGZI?=
 =?utf-8?B?NHBVWWRsUjVwM1J2YTVhb1pRb001MWRDVDlvMlZHTmVYRzJtNHpIWUFnQ0Er?=
 =?utf-8?B?MkhJQlNZSGd1ZG9WQTZ5TWxQSW9QSHJDMkhXNW1GUFA0SmJ3c1F5d2Y1ckhy?=
 =?utf-8?B?Q3Z5cG5tS0ZTUDIrK1VuTStVckFSZWM1V1hCTUxaeFAwZENkeGhrNmI0OTJ2?=
 =?utf-8?B?dEFRZldrRVYzYXBQYnlaSjNXZWJjL0pFWUhjSmt2dlNHYzFKbU9ISDl2WXQv?=
 =?utf-8?B?YTJFek1LL1orYzZpZnNNUEowNXZPV3krd1Z0R0FSMFo2MU5Hb3lZRjNDSjk4?=
 =?utf-8?B?SENISzc2NXovc3lKdTV2a25EUFZ4eko3aG9mLzNtUDNWRjVtSi9SVmJnSG9F?=
 =?utf-8?B?TXhQR3I5c0xQd3A2aHVpVHo4RDhKckxCdzQwNGs5aGt3WXkyejdUbGhYeUlS?=
 =?utf-8?B?bXpXRCtWZTJTZGd5WVZybERZcmFwdWF5d29Hb0ZuT29MUllwdU9ndDExMlRt?=
 =?utf-8?B?cEN4TWtHVThReDB5bU12UVNVWG5VeWZ0VjlGNDYrRFdHQkVlbEpKSDh0eFpo?=
 =?utf-8?B?d2NWOGdNMzhkL2R5QU9LZlkrZmJDUnhLNlQxMElWSjB6ZTMyTHFoZEV0Vi9m?=
 =?utf-8?B?QjVSNkRzT094eGdHcFlWeTBBN1dqdS9GZEpvVHl0Q09hNzdCZkQ1WGt1QUNI?=
 =?utf-8?B?dGx2QXo3Z25lbXp3RWNtZlp4RjFaNk1rbkpZTVR3Qk11RXZ6aUpIdWdmZVV5?=
 =?utf-8?B?MDZNcGk5akg5c0lyVkNmZEphU0F3c0ZuL0J4WXdmV2luSFkxRXRBaDlkVWZR?=
 =?utf-8?B?QVFwVUM1VW9WV0lWQThOS3ozL0NPaXdvRnBaMUZVdGFpVGd4Tk9LS2g2SnE0?=
 =?utf-8?Q?TfrWtAjh6NVqwWReKKRlRy6ckIs80DFFk3v76oAROWWot?=
X-MS-Exchange-AntiSpam-MessageData-1: /BZWWo65k0ouXA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d045d5-d6a9-4f95-61fe-08da31cce863
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 15:02:17.0450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/miy4CGCLtuf1pL8SRES0A9cmbsWvvW6t23ZcxdgU50b7UlOUuCBay0QJe6/MMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1355
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.22 um 16:33 schrieb Daniel Vetter:
> On Wed, May 04, 2022 at 09:47:39AM +0200, Christian König wrote:
>> VMWGFX is the only remaining user of this and should probably moved over
>> to drm_exec when it starts using GEM as well.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> I guess this is a bit annoying since it means we can't require drm_exec in
> ttm eviction, but we can make it an optional pointer in the ttm ctx. Needs
> to be optional anyway since we won't roll this out to all drivers, and
> then we can optionally use it to handle the locking in eviction instead of
> the current lock dropping tricks.
>
> I'm assuming at least that's your goal here, or is there a different one?

Yes, exactly that's the long term plan.

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/Makefile                                  | 4 ++--
>>   drivers/gpu/drm/vmwgfx/Makefile                               | 2 +-
>>   drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c            | 3 ++-
>>   .../drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h     | 2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                           | 2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.h                    | 2 +-
>>   6 files changed, 8 insertions(+), 7 deletions(-)
>>   rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (99%)
>>   rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (99%)
>>
>> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
>> index f906b22959cf..b05a8477d0d0 100644
>> --- a/drivers/gpu/drm/ttm/Makefile
>> +++ b/drivers/gpu/drm/ttm/Makefile
>> @@ -3,8 +3,8 @@
>>   # Makefile for the drm device driver.  This driver provides support for the
>>   
>>   ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>> -	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
>> -	ttm_device.o ttm_sys_manager.o
>> +	ttm_range_manager.o ttm_resource.o ttm_pool.o ttm_device.o \
>> +	ttm_sys_manager.o
>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>   
>>   obj-$(CONFIG_DRM_TTM) += ttm.o
>> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
>> index eee73b9aa404..c2c836103b23 100644
>> --- a/drivers/gpu/drm/vmwgfx/Makefile
>> +++ b/drivers/gpu/drm/vmwgfx/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_hashtab.o vmwgfx_kms.o vmwgfx_drv.o \
>> -	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
>> +	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o ttm_execbuf_util.o \
>>   	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>>   	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>>   	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
>> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
>> similarity index 99%
>> rename from drivers/gpu/drm/ttm/ttm_execbuf_util.c
>> rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
>> index dbee34a058df..1030f263ba07 100644
>> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>> +++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
>> @@ -26,13 +26,14 @@
>>    *
>>    **************************************************************************/
>>   
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <linux/wait.h>
>>   #include <linux/sched.h>
>>   #include <linux/module.h>
>>   
>> +#include "ttm_execbuf_util.h"
>> +
>>   static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
>>   					      struct ttm_validate_buffer *entry)
>>   {
>> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
>> similarity index 99%
>> rename from include/drm/ttm/ttm_execbuf_util.h
>> rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
>> index a99d7fdf2964..47553bf31c73 100644
>> --- a/include/drm/ttm/ttm_execbuf_util.h
>> +++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
>> @@ -33,7 +33,7 @@
>>   
>>   #include <linux/list.h>
>>   
>> -#include "ttm_bo_api.h"
>> +#include <drm/ttm/ttm_bo_api.h>
>>   
>>   /**
>>    * struct ttm_validate_buffer
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> index be19aa6e1f13..cae306c60af9 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> @@ -37,8 +37,8 @@
>>   #include <drm/drm_rect.h>
>>   
>>   #include <drm/ttm/ttm_bo_driver.h>
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   
>> +#include "ttm_execbuf_util.h"
>>   #include "ttm_object.h"
>>   
>>   #include "vmwgfx_fence.h"
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
>> index f21df053882b..3613a3d52528 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
>> @@ -31,7 +31,7 @@
>>   #include <linux/list.h>
>>   #include <linux/ww_mutex.h>
>>   
>> -#include <drm/ttm/ttm_execbuf_util.h>
>> +#include "ttm_execbuf_util.h"
>>   
>>   #include "vmwgfx_hashtab.h"
>>   
>> -- 
>> 2.25.1
>>

