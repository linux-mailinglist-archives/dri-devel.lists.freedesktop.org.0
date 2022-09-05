Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D65AD434
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC2510E3B9;
	Mon,  5 Sep 2022 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1810E354
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZn7vcvPqixnJdgWTIDFPiRf4DDC0/KLhR32Jnnt91376OMlXnudsKINM2B1dnkn8ztpW7RPZyCm3vzTFd/ZYOK+i8RP/mNnDhcHBFbOZBF7SlAbE0PIwhpbe861nQw/pdV7Lbhe8afQlU3M7od13IexqiG8JjzGGL3gBrxNYBNoJYuabays2REbDqeVDJczpfwkngcQeTs/JaYSG/qrbbJWwSCXs+n4wzlwdCsRMwySaRcP2o7U5C/Y6gM6baHVdLVHsJR1gc1R+biEnZlT6XPwq6fwBlC3BdDduuPhiy6010cQT4W5F8ECIKiwlAa+ei7dfLpZfdeMc8AxAh0+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cid+8NWSvJ+eXJ6qlWu4YIkrdJL8/GvCc5XORUBydg4=;
 b=JNkW5o3uykZjoVWH0h4q0GpnwPAP5wip1c4eGPVtg/400XLAzEahymtrGYqup1ZevdBtLag2fSAS5SZg9EeIkkYNikjRH6h76mpjTt01p6Hx1LcM1+tH95/x4Zq0DrD2vR0u1E0CMG1uH+R0Lm8tkVtw5wc9Pl6uq4kXa8TkCG5au0MD6Psyvar8aUY0hZGWvgp8YreQKeMMRfE0NGBImoyqoviNFURlLsGXbav/yGIk9Y93eZONk1ckIB9eQm0moCGQmeZBjHzz+QHbqJnVW0pFamXNGDgP/LGlm0u+WCSKn0upv7Q73eC94PvWo40xIuFBbVaE5STy13WWVRzjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cid+8NWSvJ+eXJ6qlWu4YIkrdJL8/GvCc5XORUBydg4=;
 b=Qlj5ZhyTapLYdiQEOaVPefQ6RhCwHrxq63uVsDMjJKgvXb3BIIB9wcnr7jSqPQElCkDknqxfLpZUDwFCD33Ae/7f8/labwHWf0MpZ9da+/EhHHoD6pJlnKVWUwOD9S9AdwQDODfV8Gng+h+oDhp6/mJW+z8Qy60drdbUjZK9vPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 13:44:05 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c%5]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 13:44:04 +0000
Message-ID: <f9042797-1c41-a4c2-fdd2-60feaf38e87a@amd.com>
Date: Mon, 5 Sep 2022 19:13:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/4] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-2-Arvind.Yadav@amd.com>
 <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::32) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb022abf-5b92-41c9-dc7d-08da8f44b2ac
