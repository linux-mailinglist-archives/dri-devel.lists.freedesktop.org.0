Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0F387D84
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CFE6EC32;
	Tue, 18 May 2021 16:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F716EC31;
 Tue, 18 May 2021 16:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuQompQ7wuT5kru3CLMdX49EuWIsZgk64Us1tz4QjOCsXbRts2AgfdcvuNdLbBrQ05t2Ykk8Rs4rImgAMjUU30bFR3ehpbjiChK6zVs1KQYcfnfjrFoge8k+WqMqFa2HJ4MgcIEwix7sr/ieZ4QoPlGut0XVr88hpUgRbWG2WhpYQEDFtq+/FAU6y3M9bbdON6lH7KAvvKht6oY7L46MqluDYTDpST1vLFrYc4L7rRyN4+dWErgrtl1edSPK8C8KEHPtMXI87mtVfbk0psr95HS9yt95jH8kkUQe5mg74tqoUv+roZ2U398tYBHccoRsIwN9dEp0A2eBiCWXK4x5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pSNCCxVKbOvtrpx2B+TtTDZ9LmzYU23V9EnHtMgIyw=;
 b=bJJbKKjD8Kl9sH1+8FIwtbvGHVjSutM/k5ZBItk5kKq2U50IiFuhYKvKpgoX8/lZ+o9SIq782QvnRtprrfzUMLbZq7kEP9jy4SHt3E8VeD8rjemyMfC4jScT2bdi+l1oM7fMlhZhuouXRbLPgWCuR5jEOV2yRyPdXNhe6C+ckZpKBaeK+dtN/ZXZzBprOOaFyFGnSUSB6EXmOV1M+17rd+Fjq4Mly0IP7QABKLyucQyVdYVOou1NEwN3/RZbiRB2AZQVgjmEaHFj9nraS6QcFQAqjUYftIrSnkn5P/bygzqzzfGn5dthz07/3nlgawMDceEPXuRo7OEJS1d+UcEoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pSNCCxVKbOvtrpx2B+TtTDZ9LmzYU23V9EnHtMgIyw=;
 b=m6fwnqoceHqUQ/YHAuD20xaw+bv2NpUnigJHlwBCjwrAjLgVLk1etvNsh6/oDGmaTFmgBK8eqfk3rnE9RME1PwSxV0RRFmRn/73HmStaaROQmGZ2c09rsyfVo6Fko0rEpmaCToLo7/d8F38ORxdZA0AcTSboYwxEVCmhbw2W9F8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 16:30:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 16:30:46 +0000
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
 <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
 <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
 <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
 <fb9a4898-5844-c1e5-7a24-cb50a9ad6df7@amd.com>
 <334dc2d2-2053-9e42-62be-58784e4256aa@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a627f340-492e-c2cd-f805-8fafdca8eb60@amd.com>
