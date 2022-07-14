Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198A574789
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C74A3816;
	Thu, 14 Jul 2022 08:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF534A380B;
 Thu, 14 Jul 2022 08:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrOmMRKVCSeoXSYLFvRhEL7Q8ASt+ClxGE8on+boeXj16vhRsRjg5DNhFbcdq9Zvh3tu1EmuWJC09TgnQbdPuJm0Alpy+kTof7Bp+i/PEP4df28eslp+yMZYgLzx8zvGyWzm6VCA5eBQFTfG/oLgl0rrzIHIGOebbWyGbLXNLSe5Ah1AHYeGyEMj/69hlmme/PvBHW95qacbRhh8K2De6kZ8D8H8q4Kxg4s1JV07cHDLtrSLCpNfKhZtvbeYHBAsxxxhM4ocyQsR6IbvQf/fCyuX3t5zJTAxSsSBE7mQxUrMcbaFmjmk1975QgtPOrW32NnXUUInP0X/hmlwin32Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhIjWPzKmQt86le0XcME9raamf8KpGScOb53tDxK+iU=;
 b=Bhoa7RBBPnlKUd4VvRMx2QgIpCi9XU21qT5NtJx3IV55aBlL/HyAP/gbzXqFuchopqFhjHTfLK+1Tz6tFu+UGtZpqclLBDehh9FPMBeK3ynWDBeRJPxy8hEroApeBW0T4p5etMhS8XTTgxYr+YG0susmmwNLNB7VXq+KiZljSDTfG2HhhHXZJi8UNqzOd0NWOrRMpiq3Bj+GS+9MbAbSbovZJFt86Ag21ay/ePkn3uhcqKhueULHOXZtyvTLqrE+3ehdnuO7CPt+UQRfIvEs6DFPhwqwTyrKwHRLA33XLvITn19GgNy9EyfOS04uT4CpiLypCRurozoz/0KnKN6Y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhIjWPzKmQt86le0XcME9raamf8KpGScOb53tDxK+iU=;
 b=rN/N3487KtepS/MV/UiKus887UpGYQfv7wr7Wmb587S0r5CgokaCJpRMsS/InPYAOZEGQz3nqVkRBKqH84PY8LghxVG2AJS9YFFQvqG6UmIDPJI9ggrt+oig2RJFDjWUVewI/sziIjq4ySQY4Vb11swdFsefy3oikjwkEH9Do4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 08:49:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 08:49:35 +0000