X-MS-TrafficTypeDiagnostic: MN0PR12MB6079:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qeut4IHlVi0eoEqDpLklR2uZG4h+g8XrjwX70+Hypd3dfb7JuJrKuZxOMfNDMKiaZShObzLKEqJ8vMgvj4P5NfvBGPo1f684e2P5zRwHZOXZyXW5XSetUFHfxIws9ovtAipCdEplSl6Xsde4VDxNOhN2asuThenmkPZsUGe963JqHl71S7jgupk91JTO+X0GX3s6UXACDFmenKQUs1b/BV6bBW+v5xphkIrhJqAlk88ezl0u4iM6KrPRXgg0+Ee7FaBaqXDIJZvs0T5PggNQelpgP06dA4+/mZ5UlhIhYpRAdlABVakGf87uLJOEDwrYoRsATUyF1pxiZHJzA9LMARSkzHZkgQ2mN3pMBMyNIHPy2MQFoDuzbHhZJhCfa3fPRwnU7w9fLsOM21xAcrnDoBtdlSByyXwMT0S02qZXD4yLyQoHirPKBG6gEzCQv6c1qX17evlkv8V6skHPLMxTObzxDYEXzGu6xdqPZXe7xc3Ni/8QIbx431vHAMi19gnxTjle1k+hrsa5/L819tONhAAPEhyiwTRlY94qK/D5spY2NCJKGrZj1Bxi2ba73fyZWAZAixqrt9g2bIvtp5jK5Gy/kTezxbJrOiiEt+croRibgR4FqsyC49Wjjl1H9UXPEODkba+9fg+RATouNDwRuNzJT+TGYODNrcVm2vFt2hnu56m+i3n8/pc1VAKwGZwcNX+Iv+QTJ60xjeP5r+A9KN/HPVxFyZOFodnpNxoYy+SDJm5SgYe20RbYg6if4BOtDVh5qt4XMTtURoMn4qLIQy9mJEAwWnTFsqQfZidYfoxETV7odJZ2Em7mZXAYWEn6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(6506007)(31696002)(83380400001)(38100700002)(921005)(316002)(110136005)(66476007)(8676002)(2906002)(66946007)(2616005)(66556008)(6512007)(53546011)(66574015)(8936002)(186003)(478600001)(6486002)(5660300002)(41300700001)(36756003)(31686004)(26005)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNIai9xSk04RFcvVnlWdDBsbVcxUEU5dU5FVno0b09iWXlYWkpQWkdYckpF?=
 =?utf-8?B?endBdnF6ajk3QmRoOUtUclZ4Vmthcno5R1NVL0xaa25BcVZnRXREOG15Z0s3?=
 =?utf-8?B?YzFkUm1QSkszS0UyajJmYTNkcldNOG1WNjB6REQwL1JCa0hMMWl6cjM0a0JJ?=
 =?utf-8?B?MjlnZ291QVI2T0l3MXNkOHA4RlNFVTRWbytMZTJjWlp5aUhsRVBMY01hM3hL?=
 =?utf-8?B?UDlCUk9TRHp1em9rbzZ0YUgwUHVpMFQ1WE1tS0p5ZU9US01tbW11WWtKaVFr?=
 =?utf-8?B?MjJ1dVREYTc0dmEySUxuUUQ4Ynd5aGNYWElYZWJCcmpDYzBwa0FiTm5hMWlZ?=
 =?utf-8?B?SUdncTQ3NDJ6Z1ZRNitUcXY3S1F1Yzd4UWVOdFBCMTU0VGN0SDBtbjJRMmJi?=
 =?utf-8?B?aUkyaDhXM1dJcnBUVnZzT2dMcStDd09hNmRjSzBkQzhiK3FPN3hsd1lSc2Rz?=
 =?utf-8?B?N1BPR2h2TC9VckE4elRaY053NDdYbTllQTQ1bXo2TkpyV3FPUi9ld3dQWFNU?=
 =?utf-8?B?cnUrUEJqOEo5RDc2L00wQVZ4S3I5cjVsUEthQ0pDU05Ha01hSHNNWkgrVHpx?=
 =?utf-8?B?azF5YVNtS2RqaytFRkRGRjRjSVBqTndNTlduKzBRZW5nb2Z1VTEyMnFzSmMx?=
 =?utf-8?B?dk13V3FTMkJPT1RZWUVSd09veklwRFVYMFZZaXNiZ2UvcVJJaXNkb3VpZ3Jv?=
 =?utf-8?B?Yy9nUUJacXozdGJ3TURiMHVNRWZ2Zm5HNTdiak56aGZpSzJrZlBhdTJXOVgy?=
 =?utf-8?B?SS96bWpvZEg1K2crR2pBSGpNRk9WNWNnTnlmSkpWS1Fuc0JvVmNyaWRCd1Fs?=
 =?utf-8?B?R09ldTNYRE5lSzYycm11c0tEWWF6dVVpSjlldEZxVlZ4TTJYZHYxOGdBaGI2?=
 =?utf-8?B?WWg3alJWbDc2c3lrWkVyTGlyZG1qR3J1RTV0L0RUOENWYy9idE9KbktZZTVx?=
 =?utf-8?B?NjdNcmo2RWgyY29XSVhoNmVtaWwzWnRHcit2OVBzNjZSeU1qYXNudm5JS3FH?=
 =?utf-8?B?djM1Y3BDQzBmVHFkc0pVcS9uK1g4N2lpdjJwTmNJWllmM0wzUWU1RFZYS3Y3?=
 =?utf-8?B?aVZWeXdnUTh3dEJDZUR1RWY5by9Ha2Jtb0hyMzBvb0tPbXpXTllPSURVTG1W?=
 =?utf-8?B?OTJkdUtsR0EwNSs5YklrVkhTYkV6L2tIclluWVVNSm8zQTV0VG82dXJocU0y?=
 =?utf-8?B?TE1nMFkrQ214TjljclZTQllBNVEzblpRV0tIQU1MRUZkRHh3WTAwendadGhy?=
 =?utf-8?B?UVNTSkhOVXdJa3JBdUdKeWIrNmV6akFmN1NPckxuTWZTQ0FSVTB2NGFHcTlF?=
 =?utf-8?B?V1djMVdORmZCK0hZYU9PTGdpMHhaNEhiNFZETkdoanNVZ1hKSEpwMjZ6bFVK?=
 =?utf-8?B?NWZjM0crckNLL2grTmtCMm9BaG0xR3A2eU9sK2hHTjUwTFpsU3BCbzNHSDJO?=
 =?utf-8?B?S05RT0h4UDZWZncydUNWbTM0WXA3OXoweDBQMWVsb3ZKZWJzRXVXTm5WUWhz?=
 =?utf-8?B?NFRGVXNsMFFvSWZvOWVWNUVyRlZOa2FEZHcvb3BiTGxlREN2ditza25yYW0r?=
 =?utf-8?B?QmNLMmEydkFmT0RKVjlzZ1ljdzFXcVZiNEFrblFCNWhtMkkySlRzVW5SNWtz?=
 =?utf-8?B?UTNNL0o1ckxRbjJLZkpMdVJaOUowS3dpNUlQSWlRbk5DeEZXc1QxU1NsbU8v?=
 =?utf-8?B?QUhuMy9CalVZN21tTXgzSkp3ck9meWpVYTFTMnpQVVA1MHFlVk9xUmRjOGRE?=
 =?utf-8?B?NlExU2oyWGNSdHA2WnZ0N2lnVkw0bTR2VGtPSjc1U0FJbjZFS3FsMVM3UTd6?=
 =?utf-8?B?Mm5ZblBXWlBzWDRCMUFuYjhHcm1CbnpQSDVlWCtFaUJVc1oyY1Z5S1BaY0tM?=
 =?utf-8?B?RG1kZ3VXNWxoZDB4V0ZjQ0lsMDAyMDV2cDF0MkluM2xXZjN0VnlxWXYzRndh?=
 =?utf-8?B?WklUZlUrbWZLQ0IzbTU0RUpIaEo1TktpQkR2TmYxTGp2dHYwOEFpaG1GVGo0?=
 =?utf-8?B?Wk03VXR1WlRoQjh6d0t4K0F3ME9lSGRnTHAySE5SY2sxdStYV0FleGE4WnBV?=
 =?utf-8?B?TmczNUVZSkpBek9zT1NiN0F4ajlpektRb2FoM2VzcjN4NEJCbFdrVldrZTFu?=
 =?utf-8?Q?DWNF16cWEWYKPef5vN1YjQQxw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb022abf-5b92-41c9-dc7d-08da8f44b2ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:44:04.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKHDNm/l1qKe0cdS98ujoIJf5cyhgdhrPgf2fneRWJ66otueqohj3DuRDHXt6RfBDueldcEzedixb6znC4BzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
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


On 9/5/2022 4:51 PM, Christian König wrote:
> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>> The core DMA-buf framework needs to enable signaling
>> before the fence is signaled. The core DMA-buf framework
>> can forget to enable signaling before the fence is signaled.
>> To avoid this scenario on the debug kernel, check the
>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>> the signaling bit status to confirm that enable_signaling
>> is enabled.
>
> You might want to put this patch at the end of the series to avoid 
> breaking the kernel in between.
>
sure, I will add this patch at end.
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   include/linux/dma-fence.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 775cdc0b4f24..60c0e935c0b5 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>> *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +#ifdef CONFIG_DEBUG_FS
>
> CONFIG_DEBUG_FS is certainly wrong, probably better to check for 
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH here.
>
> Apart from that looks good to me,
> Christian.
>
I will use CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS

~arvind

>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>> +        return false;
>> +#endif
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>