Date: Tue, 18 May 2021 18:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <334dc2d2-2053-9e42-62be-58784e4256aa@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: AM9P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 AM9P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 16:30:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001f6dbf-2287-4b6e-fe22-08d91a1a4a2a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223BAC2652CBC103714512E832C9@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5bDv00axUWJln6q6tiG0G+kCmkkDNlQ9vWTSKb06fVAuH4yyg0WfFC06ignqgt9wDSByDQhw+k2FfjPfmchRAJ3N8ogiS7kw3umD/qKZrRIM81MgjKpu48W9+UxXzT//000nHnnpLzyPdHLFdYLIYA2VoM3OZvKIWw3CyQBeOeodLpre3pllCDyMx0b3i7lbGhI3104nZu3kFessHB53dTwn7dhXjZy6Q8ckX+EiBM/7j/5sltT3sQwuJ1KwXZDq7DYbT9K6YMTGalp9k4uA2D2Aje/HDaR12xDpBYykQ6vkoX6UumCJ7BGahKMZx3Sk6TSFuBVNmonj6KzoBbZG7F+di9AbQMphnc1KNhuSFdeDS6H1TfUIrHO5b5k4Pc/wEP3J6fwJuwx9X1dLLAjhmaPRe8wi8W+iZGZWSUfXbTUoyuBLFE3Om64Bm0R2cFgkQQMQJIUnxNU34SpkM3NRmFhGMWBy81L+bavoJkWQIldBFh36+tuQ+nZL0/V0m24XdLAuRKhKHfoIXEjVo/NYC1owNzFjVI7qXAh35sraJCPhThrc4P/tidgwnRb4/3/ZLcJWn7vjz0TsR0MiCdKpjyk2jnsLSFBKyYX0CG6hmWBcsMFds0qobAC4mP0TQCkR99KIm3mNigppehSW/aA5olb4b2wnHTImBmjdVpb/QxiGJWinClnGYPMhrUXj8Vk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(66574015)(86362001)(31696002)(31686004)(5660300002)(8676002)(8936002)(6666004)(38100700002)(186003)(83380400001)(16526019)(2906002)(66946007)(52116002)(66556008)(316002)(2616005)(53546011)(36756003)(6486002)(478600001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUlpZEh3MVlJbWdvODVPYUwxWjhmMGpSSzdNcmkzYzUrSHMrOGNZL3lBTDV5?=
 =?utf-8?B?NTErYTdHcWQvYzk3d0Zpems1R3NOL1QybXd2ZEtTTFlLWEk3aFIzc0xLOVgx?=
 =?utf-8?B?aVY2NUtZQWY3aDY0RHc0WkpXeStCdFVIZjQvakVvYzUveDlFSWE5VmV2VktU?=
 =?utf-8?B?RStZajJJUGVaeWZOdlQ5WTJRbWZNTG5NWHJPLytXQmUyUjMwYkZaSlZFZ0Zz?=
 =?utf-8?B?OExaRnZ5Z05Rb2xUUTFHaTg4SEYyUVdxQi9Wbng5Nzg3NndZdU5sWkVQQ3E3?=
 =?utf-8?B?VmpHNEJrQU5OL0FaVjZqSmR6V1FOUklLUG51MWRuZnQ5bHlOLzNSaDJFY3FB?=
 =?utf-8?B?L2R2UDB1SEE4bkVrTGRGS3NuVG1yRDB0aFEwNGpseGhVNXFmZVA0Ti91MVk3?=
 =?utf-8?B?TXg0cTNmQWwzYi93QWp5czRBTEpGOW0yMlJUb24wOWkxL1JNREJrNmNpVDg3?=
 =?utf-8?B?NGVuN2F0WEU3RUdsV0tOTGxWaVMwWWlSanhBYUFZS1pQUTRTSDNmTVFHNlZP?=
 =?utf-8?B?SDM1V2tlWVhLTWhUMXpOTUc2WXhadlhHUDk5Z1Vya05RUEo1K2trZkxMQmtN?=
 =?utf-8?B?T0FBdGxiOEJqUWlwc2N0aVUzME42TStKSm1STXc5aW9PK2NtVlVXOWZJZ3hO?=
 =?utf-8?B?NkhjQk84Z0s5S1lyWDBZNFlQWldVRGp5eHdvSUhwZkJMeHhKL0g5cDNMcmVj?=
 =?utf-8?B?TXBMdGhEQWNENG5NMVZCMDFkT0srdHF0Y2VDZkVEZlB6Y1NKUmY1L3psVVRX?=
 =?utf-8?B?NUhuNSsxYzZnWFY1RkgrNVp4Y1pWL0FGdkc1WXNSc0EvLzdKdTBBNTJicHYz?=
 =?utf-8?B?S3hVMXVYa0NOb3RYUkdOK1BiTE56VDFTOWtRdEVpdjc4N1I0emJlQW1hOVVo?=
 =?utf-8?B?SG03N0dsUXMxVEpCazBrYkt0RTBpdDlkaFQ0UEdYK051NmxqNU81R3ZsdEhh?=
 =?utf-8?B?ays2WElSdlFYSGtCa3BUMmNSWGgveFV4SGFvdHJMSm5OY2JPRmdSMEltek81?=
 =?utf-8?B?dFNWYkJBSjE2NGJ1QU5pREZoaFk5WTJWdE8rdXdFNHgreG0wUFBORFNocW9L?=
 =?utf-8?B?aWIvekFYdDgvSzltRWRFSFpuQkFYa1g2WjBjeGVvQ2JuR1YycDVoQTlKUnpR?=
 =?utf-8?B?MlRKMFpwL3AwTXBBK2VpV3ZJdmZFSWM2c2FuTUc1alVZT09QckpIM1YybjVu?=
 =?utf-8?B?ZzlJZ20vODhWSnprWi82UmE3eEpyVGdFSEpmV1JGZCtnVE9FbmxYa0RNVHcy?=
 =?utf-8?B?N1h5UHZrSitZNElRQ3lQdjBTbTQxSUZLd0xJT1Rhd05NMGt5OVBVekxlN0Rk?=
 =?utf-8?B?S1phMW54STBRRXNMSTR3aThTSDNCMjU1bXVLY0JPT0F4MFJuUUh3cDE4ZlJV?=
 =?utf-8?B?c3c3YzdFZEw3Y2dVZEcrM3ZWWHVNSW56OU1WNWtHZ3N3dHo5bXNUWlUvL1ZE?=
 =?utf-8?B?cEt5Uml6czhsb29IOXdodzcxTEZ3SE5kN1FLQk5SSndxNElCNG1mdkxId1l6?=
 =?utf-8?B?VTRpZWRQT3F2d0VXanE2cGtxdmxKNjlZL2hrSzl2cnd5TVlnQlI2bmRGTGJp?=
 =?utf-8?B?MXp1T0JwWWM3WkF0b09uY1hRd1JOU1ZGaFhJMm5LeUxRaVRyZDdDNnBPaHY5?=
 =?utf-8?B?YjVZWk1zZ0YwQ3p0b0pHTWJ4dENLV2ErUk5xaGpOcDkrc3lyOWlqN2tFajU3?=
 =?utf-8?B?YWpvMHpJSHVXRjJ1OFdrYVY3UjNyV1dWSS9jeU9ENHlOd2dTcFlJNFhSTi9V?=
 =?utf-8?B?ZlpoVGFzbC9GUWxiWkdhNDF6R3ZvS3o5U1NLMzYzVFg2VlJtUzYxN2x3anpl?=
 =?utf-8?B?OVYzVUl2TE9YQUd6V1VzVWpLSVlkUTA1WEEwREdIRjZCMFlDdzRaVjNZSlh5?=
 =?utf-8?Q?VpMktcPBQ3rnH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001f6dbf-2287-4b6e-fe22-08d91a1a4a2a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 16:30:46.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH7ZFWbyIlZB3c5GtgGkBiTMx3bp6rLZ9Z2NwVE9koF275xdQgKcA6eApE9Ej6dT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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

