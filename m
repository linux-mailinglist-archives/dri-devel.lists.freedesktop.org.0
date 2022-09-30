Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68955F05C1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 09:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE3410E1A9;
	Fri, 30 Sep 2022 07:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F05B10E1A9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FscJITiMIAzduLUveKyL24bGOJrS/GvPgVfOozr9M/Q1VD0w/2uXlrmrvL6CGZwDsfC1VYdgzXvp86L9qvhLatYRKEjIPUxO70LK2zA00djvMJEznT9klFqix7AR6TeqkxwsdSqQlWY+72Jn975tn8j99sQdw6EHtzone2d5ebBt8oPg0c11+JEhEMre74UxWPlRsfOVqcGfl8zVVr8KlzgTIA2ncXwM9vq8zMOwC++LPcEmBDd3Se1385j2+P7JoZyhSLXADB7bW/enWeupB5T1sZXLH4Jxmc/N56KXDLurhZkMYpNIPClgAulrQJdQFjVBJ2rfy749BnV/lc/sQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIFVGit1TOX8u/bsEhFSfgjnDAOyL9HW+VGPSvMscJo=;
 b=EhL++Zk3jHlde7t888ztPx2gKVaMNYqkSnlWRaGNeTLDVh5H8znGguMRn5SMd8I7Y3S7u6XVLgdxOliAaBo2s5kMUD7Jb/e46lYPj7lsTpvEpL8349wDlnksoOc4UPhu1GNTzvHaUXsmoSTurc4VEKds+u5Vmy+qEOawDIMEfYnh0TsN0YaqJGSGJNFIyYUQYmitqyzyUHFKr/WXjFmzdOERXBvQKEKYzarsqo9vZBKyf2/jYuC5YokjvKXLhqN68pfhk/0xvUGIKlFRcfhoFmSyhH6bLr8fOLQUHbqC4g1UDZK3ls9BiQvlnWSIMim0XA5DR47nuTcDKrm4t9pEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIFVGit1TOX8u/bsEhFSfgjnDAOyL9HW+VGPSvMscJo=;
 b=yKurC7rGG3U8hfguTco1D0qwpiu/M/jX8xPM++fw/6ZtwbRaOe1EzKw4JedAVHXkPVjR7ItkvzhCuqzINFYMvR2CfjQ15xhnnZTEEfLu2EHI/AhfoP+s4np4JF2TOi8kf1EDtGY6tW3j2wt46sk8omKNnB4deLIG6AaRQjEDaIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 30 Sep
 2022 07:32:56 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::9ef8:a10e:6fe:1933]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::9ef8:a10e:6fe:1933%6]) with mapi id 15.20.5654.024; Fri, 30 Sep 2022
 07:32:56 +0000
