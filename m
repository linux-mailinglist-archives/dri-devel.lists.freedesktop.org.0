Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47F38B142
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDD6E405;
	Thu, 20 May 2021 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4776E402;
 Thu, 20 May 2021 14:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko9RZG3/fMBqnrB9wO+pN5UBcOU3isjTfC6eoLkuSO6mOUhiJjpESvuEuJHHa+YTNvfo+fEuAne1FT08uuS22gjhkKXenlanQKZfnsGcVlXJzD0Q6ISsU6H8KfMQ9aGxzhtSHxjeABK6RqtV7cMLSEg0ihVbB6PP9bbfs2SHaDEB5F5FubymlKgovC5lfGouh+QRnxVktNhI2t5v7yL192J+7a+X1yyg+dQBo5GQxrfUfw8qLqQPcQBs+a5ujzDMcHCtJ+9QAu+60oaeC298bZySRWY0rlIieAAJMWzsdR6bjDKNXoflpD2spueHJ/2NiPtPtnUnTIxdGa6jM5c/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QMbNqA+0lIrttnAt2Umj1ldsBbm0VngX6J/9WLTWU=;
 b=SyXgNvyomH2w1/m/8QgYryscPvIo+FNy/r107Dhi7e6EzlAW1RhzyZEGQTo6LIIyOfCVMozp2ZMCXsOjbE6/R1/rbbZwdM+pmIOJpjrQ9DXZH6QiIK27MxrqGwwHU19FqrYOJcftYknk7IE7ynEG8jVCkgpNtgkD+35EPtFsaJlK8gjM14SUzh9PMSxvDfQMoawHR/3GbMaf1SddTl4yYYQbMtiqYp7TXcJEC+b5IX7wRcZ3H5rZctS+L5clI15mN8kuPq0kcjxPK3ANUjNf+BvT5n1nQ9uoXaH+RcZcizKmpxpRe+6iyhHcES1rX8BU3WrB6f81rBvcBCbttZPExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QMbNqA+0lIrttnAt2Umj1ldsBbm0VngX6J/9WLTWU=;
 b=C4Fi5UHtTo00PFFdnnj7+qKsUV7G+rUQScktbTHimg1mVRT4cetEaeqJNAixXYjaaxVtCKohaRk6K1zSFq69w2ScPlFCTe42YfT6PrAdI/uQPe0XBgc/invV7z+uAB4RWhQIPp8N1hX+UNwfRi/0lYuwaKuryiV+RsRddptmiic=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:11:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 14:11:26 +0000
