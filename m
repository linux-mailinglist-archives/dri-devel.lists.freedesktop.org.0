Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315B5AD443
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17A10E3A5;
	Mon,  5 Sep 2022 13:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A97D10E3A5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3x/vg9Vd2IA9gV/HbEho1RWJkMlNpsNX27m1NkmjD3LF/IJ09qmeZDJJesQLFFKvRyayTrKFIucto5d5dgxNNmeSD76AAFUBwEGtnAy7CUuU786u7X9bPAGCUjStgC8WoXkJ4rBlEpNX1YJJwoAsI9S7X5vYUGQUnOGmScAC4ikH6VXCkxdjYpVXTZiRH63LHrAyBgN5a09hOFHs10djuIOewmQyRtOm0Z+ESjq53wUpUPf/sdcUmYSQhgNKzDTMwjXEpmFFEO4M0610D6KiZmKxmXU83NdkHJAhRHNpB+nAGWJeedXFpliJeNsMNiTa0diOW6er+/p7cDJBde2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDVr77z/lBvaY5ggSYdWov7wrnngYiW92g2jspttE0Q=;
 b=JxAGN5dsbyD/aOyhAU4F7ZAfb31RciXfPLgUS6VQCAFo0O2i5jD/SgUzA7pDEZ8t5hFcXapBeOtUXZa5aNOX3tCPQDTPi74NgOANMf1ptYIlnrsHXzAraUt+sODsM9YrPVezHM5SxbuLm8Fbg8fljiXpRLBdIJRFl9oyInEEuV64noOOjuuEIhGZPxQblmGZ8lLoWFzkOGmP290kaBGISzrH1VM7Jlq2oNk16bnqo85GtwnVSc9qRO6IoUR9xPNTNGQGWw5f4t76wUxVoxgSaz8qC3jQh2GUgASlMjQ/QgmmJQr6j3E3AMn802qV12kz5Zddml2GDA17aLu44dCLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDVr77z/lBvaY5ggSYdWov7wrnngYiW92g2jspttE0Q=;
 b=rJ0hZoLumd+4tNJArqS/WBQjvnV+6x0MdV8SewzKHnRsZSqhGwCrNoI8ziKHFO0DQIMM56fc8t/4zQeKiS4o+9EeHv1jqJNXLOhvW3tzvZhUVufCppLMzSgiJ51NW10Dlvr6qFnzHKPCsJqIrxXVlpIO4/gIz6BSEov++l0w7eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 5 Sep
 2022 13:50:15 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c%5]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 13:50:15 +0000
Message-ID: <0ce528c5-dbeb-4bad-9bfb-68decb46a1a8@amd.com>
Date: Mon, 5 Sep 2022 19:20:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/4] dma-buf: Add callback and enable signaling on debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-4-Arvind.Yadav@amd.com>
 <47d30adc-00ac-75ad-106b-18010d8083c5@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <47d30adc-00ac-75ad-106b-18010d8083c5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::19) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a50b0c58-149c-4541-a4d5-08da8f458fba
