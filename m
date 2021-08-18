Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B2D3F03C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93F26E581;
	Wed, 18 Aug 2021 12:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ABA6E570
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzMmHWeiTk5J29GapkDCb4ae97s9r5409fNgMQNbP9mPx3kQ8EbMCKBS//niou1jWQDZicacOpqKKJdKAGtOd5f4bkWd/Fa9IHRqHNjK8Ls6bkrWHu9R6v7U8ohq+h3zOEVDTpBLvtpTxDpUDTv8RRZ4cBRZTyyvT4Bz8UgvHKpEG7yTQ2nABJUwKVL/QxSxlEocILQzOTHD9kSA8pEC1BYGBhLZo4SvDoJsXhtwa5sIV4UBqA8aq4md5Tc2KI58N+woyZn7t/3b7JXc3+DdbN4/LfD8udEeXvoKY56c0haksF3xqinVgLKJFjX/RZ7TiMn9FHUkn7fl3PXGHqfzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb3IqgKNak/8G7n6WmYfmGRa/R+U47j6uAVrdTSfS0k=;
 b=aTCCoAZI7EJg7XLkPU65L0lEKdIR1MCOC5nd88g3CLrN09r5HoZYDiVUekFb+06q37bQPZsm1UUX4juPu0xqJxDyFtABCoMm+S3GwZwWgbgn77lUOb8bB/6wTnNxyr5Z7ol4pxwqbury/cqKAljAih/MpugCVdxnAszqjWIdi87aS9dPC4c8cHDIp/8BegO1NuA9hV3fE9v5Yz8uGRoMen83rF15e9ygIW9ukZz7oBx1CnsABmxA+/CvYeB8URc6FtkHxJf3cprTri3HIpRhnlDoKhaDXrNZMkWmVzjqwv1kIXOj9sOPpeUZMUUNZDFWLOZxzsTDzLL+18HviHBsyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb3IqgKNak/8G7n6WmYfmGRa/R+U47j6uAVrdTSfS0k=;
 b=YiOU5AL6qo85+/4AOWYyYdW1+G4lF6ufYdzRvEZCrhVWGeaHGgfUmS1M1x0ydflBy+jCq288CIOAu5rbgRyHu3VEyMXRdme1JPu9lS9GAPQ2qUNHcr6G4wHsryekHJOEG0icK8P/IVCC+uN7PUrQWVDDBBZRDadYYSaCRk9QplQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 12:31:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:31:39 +0000
Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is NULL
To: "Sa, Nuno" <Nuno.Sa@analog.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: Rob Clark <rob@ti.com>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
Date: Wed, 18 Aug 2021 14:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0104.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM0PR10CA0104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 12:31:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43c76f56-194d-4e54-5279-08d962442099
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4930EE6C7D789DE5FBC90B2783FF9@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUkuhhDuBmuwLtR3xknUpyQOCVJ1bDEqNlXmZJSZII+PGCJuh76cDL9xhD1F9C9vB9RBhYfGEgBPq5aIlsKH9LTDklcWfel+zzv2DPmBNokRQ9+FvhIly2ebsGzydjBruNlBFxFT1fOmoRJe6TLQpqN5acN2HVswBaVyqGyi6eChSnzJsG5cmRoy5j9i+BB0Kq41WigmYeJOqz1nig9p7YxmxKoDET8lo6e7DMiiits+8AXLFwE6w9euLQZidsH/YSb+YkQLkl0nnU1UhlYEsD6yRiB7T9ulh+w22KpPQHKAXBusqTR8kj4NchE1yt21rledMaWgFBhU04Jq2+PFTSsXwfLsqJvg7ZFjFcde6hQE8k/xmmGiufVnDjC0QH0w9qghJ5XZZGQGBrbrmpjuZc5ZKW0odRcm+bsEX4TK0gaSafp8kyEwyMDv8qyx1Hrhg+pukP/oEqi1CD8M6yOrn4rdxAdLrsIY/i/nXFDbMP+Tf7CBzNrNu2MitSiF6ZLm5xZqWrp+JNzjV9yopmFNoAnP94RJZib21VTE63QDUG87X66aKuDSVbOFZYtMGev0CPeoAxOLLx25BaNB8AxwYQzVAxbOG/RALehQDbZOy5bof4IrkSReuRlvALWxDtYZwAm5A9SsSrDV83tHCMi0Bao/6bTPlHLoPXpywilMaJsLIsfxmOIODhRieLMjpok+nQK3EMpMpy2KD7JSYPUkmSVE8mq3vUondBE6MNRW5xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(53546011)(6486002)(5660300002)(8936002)(316002)(6666004)(26005)(36756003)(186003)(86362001)(478600001)(66574015)(4326008)(66556008)(54906003)(8676002)(38100700002)(956004)(66476007)(2616005)(31696002)(110136005)(66946007)(16576012)(83380400001)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RCak5iRkw1YTZMc2Rac1Zab1laNkVrRDdCZ1VEemxSY2M2d2hTVGt3MFRs?=
 =?utf-8?B?Sm1LSFdTQTdiZzlySzZpN2hHWnZORy80azVCaWp6YzUzaVJVWTNkZi8zQnAy?=
 =?utf-8?B?cUQ1UEFvUFZScU5wbHRLOUpuaG9tdHVHZ1lDUmhDcnlUS3ozTTBRM2c0NTdC?=
 =?utf-8?B?K1krSWxkUVh5cS9EV3R1aW4yS0QrQUM1djFtMHRPZ2xOa01tcWM3Ly9jampq?=
 =?utf-8?B?a2RMN3hnL1BGQTVqaE9kaFhDanQvQmVNRW1aSVJ6d2JnbEo1NGZPenBtVGZP?=
 =?utf-8?B?V1pNQzR3YXlVWG9YWDlUVDM4VXpla1BrOUZDOW9hQmlMb2R2Q2NBOTRiT1Ra?=
 =?utf-8?B?Nm0yanpKZG9GYm92MjVVZldPNW1YVWQ1QkRQUStUdisrb08yVVgzaVMzczN2?=
 =?utf-8?B?Q0VoSTZ0NHY0SDczcmI3c2VXa0JGeFc2NEc2cTFrNVVkelphRzI2cXFIbkd5?=
 =?utf-8?B?cCs0ZDltUllIT1c2blBlY2dHOTk2bnVTN1ZjZVArOFR1ZWg0NmQzeHFBaHh2?=
 =?utf-8?B?bDhXNU9zcE1FYjEvL01iUHBHQzR3UFBCenNJcVdSUzRPL0NTdmxlNDdzSUUz?=
 =?utf-8?B?T2tibDVuNXV2L0xhWGRuaWJKRkppM2VvdUFrWC9HelNjSFh4QURkUERJWWpj?=
 =?utf-8?B?eFpXOUUxQVQva1FqaXZIQ0d6UFdDbFZXU2tJY0xON0lJUWlONTB1N1NVcXNz?=
 =?utf-8?B?TmJjNlB0dWhwWncxakFTK2FHUmU4SmMwNUdHL2p0RUZpSE9YUGlTWmZRa1VC?=
 =?utf-8?B?SExJUUxNMk40MVhiK1VDcSt6OHA5a3phN3I3TFRGQ3Q4RmhQVXNqaFlhaU9X?=
 =?utf-8?B?MVZyV2UvRHhwTWc4em9FYUlHUlE1MVFtbkVTbTZIb2ZoYnI2bjdEcHVlOWtp?=
 =?utf-8?B?TldpcU1DY2xpZ3BVOEpJbVhvS3dWaDFEdkZHbEpkTHpySTFFMDlya0JQVTNQ?=
 =?utf-8?B?L2ZWRWJnbG4vcTZvcXFVQ25VR3FZWE1uSDNiZkNuZFAvaG9KUHFUL012MzJ4?=
 =?utf-8?B?ek40bTFXdzFVa2pURDlQWVJ1cCtoVHVpUGlNNksxTkp1bzF5c2dRZ3dxYStw?=
 =?utf-8?B?Lzc4ZU9wdkViTG5pRjA2cFdMYXJZZHdVUTg3WHRsbUZ2YUdLZnZUSzdBZWxi?=
 =?utf-8?B?UnZvSEdnMHNiTm5qVmNEMi9vaE50MExJSXlhNXVEc2JHd0tvT0ljU1c2SmRZ?=
 =?utf-8?B?TGFFeVZsTlREaVlaeERVL0NGeHpXTWYvR3NEWi91MDhtMENUdHgreVFnT1l5?=
 =?utf-8?B?Uy96d0FQV0U5czlrOFdXNjNLOXl2RkVUbFJ6ZjRoMkh1WWNrZXJRNUs2ZTRi?=
 =?utf-8?B?M3pCazhhVzBDakNkV281ZXpPUkVVekNjRTM2RS9zd1BNc0JqSEJWUGk1YUhp?=
 =?utf-8?B?dFlFSjJhSnFRN291a2JGMHFxcEtaMFYvNlNOR2FTWVFpdGZiN2E0cjZuOHhQ?=
 =?utf-8?B?NE8zMUJYbFFUNlFXdGx0a3BkUTByTXFHM2E5TkIvZ1JPd3N4TnJ6QkQwQVhR?=
 =?utf-8?B?RVFLRnZoNHpTNmFYdWRYWFBETFN5WGdWM293ZUl0V3cxRUphdVBFY3FOQzYw?=
 =?utf-8?B?c1JxUWJ4My9Hc0lldUZFUzBkUHpqaUtOSWJKeGQyNUttQmJiYmoyc01IUkpM?=
 =?utf-8?B?bEF4b00wQmg1YUsvaUUzbFBSeHNLenliNk9JUTc5T0lsZjdZTUlzUWxORThv?=
 =?utf-8?B?N1dpOFNBRkZScDF1dGdjM0xKQzNRd215R3hJb2xwbHV0enUvZjNxZCtSZFM2?=
 =?utf-8?Q?HmpI3OQkX3hy6pq+qwn9HcKT4vIEhtvTZL5iYCE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c76f56-194d-4e54-5279-08d962442099
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:31:39.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbAGM14DJChoBp2SNL8aEOAMQ6yfvBnhV7x+NW6QdHsFufL/HwvUJZXIAQMKMbSq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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