Message-ID: <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
Date: Thu, 14 Jul 2022 10:49:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 360349d0-22ca-4132-6f21-08da6575c751
X-MS-TrafficTypeDiagnostic: DM6PR12MB3834:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SpM9gi1W27m+L01UIynXcjK6me/QizPLSHej04HptW4PnqDfkLeKk0nBsFqPCjgdeOXxvSXjVQLmniGxxBa9cERljgpnntovscNXYQ+Xi6UZ50SQavbYG+mJn0lRjEEcaVSiBkQ7wp30vF8WIJjqo56y8lzZUI/BOCHhloROPEWoL3JW31gSTrpRVepGci+7f6j8kDuaUk4VCpyMPV97R9VmjCz9c7xDKqocLNc1kOfPk//dGAvIq78dgLNwx/2QtpWpS6v/8MxNaPtkIiE4P74LriOI+46x7lteWx5LaaXtcZFLc+dgcvlmbpdgWIB4nCzC0+mBkqV3EPGYaTVtRokKDdAlC0+HguTRrs6guIn/pIZ9wSmzKiDRYfu+HdkZxTBj+mjNUjRMCdRD0xdtz6JxK0QXTFdkNyyozUfjiu+wHEh8WmDr4xkv6rQMaWQAyzMf2fwU2x7WDXqG909wivkSlyZofapAE0p/31LOtDnT+45kZszaetPX/KwucCEy1bsu39/GNnSPChd5gPVmxD5PBsVkDfSc20lJvPCR8jmOhx1SRslcXbrBdGuJKxgkNSzkVNSlLa6dKh5vJo8v7GMzoWJ2F5ou6Q2g6hfS3hjlcJUhsqAyKaPMTmIRQL3mbRjwrmEqa0WzklVlARtfwJEpHquIkH3gxqbXsZPfAVoGmvmHz3UBgy/QjMOo3iT14hR5QHD1tJm4J9XtRs7ESNzzO5Zl+WHpQHVzWRvLsAWQyqkHKMzYADTV40ZLT66edagNqrWzvHxM3Vx4d6gebDxP94R8LLweWP9hlqh4fGAhKtPoZsgjtreiYpz98hcM/aAno3GvZDiFdkji5NulqYsPVEjcXzT+dUCcxrXH7fQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(38100700002)(186003)(66574015)(2906002)(316002)(110136005)(83380400001)(2616005)(31686004)(36756003)(8676002)(8936002)(6512007)(31696002)(5660300002)(6486002)(478600001)(6506007)(26005)(66556008)(66476007)(41300700001)(66946007)(6666004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRKbkdRVkdxNGlUVUo2UXVwa2lLZWlmWUVQMFkxdHBPY3RDN3ZaVnJIRUo2?=
 =?utf-8?B?MmdwdlkwakEzQ1ZwODg3clNuY3dESTVTSmJXbWFkUVA2TDV4YjY3cGpjcDJ2?=
 =?utf-8?B?VEEyaVFDdlk4YWVuNTJrMVJ3MzZNTGdJcWlTUTlyK0ZuRDVUMGYrSkp1cVFO?=
 =?utf-8?B?ZWhEdGFSQjV4dUJJOHVwb2tkWGVGNmcvcklJVnYxZzMwc29kNmJ6bjEyVW9B?=
 =?utf-8?B?dFRmTUhleVVaSzdwdTgxTkRtc0lERnVxSmxMTGltN0dIS0p1akNkaTgrcGZQ?=
 =?utf-8?B?bnQ4NHVoS0RFODQycnVMZndUcStTcG93K2dkdEdUV3dsazZkSU9BQlQ5Y3NQ?=
 =?utf-8?B?dXZFeXpvaDFZc0FzTzk5U0RkRDgyRFh4K3R4MElXUTZZa3hGMDRtRm96dXZt?=
 =?utf-8?B?YXYycDdoUmdLeWpWVnhiLzM4aFNOVkxRcittYWJ2MXltQjQrdmtsbEc5WE9W?=
 =?utf-8?B?V0swSkdGRUs1NWVLaFZkeTFvRVliZTV0cjFSTGRJeUV1R3RKd1pLNHljMkFk?=
 =?utf-8?B?TCt0OHNwTCt0M1lEcVFvbmpDWm5mTDJmS2NLYzlybjVMRmozakZXc2VGZysr?=
 =?utf-8?B?eE1aUmhIMEhBRlI2NHB0Yk5wZDN5Wms2aGU2VmlaekE1Tk43aFFTYlIrSFgx?=
 =?utf-8?B?VHQyQXBaTnRpeHFIK0Q1ZEhxUTk0UllXZFBJeXJ5TEFucFpOZ1ljVHRGbnA4?=
 =?utf-8?B?ZGpBZ0o0OEFoT2ZzdWZqQ0pyUG8wNkc3M3RXMlNZTVNXekFiQ1M1VHVPYWFz?=
 =?utf-8?B?NnNmWk5sQkh4QytKWGNPaTkwcC9CeWtwNW5tUlN5NXg5T2tJdWZGKy9ETWRF?=
 =?utf-8?B?anFwbXBzOTNEWFI4Nno0eWRETkM0bDE2U2tHR3huVFpxTlJlWDRaQ2tuL1Mx?=
 =?utf-8?B?OFNWaGZhNEc5cUVTeHVRNzkrSzAyM0krZ0k4MmdLUXNxM1lac2tjeTJQV09h?=
 =?utf-8?B?Snc1VE1XZU9OV0doNnhKY21DVUoxVUw2eVFHSGYyaUEvZGROaWc4QjNrbkdP?=
 =?utf-8?B?cjQ5aENVRHdDdFFuUFhpWlBPR29MK3JNUWtTUUdwQ3FLanpIRS9CY2wzN1pV?=
 =?utf-8?B?bzBMNmRMYmxBV080SVJOeFNLOGV2dlZVZVRwMklyQWNzc09oWU84RXUzMEk4?=
 =?utf-8?B?b0RPSmlYYXJPYks5dHM5RXBuYXo5alY3OHhkZGRiRi8yTllJdVJQZ0RUTStB?=
 =?utf-8?B?MU5PZTU0bTBCc1pqRVVVRWNUYzJrNktHMU5CRER6VUtBOWp3L0k4YnIxL2VI?=
 =?utf-8?B?N1g0ZjJiVXhsdjZ2VmtmKzAwZkhoYXVKbEFpRlFZYjB5OTBySUZqQmNnT1pV?=
 =?utf-8?B?Q1lkc1hSYXg3UmYxaTdXa2Q3SXRZQkNoR1J6M1dJOEFNZnRiWmkvZnFuZk81?=
 =?utf-8?B?M3M4ZGgvdWsvY0NVdEZNYVNFNmpOdEFFZXFvMkpZYnp1V3Y1Nm1xSWpqOUxC?=
 =?utf-8?B?a2tQamY0c0oyZXFYNlBKZE84ejl5YnMzQUhFek02cXhhbWt0OVN0a1dKNHI1?=
 =?utf-8?B?akxCeCt1a3J4VjNEeVIrUVJ1aHJYMVVvOWdLc2c3ZWtQd3ZhbkR6cWJtUFFY?=
 =?utf-8?B?MWNwdC9UMXZjeVVDcmFGeFRTUmdjU1VRL1I1aExXU0lobTRvbkFDekZVdnVH?=
 =?utf-8?B?eW1WU1BFZzZkTHNyVzU3ZjQvdFZpOFlDVk1SUDNGK1NWaGdWZ1E4ZE05VEQ1?=
 =?utf-8?B?ZjIvSXEraVZ1aWVNZGRuNzNsaEZqQ0krbkJ2L2REWFlORGdpYzg3VUorR1dj?=
 =?utf-8?B?SkRvaGtxVmpTZ21hS0FEY215SXNTeFREb0FMTHJGTGdQSFdiQ1dQSUhlLzZy?=
 =?utf-8?B?RWd5L29iQTZVTUV0dFJDdURWclR3Q2g2NW5LU0ZkR3I5Q0tXa3RJWlBTYWNQ?=
 =?utf-8?B?T2xwamZ4OHBqZVFkdXJNMlZNTVhjZjB1T1Mzc2JaMG1QVkROcFNTZ1psT2Ey?=
 =?utf-8?B?UkFjbThaYVJYai9PV29USE81NHR3M2dnZU5pcUppdHp4T3ZqNUxWdkU4V0ZO?=
 =?utf-8?B?L3pUOUx2MEIwMEVWeDJQb043bnkvL1ZQdDBJL2lYTktWck5MZFdLU0VlNTVX?=
 =?utf-8?B?cnRKRXYvblE3U1gvaldvTFphY0VSTDQrTElKNm9wQU43Z0I0am5aVmgvcjZv?=
 =?utf-8?Q?UYmDu4BsQThkgdOnl3f1ifgvt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360349d0-22ca-4132-6f21-08da6575c751
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 08:49:35.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcKTMpaNGSrGtkIEKd73Klsz/EYWYCW5RiuzWI9hwJ7E7ahen1WBussbBoXH5K67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3834
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