X-MS-TrafficTypeDiagnostic: BL3PR12MB6474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxWVehsDFkDTpAPsSPkDdHkhJ48wDlUL2zycCo1nm0KNJ5MUFW34I097Jg1trccu/XaPW4imrLZj1QaPNBGHciwhybzxYbMJVFvT7DhE1sr1+5PF1DdHr2/bkSeeWDpE6HhaERYa20c3iln/UczmdCp9ieDcleb2Kd+5b65NwFeY9KDaodSKuP4j/N8Nzfw8F5l+MObkCJTeOU4izPKdhYNV8RwvMakTc7PVWhEGzc05mDdIInE2Eo+oAuaXrBKVPsgHSagVv+7pzscvxMrKUTNmHXQ1MG4pROyz04yDv5X6edoXrj2pQIG26oqqWpHKNOK44nboHZEj1GUdEqrDSfE1IeT8PiuW2PByzKRZzy54Kx617y/sA1NYe+qRSYK+ribfbD4+jbjGH6wAcMyMzvEA9SLj4UFNR74uDE1p6AxkhgxA2I4C4wnfzx3iBTE0kWwgL62GT3lA659s8i+XmsPisP6QNnhJTrPFWO/8uPrZzwZVt1AlTHj/Fp/ii+zbfhnFMXCw1jGcip0bdm4Vc488Pv1SmEESg3+o0E7k8QrtGUtge7niWsPmFa1txmClnDC7NmZVbKYSKJf3s8vmjzflb4SiPuIMR34X59D7uvrMLXZ9GrLKJKd2eeGrEgT3HeZCHSty0IVgo8Rl2Q3rHwLN+XOG6oUKtcCtmCfNGFbkx6UZHqmCWJOC3tWfF5XH32CYyiILq325HYyNRuEdo81IOR4WbA7cEPpLJdfX5eIB47arDdHcYXCkQ0F1FEPncPIs0rtJHmXIiGs9Kxxpu+SPyIWv1r33kqynGJKJ4hynVPc5RdX3w1eGNv3hvFYT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(316002)(31686004)(36756003)(478600001)(110136005)(66946007)(66476007)(66556008)(38100700002)(6486002)(8676002)(921005)(41300700001)(8936002)(2616005)(5660300002)(31696002)(53546011)(6506007)(26005)(83380400001)(6512007)(2906002)(66574015)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmp3RUIrK1Y3a1dodU4rVzFWMGJrTnEzamxwK2JlMDgxYnNXMEE5ZnNTdytq?=
 =?utf-8?B?czNMbnUvVlBPeHdLdjNIdER6aytjMW9LK3laZmR3bnVFVkx3cm5jU2dsaURp?=
 =?utf-8?B?Qzg3alBFNVlnYnBtM0c4b2R4ak50U3E0bDhFQ0Fwd3FqRW9iREsyZytZdnhJ?=
 =?utf-8?B?NzJhdzBkbEhYZFhvSDN0THNEMXFQTHFiOFBjS3NzNHJJbFlCanVRbVB2RzZk?=
 =?utf-8?B?b0JIcFRRcWJXSDQ2Vyt1VFNmTUhEL3MyQ2pibkRKMkttMlBPZHlmNm90QUNo?=
 =?utf-8?B?RWlUbEUzYXVlaGxiNjVDMndxNUlqcms3M1RLOUlRVW9BMVUrQmhpb2VMTG1I?=
 =?utf-8?B?b1E1WSt1b0twTEV4MGFCa3B4Y05yc25lOXE3amNHYUdJaDdPeWFZOVB0cmNz?=
 =?utf-8?B?c3ZYRzkxRnFwdTVmaW42MzJlRlZ4L29RYm5zWjc2Zlh5Vi9mT0c1dTlibVlR?=
 =?utf-8?B?L2V1QndiMzFkM2hkN0toT2toK1NxMkFqRWxuRGZQSXdNcGtuemxRVSt1VDl1?=
 =?utf-8?B?bDVjbFkzRk1mRUJoaUdicDU5OWluVllVWjN6dnFVVFUxUERJSk1zZ1ZyN3Fp?=
 =?utf-8?B?TkJOUkVLc3hxVzhTUHFYVC8rMmhibjhaWFVSelFGaG1XaFpzTXdDbk9MZmw2?=
 =?utf-8?B?VkYyK1A0SklHOVdLN0FjRm10alJzRytIbW84WHZVakdIMDNUT3IxSk5ndkQ5?=
 =?utf-8?B?N1J2K0lkeDRLRElDQUZPejV0WmNjZmk1SENKSUNNVXVqQ2dhSGZ5ZXBmamRQ?=
 =?utf-8?B?WE1UUFE5MU9seXJlUU9uSFliQUdiQkhmU2lkZHAvRVlCWEl3bU02ZGhFaUQz?=
 =?utf-8?B?cHZWZnRucU5oZEhVYk1BS1o0NnRUclcwcVBkc2UxZ05wMld5MXdLSi9zTENG?=
 =?utf-8?B?aHA2cnNLd0xzRmtkMjdaTUpncG93TElST3Y0Y1R4UnhqN0lhbkphb283Tllt?=
 =?utf-8?B?V28rU0V5ZUNxWkdPb1RKc0xXcHFhR3NoeEFtS2hJZGxFTHYrcDFoRkZTdlhS?=
 =?utf-8?B?anNpSTV6N0M4dC85WTR5NzZSSFRmK3p2WUk5VExBL0x1czRnbnVHZTU0R3NH?=
 =?utf-8?B?UERQa3VBNFpKWkpTa2Q4cjlSb2x1VEhTODA0Wk1kc2hTUEJVeENqZGlXZ1ZB?=
 =?utf-8?B?bFgvUTA2Nkp1QjYrYVV1ei81b1RTdFJwczVEUG1oR0RQYWhTMTFGYmMwRFM3?=
 =?utf-8?B?VlRYaVhrdGlXVFhiQVJya0VlYStyeE1zUU5tbk5IUjJYSkhkUDkyT3B5VHE1?=
 =?utf-8?B?MHhSVm1HcDluelRtWDB3TnVpUHhiazAyUFZuTmRLemtZQWVmMVl0cDNvSDBR?=
 =?utf-8?B?a1R1OGFxZ1JOWUQyemVlVkFUOEhmZGdpUmlmTTYzQ0pINmRnNVZFL3RHVmdr?=
 =?utf-8?B?M2kwUWhEbkJSTGZqOEphdmJYcWo5UUhnZDNCMTBjZ21DeTZ1UW9NRnFxS21s?=
 =?utf-8?B?ZGR2SGRmaDgzWGlCOUFGM0Ric3JmVzh1aEtGaG5NS01ZS1llemx2eW9nU1dz?=
 =?utf-8?B?UVA2RWtFeWdvRmZ5ektNaE11UUw3NXQ4eVd1QlJKWnJIODYyR1F5UlAyTThJ?=
 =?utf-8?B?TGw1NDB1U0t1SVo1K25VY3lDbTdFMVI3Q2lYWEd1dytUOHpBcUNoUUQ1dHlZ?=
 =?utf-8?B?S2RNcTB1L01mc0Zyc2lNKzc4dWsxT2V0d09wK0J1MjVWYkJZM0xuYlRyMC9K?=
 =?utf-8?B?WFlZYjlBMEZwMFR1SGhSTUlQNTR3TU5DYlJuMWdzeUZBd0NKcWJCVFVxOUw2?=
 =?utf-8?B?b2lEYjVnWnFXQ215Sk80Sm1xOUxQQVFFUzZZeWtpVFRFZWNDS1JoTnRQdjdV?=
 =?utf-8?B?TjZCTklYVUozcEtRSTdTdWJFdnBwMTArVlBPSytBL0VPUmRiN2didlZDaDUy?=
 =?utf-8?B?S2RWOUhUanpWTEFVdmZ6Q09WMXoxQUNiTVhCOTd4bVRQOVZYbWppV2ZzdjNy?=
 =?utf-8?B?Q0FTUGFlcW5VN1ZiOFdWTWFXQlY2QkFEM1NySUhmVXFFQUJJditQUEZuY3dB?=
 =?utf-8?B?N3E5elE3eDFLTUlmeTgxcnYybVdVMkxBdmR1QkpMRUxhU1A3UU01T3Y5Rzc1?=
 =?utf-8?B?QmhUdzJqanlNcjY5QW1FTWJYQmRGdm1iVFJMa1dicHBzakdBS0tVVEd2NlBi?=
 =?utf-8?Q?lOETh3Xb5PNuQmPYHAZ6BTibr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50b0c58-149c-4541-a4d5-08da8f458fba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:50:15.6360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwMHNPo3Iy9CKGTi21aP9ZYdFdfwSdh83i/pSWl4ORifGpXLjR35ymKTIKhKifkDHYepU+8w3sFVdtv37hVLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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