Am 18.08.21 um 14:17 schrieb Sa, Nuno:
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Wednesday, August 18, 2021 2:10 PM
>> To: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-sig@lists.linaro.org;
>> dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org
>> Cc: Rob Clark <rob@ti.com>; Sumit Semwal
>> <sumit.semwal@linaro.org>
>> Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is
>> NULL
>>
>> [External]
>>
>> To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL
>> handling
>> here is misleading in the first place.
>>
>> Returning -EINVAL on a hard coding error is not good practice and
>> should
>> probably be removed from the DMA-buf subsystem in general.
> Would you say to just return 0 then? I don't think that having the
> dereference is also good..

No, just run into the dereference.

Passing NULL as the core object you are working on is a hard coding 
error and not something we should bubble up as recoverable error.

> I used -EINVAL to be coherent with the rest of the code.

I rather suggest to remove the check elsewhere as well.

Christian.

>
> - Nuno Sá
>
>> Christian.
>>
>> Am 18.08.21 um 13:58 schrieb Nuno Sá:
>>> On top of warning about a NULL object, we also want to return with a
>>> proper error code (as done in 'dma_buf_begin_cpu_access()').
>> Otherwise,
>>> we will get a NULL pointer dereference.
>>>
>>> Fixes: fc13020e086b ("dma-buf: add support for kernel cpu access")
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
>> buf.c
>>> index 63d32261b63f..8ec7876dd523 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct
>> dma_buf *dmabuf,
>>>    {
>>>    	int ret = 0;
>>>
>>> -	WARN_ON(!dmabuf);
>>> +	if (WARN_ON(!dmabuf))
>>> +		return -EINVAL;
>>>
>>>    	might_lock(&dmabuf->resv->lock.base);
>>>

