Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91E3F040E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11A6E5A4;
	Wed, 18 Aug 2021 12:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0B66E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGdc/v8sBkkz6PyRCSd0URDP3UwKzWROp5P0bapgCv4aTTy0gxCkGZC08gISsf5H7MCth23A7qNnYSpA3oCwfjCvPjD0sUtH6+XqB4dXXyFWCaowCRvtM1inrnnjKub1tsbRAidHinDZf7bQsDw8ewgzUUhBEpnyK60m2z8DRd+tCEcQf7z2coh2Vq8ZfeRa6ewk/dn1umZQGo1FO2j/pe+5A3AEfT7lQ2EnUzBXs2+5Jv5KZKTJZgiLPy5G+nx6OyMtUan5zsbonmbDI6tQ7u6X2bdVOW9W+G6Uoce4yQg9QSyI6/TrNXpq4utgJC/g7KcmFR3YecjJtFDT4rCXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CivRy1/et75oVvHubFoaKTYMEaZBUXlzkb/vam3d5jQ=;
 b=NWjKe17mH72byE0UOWtNiRXUhPteck+jCVP5XofphrngDVVlEBCbNe9UBD5BtXMPcjRF9m2JMzP0WaOHFjrHI2vr+/ZND3rWC2GP2OtxtIBeLXVnQQnrduSGo1eZe/I8NfYHd3DekpEZ2Nj+WLpaPpnbryDadVvo8J67OnrtTAUk3wfuAyAl5+8qo9arTmjElUeF4tJ/PL0oK4vNnhsgXWxfDGWDLvYbjI+3Bh70ujwPhAA6O7p5kF6nCD180J8g+vW/o/w+3dNdQoChX3/bkzMmTjc57viypOe7ggyIwwXL5ZXVtqdmjVj66nxN0sc/NAjxF1rQPk6OZARKzgaCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CivRy1/et75oVvHubFoaKTYMEaZBUXlzkb/vam3d5jQ=;
 b=xDle+Grx3hm6HePdY84FILjr3G0YGUFJW3EPu2wR6iXJi3EmzNkv7J4RuSvFG/uOhKpXaga8UoHbnYQkCZRrSb6qZdEtCBXdTonxFFSAgBXdD+2YjnyZkY/kQt5beTU+NRoPTaG60YKK0pSSR5pJOIbXaR4OAnLhRUF3a9Qoakk=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 12:57:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:57:57 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "Sa, Nuno" <Nuno.Sa@analog.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Rob Clark <rob@ti.com>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
 <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
 <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <74802a7d-9105-006f-bcd8-3bbf97035704@amd.com>