On 9/5/2022 4:56 PM, Christian König wrote:
>
>
> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>> Here's on debug adding an enable_signaling callback for the stub
>> fences and enabling software signaling for the stub fence which
>> is always signaled. This fence should enable software signaling
>> otherwise the AMD GPU scheduler will cause a GPU reset due to a
>> GPU scheduler cleanup activity timeout.
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 066400ed8841..0a67af945ef8 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -27,6 +27,10 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>>   static struct dma_fence dma_fence_stub;
>>   +#ifdef CONFIG_DEBUG_FS
>> +static bool __dma_fence_enable_signaling(struct dma_fence *fence);
>> +#endif
>> +
>>   /*
>>    * fence context counter: each execution context should have its own
>>    * fence context, this allows checking if fences belong to the same
>> @@ -116,9 +120,19 @@ static const char 
>> *dma_fence_stub_get_name(struct dma_fence *fence)
>>           return "stub";
>>   }
>>   +#ifdef CONFIG_DEBUG_FS
>> +static bool dma_fence_stub_enable_signaling(struct dma_fence *f)
>> +{
>> +    return true;
>> +}
>> +#endif
>
> Again, adding the callback is unnecessary.

sure, I will remove callback from here and other patch also.

~arvind

>
>> +
>>   static const struct dma_fence_ops dma_fence_stub_ops = {
>>       .get_driver_name = dma_fence_stub_get_name,
>>       .get_timeline_name = dma_fence_stub_get_name,
>> +#ifdef CONFIG_DEBUG_FS
>> +    .enable_signaling =  dma_fence_stub_enable_signaling,
>> +#endif
>>   };
>>     /**
>> @@ -136,6 +150,9 @@ struct dma_fence *dma_fence_get_stub(void)
>>                      &dma_fence_stub_ops,
>>                      &dma_fence_stub_lock,
>>                      0, 0);
>> +#ifdef CONFIG_DEBUG_FS
>> +        __dma_fence_enable_signaling(&dma_fence_stub);
>> +#endif
>>           dma_fence_signal_locked(&dma_fence_stub);
>>       }
>>       spin_unlock(&dma_fence_stub_lock);
>