Message-ID: <a4790844-825f-839d-ed9a-104d4b589290@amd.com>
Date: Fri, 30 Sep 2022 13:02:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
 <20220927172409.484061-4-Arvind.Yadav@amd.com>
 <59d4d647-f451-061c-79b5-0ffc4e33fc58@amd.com>
 <52ed8ec2-bd90-ad40-fe85-83d60eda7e05@amd.com>
 <efce6f23-135d-d946-6677-0668d83a7831@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <efce6f23-135d-d946-6677-0668d83a7831@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 780b7422-4cff-48cf-9662-08daa2b5fddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09tceJPYWDHcU9LEM46dEbqtATfcJ18A8stRBs8x7UaNjZApRrwlOZZEYcxmmzhkf4lC8iV3rB+FUgC7xw/QpGkh5eA3NBXFryUegqtKumMsGNoeuOtX7Fi6h6GJVnfY7tKbIMVNSojVDWT02muxJRstkvXrsBZYMeWspBHSbKzvhDX3hANBWjc5/MgIoLkNt8pyxpbx8A+cLFAYyyUfbNRlfXA4NR27vi57TQa/qARGqLhLbKe5pWJZcDQiFI8cPkFzEAto6UdcGpTmZ/jLDB6truqI5G5m3Vylxhj4FPTGGSDf9ZDu8bVieEptTK+z5Vl3iQtX2nZ4wLQJ/i3MAkhGsFWRdgqzXFg4WVZXoyJSo1+wOwKJ7LWcRiMEUfYc2xiULrdPF8gsc2o74s3xvQ8RrsNBvSzIShT5YPPUxZ1ljM0/R4m3agWY9Ad/OXXDrkeviMQW9rku3tj2JRQrYX1Cs9bAg8zQfaf9z0TC/Fnr9QvLZrgv4mZzzEzUw8dvv8NtPV8vtsGofD/DIazlp4MvfIeQeZk+/zGinG985xPd3jPW10aAHClxh3tjYB6pRxyvJePbCg0wmQUQRxDQ4WJoD3QvaUCpb2k3UECj5Xd+WFu/sL+HH3XT7pErPJBeQJfc7BTz/z62sllmo5Exlb6DRcRN0Ii9E9H1fWzgL7c+ExgyvTbLKaMLIE5uhxeprwfFlI5TNDToizggGigfafZ5dkpF+84yQVvcXI/kNDJbDwLVrXt5UgEGQXOnlDSk3Z44a18cGQPa1Mg4FCZnL0b4mZu1b+ZVH5ki3MwBjXOjZXVXoeYIULJmJZM23wyG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(6486002)(478600001)(53546011)(6506007)(5660300002)(6512007)(41300700001)(8676002)(110136005)(6666004)(2906002)(66476007)(8936002)(26005)(31696002)(316002)(921005)(66556008)(66946007)(31686004)(2616005)(66574015)(83380400001)(36756003)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlEaTR5ajl4a3hkLysvMmh1ekRzQnI2bHFGUGhQMnN6ZFVBV1JBZHg5UG9V?=
 =?utf-8?B?cjdPK3FtK09YQWgrSFJ5d2RHOHJrbTExSXM2dTdEekZocEZjL0ZOeVVDc0pi?=
 =?utf-8?B?elNUQy9zSldkUU15MHdiQUlTOFo1aU5IbXpHdytPWlR1SDNwYk85c3N5NHVi?=
 =?utf-8?B?WWJmdjE1MDhnYVlRbkRHWmtnenRmb0l5NUtxbkQvSHRZNW43VnNlSFhwOTBL?=
 =?utf-8?B?OEhod2xxZkQ1NFpUS2JWcFF4TW9DODd3ZklFQ0ZhVzZyZXlPUEF1SEV0YU5K?=
 =?utf-8?B?SGdyYzBBVW9yaG0vSkp2cGszbkswaXBuTkxiWUFMVm0ybGxDOVpuWmJqbUh5?=
 =?utf-8?B?cXpoVk1jdldBM2swOGMvTTFuTlpIQWhqSGl0V01EcTVQaGxmQVBEQW5YeFdM?=
 =?utf-8?B?bTBISHRLWXIvbWJheGplUlg1Rjg1Qy9uMExId3dmais3aVNRZFpvdVRabFBH?=
 =?utf-8?B?L1VCVm5tYUU2TjdtbXhWL1JNSzlsNnNNQ1JPSU5WNE1DOXdWODNKNFBRRE9V?=
 =?utf-8?B?MUcveW5HTXAvM2xtczJSYTkyYURMb2ZlZDZBNXAwWDI2VDFWOVhBbkF2MUxQ?=
 =?utf-8?B?bkdXY1BCS01BL2RudkFCMW8rNHdYNE5HN0FmRlcraGFSRHF1ZXVqaThCSXpv?=
 =?utf-8?B?L0hCV1JWU3BOalMxNVNPYVFEdE9MR1ZrcVI3Q3cyaHZEaVY3bWxWSHkzNVFk?=
 =?utf-8?B?bWd1WUtDdkNwSk5GL2oxMWRDTk13Z3NpelU3d2ZxK0xuSGRsNWcwZjN3eTVi?=
 =?utf-8?B?RU5oelB6UXFlN0ZHM050S1h1d1dsV1lJZkJnRlAzYllLSlExRDJuTDNNVVJi?=
 =?utf-8?B?c1M2eTF2UDhwNlcvUlhiUnhjNCs2dERaR04xc25YUFl6V05MYjc5ZndxYkZR?=
 =?utf-8?B?MWluT2NJdXZVZ2hPQ1NBL3ZDVHdzTW5VbUg5VXRsM2FwcEcvRXJnaVdUK0s4?=
 =?utf-8?B?LzdDRG1LZjJHRE9mdE5QZzN4Q2Exb0xRdVZkTzIyS3grOUJxekw4eDdIbkIw?=
 =?utf-8?B?ZkU4LzljZUpZYW1aUDhPYk9RZ1FtbWFvT0U1VTVaK0M4QUxQbUc5TDV0RitQ?=
 =?utf-8?B?djd6bVdUSmxGSVZPVnovRFlCOUZqN0dQTE5YRXpZOVhKWUo3WEs1dWJVdDRj?=
 =?utf-8?B?NGhydWhJdUlzdXBjYk9Cd2EydGF2OGZSNUhsb1EwTytESUpmKzJsQXNxN0dN?=
 =?utf-8?B?SGt4eHlOQTZ1WXptQjBtaXFJYUZtdXhyMkpBb0M5QXVQK2pqeXFTanFTbVc4?=
 =?utf-8?B?TlMxRXl0ZDFGdTBScnRPQWYxTElPSzMxQ1k0S3lLc1daSVlRaXlsM0NNRktn?=
 =?utf-8?B?aWVNOXpybmxUY1M1T1NLSGVEYjVsM0NzZUdqOFZrb01jZTlqM2J5K1MvNlRI?=
 =?utf-8?B?RzFmUU5IMlo2YVErWXIzb3lEQW1Ka1Jkb3VnN0F5eUN1YzdsK24ycU10R1Vo?=
 =?utf-8?B?dUp1ekgzOExFU1EyQndmMVhyTnZTM3JWV0JoYkVYVUxuZ2p3ZFVpcTJ3Q3NE?=
 =?utf-8?B?Y29XYU1yZUIrdTJXY25FLy9IWGJnaWVkUHIzWm9CSkg3TGRGUHBPZTJHRENn?=
 =?utf-8?B?cU5sTUYrSnFTZllORktKQUdVcFg4Ym9hbGhhTkY2OWNLb2t0TTRBVTJxT2Y5?=
 =?utf-8?B?UE1idGNXcTBIeHVhSC9iTjR2QkpDcmRWUFZNWEZWQjE2bno2V3MxVHY3UUMy?=
 =?utf-8?B?cm1qKzJsTG9hOXZSNHRGb2ZLRmppQ1JLaGVrbjVVNnF3c24zbFhzalJBQzBQ?=
 =?utf-8?B?ZG1WTEF4VzJUYUJVN2ZWVjVKeERWRWQzZVRJczg0eGlWZjI0ZVp6dm56QXNy?=
 =?utf-8?B?a3FKZkszWFNHVUlUTXl5Qmk1a1VHNTlSWmR5bkk3N2NjYXFMeGtvdllYbTVh?=
 =?utf-8?B?U255eUU4Wk1Id214TGxZa2NpaEcwZnBzN0xBYmc3eXJic29UM3N0Ty9HSmtD?=
 =?utf-8?B?dklOVW9MZEtDY2NGdmZXYmN4eWZYd1MyR3QrTVBrcTZXZGlNUTVmWlBHRDE4?=
 =?utf-8?B?V3A5N2hVZUYvbmFkZnlkdHc2Tng5alJPOTZwZC83THdLbFJ2L0gzVndqUzdE?=
 =?utf-8?B?MlVvaGtSTVYxVEFyUXdubTF4cXRKY2xRN2Zvd1lrUnBpeUszdS83Ri83QVZT?=
 =?utf-8?Q?7z/OREFV7wzvKOf48w7Wd9Y9o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780b7422-4cff-48cf-9662-08daa2b5fddd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 07:32:56.2346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkcM0BJq+t3PwMTebb3yz27IqU0lLixbtxDahGIwo69qrVkANR9i4O5R+fysPBL2nYPb3PStS1ZneOyNCnRtLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
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


