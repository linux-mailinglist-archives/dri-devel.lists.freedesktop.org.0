Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF075EFD1A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1D10EBFD;
	Thu, 29 Sep 2022 18:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895E10EBFD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQHT+KhImtiP4QeCUXkTUpM9VAkVCupz8INnM4Xy66UzXZBIH5cQJoqGlGmd8CzTTF6CgYT5BSFZ/mAU+oPCigoNC1RN8zKWVFQKm0P3zcXrSieSfyBY5CoWfFkb2LkvWBer0ZrmcG2U5u0WC4+wa4Ev98br/XvaYioSDX5O/ZwYuUYb1lTEAlR3yWOwpjLONUzVBSaRtaEPa8CFHBnMuu5vv3omIlvtJX9N9uFr3QklllJrc8tv2YHDBoFks8b65YFFbpz51Uc+TOxhauU+9NTHsPH7kIvkoT+K3GjvsjHHi6BEd77FA4Co3NJtPm1qP8OkJMvk068rBYX7IhiXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkeAnoo2HrKMToe13FOL9LVMuyXC3hW//oNThQUwrs4=;
 b=CCdqKVHqpf9PZlyFrfhfdkArznWhYWmw2/YXVXm4zKCtOJySK7b5p4LV1A1yDZC1R1xjkOOeuRtvFLiMp873sc/7Fp8ZR61sRAiltcBEyizEq7dzztFkbVRmWyCVeH23n5ELhB/FBZJ3Q0Q+OZbPKTjZo/avWD61xdh5spQvkgpq3uyfWhGK+DouoK93fXqfsazvLfkElUYko8l+/xa6FAbkh8+r2gBpC9STMf5A4879kxGQpYJ+y2DexhEJHP7VYvSqglMQOj5hYMfEgUCTbWVG0qeXmnNiD/JuuO8n3yUl3Q/Fh1/JuW0J2zM70v4ezAG7sumZ28K/wsqHJ7/PLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkeAnoo2HrKMToe13FOL9LVMuyXC3hW//oNThQUwrs4=;
 b=c/dRIlZCzk4/goTQ4xw6wr1Gl9370edIT+ZHjfnLchR8MHqciFRyff4wHEshyq//62NqS1AUJOV87zitq/X4sVCbMF5r3dIuAl1bPHl38f+8ruHqnadiBD0JeoBa2MRhQh5CkTGFP9RMgHcrSuNsWQrtZFkeYeV+vPwXOxsz7Rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5069.namprd12.prod.outlook.com (2603:10b6:5:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 18:32:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 18:32:14 +0000
