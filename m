Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35472FEAE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 14:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD4C89CCE;
	Wed, 14 Jun 2023 12:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D8410E454;
 Wed, 14 Jun 2023 12:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHhGMHdjTac5YyOOSwCiV5Rjkwg8MN8acEUv7C8bR+gJ9nb/Tj1xEdF4BK4eZSUsaDPvq5AmDuT1W1vVmXFx8Mvfsnol0DdHVplvn/NIma/wdI2c34QkfuDQtgJM0wp0IFq0/4HNfyOjkDAjq7AmmP1GkP6uqa4+BoLKge1qP0p25CptolOXA2KXVXWrY+E9lJlOvu9gHyTtcyyQL25juklBCJOdysJx+AmPMZ2FJDzv/puALyuJ3WQp47lskBqSaEAy2hKW4pFTFJVHm59d6udcZxHeQoLAsESR0eKi2xbr5+i6tkGQgsXCEpgvq5s8o9gPtqurzgijAtbvH8t5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slN9NfTbqObByvKf23HlTJcNkZUEYD4Bw8FGoDP6fVo=;
 b=DcbxJSEtf3jQkfdFeMFqnNdos5EFIsbRjjeKuz/0oE8Vf25nqWTcdivTwMhEspeAddpw26LjFejwIO6ouyUv6Uxz2BWVyQZMUrgUVb5F3xf606g5QM810eP6M/uu/d16Qp5kzaVwcIQcp61EQiToB91q1FAojn6yqC0d/tBmQes19DkBktdkvfyi5CPuZxDXLmtO/2LUpSnF5KxdqYk5Qc2dZoo+DooNOSrMHsy60japBMDiWKeDRmjR3KCtJpa169lALhpbbFL0z27biDAg9S8CsXNekgQNiY53ScXLjwLOvCNNQLBNiNXaB6KcmivfeTNuBkUOeWvCZUvxxz33QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slN9NfTbqObByvKf23HlTJcNkZUEYD4Bw8FGoDP6fVo=;
 b=hP50ZxNVR7eF972IPAwlqbt0lUyBk9uOrPH8it5sUWFVmzLmBjss7yq5o+G0VPndbK/JR37bQx8oO45jKOn4TpMg2/ctN3WY1+/of/Cwd4QMKxRbZc6aDRe9S8usg1tJR451uY8/E6GUhly5PDawFdlRpfcHfLXKJaa74r1N/90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Wed, 14 Jun
 2023 12:31:00 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Wed, 14 Jun 2023
 12:31:00 +0000
