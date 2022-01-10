Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC14890F2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 08:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29111B261;
	Mon, 10 Jan 2022 07:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A70011B27F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 07:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9djzW3zz4GB4sdprzOa78YlMEI7G6NMDQsvgYE+4MPJf05aaOzP3TlrfnTx6+qwyskZARH8KIv/EHeLInTh6vxX7YBjWxPITH5RJIe75eI+NFDc9B0gYc/DfuhFHpUp8muG4ko9T3PgMRAQWS2AFwO0E2pP5Wj5uOEg5CUf0VpbFkC3/RyXgkWliqaiamzNft5+WNG6cuStsKjP18+9DDJVb7qc8doFT10ZYe1zlCvepkYZjCyseZyqaaH3zMT3v8QzzBjPy+UjFGLOMgG4F592cVNWfbl5RoEXb3NAhnyiYmveMCzUeUmanVE1kz76xZaiN3fiOAS5ey4PJ/c0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXwOiXGX/2/8P4/qRAcq5FdCw1pdNLfolTqFIso0OeY=;
 b=PcTo0kvVAau3BU02cBcr3V2erzzTT057TOb/BGDVeAVu/Rmqf2WhqFMYlXnbJfMpzKcihPy3VgiU+AAgNLO4kA8UwBhngFI0g/hr82DzZtDIIYw7APoyslqkJcVweUQIFUHrYr7/5X+JrRwdKCET+e0X4yHH5VFnYrt0JJYVQJzbHhAbYumCpOqqcq8pxxxY7/zZQXcWy5dnUgUC6gaGWWjCiGSMPUm44ap3H7lsAPVX5xr6KwdqpMT1OgYYfCGFEsZ7tiI80vOx+wzjkK8l9awKZuTS0nTq/VDHn8v0kkULdtm/j07qOttXEFiOrsog2omAqZpuJJ6nQTyWtusZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXwOiXGX/2/8P4/qRAcq5FdCw1pdNLfolTqFIso0OeY=;
 b=nTRZ3iPwIu4/D2b+YAUfil0OTheZG5Icf/32Xgkr77l5TV7F/rVi7E8rxlI23ZY4XTcL8tbZBg5tpzElNIKb/h8fl5/+0A7EPIDm2cyComNxZSW3aRff+gsFkMFrMwGj50mfHbw26An6xi2+ljrvuvIclL2S41XHtvcQFi092S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2492.namprd12.prod.outlook.com
 (2603:10b6:907:8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 07:28:17 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 07:28:16 +0000
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Hridya Valsaraju <hridya@google.com>
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
Date: Mon, 10 Jan 2022 08:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1471c9f1-f3d5-4f06-ffe1-08d9d40ac451
X-MS-TrafficTypeDiagnostic: MW2PR12MB2492:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2492B248C42FDA4E3AE59C0583509@MW2PR12MB2492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBy1gcrApnrp5nNhqu61t2V1AXvMfs+GwwjH3V0MCOL3fmqtaWd0L044JVvqCWBrhTa+2E7XFxOsOjtCOCnO1yrtNfLnRhWPBNbORdGtxFCdZiUHbFbwtga8dZUNVWbFv45zFue+CEPsqls4cbxPf3FB7z848GeUaf7DKEgsQKo+t9NrECOoKQw+8QUtfvkpb+J3gGhmZHqglRV3ebj5/Ez5+5dGJO3rwD/880D+Ug+zrtQ/R6LHmbc5ZhrKbWR6C+5CXuHNO3YPI/1/TLTbHuPAaUAUEMFUStJbXRVrqMVJct/f0abWfEmwfX7ZgSKwmP5u6S8pZrdL3NfITL3+36TrSXkOdXBzjz6gx4FoKRWF0wm4mfgJX/zdN+fJK0Y6Rb8PYiri0JzYT4IL1CTuO5SSq6gLxKY9M/GzAJfruUEskAjbu0TERC/AWBKRNv7Qr0JnyuRlaO98WDdZ+4eJs1KSJUP2Pxpeo6ra5GAINWMY7JmwxuOGK5sEFiOGv2TDfZK+kXoTSDuL+MKwon7lPvob0rZib9vjNf9PZOhyHduGa7e2yYBEQhAvL3rqhN1bhCG3fFrcSxwMsGu3s4CwVzO9AirS88U4xQEgoJ87XorbSKjbArQgB75FYcMN4Pjll2B29k7EWt0PiN7AttRhL7j43aNZTYnTT2gFiwijknLKWV6RhZPMPKISxOqMLbXWioB7DDZWM4xz33jBeHAxf0Wya9dU4tqDCdpE5Hn5Hbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(6916009)(66946007)(53546011)(316002)(66476007)(8936002)(6506007)(2906002)(4326008)(83380400001)(66556008)(6486002)(54906003)(31686004)(86362001)(7416002)(31696002)(6512007)(30864003)(5660300002)(186003)(36756003)(508600001)(6666004)(26005)(2616005)(38100700002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFRtTXhmZVFoQWNKTVREaFA2bFNGTmNFbHkvcWs0WDc0c3crZ1B0WEM1amFm?=
 =?utf-8?B?SmUvMkFPVndCOWk0TmVsRjF3ckM1WGY1aUNkSXh0dFlPUkZLZlB4aEJBbkt4?=
 =?utf-8?B?WGtrTnpuOWlnSENEakZ5VDR6dXlsQjdmZXJPNjEvZEJBc1VWeWdncm51Z0tE?=
 =?utf-8?B?RytwRVVvS0s1cXlvNHZUTkkwcXdHV0UzNXFKWGJ4K1FZd0NVMk5wMVJOUjEr?=
 =?utf-8?B?eXNmYXV0K25FY3EvSEJLcytORk9CcmxiTysvOS92emhrRXdsaVJndzZ4TURi?=
 =?utf-8?B?UDRoSHk0M2Qwbm9VZHEvbXJEdm00U3hvd0hYaDhoV2RGcyt3eDI4ZmcyNVoy?=
 =?utf-8?B?dnlTQnl4TGhFRXNEZ01keTZCbHlINGk0WSt5bGlTVExtd2NBd1p5T1VwampR?=
 =?utf-8?B?djhPM0NHR2NsTUc0TzU1dmlMczk0Z2NoSXM5dlRlUTRkU25Iai9SQStCSmRs?=
 =?utf-8?B?eTd3eGZLZEExWjhOMWk5Yi9PRXVMK01PYTh5MG13TTR0QjduSUdqZ3RVODVN?=
 =?utf-8?B?VTBJZTljRjBwT250RzJTL3V6ODllNU5OMWlwUlAydXdjVGY0TTBvNkFtRWpx?=
 =?utf-8?B?Y0o0enhXNnFubzRpUVFaN1BrcWRCekJzODdzVzVUdDg0NVBEZ1lnQ2VwMTRs?=
 =?utf-8?B?Y1J2VVA2MGp4dEl5aDBqaEFEZ2ZjVC9DMDJsQlFTYTAvRHc0ajRZQXI0VGt6?=
 =?utf-8?B?UytBTGlNMy9tcUZKR0ovclFPd2JDL3cyek1KQ3Y5cVRYZnY4eUFaMnVjTThN?=
 =?utf-8?B?QUJaZk1jSThEL1FQNzZVTFJMODBVRHZmOVJqUDJhcStOaDk5dmt5S3ZaQyt2?=
 =?utf-8?B?VXdMYmZRZVVXRzJJdkE2bHAvYkErcWNmb0ZEajIvZVhFZUhyTXFjdi9Odm5W?=
 =?utf-8?B?ZDJPbFZFME94cFEvZDlmNStDRWtvVFQ5OG5PU2Y0TERWMzFFRnhSeEhNMmls?=
 =?utf-8?B?V1VrajNVaFFZdWJjVUFoYTJHZDl1NnFxdVVGclpnN0tMamExQ1lEN3E1dXpz?=
 =?utf-8?B?N3UvNklOYlYxdWpiNlI2ZTJYUTRQM0lUckxwYXpKb3pPVDBtRkhBUTh1OUZo?=
 =?utf-8?B?UGhaV2hjSUE1S2UzMnFDNHZyamlFVTFJQmJhQ3RBLzR5cWx6aVlPTHVVU1J1?=
 =?utf-8?B?ZWZhYStPWHcydFdock9lZUE3RTRRR1lnbWpCa0JrL3RIRzZZWjlkMnRVT1Fn?=
 =?utf-8?B?aGNvZDFBTVlzVG5RVW1VRGNLdXVMRW0rOC8rVk9xT2h4dlcrczQ3U1RKb3lq?=
 =?utf-8?B?VktBYWZuUHNicDZWQ2hRUit4NjZTME56dVlGdmI0eGVNREFZN1VoODd3OTkx?=
 =?utf-8?B?SVh6cE8yT0dqSUk0MUVyL1lsWjd1b2FXRGpCaklPSlJsUVJ3c0VCNWd4Nlhr?=
 =?utf-8?B?alRaNDRXSm1NQkZIaWlnTjJCWWIrOHdXRFFEVmlGV1h6ZlkyVjBmNUkvT29Q?=
 =?utf-8?B?UkJPcDFzSk5UVHk4RFFMdzVoV2R0WWVMUUhrVmk3Si8yeHlOanQ2SSt4MnM0?=
 =?utf-8?B?cjNRSHVkeXFzUGZHZ1lPQWNHZlF0bWhhODIveVVKZFNQYlA1L1d5U1pPQXdY?=
 =?utf-8?B?TklYQ2xob1B3V1ZtYUxncG5NL1FaT013ZVlvekx2OEJKM0lnMDc5QWpWR2t6?=
 =?utf-8?B?K2N4S29WelJRWHUxRnovV3dVcllPVm9YdmtUNXdTTDd3TUErd0ZaSEpEb0pU?=
 =?utf-8?B?ZUJBYk1HTm42UzRJL1E1eENVL2w5dzJwUlV4YmxlTFAxQmErNC8ydGc5VjI4?=
 =?utf-8?B?eDRrbmtQMk1jbTdZVGxkUlF2ajMxTTdPQ1RvMWorUHN3YTU4Zit5c3Q2aGQ0?=
 =?utf-8?B?MGYxQUpOR1ZhZ1pXRkR0QzhteVlHcG51NDk2TjQvOTBmMU9vM3dubXJzL280?=
 =?utf-8?B?QUpVMm1XNTJXOUwrZnkrZWZQMWN3dXlXT2VjblBaanR2WDdVK09FeTRPdm9R?=
 =?utf-8?B?UlVSV0dLTnNXam1ndXdsdEFyU0wrWFM1ZDBuanlqRjRxR25ETE41NHlNVHkv?=
 =?utf-8?B?Q0ZzdWZiT0JEVnBpZzNZTkJsUE90YlNCbEVucEV4R1k1RUMxaUZhVDRadGVS?=
 =?utf-8?B?TmhYaVJmaDMwSjRxME5nY0VSKy93aTlka2x4ZG1EWlFTUkhCellzVzVhTzQ0?=
 =?utf-8?Q?xdiU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1471c9f1-f3d5-4f06-ffe1-08d9d40ac451
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 07:28:16.3105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46nTxqYk7WtxDKoqF05wuDrbxxhNQyKKg8skxYjk0YS0WlJnorYmUv0UIy/Q6aEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2492
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
Cc: keescook@google.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.01.22 um 22:25 schrieb Hridya Valsaraju:
> On Fri, Jan 7, 2022 at 10:17 AM Hridya Valsaraju <hridya@google.com> wrote:
>> On Fri, Jan 7, 2022 at 2:22 AM Christian König <christian.koenig@amd.com> wrote:
>>> Am 06.01.22 um 20:04 schrieb Hridya Valsaraju:
>>>> On Thu, Jan 6, 2022 at 12:59 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
>>>>>> Recently, we noticed an issue where a process went into direct reclaim
>>>>>> while holding the kernfs rw semaphore for sysfs in write(exclusive)
>>>>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>>>>> to go into uninterruptible sleep since they needed to acquire the same
>>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>>>>> blocking DMA-BUF export/release for an indeterminate amount of time
>>>>>> while another process is holding the sysfs rw semaphore in exclusive
>>>>>> mode, this patch moves the per-buffer sysfs file creation/deleteion to
>>>>>> a kthread.
>>>>> Well I absolutely don't think that this is justified.
>>>>>
>>>>> You adding tons of complexity here just to avoid the overhead of
>>>>> creating the sysfs files while exporting DMA-bufs which is an operation
>>>>> which should be done exactly once in the lifecycle for the most common
>>>>> use case.
>>>>>
>>>>> Please explain further why that should be necessary.
>>>> Hi Christian,
>>>>
>>>> We noticed that the issue sometimes causes the exporting process to go
>>>> to the uninterrupted sleep state for tens of milliseconds which
>>>> unfortunately leads to user-perceptible UI jank. This is the reason
>>>> why we are trying to move the sysfs entry creation and deletion out of
>>>> the DMA-BUF export/release path. I will update the commit message to
>>>> include the same in the next revision.
>>> That is still not a justification for this change. The question is why
>>> do you need that in the first place?
>>>
>>> Exporting a DMA-buf should be something would should be very rarely,
>>> e.g. only at the start of an application.
>> Hi Christian,
>>
>> Yes, that is correct. Noticeable jank caused by the issue is not
>> present at all times and happens on UI transitions(for example during
>> app launches and exits) when there are several DMA-BUFs being exported
>> and released. This is especially true in the case of the camera app
>> since it exports and releases a relatively larger number of DMA-BUFs
>> during launch and exit respectively.

Well, that sounds at least better than before.

>>
>> Regards,
>> Hridya
>>
>>> So this strongly looks like you are trying to optimize for an use case
>>> where we should probably rethink what userspace is doing here instead.
> Hello Christian,
>
> If you don't mind, could you please elaborate on the above statement?

The purpose of DMA-buf is to share a rather low number of buffers 
between different drivers and/or applications.

For example with triple buffering we have three buffers shared between 
the camera driver and the display driver, same thing for use cases 
between rendering and display.

So even when you have ~100 applications open your should not share more 
than ~300 DMA-buf handles and doing that should absolutely not cause any 
problems like you described above.

Long story short when this affects your user experience then your user 
space is exporting *much* more buffers than expected. Especially since 
the sysfs overhead is completely negligible compared to the overhead 
drivers have when they export buffers.

I think in that light adding sysfs was rather questionable to begin 
with, but that change here is a complete no-go if you ask me. You are 
adding complexity to the kernel for something which should probably be 
optimized in userspace.

Regards,
Christian.

> Thanks in advance for the guidance!
>
> Regards,
> Hridya
>
>>> If we would want to go down this route you would need to change all the
>>> drivers implementing the DMA-buf export functionality to avoid
>>> uninterruptible sleep as well and that is certainly something I would NAK.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Thanks,
>>>> Hridya
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
>>>>>>     include/linux/dma-buf.h               |  46 ++++
>>>>>>     2 files changed, 366 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> index 053baadcada9..3251fdf2f05f 100644
>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> @@ -7,13 +7,39 @@
>>>>>>
>>>>>>     #include <linux/dma-buf.h>
>>>>>>     #include <linux/dma-resv.h>
>>>>>> +#include <linux/freezer.h>
>>>>>>     #include <linux/kobject.h>
>>>>>> +#include <linux/kthread.h>
>>>>>> +#include <linux/list.h>
>>>>>>     #include <linux/printk.h>
>>>>>> +#include <linux/sched/signal.h>
>>>>>>     #include <linux/slab.h>
>>>>>>     #include <linux/sysfs.h>
>>>>>>
>>>>>>     #include "dma-buf-sysfs-stats.h"
>>>>>>
>>>>>> +struct dmabuf_kobj_work {
>>>>>> +     struct list_head list;
>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>> +     unsigned long uid;
>>>>>> +};
>>>>>> +
>>>>>> +/* Both kobject setup and teardown work gets queued on the list. */
>>>>>> +static LIST_HEAD(dmabuf_kobj_work_list);
>>>>>> +
>>>>>> +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
>>>>>> +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
>>>>>> +
>>>>>> +/*
>>>>>> + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file being
>>>>>> + * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
>>>>>> + */
>>>>>> +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
>>>>>> +
>>>>>> +static struct task_struct *dmabuf_kobject_task;
>>>>>> +static wait_queue_head_t dmabuf_kobject_waitqueue;
>>>>>> +
>>>>>>     #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
>>>>>>
>>>>>>     /**
>>>>>> @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
>>>>>>         struct dma_buf_stats_attribute *attribute;
>>>>>>         struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>         struct dma_buf *dmabuf;
>>>>>> +     int ret;
>>>>>>
>>>>>>         attribute = to_dma_buf_stats_attr(attr);
>>>>>>         sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
>>>>>> +
>>>>>> +     /*
>>>>>> +      * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-BUF
>>>>>> +      * being freed while sysfs_entry->dmabuf is being accessed.
>>>>>> +      */
>>>>>> +     spin_lock(&dmabuf_sysfs_show_lock);
>>>>>>         dmabuf = sysfs_entry->dmabuf;
>>>>>>
>>>>>> -     if (!dmabuf || !attribute->show)
>>>>>> +     if (!dmabuf || !attribute->show) {
>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>>                 return -EIO;
>>>>>> +     }
>>>>>>
>>>>>> -     return attribute->show(dmabuf, attribute, buf);
>>>>>> +     ret = attribute->show(dmabuf, attribute, buf);
>>>>>> +     spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>> +     return ret;
>>>>>>     }
>>>>>>
>>>>>>     static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
>>>>>> @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype = {
>>>>>>         .default_groups = dma_buf_stats_default_groups,
>>>>>>     };
>>>>>>
>>>>>> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>>>>> +/* Statistics files do not need to send uevents. */
>>>>>> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>>>>>     {
>>>>>> -     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>> +     return 0;
>>>>>> +}
>>>>>>
>>>>>> -     sysfs_entry = dmabuf->sysfs_entry;
>>>>>> -     if (!sysfs_entry)
>>>>>> -             return;
>>>>>> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>>>>> +     .filter = dmabuf_sysfs_uevent_filter,
>>>>>> +};
>>>>>> +
>>>>>> +/* setup of sysfs entries done asynchronously in the worker thread. */
>>>>>> +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *kobject_work)
>>>>>> +{
>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata =
>>>>>> +                     kobject_work->sysfs_metadata;
>>>>>> +     bool free_metadata = false;
>>>>>> +
>>>>>> +     int ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>>>>> +                                    "%lu", kobject_work->uid);
>>>>>> +     if (ret) {
>>>>>> +             kobject_put(&sysfs_entry->kobj);
>>>>>> +
>>>>>> +             spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +             if (sysfs_metadata->status == SYSFS_ENTRY_INIT_ABORTED) {
>>>>>> +                     /*
>>>>>> +                      * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BUF has already
>>>>>> +                      * been freed. At this point, its safe to free the memory for
>>>>>> +                      * the sysfs_metadata;
>>>>>> +                      */
>>>>>> +                     free_metadata = true;
>>>>>> +             } else {
>>>>>> +                     /*
>>>>>> +                      * The DMA-BUF has not yet been freed, set the status to
>>>>>> +                      * sysfs_entry_error so that when the DMA-BUF gets
>>>>>> +                      * freed, we know there is no need to teardown the sysfs
>>>>>> +                      * entry.
>>>>>> +                      */
>>>>>> +                     sysfs_metadata->status = SYSFS_ENTRY_ERROR;
>>>>>> +             }
>>>>>> +             goto unlock;
>>>>>> +     }
>>>>>> +
>>>>>> +     /*
>>>>>> +      * If the DMA-BUF has not yet been released, status would still be
>>>>>> +      * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized.
>>>>>> +      */
>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INITIALIZED;
>>>>>> +             goto unlock;
>>>>>> +     }
>>>>>>
>>>>>> +     /*
>>>>>> +      * At this point the status is SYSFS_ENTRY_INIT_ABORTED which means
>>>>>> +      * that the DMA-BUF has already been freed. Hence, we cleanup the
>>>>>> +      * sysfs_entry and its metadata since neither of them are needed
>>>>>> +      * anymore.
>>>>>> +      */
>>>>>> +     free_metadata = true;
>>>>>>         kobject_del(&sysfs_entry->kobj);
>>>>>>         kobject_put(&sysfs_entry->kobj);
>>>>>> +
>>>>>> +unlock:
>>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +     if (free_metadata) {
>>>>>> +             kfree(kobject_work->sysfs_metadata);
>>>>>> +             kobject_work->sysfs_metadata = NULL;
>>>>>> +     }
>>>>>>     }
>>>>>>
>>>>>> +/* teardown of sysfs entries done asynchronously in the worker thread. */
>>>>>> +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work *kobject_work)
>>>>>> +{
>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>>>>>
>>>>>> -/* Statistics files do not need to send uevents. */
>>>>>> -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>>>>> +     kobject_del(&sysfs_entry->kobj);
>>>>>> +     kobject_put(&sysfs_entry->kobj);
>>>>>> +
>>>>>> +     kfree(kobject_work->sysfs_metadata);
>>>>>> +     kobject_work->sysfs_metadata = NULL;
>>>>>> +}
>>>>>> +
>>>>>> +/* do setup or teardown of sysfs entries as required */
>>>>>> +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
>>>>>>     {
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>> +     bool setup_needed = false;
>>>>>> +     bool teardown_needed = false;
>>>>>> +
>>>>>> +     sysfs_metadata = kobject_work->sysfs_metadata;
>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED) {
>>>>>> +             setup_needed = true;
>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_IN_PROGRESS;
>>>>>> +     } else if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>>>>> +             teardown_needed = true;
>>>>>> +     }
>>>>>> +
>>>>>> +     /*
>>>>>> +      * It is ok to release the sysfs_entry_lock here.
>>>>>> +      *
>>>>>> +      * If setup_needed is true, we check the status again after the kobject
>>>>>> +      * initialization to see if it has been set to SYSFS_ENTRY_INIT_ABORTED
>>>>>> +      * and if so teardown the kobject.
>>>>>> +      *
>>>>>> +      * If teardown_needed is true, there are no more changes expected to the
>>>>>> +      * status.
>>>>>> +      *
>>>>>> +      * If neither setup_needed nor teardown needed are true, it
>>>>>> +      * means the DMA-BUF was freed before we got around to setting up the
>>>>>> +      * sysfs entry and hence we just need to release the metadata and
>>>>>> +      * return.
>>>>>> +      */
>>>>>> +     spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
>>>>>> +
>>>>>> +     if (setup_needed)
>>>>>> +             dma_buf_sysfs_stats_setup_work(kobject_work);
>>>>>> +     else if (teardown_needed)
>>>>>> +             dma_buf_sysfs_stats_teardown_work(kobject_work);
>>>>>> +     else
>>>>>> +             kfree(kobject_work->sysfs_metadata);
>>>>>> +
>>>>>> +     kfree(kobject_work);
>>>>>> +}
>>>>>> +
>>>>>> +static struct dmabuf_kobj_work *get_next_kobj_work(void)
>>>>>> +{
>>>>>> +     struct dmabuf_kobj_work *kobject_work;
>>>>>> +
>>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>>>>> +     kobject_work = list_first_entry_or_null(&dmabuf_kobj_work_list,
>>>>>> +                                             struct dmabuf_kobj_work, list);
>>>>>> +     if (kobject_work)
>>>>>> +             list_del(&kobject_work->list);
>>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>>>>> +     return kobject_work;
>>>>>> +}
>>>>>> +
>>>>>> +static int kobject_work_thread(void *data)
>>>>>> +{
>>>>>> +     struct dmabuf_kobj_work *kobject_work;
>>>>>> +
>>>>>> +     while (1) {
>>>>>> +             wait_event_freezable(dmabuf_kobject_waitqueue,
>>>>>> +                                  (kobject_work = get_next_kobj_work()));
>>>>>> +             do_kobject_work(kobject_work);
>>>>>> +     }
>>>>>> +
>>>>>>         return 0;
>>>>>>     }
>>>>>>
>>>>>> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>>>>> -     .filter = dmabuf_sysfs_uevent_filter,
>>>>>> -};
>>>>>> +static int kobject_worklist_init(void)
>>>>>> +{
>>>>>> +     init_waitqueue_head(&dmabuf_kobject_waitqueue);
>>>>>> +     dmabuf_kobject_task = kthread_run(kobject_work_thread, NULL,
>>>>>> +                                       "%s", "dmabuf-kobject-worker");
>>>>>> +     if (IS_ERR(dmabuf_kobject_task)) {
>>>>>> +             pr_err("Creating thread for deferred sysfs entry creation/deletion failed\n");
>>>>>> +             return PTR_ERR(dmabuf_kobject_task);
>>>>>> +     }
>>>>>> +     sched_set_normal(dmabuf_kobject_task, MAX_NICE);
>>>>>> +
>>>>>> +     return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_work)
>>>>>> +{
>>>>>> +     INIT_LIST_HEAD(&kobject_work->list);
>>>>>> +
>>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>>>>> +
>>>>>> +     list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
>>>>>> +
>>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>>>>> +
>>>>>> +     wake_up(&dmabuf_kobject_waitqueue);
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>>>>> +{
>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>> +     struct dmabuf_kobj_work *kobj_work;
>>>>>> +
>>>>>> +     sysfs_entry = dmabuf->sysfs_entry;
>>>>>> +     if (!sysfs_entry)
>>>>>> +             return;
>>>>>> +
>>>>>> +     sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>> +     if (!sysfs_metadata)
>>>>>> +             return;
>>>>>> +
>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +
>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED ||
>>>>>> +         sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>>>>> +             /*
>>>>>> +              * The sysfs entry for this buffer has not yet been initialized,
>>>>>> +              * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort the
>>>>>> +              * initialization.
>>>>>> +              */
>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_ABORTED;
>>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +
>>>>>> +             /*
>>>>>> +              * In case kobject initialization completes right as we release
>>>>>> +              * the sysfs_entry_lock, disable show() for the sysfs entry by
>>>>>> +              * setting sysfs_entry->dmabuf to NULL to prevent a race.
>>>>>> +              */
>>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>>>>> +             sysfs_entry->dmabuf = NULL;
>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>> +
>>>>>> +             return;
>>>>>> +     }
>>>>>> +
>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>>>>> +             /*
>>>>>> +              * queue teardown work only if sysfs_entry is fully inititalized.
>>>>>> +              * It is ok to release the sysfs_entry_lock here since the
>>>>>> +              * status can no longer change.
>>>>>> +              */
>>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +
>>>>>> +             /*
>>>>>> +              * Meanwhile disable show() for the sysfs entry to avoid a race
>>>>>> +              * between teardown and show().
>>>>>> +              */
>>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>>>>> +             sysfs_entry->dmabuf = NULL;
>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>> +
>>>>>> +             kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>>>>> +             if (!kobj_work) {
>>>>>> +                     /* do the teardown immediately. */
>>>>>> +                     kobject_del(&sysfs_entry->kobj);
>>>>>> +                     kobject_put(&sysfs_entry->kobj);
>>>>>> +                     kfree(sysfs_metadata);
>>>>>> +             } else {
>>>>>> +                     /* queue teardown work. */
>>>>>> +                     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>>>>> +                     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>> +                     deferred_kobject_create(kobj_work);
>>>>>> +             }
>>>>>> +
>>>>>> +             return;
>>>>>> +     }
>>>>>> +
>>>>>> +     /*
>>>>>> +      * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
>>>>>> +      * metadata.
>>>>>> +      */
>>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>> +     kfree(dmabuf->sysfs_entry_metadata);
>>>>>> +     dmabuf->sysfs_entry_metadata = NULL;
>>>>>> +}
>>>>>>
>>>>>>     static struct kset *dma_buf_stats_kset;
>>>>>>     static struct kset *dma_buf_per_buffer_stats_kset;
>>>>>>     int dma_buf_init_sysfs_statistics(void)
>>>>>>     {
>>>>>> +     int ret;
>>>>>> +
>>>>>> +     ret = kobject_worklist_init();
>>>>>> +     if (ret)
>>>>>> +             return ret;
>>>>>> +
>>>>>>         dma_buf_stats_kset = kset_create_and_add("dmabuf",
>>>>>>                                                  &dmabuf_sysfs_no_uevent_ops,
>>>>>>                                                  kernel_kobj);
>>>>>> @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>>>>     int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>>>     {
>>>>>>         struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>> -     int ret;
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>> +     struct dmabuf_kobj_work *kobj_work;
>>>>>>
>>>>>>         if (!dmabuf || !dmabuf->file)
>>>>>>                 return -EINVAL;
>>>>>> @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>>>         sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>>>>>         sysfs_entry->dmabuf = dmabuf;
>>>>>>
>>>>>> +     sysfs_metadata = kzalloc(sizeof(struct dma_buf_sysfs_entry_metadata),
>>>>>> +                              GFP_KERNEL);
>>>>>> +     if (!sysfs_metadata) {
>>>>>> +             kfree(sysfs_entry);
>>>>>> +             return -ENOMEM;
>>>>>> +     }
>>>>>> +
>>>>>>         dmabuf->sysfs_entry = sysfs_entry;
>>>>>>
>>>>>> -     /* create the directory for buffer stats */
>>>>>> -     ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>>>>> -                                "%lu", file_inode(dmabuf->file)->i_ino);
>>>>>> -     if (ret)
>>>>>> -             goto err_sysfs_dmabuf;
>>>>>> +     sysfs_metadata->status = SYSFS_ENTRY_UNINITIALIZED;
>>>>>> +     spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
>>>>>>
>>>>>> -     return 0;
>>>>>> +     dmabuf->sysfs_entry_metadata = sysfs_metadata;
>>>>>>
>>>>>> -err_sysfs_dmabuf:
>>>>>> -     kobject_put(&sysfs_entry->kobj);
>>>>>> -     dmabuf->sysfs_entry = NULL;
>>>>>> -     return ret;
>>>>>> +     kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>>>>> +     if (!kobj_work) {
>>>>>> +             kfree(sysfs_entry);
>>>>>> +             kfree(sysfs_metadata);
>>>>>> +             return -ENOMEM;
>>>>>> +     }
>>>>>> +
>>>>>> +     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>>>>> +     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>> +     /*
>>>>>> +      * stash the inode number in struct dmabuf_kobj_work since setup
>>>>>> +      * might race with DMA-BUF teardown.
>>>>>> +      */
>>>>>> +     kobj_work->uid = file_inode(dmabuf->file)->i_ino;
>>>>>> +
>>>>>> +     deferred_kobject_create(kobj_work);
>>>>>> +     return 0;
>>>>>>     }
>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>> index 7ab50076e7a6..0597690023a0 100644
>>>>>> --- a/include/linux/dma-buf.h
>>>>>> +++ b/include/linux/dma-buf.h
>>>>>> @@ -287,6 +287,50 @@ struct dma_buf_ops {
>>>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>>>>     };
>>>>>>
>>>>>> +#ifdef CONFIG_DMABUF_SYSFS_STATS
>>>>>> +enum sysfs_entry_status {
>>>>>> +     SYSFS_ENTRY_UNINITIALIZED,
>>>>>> +     SYSFS_ENTRY_INIT_IN_PROGRESS,
>>>>>> +     SYSFS_ENTRY_ERROR,
>>>>>> +     SYSFS_ENTRY_INIT_ABORTED,
>>>>>> +     SYSFS_ENTRY_INITIALIZED,
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * struct dma_buf_sysfs_entry_metadata - Holds the current status for the
>>>>>> + * DMA-BUF sysfs entry.
>>>>>> + *
>>>>>> + * @status: holds the current status for the DMA-BUF sysfs entry. The status of
>>>>>> + * the sysfs entry has the following path.
>>>>>> + *
>>>>>> + *                   SYSFS_ENTRY_UNINITIALIZED
>>>>>> + *            __________________|____________________
>>>>>> + *           |                                       |
>>>>>> + *     SYSFS_ENTRY_INIT_IN_PROGRESS      SYSFS_ENTRY_INIT_ABORTED (DMA-BUF
>>>>>> + *           |                                                     gets freed
>>>>>> + *           |                                                     before
>>>>>> + *           |                                                     init)
>>>>>> + *   ________|_____________________________________
>>>>>> + *   |                         |                   |
>>>>>> + * SYSFS_ENTRY_INITIALIZED     |       SYSFS_ENTRY_INIT_ABORTED
>>>>>> + *                             |               (DMA-BUF gets freed during kobject
>>>>>> + *                             |               init)
>>>>>> + *                             |
>>>>>> + *                             |
>>>>>> + *                 SYSFS_ENTRY_ERROR
>>>>>> + *                 (error during kobject init)
>>>>>> + *
>>>>>> + * @sysfs_entry_lock: protects access to @status.
>>>>>> + */
>>>>>> +struct dma_buf_sysfs_entry_metadata {
>>>>>> +     enum sysfs_entry_status status;
>>>>>> +     /*
>>>>>> +      * Protects sysfs_entry_metadata->status
>>>>>> +      */
>>>>>> +     spinlock_t sysfs_entry_lock;
>>>>>> +};
>>>>>> +#endif
>>>>>> +
>>>>>>     /**
>>>>>>      * struct dma_buf - shared buffer object
>>>>>>      *
>>>>>> @@ -452,6 +496,8 @@ struct dma_buf {
>>>>>>                 struct kobject kobj;
>>>>>>                 struct dma_buf *dmabuf;
>>>>>>         } *sysfs_entry;
>>>>>> +
>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
>>>>>>     #endif
>>>>>>     };
>>>>>>