Subject: Re: [RFC 1/3] dma-fence: Add boost fence op
To: Rob Clark <robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
Date: Thu, 20 May 2021 16:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:11:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6afb75b9-885f-4ee1-8b6c-08d91b992797
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900389E27942A6D7BB36E8B832A9@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WrhJxArlGCU6pYBUG7CrQkYD1kLu6p3JDp3yCx1LxH48jfxezYhotkwKoLJiqqI5hLkF5WWidCUwcIFbaCCqko7EDESBnvU0QCWkUNR9Ka0Y5Lr1PSC21FxeC6wyioseuakZgDmDxSjjTdwpmLb/wYhsiWjy6oI+zVk5RrxA5a512wThDsJPPSBKbt4nstxhe3qlxzc264PXjlVXoC92ofO9EXch5t3Aub9v3fZ9D9WqiWk/e9lSO2XgbWIUUIDHjQwfICQZKY7tjBw2/zMmEOA+oV/q657EZXtO5H+8Trk9pmt1ZWzkb2zThzuuKIhYPgyIeZSB4riIFjRyVc9CA7Fr1tTDPIpzlSLTeErpaqfPcY7B4hbHjl12C6KOCkk6cKfFboHQabi5it266y3PPTHHH4r/cXHxYvAnHvX3D45S95Dwm4uTci6V/s4hr/p3QG145jbNssrJOJ0oPxUF2KwGq/Lf1+hUVGD1eDpTWhhIi3onO7q+XkmxG8bpdpYv4595tXLLvxu9p+foIpoVXMt7HvAoSfyxKawXw58xOznb5Z/kIZVEb/72t/+7dnQrH24Bt0E6CHh/uhdigLlAMuA69jKRpfpmCLAfqEmV+pmzXwI6cOy5q/HCEMmiW/ihyv8XKnMfVH5qHIMtHBzmtg3ub/gcGbLOPAe0W3A1RemOwYp0syMii7AdxDIXSb5Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(186003)(8936002)(16526019)(6486002)(6666004)(66574015)(83380400001)(31686004)(36756003)(8676002)(2906002)(38100700002)(6916009)(66946007)(478600001)(316002)(5660300002)(52116002)(53546011)(31696002)(54906003)(66556008)(66476007)(2616005)(4326008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWN4ZGVrR0xIYURPQUxQc0d2TGlkdmYrYnhiWXNCditLVUh2ZEJqM1JSellq?=
 =?utf-8?B?TnJVQ1JhdDk4MFhWY1prMGlkbk9tZlVrTHFzc2FScWRacjBHZHMvVURzdXMw?=
 =?utf-8?B?SE5WaEx3blRQMVVVSXdtNktDdzNoWkVvZzk1MTYrSW1JTFN5am1BdVBDYnA5?=
 =?utf-8?B?cUdUeGw5bStkL1Z3QzBqSXJuN2lqTnBDQ1FMOHp2bEJaNllRWUU5dlZRdEpU?=
 =?utf-8?B?VkxTTzNLbUtUdGx6NndWUTBPU3QvUmNXVFNuQkNWQlg4VlVaVkZHNk1ROTBp?=
 =?utf-8?B?d3JnVHQyRDczR3dVdUtSdi84ZlhtVHdyWXE0NFp0RFZnb0ExLyt0M3BZUUw4?=
 =?utf-8?B?LzBGbENFdnpXbldXZUxESlRURGR0Ry9TRmJNWUsyQTU0NkRjektLZ3lpNVF5?=
 =?utf-8?B?T0NRNUhObzdSMTR0L045bTU0a3FzTWMxajRoL0NYcER2Nm40YlJwN2ZzSGZP?=
 =?utf-8?B?S0dQdGxxVGR4V05NYzV5MitQWWpKS2RSUmh4TjN4OGJ6SUVRQ1ZPdkRJZUJ4?=
 =?utf-8?B?aWs0bmpqVW5YcFFUOU13U05sYUxPTTZIR1UxUy8wUndJbDJzOFpKbzhMcjBS?=
 =?utf-8?B?Y1NMdWtIUVd4cHBjMnRSUzdQejR3QysvZEVBTTVNblg1MHdodlZacWNMZllI?=
 =?utf-8?B?NnExRUM3OTBWK2FBSC9DWDFvdmg0U3BVUkVqdUIyU1JqVk9VQWNMKzhxQ08v?=
 =?utf-8?B?OGlJTjhTNXZlZS9CVkxWSFgzakNnNFJZbXZkTDR4R2dJTHN3VU4zRXJSYkJH?=
 =?utf-8?B?SEsvdngxS1lPWEE1aG9NbkhHb3ROd2hGd3ZVdjhYRnAvZDlkbGFVRlhtMDYy?=
 =?utf-8?B?SUVhL2xjWW5QakJJRW5EL1d2YW1KTEVJNGJrY3VqWXFlZlJyWkdYSTFHRlF4?=
 =?utf-8?B?ZWV1YlJlWnVBSHNhd2krZUJxdWhqQWRMMWFuZmp2U1d3Ymd3eXZyMkR6YXYr?=
 =?utf-8?B?bEwzRXI1V09oU2R6R3NwSE1FSy9xWGNITGdZdmoxWkdZbk5FUVIwVXdiN1Na?=
 =?utf-8?B?ZGd3T0hYS1V5YXFIYVpDZEt2VmFwQjJjc3Y4MklyUGcvUWpCZGt5ajAveXVR?=
 =?utf-8?B?WmxaU2NESUtNSzg0anlLVTNhN29LcEx2RWwzc0tmV2V5ekVLVktBdlpvSDh4?=
 =?utf-8?B?OEVqdW83aUxHL1V5WmhOWU9XYUpTRTVubFBieS9zd2dpNEpPOHhNUStJbFNR?=
 =?utf-8?B?bkVub1Y4QWtwT3ZWOThpcXNxcldFWWM0M1R2RnlESS9SSUZUMWg1NFRUUlMz?=
 =?utf-8?B?a0lpdE1pcHdNYTR2VGZoQkVIZ2w0V1NwQjBDU1JXMldMU3B3WGdqc2F5TUNV?=
 =?utf-8?B?Zk5FeS9nbExETldCVm10dDA0d28wVHdWejVWMkhGSHVzZGNXNDZEaXhwUXNt?=
 =?utf-8?B?TnZlcjFQWG55UitZZXB4cWVCbzBQL0NMblRVTEZaSjdYakpXRFBpZU1ORXVF?=
 =?utf-8?B?SThJNWxxbjNXYXV1d3cyVEpxS3laSzhIaUJSZFBFb041Q2pXTFJROUJjTXdR?=
 =?utf-8?B?UlNGSVFRVHBodG0rdXByaWFCSW1Nc0VKeXdXWkNRMWRERThyRE03aWROeWUz?=
 =?utf-8?B?RlcxZDRPSUhnN241NGFRb0huRUI0ZjFjdnRaUEdTaEVZT3BJYnRJaHRScVpX?=
 =?utf-8?B?WGtiQ1lXd2pUR3M1NVNXakR3R3QrbmRScVErOWg1OHZPYm50Nkk5UXd3dXVP?=
 =?utf-8?B?RWJiWTBFWGVnN2ZPTEtrbEkrMlBCVjJNMGg1UE50cEdHZnJBRVdDbUFpU2dq?=
 =?utf-8?B?a2xhQUZ6VUFoSWdvbUdHcWJlOHg0L1UvakhtbnJpQk9sTktueFpjOEF3RGRl?=
 =?utf-8?B?dGpJN0VPei9NbE83dndzNEJSVzFYb3dJT1oyU0tYUDdKOHJESSt0M2dYS0dD?=
 =?utf-8?Q?gnFmQ8VDdIjwD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afb75b9-885f-4ee1-8b6c-08d91b992797
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:11:25.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qOqb5VsGaNrueZJdMSmiDyz/ihJD6KpGi4Lvu8Q/PpthobY8lbBUrQVDEoAEvsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.05.21 um 16:07 schrieb Rob Clark:
> On Wed, May 19, 2021 at 11:47 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Uff, that looks very hardware specific to me.
> Howso?  I'm not sure I agree.. and even if it was not useful for some
> hw, it should be useful for enough drivers (and harm no drivers), so I
> still think it is a good idea
>
> The fallback plan is to go the i915 route and stop using atomic
> helpers and do the same thing inside the driver, but that doesn't help
> any of the cases where you have a separate kms and gpu driver.

Yeah, that's certainly not something we want.

>> As far as I can see you can also implement completely inside the backend
>> by starting a timer on enable_signaling, don't you?
> Not really.. I mean, the fact that something waited on a fence could
> be a useful input signal to gpu freq governor, but it is entirely
> insufficient..
>
> If the cpu is spending a lot of time waiting on a fence, cpufreq will
> clock down so you spend less time waiting.  And no problem has been
> solved.  You absolutely need the concept of a missed deadline, and a
> timer doesn't give you that.

Ok then I probably don't understand the use case here.

What exactly do you try to solve?

Thanks,
Christian.

>
> BR,
> -R
>
>> Christian.
>>
>> Am 19.05.21 um 20:38 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Add a way to hint to the fence signaler that a fence waiter has missed a
>>> deadline waiting on the fence.
>>>
>>> In some cases, missing a vblank can result in lower gpu utilization,
>>> when really we want to go in the opposite direction and boost gpu freq.
>>> The boost callback gives some feedback to the fence signaler that we
>>> are missing deadlines, so it can take this into account in it's freq/
>>> utilization calculations.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 9f12efaaa93a..172702521acc 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
>>>        signed long (*wait)(struct dma_fence *fence,
>>>                            bool intr, signed long timeout);
>>>
>>> +     /**
>>> +      * @boost:
>>> +      *
>>> +      * Optional callback, to indicate that a fence waiter missed a deadline.
>>> +      * This can serve as a signal that (if possible) whatever signals the
>>> +      * fence should boost it's clocks.
>>> +      *
>>> +      * This can be called in any context that can call dma_fence_wait().
>>> +      */
>>> +     void (*boost)(struct dma_fence *fence);
>>> +
>>>        /**
>>>         * @release:
>>>         *
>>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>>>        return ret < 0 ? ret : 0;
>>>    }
>>>
>>> +/**
>>> + * dma_fence_boost - hint from waiter that it missed a deadline
>>> + *
>>> + * @fence: the fence that caused the missed deadline
>>> + *
>>> + * This function gives a hint from a fence waiter that a deadline was
>>> + * missed, so that the fence signaler can factor this in to device
>>> + * power state decisions
>>> + */
>>> +static inline void dma_fence_boost(struct dma_fence *fence)
>>> +{
>>> +     if (fence->ops->boost)
>>> +             fence->ops->boost(fence);
>>> +}
>>> +
>>>    struct dma_fence *dma_fence_get_stub(void);
>>>    u64 dma_fence_context_alloc(unsigned num);
>>>