Message-ID: <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
Date: Wed, 14 Jun 2023 14:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230614142339.04df5111@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4fb587-4f01-43d9-b6f5-08db6cd335d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVmn53oAeJYJZP5gOB8N1d8z3ftM6G+K0f3CQuxJY+Uq1P6ARg5muS5xuazdtw6DyIOo7cQ1O/Hnv3VKM7CdCFNqKey+hJeK/56gbvUqRs0mlebA1aI568U/nP4U5zBuzej31wnch1LYisuuatirG1LS/vgWwq3Zd7Tyx9sxOXHn0zl7mBA9KK+/GiiL1sI85VLzldXzVl2ePJrsT3rK/8mhOoa5xyesivQaQbUAVC5UcPT+Xr/oMgtwPPDnQsz0m4fbc75hMXYU6hJuhv+qHjiCmROt8tZQvpITOD7MczMrizWo5A/4NUhB6pC7JFA/D5Kr8hIhJoTLza9oCLFYJ5CqZ6dH6nPgPCaAUUIVbsvTASRFPPXCEyZ95vM1eLYKOetQxICEt+wzMTStW+buS4dmoLyXQAEyZzTcd5MKBXeGM+r/Lvi375ax9pcGcDmT1g7qlxIy0+Xg4suPxJmTaQWNYhB2acu68pvanyXkXUKRnBd5fFiXbzFeY9VQTBx29bsZqsRbY/spN+PQbzLBwdPL2Eof7DAZ59PnMxLT/l/k827BDGZFuUnfYxtL1bALKp0Nx9Lj6jlUdxbQOakJ0JhigNgCLBSwKhldbqe3m8HvgJ6mU2XSbTo3G1crfLB+L1qWoPglhHgAhwInGnibzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(86362001)(31686004)(66574015)(83380400001)(31696002)(2616005)(478600001)(186003)(2906002)(41300700001)(6512007)(6506007)(38100700002)(8676002)(8936002)(5660300002)(6916009)(316002)(66476007)(6486002)(6666004)(4326008)(66556008)(36756003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkIzM3BEUjJaV3krdVdkU09xNU80N0Iyd0ZyVkEwTXFXOGtTU0FsYW9jOWVF?=
 =?utf-8?B?bHlNOFoyQU56OTd2MjVMWFh1aU5CTUxCcWJLSUJFa2Y1Q0dSZERDckpNSXdB?=
 =?utf-8?B?QmNCZkRYQU9oZmVUZE9PVWg5MitianNiTFlTVnk0eG1Qa2tTd3ZLRW4zYStQ?=
 =?utf-8?B?WERrRWpZM3ZhRDcrejM2UEQ4WUMyTERId3JhSlkvOEdzdEh1bGVZQTdLeSt0?=
 =?utf-8?B?Snk3dlptVHhnVzVSRWpacHlEWG91dWg3b2pxQWplL2RmQ1lrNWdXRHd6WjRX?=
 =?utf-8?B?aUF3ZEszM2lKNzFMdEhpeWtndkZWMEpCQTdtN05rMTRsN3FNdlh3TWdlU0M1?=
 =?utf-8?B?ZGR5NmV1Z2Y3RFVqZHk4cUNCUGdlSjU2TVdweDhCU0orMEJRY2dnaEgvVmk0?=
 =?utf-8?B?d09CYnZIbjZlZWdoM0RibnlRYlVYYi9UQ3NBUE91U1dvMXNWN0xqZ2FjZ3Bz?=
 =?utf-8?B?TElpK1BCMUN1UlAzeFFrUk9GVk8wTndnd2R6MHMvdi9hMjAycGJ3RWlsU3BC?=
 =?utf-8?B?REt5emVFYURCcVZtWTBTNzVzZERXTHZsTGpORUl3d2JjbzMweTQ3aWpxZFJQ?=
 =?utf-8?B?amZHRHBNRHVFRE5rbHVxdjZXWXFXVG0xeHhmWkdYUnBWcmVMcDBMZlpaVlRx?=
 =?utf-8?B?T0ZmVldVZVZBY0RrM21OdWZUdi8xN1VEYlY5YUQ5YkRzWlBaS0lnZUFIMERK?=
 =?utf-8?B?SGpYbktocXZWSE5kK3d6Ymk3a0Vud0hlVThERy9ON096Q3U3bFIyNkxpbDZM?=
 =?utf-8?B?emNVNUM2WFVvRWs0MWFJbjczelgzU1RoQXhjMm5Gam45TDZMbVQ1YklXUmtk?=
 =?utf-8?B?S0JPKytBV2RFOWdoSjIyVVZDMUZWRUdOTlpuemE5NFJwaU53WWhBUWdJMkx2?=
 =?utf-8?B?b05XTE9xSTA2MHk4ZlUxZWhINXp6R3pQbWpUWTMxbWxuM2daZmhaWk0xQ3lL?=
 =?utf-8?B?R0lJRVREL1FCWFJhRFU1SFBIWWpUcDk2cVJoQk00OWVGOFkyY3JmL01qYjdo?=
 =?utf-8?B?M0d0Mmx4bjhUb25EMXVtY2FITnQwVEx6SFdwcmg0MVkwdGtlOXUyeHRRTzFX?=
 =?utf-8?B?ZjFqQWUwZlNUT0tqNkRpSnQ3SnBDMC9xUk1CR1Vhamw3UWUxbWNPQVF5TEly?=
 =?utf-8?B?WnU2SUZXMU5KSnB0OExDeXQ0SzBETGRNVmhJcG1jc2c2bkloVnA4QVlvUTlm?=
 =?utf-8?B?SExFK0pDSW80S0F5M3ZzU0NBTjV3ZG5nejY3MnFWTDNNTGVObzdQRERkWHgz?=
 =?utf-8?B?UXo4eTZyWVZNZHo4R1FheW1YMWhwK00wU0ZPUXd0YkR0LytLay9iaUQvRitt?=
 =?utf-8?B?ZmNlQTBiUllDdGZyZzJFcUwwdU4wZTVjM1daTGU2VkJhR0UxYmx0RTNreENE?=
 =?utf-8?B?T0pNVXRaSnB4T015aHUwOE9FcDdWUkVJWXVNeXN6SG1WOVNRK1RMTEI5aG1u?=
 =?utf-8?B?bC9FSkMwLzFUa0hSa2ZHTnZsZDhoN0tXMFFQNUZmVVJLNnp6a0ZLdUlTWHZx?=
 =?utf-8?B?N0xTVURiZlBuazZYMlZEbkFrbmNxRlVtRzdIcEc4cXUwRWdBbkVqdE1UZFlG?=
 =?utf-8?B?QXlDT0RwUlBIdjN2eDVzQ09KQXJjcGdLVUlKQUh6Q3JDR2FqQmd0L0tXMkQ4?=
 =?utf-8?B?a1BDL2FpcCtJazZsVVd4Y0hBcmtxWWlybWJXZGxodkpVSU1GckJwQnBUcVdE?=
 =?utf-8?B?OG1vT3hiQnZ6RjBEblN1L1FySUVyWUcwNy93NkhTYU1hQ2VoeXpTTHFISUxn?=
 =?utf-8?B?amNVN1p3QUh5Rm8wZ3ZoV3dsRzVtc0tQdEg3MmFNUTlwSllpbi83NEIyd1pt?=
 =?utf-8?B?V01mbTRRQ1dJQjJPSzNIRVZ5U3piQjJPNWExOEdJbks0UnFZcGhvSWNYTDZ2?=
 =?utf-8?B?czZzM1RlZEVFNWtsM0NSNzB4NExTbkZHZnMySGtZMW02c0ZEc0c0Qk9qRWdn?=
 =?utf-8?B?NmpDcjFrWHpPci85bFFBb0UzcFVlaDIxVE5uZ0tJNnNKNHU0ajhoOG94M3Zn?=
 =?utf-8?B?V1dxYlNyejFDbklaZlR3K2VmSHZqR0FKSi9UaDE1YWFRWWJFM0RUcU9YTkxt?=
 =?utf-8?B?QUVRY3VQZlluSm4wdTVtSm9qYWJnZnFOWS80WkVCbU9NR0pVaXhiRm9vbU1k?=
 =?utf-8?B?aXYzZE8raFpLanNsRldZak1EN0MyVVlyZjBRWGpDMHNPb3UwY3ZEZUJRR25F?=
 =?utf-8?Q?qWtqiVML2Eo7fYavU/iAVQk4fci4LmothcdSK3R8jdl7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4fb587-4f01-43d9-b6f5-08db6cd335d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 12:31:00.1627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8ldbXtdotyUjC+bOa718TqejgB7zl/HGVBG2xOn1r3OX1XpHBmSoko76Z5m/+Yq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883
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
Cc: arunpravin.paneerselvam@amd.com, felix.kuehling@amd.com,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, thomas_os@shipmail.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 14.06.23 um 14:23 schrieb Boris Brezillon:
> Hi Christian,
>
> On Thu,  4 May 2023 13:51:47 +0200
> "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> This adds the infrastructure for an execution context for GEM buffers
>> which is similar to the existing TTMs execbuf util and intended to replace
>> it in the long term.
>>
>> The basic functionality is that we abstracts the necessary loop to lock
>> many different GEM buffers with automated deadlock and duplicate handling.
> As many other drivers do already, we are considering using drm_exec()
> for our resv locking in the PowerVR driver, so we might have more
> questions/comments in the coming days/weeks, but I already have a
> couple right now (see below).
>
>> v3: drop duplicate tracking, radeon is really the only one needing that
> I think we'd actually be interested in duplicate tracking. Is there any
> way we can make it an optional feature through some extra helpers/flags?
> Doesn't have to be done in this patch series, I'm just wondering if this
> is something we can share as well.

You can still capture the -EALREADY error and act appropriately in your 
driver.

For radeon it just means ignoring the error code and going ahead, but 
that behavior doesn't seem to be desired in most cases.

Initially I though we need to separately track how many and how often 
BOs are duplicated, but there is simply no use for this.

>
> [...]
>
>> +/**
>> + * DOC: Overview
>> + *
>> + * This component mainly abstracts the retry loop necessary for locking
>> + * multiple GEM objects while preparing hardware operations (e.g. command
>> + * submissions, page table updates etc..).
>> + *
>> + * If a contention is detected while locking a GEM object the cleanup procedure
>> + * unlocks all previously locked GEM objects and locks the contended one first
>> + * before locking any further objects.
>> + *
>> + * After an object is locked fences slots can optionally be reserved on the
>> + * dma_resv object inside the GEM object.
>> + *
>> + * A typical usage pattern should look like this::
>> + *
>> + *	struct drm_gem_object *obj;
>> + *	struct drm_exec exec;
>> + *	unsigned long index;
>> + *	int ret;
>> + *
>> + *	drm_exec_init(&exec, true);
>> + *	drm_exec_while_not_all_locked(&exec) {
>> + *		ret = drm_exec_prepare_obj(&exec, boA, 1);
>> + *		drm_exec_continue_on_contention(&exec);
>> + *		if (ret)
>> + *			goto error;
>> + *
> Have you considered defining a drm_exec_try_prepare_obj_or_retry()
> combining drm_exec_prepare_obj() and drm_exec_continue_on_contention()?
>
> #define drm_exec_try_prepare_obj_or_retry(exec, obj, num_fences) \
>          ({ \
>                  int __ret = drm_exec_prepare_obj(exec, bo, num_fences); \
>                  if (unlikely(drm_exec_is_contended(exec))) \
>                          continue; \
>                  __ret; \
>          })
>
> This way the following pattern
>
> 		ret = drm_exec_prepare_obj(&exec, boA, 1);
> 		drm_exec_continue_on_contention(&exec);
> 		if (ret)
> 			goto error;
>
> can be turned into something more conventional:
>
> 		ret = drm_exec_try_prepare_obj_or_retry(&exec, boA, 1);
> 		if (ret)
> 			goto error;

Yeah, I was considering that as well. But then abandoned it as to 
complicated.

I really need to find some time to work on that anyway.

>
> I guess we could even add static checks to make sure
> drm_exec_try_prepare_obj() is called inside a
> drm_exec_while_not_all_locked() loop.

Interesting idea, but how would somebody do that?

Regards,
Christian.

>
>> + *		ret = drm_exec_prepare_obj(&exec, boB, 1);
>> + *		drm_exec_continue_on_contention(&exec);
>> + *		if (ret)
>> + *			goto error;
>> + *	}
>> + *
>> + *	drm_exec_for_each_locked_object(&exec, index, obj) {
>> + *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>> + *		...
>> + *	}
>> + *	drm_exec_fini(&exec);
>> + *
>> + * See struct dma_exec for more details.
>> + */
> [...]
>
>> +/**
>> + * drm_exec_prepare_array - helper to prepare an array of objects
>> + * @exec: the drm_exec object with the state
>> + * @objects: array of GEM object to prepare
>> + * @num_objects: number of GEM objects in the array
>> + * @num_fences: number of fences to reserve on each GEM object
>> + *
>> + * Prepares all GEM objects in an array, handles contention but aports on first
>> + * error otherwise. Reserves @num_fences on each GEM object after locking it.
>> + *
>> + * Returns: -EALREADY when object is already locked, -ENOMEM when memory
>> + * allocation failed and zero for success.
>> + */
>> +int drm_exec_prepare_array(struct drm_exec *exec,
>> +			   struct drm_gem_object **objects,
>> +			   unsigned int num_objects,
>> +			   unsigned int num_fences)
>> +{
>> +	int ret;
>> +
>> +	drm_exec_while_not_all_locked(exec) {
>> +		for (unsigned int i = 0; i < num_objects; ++i) {
>> +			ret = drm_exec_prepare_obj(exec, objects[i],
>> +						   num_fences);
>> +			drm_exec_break_on_contention(exec);
> I had a hard time understanding what the intent was here: we do want the
> locking to keep going on contention (reset and retry), but we need to
> break out of the inner loop for this to happen, which is what this
> drm_exec_break_on_contention() is doing. My misunderstanding was coming
> from the fact I was expecting drm_exec_break_on_contention() to stop
> the process of preparing objects. Maybe it's just me, but I think it'd
> be less confusing if we were getting rid of
> drm_exec_{break,continue}_on_contention and have the loop slightly
> adjusted:
>
> 	unsigned int obj_ptr = 0;
>
> 	drm_exec_while_not_all_locked(exec) {
> 		int ret;
>
> 		/* We acquired/prepared all objects, we can leave the loop now. */
> 		if (obj_ptr == num_objects)
> 			break;
>
> 		ret = drm_exec_try_prepare_obj_or_retry(exec, objects[obj_ptr++],
> 							num_fences);
> 		if (ret)
> 			return ret;
> 	}
>
> 	return 0;
>
> Of course, this is just my personal view on this, and none of these
> comments should be considered as blockers, but I thought I'd share
> my concerns anyway.
>
> Thanks again for your work!
>
> Regards,
>
> Boris
>