On 9/30/2022 12:02 AM, Christian König wrote:
> Am 29.09.22 um 20:30 schrieb Yadav, Arvind:
>>
>> On 9/29/2022 11:48 PM, Christian König wrote:
>>> Am 27.09.22 um 19:24 schrieb Arvind Yadav:
>>>> Fence signaling must be enabled to make sure that
>>>> the dma_fence_is_signaled_locked() function ever returns true.
>>>> Since drivers and implementations sometimes mess this up,
>>>> this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
>>>> is used during debugging.
>>>> This should make any implementation bugs resulting in not
>>>> signaled fences much more obvious.
>>>
>>> Are all IGT tests now passing with this? That would be a bit 
>>> unfortunate because it means we still have missed the bug in 
>>> drm_syncobj.
>>>
>> IGT has these test cases related to syncobj (syncobj_basic, 
>> syncobj_timeline and syncobj_wait)and all are passing.
>>
>> I will check syncobj and let you know.
>
> Maybe CC the Intel list and let their CI systems take a look. That's 
> usually rather valuable.

There is one IGT subtest is failing which is related to syncobj. I will 
fix this and submit the patch.

  igt_subtest("host-signal-points")
                 test_host_signal_points(fd);

>
> Thanks,
> Christian.
>
>>
>> ~Arvind
>>
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>   include/linux/dma-fence.h | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 775cdc0b4f24..5156dc6be0a6 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -398,6 +398,11 @@ void dma_fence_enable_sw_signaling(struct 
>>>> dma_fence *fence);
>>>>   static inline bool
>>>>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>   {
>>>> +#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
>>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>>> +        return false;
>>>> +#endif
>>>> +
>>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>           return true;
>>>
>