Date: Wed, 18 Aug 2021 14:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0113.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM0PR06CA0113.eurprd06.prod.outlook.com (2603:10a6:208:ab::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 12:57:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dbc8315-c292-4da6-60fa-08d96247cca1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455015E954FE204E826BDEA883FF9@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +T3HhjSdpjX0kLIRVci/aau9zvFZiZIelpLkUloxdtEmCi+sz7Z4wPjQLFnmUl+SNNKcxzrG2ijZpMOSxI+yMsRiOcwhu6bicSDqDoamEc5wFfZ+OG0Cvdrvb7SnKMThZiB7uXDMrggGTUu3hLT1vpcH+ONPV3LRZv++xxAeVvOPDrygie7X+4b1b7m+mRufzejX3d9t0thMT6r8c/R9uTvU3MAGkH7yEAVpeQ056AHWDsGBGFcBYtAABdPs5BCayOT30tpE/W6uzVNRpArPfevOL+Fcd0iD2Ca8U23LHTn4oX/NN7NS5FCGWU+bqpbAv5qD5Qh1QWwXGlpXidQFTFONEe04mXzscVoABNMWPf+xli6tjjV8+KALq9I6RRAI6rFa6XpXcT60IzwbIM0zTQVYX0tRHsDFnYihO3AWo0T5Vo8b8ba8CwuQO1aHC0+bAObpH8q20G/OVHnVx3tkwPsmyXkJh75kU9nzlsP7yr+Fy/vKret8jfjfPcUNJG/mOTmk6wsMNdMm44a+OciyQWjOLt2dePl+TmFTWPbUfyVwJxTOYujrqKkS8vuqgAaDlfBSACU5oISzqpybB4m3vN6vhmLc90irGKaps0SvK//DLo0sqwlSNetRWNSrgt0+Kzs31VJO8UcYXY5lKY0dTr9C/279CnKQXTiodIO49miHoKSgAbiTNfrHHIq8zye9NgyPX9oCl4R9H+P+3Im46gN5NR6DJHwGl8+69HDQLYQWYhLPxoAx6MRCh5e2QSked4DxU1ibMuzrklbImydb50BHMjph8QIg3pvvw1XuHq4fdJDfLf8MkIdR+eLMFAOG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(66946007)(66574015)(6486002)(31686004)(2906002)(6666004)(2616005)(966005)(66556008)(66476007)(31696002)(38100700002)(4326008)(26005)(6916009)(316002)(83380400001)(86362001)(186003)(45080400002)(16576012)(54906003)(8676002)(8936002)(478600001)(36756003)(956004)(5660300002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFkS0F2a0lMMFE0TjBOdHczSCtpRG1YR2lldkticnR0NTJNeFlTZUoyTUlN?=
 =?utf-8?B?UmhTQU9QSzdlVlJDbFdpdENGWmdaK1V5ajJXSEhZWUtTNWVFejEvNk5XZXdD?=
 =?utf-8?B?QnZ3UVJEWWFOZ2hiWFpvYkJybUo0ZDUzd3pEakIrQkNmODdlcU43RU15NDVo?=
 =?utf-8?B?bjZMNFRPOGNLOVZSM1phclBoVjlMTjNnd1dueVFYUzRpYkRYcUsvdkVoSjNG?=
 =?utf-8?B?OXV3SGZYRUIrZVJSSUNEWHd3T0RGOS9scmZOSXBrandwbExMMlZWZDE0NWNE?=
 =?utf-8?B?dkN4KytrUTBuK04yY2VHdVJzc0UweDMxcTNzZVUwa2kzd3pnNU1aVFdGdVZS?=
 =?utf-8?B?TjBLQzZHenNNbEhnMTBINXZydUZZdDR1QjhEM1hGVUpOeUhEeE55SWcwT3Z2?=
 =?utf-8?B?ZTBGQ21pTE5GcDQ3QlpmN0crcUludmJ3ODlKdWNrdVJkTlQ3TVJPVndEbWJW?=
 =?utf-8?B?MlN1Yk5SRW5vUHJwaXdPb3ZIdFpjYlh2TEFpZDhVU3A5WUt0TTZ0NkthdWpL?=
 =?utf-8?B?OWJOdUE3Y1U3NDdqMEQwQ0UzRjR2OUt2TXBPZXBMNllhY1kxZmdTa2JSNy92?=
 =?utf-8?B?OU9URW9PWTZtb2tXaUtxdEZzV1JGV2FnTzBQMEdhbXBCWHo4L25rdVdaRGVD?=
 =?utf-8?B?cXJxd0JyQTd4ak1RWjVSUkEvbXNpMVR6R0drK1lIY2NTMVdUeXA5bStqci9r?=
 =?utf-8?B?dG83Wmd5TmJJMEF4TU5tSldoeWN5NS9ZelE0eXEwZlJnQXJMMlk3NWozVXdG?=
 =?utf-8?B?SUZrTENyUnJsc2huTzB2WDE3Y0NmREtodnE1SEZyb2JDUVVZMU5ncVlwNXR1?=
 =?utf-8?B?dzh4SGhrajBaazgwVmx6N3ZUdG1uQnpWVGl6eWZqaVhEdVQxTW04OE1zcm9i?=
 =?utf-8?B?Z2ZQSlM1U0dRVmZXM3R0VzdnVEptTzBuOStRRmZzcWh5VjI3OUl0UnVHMXhy?=
 =?utf-8?B?ai9lZ3FyLytpQ2pTanBtNGNmSWxiRS9uay9UVGQySGJJMlR2VVYzVUtSR3U3?=
 =?utf-8?B?aVlYMUFyTE00TnI3SHpjQ0FPeU9iV0FPa1Z4QVJ2QU03SGZ6VCtjc1l6UW50?=
 =?utf-8?B?cjFwRGlFOEw0dGdrcUU1OWlrSUg0Z1ZyVWhOZFN0UFpzdjVKaExmOUhEVmZk?=
 =?utf-8?B?S3pveXJyOGw0Zi9CNlFqV0MxanZlY3dkUXZYaUJHL3EvNjlMZUNYeDEzZUlC?=
 =?utf-8?B?azN3dE05cXFMNHpWeGMvTWUrOGkzT2N0czBOQzZ0NTkvaXA0Um0rS3NtalJx?=
 =?utf-8?B?MVNwRjNrc1hrcXErV20xVTAvUUlwUys2RTJkNlhvNFprSDRNdzMwS1hmK1Ev?=
 =?utf-8?B?bDdiUEtZWndBczV5MUJHeFZyRDFyNk1nWGpzWTIvdXdrYmlKTjhESm1ZL3hm?=
 =?utf-8?B?Z2VSTE8yRy9iTEVvYkN1bHVPN0FTdmRpb2QzRzVHazc4S05ZL0dGbEZaRXZz?=
 =?utf-8?B?ZHNSS1Rvd1QvRWNCMmpXSkdVbXBJUEllb3IvRUcyTStRTEc2bGYzUWU5VENN?=
 =?utf-8?B?Kzk3OTM2UTNKQ2d0UU5Rb3NsMmxrSFFHaHBoZnZUZG0ySE90ZTlVbEpJZ081?=
 =?utf-8?B?WG1FRlJMaHZEUUxaUzdVSkdlY2d1TjZRWUpVbHVkT09rL2RtZllsWDR4Wmhx?=
 =?utf-8?B?Znp1WG5LVGNQRzNabHBCK2owK0JIc25vTlJ0ckQwS3lHUzV3dXk5N2F4N0l3?=
 =?utf-8?B?RXY5NnhWWXVQQytrYitlYzFqbm9GWVZ1bVJFeGpmT3ZxS1Y0dFIxdVd1eWV0?=
 =?utf-8?Q?w5OtWd3pXrAGXn5Yk4QMTSJXJBVH2n6YAei9Onx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbc8315-c292-4da6-60fa-08d96247cca1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:57:57.4328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pby7n+u2kmG1/M3RMYkfgyNqZZVRmij9QCi8LcXsQc8+A2jNo9WkHnuP0zVDPmHa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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

Am 18.08.21 um 14:46 schrieb Daniel Vetter:
> On Wed, Aug 18, 2021 at 02:31:34PM +0200, Christian König wrote:
>> Am 18.08.21 um 14:17 schrieb Sa, Nuno:
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Wednesday, August 18, 2021 2:10 PM
>>>> To: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-sig@lists.linaro.org;
>>>> dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org
>>>> Cc: Rob Clark <rob@ti.com>; Sumit Semwal
>>>> <sumit.semwal@linaro.org>
>>>> Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is
>>>> NULL
>>>>
>>>> [External]
>>>>
>>>> To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL
>>>> handling
>>>> here is misleading in the first place.
>>>>
>>>> Returning -EINVAL on a hard coding error is not good practice and
>>>> should
>>>> probably be removed from the DMA-buf subsystem in general.
>>> Would you say to just return 0 then? I don't think that having the
>>> dereference is also good..
>> No, just run into the dereference.
>>
>> Passing NULL as the core object you are working on is a hard coding error
>> and not something we should bubble up as recoverable error.
>>
>>> I used -EINVAL to be coherent with the rest of the code.
>> I rather suggest to remove the check elsewhere as well.
> It's a lot more complicated, and WARN_ON + bail out is rather
> well-established code-pattern. There's been plenty of discussions in the
> past that a BUG_ON is harmful since it makes debugging a major pain, e.g.
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FCA%2B55aFwyNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-3UNT%3D0Og%40mail.gmail.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C19f53e2a2d1843b65adc08d962463b78%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648876076613233%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ajyBnjePRak3o7ObpBAuJNd08HgkANM9C%2BgzOAeHrMk%3D&amp;reserved=0
>
> There's also a checkpatch check for this.
>
> commit 9d3e3c705eb395528fd8f17208c87581b134da48
> Author: Joe Perches <joe@perches.com>
> Date:   Wed Sep 9 15:37:27 2015 -0700
>
>      checkpatch: add warning on BUG/BUG_ON use
>
> Anyone who is paranoid about security crashes their machine on any WARNING
> anyway (like syzkaller does).
>
> My rule of thumb is that if the WARN_ON + bail-out code is just an if
> (WARN_ON()) return; then it's fine, if it's more then BUG_ON is the better
> choice perhaps.
>
> I think the worst choice is just removing all these checks, because a few
> code reorgs later you might not Oops immediately afterwards anymore, and
> then we'll merge potentially very busted new code. Which is no good.

Well BUG_ON(some_codition) is a different problem which I agree on with 
Linus that this is problematic.

But "if (WARN_ON(!dmabuf)) return -EINVAL;" is really bad coding style 
as well since it hides real problems which are hard errors behind warnings.

Returning -EINVAL indicates a recoverable error which is usually caused 
by userspace giving invalid parameters and should never be abused to 
indicate a driver coding error.

Functions are either intended to take NULL as valid parameter, e.g. like 
kfree(NULL). Or they are intended to work on an object which is 
mandatory to provide.

Christian.

> -Daniel
>
>
>
>> Christian.
>>
>>> - Nuno Sá
>>>
>>>> Christian.
>>>>
>>>> Am 18.08.21 um 13:58 schrieb Nuno Sá:
>>>>> On top of warning about a NULL object, we also want to return with a
>>>>> proper error code (as done in 'dma_buf_begin_cpu_access()').
>>>> Otherwise,
>>>>> we will get a NULL pointer dereference.
>>>>>
>>>>> Fixes: fc13020e086b ("dma-buf: add support for kernel cpu access")
>>>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>>>> ---
>>>>>     drivers/dma-buf/dma-buf.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
>>>> buf.c
>>>>> index 63d32261b63f..8ec7876dd523 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct
>>>> dma_buf *dmabuf,
>>>>>     {
>>>>>     	int ret = 0;
>>>>>
>>>>> -	WARN_ON(!dmabuf);
>>>>> +	if (WARN_ON(!dmabuf))
>>>>> +		return -EINVAL;
>>>>>
>>>>>     	might_lock(&dmabuf->resv->lock.base);
>>>>>
>> _______________________________________________
>> Linaro-mm-sig mailing list
>> Linaro-mm-sig@lists.linaro.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C19f53e2a2d1843b65adc08d962463b78%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648876076613233%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=0E5L4Kid5ZPeKT8Uxx7K61fBXmI4TOsz%2F5ILsFpLB%2Fo%3D&amp;reserved=0