Am 18.05.21 um 18:07 schrieb Thomas Hellström:
>
> On 5/18/21 5:42 PM, Christian König wrote:
>> Am 18.05.21 um 17:38 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 5:28 PM, Christian König wrote:
>>>> Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>>>>>
>>>>> On 5/18/21 5:18 PM, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>>>>>
>>>>>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>>>>>> We are calling the eviction_valuable driver callback at 
>>>>>>>> eviction time to
>>>>>>>> determine whether we actually can evict a buffer object.
>>>>>>>> The upcoming i915 TTM backend needs the same functionality for 
>>>>>>>> swapout,
>>>>>>>> and that might actually be beneficial to other drivers as well.
>>>>>>>>
>>>>>>>> Add an eviction_valuable call also in the swapout path. Try to 
>>>>>>>> keep the
>>>>>>>> current behaviour for all drivers by returning true if the 
>>>>>>>> buffer object
>>>>>>>> is already in the TTM_PL_SYSTEM placement. We change behaviour 
>>>>>>>> for the
>>>>>>>> case where a buffer object is in a TT backed placement when 
>>>>>>>> swapped out,
>>>>>>>> in which case the drivers normal eviction_valuable path is run.
>>>>>>>>
>>>>>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>>>>>> that are not populated. This allows a driver to purge a bo at
>>>>>>>> swapout time if its content is no longer valuable rather than to
>>>>>>>> have TTM swap the contents out.
>>>>>>>>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>
>>>>>>> Christian,
>>>>>>>
>>>>>>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>>>>>>> figure you will push back on that one. What we really need is a 
>>>>>>> functionality to just drop the bo contents and end up in system 
>>>>>>> memory unpopulated. Should I perhaps add a utility function to 
>>>>>>> do that instead? like ttm_bo_purge()?
>>>>>>
>>>>>> We already have that. Just call ttm_bo_validate() without any 
>>>>>> place to put the buffer.
>>>>>>
>>>>>> See how ttm_bo_pipeline_gutting() is used.
>>>>>>
>>>>>> Christian.
>>>>>
>>>>> OK, so is that reentrant from the move() or swap_notify() callback.
>>>>
>>>> That sounds like a design bug to me since you should never need to 
>>>> do this.
>>>>
>>>> When you want to destroy the backing store of a buffer during 
>>>> eviction you should just do this by returning an empty placement 
>>>> from the evict_flags callback.
>>>
>>> So this is for the functionality where the user has indicated that 
>>> the contents is no longer of value, but the buffer itself
>>> is cached until evicted or swapped out for performance reasons. So 
>>> the above would work for eviction, but what about swapout. Could we 
>>> add some similar functionality there?
>>
>> Amdgpu has the same functionality and you don't need to handle swap 
>> at all.
>>
>> Just return from the evict_flags that you want to drop the backing 
>> store as soon as the BO leaves the GTT domain.
>
> Hmm, the pipeline_gutting function seems ok, but overly complex if the 
> bo is already idle, Am I allowed to optimize it slightly for the 
> latter case?

Yeah, sure. We just never hat that use case so far.

Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Thomas
>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>