Message-ID: <efce6f23-135d-d946-6677-0668d83a7831@amd.com>
Date: Thu, 29 Sep 2022 20:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 andrey.grodzovsky@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
 <20220927172409.484061-4-Arvind.Yadav@amd.com>
 <59d4d647-f451-061c-79b5-0ffc4e33fc58@amd.com>
 <52ed8ec2-bd90-ad40-fe85-83d60eda7e05@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <52ed8ec2-bd90-ad40-fe85-83d60eda7e05@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2c0df7-b595-40b5-8955-08daa248ee4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fC0l0acnTxf9yGSll45E26LHJXmAqOTqPtl9h9+VPzj0/ZnPhfavUHcxETqq9ZMotDxPdPw2OBUEDv48yW/cIazeKD3rkoMX6PPGVoxv00PmyTgOkBw+e2oVbR1PRfAM3ECbiGGClv/SwYS7jgjSQjvzHiPtMrVtG4d1RqLV3FUlg8Mtq9ejStJMBokVrMUDsaV84iL9wR+VGnGA8HC7nJwFe0rnbGoP/WrNZhmtDyvkhWMBJMVGAUjRVIgnwIN3kG8jpcZlkJksW+ax3MhCJSMn6o13ugvLflbFEVEVyL2A8+VP8F8A7zgUtNi93db8QM7jG8Go6qVpcqPA91k1yB2Sow2+9p2jw3k2q9TvQR9+1wvH89XJbrir0wO1IwGwz3lgiY7ctQKdRFEpb8sfdVYS275p34BjezIXYzLHNxMSsUSumhNTPiAlcQGVDS7j7vIu4rMA1HyHGS1KfRI5Gf1geXRYesa0/RhpEtdwfXbceUpkMoSq4QXVsuhxGkPOCrPDTrZoBs1K499jA36vVr3S2/3Fv4ycliI/JQlA9tdvwyWPPvqmXvkdptwaGDNWtbnCKEprolWBPMXbAL5XvxRN7o4KkRDomo2k7jH94KqhAKm8oNXBqcOtcag8EmrRMcwNMAmN2FONHpeI+m7+4rlNQ1Ki7jQ6/dsE6I17VsZWKxprhxF0kDlkuOCxTn98bl4WJr//8P3JeZsa9FUR6PP+xuyxmqGyzHEvi2Sl51WwtSC79yArc3B53rb96B2Tx5VNYOs4UpSX8zdt3omd5VL/BI0pyFeIhK7Byu5tOJ3xN2CDQqaj8yA1ajdvLnv0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(316002)(110136005)(6666004)(86362001)(41300700001)(31696002)(8936002)(186003)(2616005)(5660300002)(66574015)(66946007)(66476007)(66556008)(36756003)(8676002)(53546011)(6506007)(2906002)(83380400001)(6512007)(6486002)(31686004)(921005)(478600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEc5a0k3Z21ybitrSWxIZldDZFRQYTk2SVgxOHBMVDlSdDJQSGJmbnFCWWNp?=
 =?utf-8?B?bTA1TWxGdElKOVFjV0FDUzV0VkdobGxIcWh5Rm9wYkZGQnRxQlluN3ZyQ2FL?=
 =?utf-8?B?Q25CQ2VGeWtPL2VHWFdYTDJtVlZZVUt1ZWczWjd3WUtxQWRPUUE3QktBd2RM?=
 =?utf-8?B?bjNFSlJZbVZvbVFtRTc4RE5XYWdCZktGL3VFRDhNbGQrU2UrTS9hTG5BS2J1?=
 =?utf-8?B?WlNFdm9UelZmb0VYekVsTWZVNjlDS0lNenBBUXJsQjZlVkdHNmI5V2dyeTVq?=
 =?utf-8?B?Vi9HSWRNZk9UTkRNYW5SdjRLb2lmRGtQYk03VzRZeFRkV016cFY0M1dyYld2?=
 =?utf-8?B?UEFneXIzS3FFN0Q3SlYzTVhGVFVwaU1JdHp6SzI5ZTR0RDNjWlNqZ0gvMm9L?=
 =?utf-8?B?bm1sVlBkWXdZZ1hyNDBVQk53SGZmaU1iMkVPNEVIZ3RPSGtYQkZIaUVzM0Uw?=
 =?utf-8?B?a1RrVEJHMDd5Nkt3VVh0Q2VOaThxT3dUUWhmbXJpNUYxdmJ1SGZZTkdIRS9E?=
 =?utf-8?B?YVd5R0NtdG5hem5jM1I3OWg0TW9ja3lsSWptSFg5NkJtampmcE5QSzlsNFc3?=
 =?utf-8?B?QldMYTZXY2FaWVhnOFZVdXdodFA2VnMvSHpYYStzaFlJUExSdll6UWVCTmNz?=
 =?utf-8?B?ZzFzd0krd0tOOWZPZ1dqRkRmRWFnWXFxMXVPbXZVbDNucVBhT2ZGSFYzSGtJ?=
 =?utf-8?B?Tmh4dGkveW5VTEI1d21oSlB3U05IZEU1N2dtV1VNQmJVME0vWCtYSTNrVjNO?=
 =?utf-8?B?WGM4NVM2dlpzNXdxdHQ3d3FRSHgyU2lObnpVRGF3OHEvV09KSlZvSXJDbks5?=
 =?utf-8?B?bXVKNE9aQUFXOVYzTWtnK2cxR3ptb2FrZi9tMUFlUnFldU56Tlk1TlRla1VJ?=
 =?utf-8?B?QXRLcm9ES3IrTVFsaW15akQzcWZzV0NZclFYMFdpR2g4RzQxbDZPOFIrZlYr?=
 =?utf-8?B?WlBVZ05pbmtZV0NPa09saUgvUVpjYTdwMGQ4eTdzb0xmcE1RczU5S3kxWW9k?=
 =?utf-8?B?RWhpYm81Vml2T0ZlQi9QWi9BUTM4VG5RYWNmWGVSNkpZc3ZvT1FUQVd0TVJk?=
 =?utf-8?B?VnFuTzl1VVNQVEEwRkVlSzdpM2x4clFGWUMwMC82S1pQc0tUdXc4enVDaEtx?=
 =?utf-8?B?WnI3ZDgrYy9FalhZOFE0UXJyL2NISDdQd2hlNDBrdlkxZW9LeHFWT2pNSWNQ?=
 =?utf-8?B?cG1vbVluUHNvRGVicE1qU1FoVThLN1JLRG9WTWthVWRZWHJMMW1xOSs0RmJD?=
 =?utf-8?B?UzByUi9Sa3lCdUtEdW91dDBYbmNUNUFncHlmRTdiVlhTNmViWDZCb0oxanNz?=
 =?utf-8?B?MldGcHZPMGlzdHlKenZkRTRSbUZLbHRLVzdTQ0tYL1VOWENBd2FPU2JlWHY5?=
 =?utf-8?B?aWdDK2paam9ub0FjRU5QNWV1OGJwZUpuUHlyVHZkcmRCR295bzRxc0JvU0t4?=
 =?utf-8?B?WXk3aTR5b0hJQlY4RjQ0QlJJOUtqSDByMXlnYkZzL3VIb3M2UzdYT0JDNFc1?=
 =?utf-8?B?V2xlaXhWYmlzd2RuSEVEdUNLT3IrNldranR3TWlqblZHblBDdzZhTm5aN0xj?=
 =?utf-8?B?S3FTZkdGd0l2TzZZb04wYXlxUjRoKzR3OHJOL0lUOUIrUGwzelZIODdOU2Ji?=
 =?utf-8?B?TFNCMVhVaU5yRTZOMVpSQ2pRQnM4SXZzMTI1dW9QeWpoaFZybTNxNUU5d3Bt?=
 =?utf-8?B?bkE2N0RTWkRpanhsQTBRN2NwQm9NZFlRd0FHalp4ZllCWHZUWTg5Z3UwOTJP?=
 =?utf-8?B?MVdNdTVRWUhuRE9xRVY0T2VFT3lYNE1VQ3JXN0NRN1hyc29KSkR6U2MwNUlS?=
 =?utf-8?B?Q2xpdkdMTDVLRlIrakQvL3M0M1hUd0w3NmFnanJvSWZVUzdDb2dHR0Zyb0c0?=
 =?utf-8?B?VWdHNXZIUG9TdFA1SzYyL0YxS3pKTG5ocm1oVHBxdzRnZDZMMWZOQVRVaHd6?=
 =?utf-8?B?ZEg2Z2NqajVEN2FzNEVhWTBONElFQVI1QjRVM0dxV3lJQlZYSERseXpnajRu?=
 =?utf-8?B?dHN0enVPUXVjSitkbXZ0KzVpeWMxTUo2UFBPZ0JmOUNDbFl2T0hjWXhNREpk?=
 =?utf-8?B?dUd5UWJqVzc1cVFuQm9wekxTUVNTK1FQMmlNYnFGY0ZhclRsZE9lS3VJZXU3?=
 =?utf-8?B?cEk5Nnlnd3hWeTFFbm1ZTU5Uck5CNUNJNkFRMVRqYnQ4L2JaUENmek1aVklq?=
 =?utf-8?Q?VL0BlNNJbPVKtQSyCuPuut5NMmBgH28LZ7qZhfNJyMzb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2c0df7-b595-40b5-8955-08daa248ee4c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:32:14.7403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBPYzyVLGhRD0qcMU3RNlFx8FhtKj42yVPIhNrl0VsFTZrAsl+kP6gtPHhylu1Lz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5069
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

