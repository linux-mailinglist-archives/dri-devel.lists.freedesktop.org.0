Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F9445014
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104296EBFD;
	Thu,  4 Nov 2021 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B4E6EBFD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 08:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgCPJIXVZmk6LpGA4iYO2mE18ZPhnuW2iICBF6UyJY5W2CiK4QbZUoP7+dmdZUco6BLr7ql2y0VSwM7QLlFRdMaFOcBYVbtOngaesNMcAUfncufwOyuKOhac/nRK+faRj9NnLmUtjoKKyKlGVp9NDSV96cK5H3W8evcySK9rREm82ODuEWcrlWq1QR6JNZvch+A7bgnLAUFVNkXJ8UloQ0j807s7iRsGfJlHRMJOk3F/0UNiRcjjhBs4IOkifPu6uB+iv7mVZjHDRfs4u/npQeXZSGrNSfEvSoqWMmhUrjDfVO0kq1+daM+qUYZddzq2RVW+TEcf0UHdG4x77ruVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+3i3o7LynXrCaVGmQnK0Kg/tQoYi4azm67c2lysRPY=;
 b=bjjKVOgVFOIjr7i5kxMEF/myiCCK8s+85kWLlxxRtM4adS20ZdSiWVaeZY88tWhNL2ibQ/gOlPJWYZhUNN4Nc2+4sPsMKgz4iwKjIOO2b2wtqLnWtXyp+xo827B8oOG8i1ihR6HqGXaS1+0UbcDUFBRBbO+UiYmSdnyf605vV1RMZ8v3YLBbFwDeUDiqLdCSS4PpNtDvBWReYEXpskaLRkR794KWTuUpaUBC5Y0diEqdVIzNQdsKQhTFNFNGDe1caZqAUVoIl9ATSJn9/tFApd2XWiZNlQ33fhJSy64f/ToAWZbptPDo7hlCLwumnBY+avV+dP7L9TaAQGqGjmPRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+3i3o7LynXrCaVGmQnK0Kg/tQoYi4azm67c2lysRPY=;
 b=HcwkMabfIwtjO35JOc2gUVNVE346Qvrev0KwFbXWerQFS0sN5+4I97eGf89aRQghFcyOcFKDyrC5J/+Fcfj0WjdlgYE7PTI1Zufnierx/gcExTfDJOpJytAjCcqN48UqyZaGncpyVTBrSF0KjCATkir3OunKBtpfspRQiTASyMk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0112.namprd12.prod.outlook.com
 (2603:10b6:301:5a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 08:20:50 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 08:20:50 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/poll: Get a file reference for
 outstanding fence callbacks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
 <884050b3-5e7d-c00b-5467-290cfc57e0ea@gmail.com>
 <20cfea36-a8cc-7bd1-9604-57efdf4710e2@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c0265dc9-15c4-e838-f183-3e9b82a6ff50@amd.com>
Date: Thu, 4 Nov 2021 09:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20cfea36-a8cc-7bd1-9604-57efdf4710e2@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0286.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AS9PR06CA0286.eurprd06.prod.outlook.com (2603:10a6:20b:45a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 08:20:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de6ddc43-be41-40e0-b920-08d99f6c01ed
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0112:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0112A3AFA79F378E05A36FEB838D9@MWHPR1201MB0112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hkZZIujAOmhusP8USiWM9hI1ALSDo4eDYLmtjjhsSCtgeCfAI8szlbhqm9hFkaNLYNcdjK9s6OZUEiSmJRKptUT4QoW5PkTrEukWMQFPQby0kd7yXRYFTiEOiC9BxDapgg/WyXTkGP1OM26GZJrPQPxWaEupRpPIyASPs9yLzviAEKHN437aPABsPyxAHn1rCIsk0+7SvCAUUioHWdy9RMBhQe0Fdl3T/6YhjAIiCOEw2qHVH6j8paHLCaAOws48rVPFzhSQ2fp63AAIHHh8onAEZJEICVLx6SygySFjJBcG69Aewf+PDyHyvbtPZ6YGMX4bKXuMEDdvV+dE8ydIUl5QcTOu0Sgy+FCavsiE7sWsCuSM9lb7vhJsV8Y0hteK1MSkfa4rKL2qyPIPVAr3K3zLcDBDOYvCC/6vIZy7Pqh66nqSh+qufioHxQhMbcqDXoRvSuGyZqGSIlSGO2d+DxU8j0pqNfqD9g05o8iL1k8HrXOM91mUN5MKbDdxnu0lIoFa1fLeDNqy8lVbyetGymuWewxJLcLVcrCH9uYwdVLRUrO7DhKf+JR7xpayamZ/xT1+IRMS1EWKp1ff9fM+mbeOU+736+c7SGqaYBpBy05KuTMcsTEw4A8/VIXEbMXmDz+1w5S+n8FEhC+4zqtcLgweumvg4cdPKRK8lwSqA5DFZfz+hShQMe5JdWjqvRmFM1vzS2E3+lO7VKZn4b3SgNo9iAtgfZPLmwrFHbUgXQ4RYb8iyOk4rnzPJdkhAGL+wCPH6x94xIQB90BbqJcFag1Zgr4IjNUUFPh2Dp0ExnWN1ajc2Vl+gRbRULUbthv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(38100700002)(8936002)(8676002)(31696002)(83380400001)(66476007)(186003)(66946007)(66556008)(53546011)(966005)(26005)(86362001)(16576012)(2906002)(6486002)(36756003)(508600001)(110136005)(6666004)(956004)(4326008)(45080400002)(316002)(2616005)(31686004)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBPVFFXaHNNUXhtczlHcllBcHRkMGFFODVadlYrOWFqRkQ1cTNoN3FMcklS?=
 =?utf-8?B?YitGU1ZJbVVJM0hXNzAwL2hYOHZXSDFzWnRlM1Q0VHA2TkUrRFV4Y0JnUDlH?=
 =?utf-8?B?U1hUL2JodmNmUGZralY2cWxnR3pyTHpSd0hqa2RMM0hQV0M0dnF5RE5BV0d1?=
 =?utf-8?B?ZktmcjN5QjR2UEE4RldoWXlBQzFtMVpJZU9zdGI3SlRBeTZIOWhTTUFWc09n?=
 =?utf-8?B?ZHNFSW16MFBZQjdnMEY4Y2w4QmJyL051MHlnaFhKV3FvbFRNb2ZVb0J1K2w2?=
 =?utf-8?B?dC9SdmV3Y2d6ZWJzMVlIaW5SbDEvUy9rVDNOWDJuNThMdTdZd0tsOC9xSDhR?=
 =?utf-8?B?NVNvYmIycS9vVTlVb2crWmFQNEI3dmF2bzFTSHNDSEZ5MWJhOWR6aUNRekFi?=
 =?utf-8?B?OWxDNlA4ajZ4cmxwczNNRERlVWhrWUxHYVc0UHByRUc0WWJ2MEUvNXV1NTlt?=
 =?utf-8?B?a3ZsQW03aDhMamZjYVlHUnUzVjlnNkxMcTY1OUVFS09NRVBVU1NheDhWOHFL?=
 =?utf-8?B?dGZZa2xua3I0SGlDbzVWOFQxa0xtd05ydUxXY1A0ZmpLd1A4dWlnWUlVTDF2?=
 =?utf-8?B?aWozK3lPTDVZcUgxNE8rVC83SzhWSjBIeUtPZWtqU3c1aWZuL2JqeDBvd0tP?=
 =?utf-8?B?ZmcyaDBDQkd2WEx0aEg5SVJXZERlM3hUYUNQOXJ5OWVVUEx1b2Y1eVZGZWpj?=
 =?utf-8?B?d3FqaC9TV3FQYUlyVjBUWWw2UGoyNjhHaVhaelpJU2Q2WkYyYUtKWnNRdWtJ?=
 =?utf-8?B?bFdDNjRYVEwwVnBZQUl6R3lFYUZYdFlJNCtOQXRGY21IZmthNE9uUDJ0TFBV?=
 =?utf-8?B?aXYxdFVqcE5EelhCVTJaTXlndnI1ZGZ0MnpidGhwMkY4K2ZsaFRpNzQwSlc5?=
 =?utf-8?B?LzBPWU5ydWthZSttd1hQYXhmcXFQdDdKK1g1d0M0Z2xkVTJsWmJ5NzlzZEhW?=
 =?utf-8?B?OXN2NkZSSTVIdXl4TVhGYUZieEpzY094SGFtQUV4dFR3dU9uSVVMTGNKU1JB?=
 =?utf-8?B?ZUdWaGFCOU1idzhENzNKdHZncy9rL3dKVENCNWFMVFh4QUxCR2ZHbzhRV2E5?=
 =?utf-8?B?dXlTZHYyeGttellEa25KZ24xeGdQRVFCR3ljRitPcTE2eDhmek1kNW9wdmhU?=
 =?utf-8?B?bndvNmdkUGlOakkwNDZldDZMNUNScm93RFY2akpUb3phbEN0Tk9Yb2JHZkhI?=
 =?utf-8?B?ckduZk42LzdhdjMzWW5IQWk0SHhJdkd6SDhoVzJoNlVEUjNxVktPOG1XV2NX?=
 =?utf-8?B?Rks4Sk9DWXVBQlovZmJ1ZGRvenplYXV4Tm1USjJYa3NsbFg2NVNsQzNEUjds?=
 =?utf-8?B?cHI3Vi9vbEtoc2Y0STE2eEU1NHRqVjZTWlpFSUJ3OER3anA4cHliRHZML2Yr?=
 =?utf-8?B?aUlzZGVCSzVURS9xMzZka1hhLzkyNUZRbzZld2VhbUE2N1FGa2RSaUdUQTBQ?=
 =?utf-8?B?MmY1cHArYWg1VVU0eW1wQ0dIa2NPSzBRNlNFWXNZTkwyeDZra3lzbjUwQVh6?=
 =?utf-8?B?WXJjbXlXNnBXVitDMVpkMTArcktkQklqTTF5S05rbVc2QnR0QW5CQzdkVm51?=
 =?utf-8?B?Y0JzSGRpd3lrMW1GYmhuR2d5Qk1XWDM0QU9jSDRYa1FjZ3pjMU5OWlJnS1Bu?=
 =?utf-8?B?ZjllUmtGRlN0R2ZSbHp4TkxXdWpzaFA2R0hMMHliUHYrMEVTU214VDQ0REJV?=
 =?utf-8?B?c1VtanllZzFHeVN2cmlQU09KcVdJdll6U2Z5eWNGbjlLM3oxd3dUQlg4TXZp?=
 =?utf-8?B?cmFzZFlaaU9hUm5ZVjdTQUxJN2ROSktwbXk3MG5xanpLVUhGd1FYU0pEaE1D?=
 =?utf-8?B?NlBRSmQ0Yk5EbDRBN09TZTJvcHJNeSt1aXJ4eWdhY1U5bUtPRGtSMjBKd3NE?=
 =?utf-8?B?ZnZnU2JqV3VHY0JDSklhelRydUZWTjhtODZnOWtGOUVBRzlxTDgrZ3ozZjRJ?=
 =?utf-8?B?QW4zS0thNW9lT0gzT1I5WkVabFg4elJ6KzNmTWN5ZldLcWxpRndiWVVjMkY2?=
 =?utf-8?B?VTFUSjRhRWpWNnBLV2ptRFg1b0lIbWtRbmN4Sjk4eHk5dnhmaS82NE5uWVFn?=
 =?utf-8?B?R2s1M21iZE9sejNMQ3R6YUVDbzhSS25UcENLN0JnblVEamUzdUZvL2dDeHhj?=
 =?utf-8?Q?MTnQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6ddc43-be41-40e0-b920-08d99f6c01ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:20:49.9771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwniUC0qDFfGAlk7ixSn1imwDWiQ536aj5K2UXD68svcWEsGf8GL9+nZgZgUyTNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0112
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.11.21 um 15:50 schrieb Michel Dänzer:
> On 2021-07-23 10:22, Christian König wrote:
>> Am 23.07.21 um 10:19 schrieb Michel Dänzer:
>>> On 2021-07-23 10:04 a.m., Christian König wrote:
>>>> Am 23.07.21 um 09:58 schrieb Michel Dänzer:
>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>
>>>>> This makes sure we don't hit the
>>>>>
>>>>>       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>>>
>>>>> in dma_buf_release, which could be triggered by user space closing the
>>>>> dma-buf file description while there are outstanding fence callbacks
>>>>> from dma_buf_poll.
>>>> I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
>>> I was able to hit the BUG_ON with https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C8d930ab39011481a839c08d99ed95755%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637715479787056688%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SjxSZIsWkP7ru1iHyL0IY9hN9882ENv7Cy38vzOtqyc%3D&amp;reserved=0 .
>>>
>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>> ---
>>>>>     drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
>>>>>     1 file changed, 12 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>> index 6c520c9bd93c..ec25498a971f 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
>>>>>         BUG_ON(dmabuf->vmapping_counter);
>>>>>           /*
>>>>> -     * Any fences that a dma-buf poll can wait on should be signaled
>>>>> -     * before releasing dma-buf. This is the responsibility of each
>>>>> -     * driver that uses the reservation objects.
>>>>> -     *
>>>>> -     * If you hit this BUG() it means someone dropped their ref to the
>>>>> -     * dma-buf while still having pending operation to the buffer.
>>>>> +     * If you hit this BUG() it could mean:
>>>>> +     * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
>>>>> +     * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
>>>>>          */
>>>>>         BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>>>     @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>>     static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>>>     {
>>>>>         struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
>>>>> +    struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
>>>>>         unsigned long flags;
>>>>>           spin_lock_irqsave(&dcb->poll->lock, flags);
>>>>> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>>>         dcb->active = 0;
>>>>>         spin_unlock_irqrestore(&dcb->poll->lock, flags);
>>>>>         dma_fence_put(fence);
>>>>> +    /* Paired with get_file in dma_buf_poll */
>>>>> +    fput(dmabuf->file);
>>>> Is calling fput() in interrupt context ok? IIRC that could potentially sleep.
>>> Looks fine AFAICT: It has
>>>
>>>          if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
>>>
>>> and as a fallback for that, it adds the file to a lock-less delayed_fput_list which is processed by a workqueue.
>> Ah, yes that makes sense.
>>
>> Fell free to add Reviewed-by: Christian König <christian.koenig@amd.com>
> Thanks! AFAICT this fix can be merged now for 5.16?

I've just pushed it to drm-misc-next-fixes since it won't even apply to 
drm-misc-fixes.

Could be that we get requests to backport this because of the CC stable.

Christian.