Hi Thomas,

Am 14.07.22 um 10:40 schrieb Thomas Zimmermann:
> Hi Christian
>
> Am 12.07.22 um 12:28 schrieb Christian König:
>> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
>
> I only found this commit in drm-misc-next. Should the revert be 
> cherry-picked into drm-misc-next-fixes?

yes for all three patches you just pinged me.

I've already tried to push them to drm-misc-next-fixes, but the patches 
somehow wouldn't apply. I think the -next-fixes branch was somehow 
lagging behind.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>
>> It turned out that this is not correct. Especially the sync_file info
>> IOCTL needs to see even signaled fences to correctly report back their
>> status to userspace.
>>
>> Instead add the filter in the merge function again where it makes sense.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
>>   include/linux/dma-fence-unwrap.h   | 6 +-----
>>   2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 502a65ea6d44..7002bca792ff 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>       count = 0;
>>       for (i = 0; i < num_fences; ++i) {
>>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
>> -            ++count;
>> +            if (!dma_fence_is_signaled(tmp))
>> +                ++count;
>>       }
>>         if (count == 0)
>> diff --git a/include/linux/dma-fence-unwrap.h 
>> b/include/linux/dma-fence-unwrap.h
>> index 390de1ee9d35..66b1e56fbb81 100644
>> --- a/include/linux/dma-fence-unwrap.h
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor);
>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>> dive into all
>>    * potential fences in them. If @head is just a normal fence only 
>> that one is
>>    * returned.
>> - *
>> - * Note that signalled fences are opportunistically filtered out, which
>> - * means the iteration is potentially over no fence at all.
>>    */
>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>> -         fence = dma_fence_unwrap_next(cursor))            \
>> -        if (!dma_fence_is_signaled(fence))
>> +         fence = dma_fence_unwrap_next(cursor))
>>     struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                          struct dma_fence **fences,
>