Am 29.09.22 um 20:30 schrieb Yadav, Arvind:
>
> On 9/29/2022 11:48 PM, Christian König wrote:
>> Am 27.09.22 um 19:24 schrieb Arvind Yadav:
>>> Fence signaling must be enabled to make sure that
>>> the dma_fence_is_signaled_locked() function ever returns true.
>>> Since drivers and implementations sometimes mess this up,
>>> this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
>>> is used during debugging.
>>> This should make any implementation bugs resulting in not
>>> signaled fences much more obvious.
>>
>> Are all IGT tests now passing with this? That would be a bit 
>> unfortunate because it means we still have missed the bug in 
>> drm_syncobj.
>>
> IGT has these test cases related to syncobj (syncobj_basic, 
> syncobj_timeline and syncobj_wait)and all are passing.
>
> I will check syncobj and let you know.

Maybe CC the Intel list and let their CI systems take a look. That's 
usually rather valuable.

Thanks,
Christian.

>
> ~Arvind
>
>> Christian.
>>
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   include/linux/dma-fence.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 775cdc0b4f24..5156dc6be0a6 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -398,6 +398,11 @@ void dma_fence_enable_sw_signaling(struct 
>>> dma_fence *fence);
>>>   static inline bool
>>>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>   {
>>> +#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>> +        return false;
>>> +#endif
>>> +
>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>           return true;
>>

