Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C694E29EC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1329610E2F6;
	Mon, 21 Mar 2022 14:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D307E10E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmMSegdNQAnQ0Qg457lEGbxKUTRz2UnY2nIGZwFGR/X8afMIyvPk22evGmkGXKZtKbb4vWqGqcXQRX7Mk8aGENWoRAz+4Q90/B9oZNg6d4kYXGInNcr8UYpmaDHVPUV3Ihj1zj0A4VQrP13AyUdFpvj8I25yGDDZvpxAW2LOoRqvIlk3p3uC+6//H+lY2a7ctX5TBDXWwNeIjKVsJpivv1eOa7NkbXlHFC53+QIeh4qu0GT+k6qM5ppWmRguss03F/E9BXnSxoZZzDbGvV3fTYcUURDcjWts5tdWVjd+9W+UmVMhDOCW0Y28R9ihw1hLgm5GAp5FaxnDRn07bBC4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8NmsL/DXDjaf28y27J4JT8JViRjpp0yBwMB3H9b5dU=;
 b=IiwFAwcca9nLP1TIDnphvXVulTSOblW0NxsXTgjkxJ62v62Z5QXRPYM7O5aUJEv1gL0bYg1fb4XHj2x+ZYS3TJo1uDtPQNFJaKv+jkaU0XdJb9JngYrqbde5egKleRLndXw0sviVDgac1/AdyHpBhNCjF2eHra2GqRaQIdebQvJAXY4u5R2cjLri/DMxoPvMC+D2Pb+vlCz8GKZGQ40p5g3Ykkvw3WyvuUsLeIzJCY4DQNXf+PR1LsGPewzJGwgJTUZhK3jPzId44WkiZbbS6TjAZ/0xkfRDTBmCmPFm2/wus74iaowyjI6w2M5S6obSSBye11Xmx5lzzmBXGofEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8NmsL/DXDjaf28y27J4JT8JViRjpp0yBwMB3H9b5dU=;
 b=S+xhW/YTDtwyzsjSa/AWoN9gCqmeN0OS8kyiCdqLrjwgQ1y5YWpxU51HuvMforgKcNwsTHa6LawGjJWtqOqBUhLP0YQf8UI8dDdepSt9B7Q0F7PAfv+seuaIvRR8evgRudTXZEX5uqR3rGn8ad7gyU37RCW+mc9D+Q/F1ifAXp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB0074.namprd12.prod.outlook.com (2603:10b6:4:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Mon, 21 Mar
 2022 14:12:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 14:12:54 +0000
Message-ID: <ce7aef7c-01e8-d0d3-ca20-e0682400ecfd@amd.com>
Date: Mon, 21 Mar 2022 15:12:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-7-christian.koenig@amd.com>
 <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0041.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3813bd3a-838f-4834-d814-08da0b44e3f5
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0074:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0074BEF131D34148C8AAF9DC83169@DM5PR1201MB0074.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECbSbRrjr1C8M1lCAftaeUQiyQrvpRLHHAaasZwZPBTNyZoT0FZcuMtqvCdXbVv1EnCPBN620hkZ0Kxoj2PgRd8gZcvFYa422w61mCK7PkuYIEld8XtieLDHfGmGAZhEo7c5JVjCO3bx4+LBwErR7gSrWOMg+rx0LAXSaqzOSpDjgGASE6187S/lHcNCogVlKyWvbp0Gq8G4Ryh6JwT36JvEYwx37vDJ4Xx4jEs9LObT0dAgRU8TKaHO7wcRKdgSwlYBSevPXyqkGxnxxl40XJynFa7pEaUOeKkHdDkonHxwYVv6drO9C9N6cAwHWLBoTKlPT6881JE+nvYe88Uhr8w1A726pqD6tpDgkxTcLk+13W7bMICpFqpUum6jc6zdtp7nLERnw8TMyy+F1qjphq7adIwr5oZT99UnvOzk04qmU9XDIHb07PdKd4Kgqyq31XrjYM4WHGdXoaYoe+gftgKsLTay2YXiv4lgnXxekKZ7/z9X+6CpUz3jfZTsZ4ZBZiW/PDXfH7wq+t6XEfMVjwiOi4STnu2P243rw+I2eM3JYbbxQfLWlHly0f9Ds0SAV4KWBkR0yqcZCIkzx+HsEiiAvFBD0Ul5VUMCOZcpBbMMddMYFWOr8shIdtc4/oEioN9BEuQT+Uzu7cywC9ELESMtA1Fwe8fivUqTzk4zzoSDyIN+o+6ngEFa5hwoSKV4Q5fz+6pUoViypi30e0DhEifFrSg9VnpaYZ99UiWU26s4JHznwDd3F93Uibl/TY/D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(83380400001)(8936002)(86362001)(2906002)(31696002)(5660300002)(6506007)(6512007)(6666004)(36756003)(316002)(110136005)(66946007)(508600001)(66556008)(66476007)(2616005)(186003)(66574015)(6486002)(8676002)(38100700002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNRUVc3eFNLUzRFUVljcnpUSUcyVGZMUzBzWHcybktkTU5Ld1RzYTNWOUhV?=
 =?utf-8?B?WU4xN0tFa3lySnJNMXFiN0Fia2R2MHZodEV4clR0NzhNSEdDT1QxaU5WYi9S?=
 =?utf-8?B?K2Jtby9zalFLYUwvVndLakthYnZtQmFycVRWRXhzNTZBQmdvWUhRR05lQXl5?=
 =?utf-8?B?RVZQQ1FRcmVGVWN0ZTZXQUlRK0lWN3dpajZLbkN0Q3Q4ZnIvUUN2NkdiSTFq?=
 =?utf-8?B?NmtUY3B2enNqUGc0cExEeVJBL2FUaCtCWFdRUTFuY1B6aWZEdThPbW9rSVBL?=
 =?utf-8?B?SXpEQVVGOEs0WGZiUWVJa2ltMXR5T05FbGQ5aUdqN1hZazFFN1ZSNTJvTXRS?=
 =?utf-8?B?Y2NyNGczMVFkZDBvWHFEMFJFVWs5dUF4WWdCbEZ4QlM2RUpLbjUxbHZkTVhq?=
 =?utf-8?B?NVNUVDlZTkxwV2lGSjgxR1hhWUdjd3M2MDRodWJLTU5seVZWcHRmVE00LzZ2?=
 =?utf-8?B?RXBSSEdGaVlwVE0rdkxqK3oxQ0FPR3FNNFZVLzN1cXhrUGt3UWRvNytkNHBs?=
 =?utf-8?B?bXZpWHpsYS9sNkt6LzFRMFZBcUtPY1hkT3RQMU8zUjFYVGY4NWVWWFVpSDY3?=
 =?utf-8?B?MjBMZGlWcnVqeXB2dVA3WU9yNWUvbjJicllFSHdIWFc2SllSWkc0cW9nZ2k0?=
 =?utf-8?B?eUZGbGNyYXBjMWxybjRMZ1ptL25NL1Q5M3QxTlJEMTRXZFF2Y2hTWEJsbndU?=
 =?utf-8?B?eXMxM1I5QW5uUndSeTczaWxWcVUyWmFsRmxTVnBmM29zbVdkblRXNmRQSlZt?=
 =?utf-8?B?eXVYdWNOQ2ZaNUY0VFN1YmlyakcybjFmVmFBV1pCTE42YWw3eXpMOWNwY3lp?=
 =?utf-8?B?Qzc1Y0cyL2UxNkxLRkZwZ21HWjJPU0pEY2lGWkFUYUluSDNJOGk2ODJ0Q1ZF?=
 =?utf-8?B?K3JtOXpIYnF4TXJSeHJUUHp5UWF2RTlZZ3p6UlZaMXNHMFY2SFNxbVNnaUda?=
 =?utf-8?B?Z0lETmU1SW1oU00zTkYrdDNyWDVlSDZYcThBeU9ETGZ1aFFub09TcHBhYkFm?=
 =?utf-8?B?VUluVVk4VXkwNEQraWhPMmNWay96M2JGR3cwbEJ5L3NiTlNyNUNpUE1hYmcz?=
 =?utf-8?B?ZVFrV0FRK0w0ZGJ6TnVBcnUxdkwwMnNUWkNlOUk5L3JUNmNHZUp0MTVSZDQz?=
 =?utf-8?B?WWN1VXR2S2Znb2xuOHBYZU51R0QyR2JnaVVrWS9DUmw5UG5BZUlsaU1oeFBL?=
 =?utf-8?B?eVkrRjdlWW4zYlQ3anU5M0VVcW5ldTdaTkxEV04zQ0lPVzlhNXNBVG5ZeUpH?=
 =?utf-8?B?ZVRmWVcrenFIaFVseityMzBOUkZmMjZncXV1c3pIR2I5a2crRXgvODk2WHps?=
 =?utf-8?B?VkpsSy8wem5ja0tML0hMN0ZaUDQxRnJNZ2M0SjF3bHNWVUJYcFQ0TUVQR2M3?=
 =?utf-8?B?MjhIQUE4OEd6RFJTajg2OHFWa2hpTjNNeWtjL1RrZGpoOGU2bHVwR1ZIMlBD?=
 =?utf-8?B?N0NPUHd1NFBlTjBqd0J5RGpDZERWL1B6UWpyK0xkRDcxNm84THFza0RGZHRk?=
 =?utf-8?B?ZjZUNUxkOHZ5aFBIY1FIeDNLeGJHWUlaTzlKYnRYS0RlVEUvcjdYT2ljM2pr?=
 =?utf-8?B?TGtBWDFORHZZWGZPYnRReTQvNkJqMjVJQXpiaS9PL3ZxRUNyZzRDdU9YSnY4?=
 =?utf-8?B?Nlk4RitCRHYxYzNpazhLVWpaSmlXSGNEVFR0YW93L0xBWEE5ZzFFT1FvQlJq?=
 =?utf-8?B?a0xPSC9IbWd6Si9lTTAzQUszSkxIbG9RTHRUcVNPdCtlRlFxQjBoMkVIQksy?=
 =?utf-8?B?N3N0SlVqd2NpTmpVNFVXWWxudzRXY2dkOUFjaWcyQmlwQVpFcXRueDFyWitt?=
 =?utf-8?B?Z0VEdVBsbURsczQwR01UTjJkN2xHYjBBTXJObjBVdUowTTZFS0tJb2N5c25m?=
 =?utf-8?B?Ti9ZUm43RUYyUGpCaDFxQXpFRXl2OXZtbnc2UHdTRkdiNEpWeG1QVUhUOTZj?=
 =?utf-8?B?alJlakF5ZktxREVkdnlQeURmM1U3Y3BPNzM5UjdvWkdQdERlblBveFZ0S3Rs?=
 =?utf-8?B?NE9qSHg5d0w4SnVCUzNIVFplL25CZDdnajUwenRsRGhwSjN0aGRBWmxBS3JC?=
 =?utf-8?Q?gaD2U3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3813bd3a-838f-4834-d814-08da0b44e3f5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:12:53.9067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuiRBb5r2F9e0X/wpFf2PtrX0nv+6V0HasUngaofHiy8qSB3QEpg0JFfjj1l4JQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0074
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.03.22 um 15:02 schrieb Zack Rusin:
> On Mon, 2022-03-21 at 14:58 +0100, Christian König wrote:
>> ⚠ External Email: This email originated from outside of the
>> organization. Do not click links or open attachments unless you
>> recognize the sender.
>>
>> Instead use the new dma_resv_get_singleton function.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
>> Cc: Zack Rusin <zackr@vmware.com>
>> ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> index 708899ba2102..36c3b5db7e69 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> @@ -1165,8 +1165,10 @@ int vmw_resources_clean(struct
>> vmw_buffer_object *vbo, pgoff_t start,
>>                  vmw_bo_fence_single(bo, NULL);
>>                  if (bo->moving)
>>                          dma_fence_put(bo->moving);
>> -               bo->moving = dma_fence_get
>> -                       (dma_resv_excl_fence(bo->base.resv));
>> +
>> +               /* TODO: This is actually a memory management
>> dependency */
>> +               return dma_resv_get_singleton(bo->base.resv, false,
>> +                                             &bo->moving);
>>          }
>>
>>          return 0;
>> --
>> 2.25.1
>>
> Sorry, I haven't had the time to go over the entire series, the patch
> looks good, but what's the memory management dependency the todo
> mentions?

Previously the function installed only the exclusive fence as moving 
fence into the BO.
Now it grabs all fences and installs them as moving fence into the BO.

But what we really need is tracking if a fence in the reservation object 
is a kernel memory management dependency or not.

Patch #19 adds that and patch #23 then finally gets rid of the whole 
bo->moving handling here because it becomes completely unnecessary.

I can drop the comment if you want or just note that it is only 
temporary until the follow up patches are merged.

Regards,
Christian.


>
> z
>

