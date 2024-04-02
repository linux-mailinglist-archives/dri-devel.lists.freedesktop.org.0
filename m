Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9687894D25
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740DD10E29F;
	Tue,  2 Apr 2024 08:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YXB0F/+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA5110E29F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 08:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cID9GekIsWc+TonfvyuB1S/fyjWyVfHqwj9McCd7mhX+nm6hI5aNW1alEIhnICW1lvX1D2S5DXEZzvPSKBnVABAA7wUmjUMlRbrXf8aXckasAqL0ITyhpderspE0k2lIsxq9w3fXlbVkDx9L0j57T1lEAQz1d8d333M8GqjwFmYtL4PN65VDg9edpMsrYsCvzz8K9O6tLoGPT+8NWmVmCtzUN+j14WKLIfKg8+faHVHArrAO3qA4cZpYUqEydoYghGz67N6YpgnqKCUoYCaOSeVFAUoRFC1mrrIIBkVnVpkyHXAmzuUPPzHP8Hed6W0nbWJ/Q6AyxnLbg+zD1Zkxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTyaHWL78fB3l8oKFz28irrxiiZOl8BnjYdp4CoDqMA=;
 b=gqg6D99xRqZJVsFXgtOXfKtKuDEMTPYJlm9KRSCCHlgpjjviyDNPRSdV3X6Pyr5eylt74+9q7tDMd+ulJDr9HEAhCpNnmljmypxdXhEAAyIl+uFr3DFbqUYmkzWFki6AEboVACTxEbbmM4I9QEf5EyGVBbY+hpKWoSCNAERKJmkaiSMIPN+dD32bxwSEDpEuwmY5VO7j9uQECpaegjfKZZY6g+160+vCgrrSIZxwrdfayr+CW98bpSWecQmbWfK8bFKeWyzg3PbLfOL28Q9uUSjrbTFaNfsJEKLBCl4+H6jlY2SsTRa0TLXEhELSGBYHaOdcm89xOFQluRmuhlKRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTyaHWL78fB3l8oKFz28irrxiiZOl8BnjYdp4CoDqMA=;
 b=YXB0F/+XcHhwQSB4Em9mFJMm2y9AxJAwjQdrQI5HCIq+AQIyYFTD73S3jUyrZz3KPYypFs8D/yxoivQNonNmhwE/R10eiq8yVUGOqJw+spcg/KUW7WxuGRJ6gQxg0tyHiCgnJ2gB5jX1do+Wrd78YxFxHGABbPH3No1h8SyT7t0=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 08:08:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 08:08:03 +0000
Message-ID: <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
Date: Tue, 2 Apr 2024 10:07:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: zhiguojiang <justinjiang@vivo.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQ+ILirV9bvcJtiGQdxJfoVr5Q9MVWYSdMOKXD5OBjv/LJpCCdPtebNiRRWp4T45F7j5t1iCG2KdAPf3C68JFRlOs9Aydb8sS6rNmd6izRS6RE6AMYAf6+ZcBwd2zXuxb9MZvVHsn6nCQwuFYkA+14dhJTb2eW3Cm429v4N0M2ZLd9+eL0Nl5Oahoj75+AfVT35S/2eikl24Ut1XS5s0+5Vn705HpaH7fA2z4ESvh7qQQ5YAJXvU1bMUhoIBN/pQeOt40aJuUsFde2lbRjO1SC715ZEu7bqMRsPIKbDtJyKi9eErVjraZtyKj3W78GJWG02M+RM7Lh805e8kczx1QONODg1zgON6pE+1br47Fvhact5DcoO3Cb8SlVGSzqlWCJCJXgHCWpEfA6lf9uR/Mykt/vasHj7eT52cgBE/LECTA17Xd2KMasW5mmT26RKHkZiPg0zM2wuXYivh3FO7DTggGBFjTHScoX33TF1dENqRellfDsqkP/RYxu7ngd5IfjZ40eDeCk+nj5VbZm56qwjFSA2wyODlg9VI79tziXFy5WRPhm76nT95sw1etkUaHrN//U0Kh6MbpnXEcJXRq8ziwmILvivkH1K373DHJKOs8PjVbgzkdj7hr3dAWma0ZX4WE5LsTQt6dbGpDa7IUCFnguagxhEFqIntZCvNgG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVczTVR5dUZycHFGakZ3VTJtWmF5YmNBRmZpSVJ1SWdOQjZiaSs4VDJBWWlK?=
 =?utf-8?B?YjF2ekN1VWpQSitaZWhONVFjczdnQlBxanMwTHJVTmNLOCtaYlB0NWNzaTA1?=
 =?utf-8?B?TDJmVVFBZS9MV2hIVzVNMUhoVzNaeGhaV0JkVWVvZm5PdmhTRlR2eHRxYk50?=
 =?utf-8?B?L3kwYkRROE9RSGZpWXNIekpyUUtFdk84WUJvV0VWTFloc0xkRi9UVm9rTmpE?=
 =?utf-8?B?ZkpmcjI4cWYzVHBaK2V4VHVBdEhWMDBEbXhNaGN0MVBrQlYyL2RKa1lKeVJt?=
 =?utf-8?B?cUNCMU42SmNJbStlZzJ4OUVHQUNYQmViT0tQTDVodHdSWHNKZjI3Z3plMm5s?=
 =?utf-8?B?dVBSZ0pwSnRqb3Y3K2NicDA3R2FxRlZCZkhXYWliR0lLNXhBQS9qYTczamFa?=
 =?utf-8?B?dGRPM1JENVAySm9qRVRSSnBHc05jZXV3eTVKM3ZiNXQ5L0s5VDhBQkhKYmw3?=
 =?utf-8?B?dGpHQVNZV1FSbUo4bjgzQnRuTjVzb24zc2Rqek9CcjZGR0dzK3dCM0IrYndR?=
 =?utf-8?B?TUloZjBlQmRpUlRxS3lHaDQ2TG9DdDNzTmlnMWY5YjY4SFZjUlcvdWJGR0VJ?=
 =?utf-8?B?S0xRYUJ6WTJQMDFWQXZ5aHJGVEVYcFNSODBwSnE3enQ4UU1JSlFyYVFCWjV6?=
 =?utf-8?B?dGl1RWZsYnlvRk1jbjlYWUlOc1FDbzMzbTZkcXA5RUJRM1hnNEtlRjNoUk9H?=
 =?utf-8?B?MWlmUXhzRDMySjNYK0JPZmNYNy9aWHZPTndNMjNyZ3hxOHFJa211UGx6OEp1?=
 =?utf-8?B?N3BuL0IvOVhRQ2gvcnR6TFJESDBCYS83NG5RNmYveXQycVBKdTZ1SUE3bFZL?=
 =?utf-8?B?eGZBS1kvQ1hwTUhtVnVzV1ZrOGh0Wm1ldm5zcWdyTGorYUFzZDh4RDBmTXpX?=
 =?utf-8?B?NXJWV1ptRWpuaU1vbzlCaVFXZG5OaVg3THl5VnJSTVhPUm8vbllMN0Z3OXg0?=
 =?utf-8?B?MnFvSHdWM1VSSUV6NStxZmxRV3VWaHVqMHd6MWgxd2xpWDhERTMwSERmbDV4?=
 =?utf-8?B?cGVqYThPSFFGQlVXMnoxZmgrZGFybkQ2RlFTd0l1NGt6RXVGckxFNXczZ1da?=
 =?utf-8?B?ZmFTUzNDZHpaMXRtM21VbWpGTGZ2Q01CVWMyTjd1Q2NwNEIxM003MEoxZTJa?=
 =?utf-8?B?WGRLajFHc01FT1JPdVBlMTB3bC9MSnQwdCtsdG9ZOVpSS1RnTWtTSForTjR1?=
 =?utf-8?B?cFl4VFFvUjBVeUdjSkV6VXhtdmNGYWc4bUs1UUpMclU1QTBRZXNWMmdFcmx0?=
 =?utf-8?B?VGFNcmRmclZMbE1OcDdreHZTOHNlSTJyMzI2V0RuSEVXZG14UTliNitMK2xM?=
 =?utf-8?B?YmdRZXNqVEFMd3VMV1I5SnQvdHFuR1FjWDNBTE1FSmx3elNRdlV1c3A2Y1Uy?=
 =?utf-8?B?cEtZYzRjYUVKSmo3dlBmRThpK01TVUZsb2dSZTM0VGo1NDFCamxXR3hIOEl4?=
 =?utf-8?B?Rk9scy8ycnpRQmRqL2d5MnJiYkdsNFNQVldYNWNWc2pwNjcyYSsrZUlEcVZI?=
 =?utf-8?B?alNUdEIzc0FPQysyV3NTdjM4cWg0M0o5aVZsZWNvbkxjK2FtNzVzSE9qUFN1?=
 =?utf-8?B?L241T09NWmdUOGN6U1JZVGg0OU91cEdoK2RXMTNRaTB1SlFzQnM2UXhzWlp5?=
 =?utf-8?B?YkhLSFFOMllnSHkxWFVpbEcySVN6dTZwZnFBYlcwWjlzalQxdThwTDNCbUFL?=
 =?utf-8?B?QnhScTJrbjFUZW5oUjh3WWFuaWhySFFKaXU0ZS9URnJ4TTl5RjNWMlJobE9W?=
 =?utf-8?B?ZG5TUVdwQWNQWXlJNDFiTUFvY3E4dThJRWs1VGt1MmJ5T3BtMjg5ekVoVndB?=
 =?utf-8?B?R003V0tCMXd2TDZIT0JNYVJWeEdXSVVtV21vUmJGb3o0cHhLdGR3bzhiVG5H?=
 =?utf-8?B?L0t2cFROaW5hM3JpNE16QUxLQ3d3WHg5SGR1TVBncjExRjdyQ1VhZWdwNXJv?=
 =?utf-8?B?SjIzc1o3T1V2a1kzNGxGemwvU1pHcVl4SVN5Q2Z0c25QRHppc3Y2aitldnVy?=
 =?utf-8?B?Ti93aFY1SXdLYzVxa1pZYm5Gd3cwQ1JXdyttbm1wM0R5Mk9vRUQ1SnpKalhU?=
 =?utf-8?B?QUpFODMzWUZkai9IMmZpa0hpSk13TDgrWUVQY2diWEdNZ005UVRaRFR0U29W?=
 =?utf-8?Q?ccNRwKeCrGzBjTb2hOS++56Bw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13956af9-963d-48bd-53f6-08dc52ec0582
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 08:08:03.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnQmsR9F+oZVHfO/JO5+9fiOdz9YIHhde+DMRTLPqtsftFnISTLDDib+axoALPRx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707
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

Am 02.04.24 um 08:49 schrieb zhiguojiang:
>> As far as I can see that's not because of the DMA-buf code, but 
>> because you are somehow using this interface incorrectly.
>>
>> When dma_buf_poll() is called it is mandatory for the caller to hold 
>> a reference to the file descriptor on which the poll operation is 
>> executed.
>>
>> So adding code like "if (!file_count(file))" in the beginning of 
>> dma_buf_poll() is certainly broken.
>>
>> My best guess is that you have some unbalanced 
>> dma_buf_get()/dma_buf_put() somewhere instead.
>>
>>
> Hi Christian,
>
> The kernel dma_buf_poll() code shound not cause system crashes due to 
> the user mode usage logical issues ?

What user mode logical issues are you talking about? Closing a file 
while polling on it is perfectly valid.

dma_buf_poll() is called by the filesystem layer and it's the filesystem 
layer which should make sure that a file can't be closed while polling 
for an event.

If that doesn't work then you have stumbled over a massive bug in the fs 
layer. And I have some doubts that this is actually the case.

What is more likely is that some driver messes up the reference count 
and because of this you see an UAF.

Anyway as far as I can see the DMA-buf code is correct regarding this.

Regards,
Christian.

>
> Thanks
>
>
> 在 2024/4/1 20:22, Christian König 写道:
>> Am 27.03.24 um 03:29 schrieb Zhiguo Jiang:
>>> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
>>> that the dmabuf file fd is added to the epoll event listener list, and
>>> when it is released, it is not removed from the epoll list, which leads
>>> to the UAF(Use-After-Free) issue.
>>
>> As far as I can see that's not because of the DMA-buf code, but 
>> because you are somehow using this interface incorrectly.
>>
>> When dma_buf_poll() is called it is mandatory for the caller to hold 
>> a reference to the file descriptor on which the poll operation is 
>> executed.
>>
>> So adding code like "if (!file_count(file))" in the beginning of 
>> dma_buf_poll() is certainly broken.
>>
>> My best guess is that you have some unbalanced 
>> dma_buf_get()/dma_buf_put() somewhere instead.
>>
>> Regards,
>> Christian.
>>
>>>
>>> The UAF issue can be solved by checking dmabuf file->f_count value and
>>> skipping the poll operation for the closed dmabuf file in the
>>> dma_buf_poll(). We have tested this solved patch multiple times and
>>> have not reproduced the uaf issue.
>>>
>>> crash dump:
>>> list_del corruption, ffffff8a6f143a90->next is LIST_POISON1
>>> (dead000000000100)
>>> ------------[ cut here ]------------
>>> kernel BUG at lib/list_debug.c:55!
>>> Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>>> pc : __list_del_entry_valid+0x98/0xd4
>>> lr : __list_del_entry_valid+0x98/0xd4
>>> sp : ffffffc01d413d00
>>> x29: ffffffc01d413d00 x28: 00000000000000c0 x27: 0000000000000020
>>> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000080007
>>> x23: ffffff8b22e5dcc0 x22: ffffff88a6be12d0 x21: ffffff8b22e572b0
>>> x20: ffffff80254ed0a0 x19: ffffff8a6f143a00 x18: ffffffda5efed3c0
>>> x17: 6165642820314e4f x16: 53494f505f545349 x15: 4c20736920747865
>>> x14: 6e3e2d3039613334 x13: 2930303130303030 x12: 0000000000000018
>>> x11: ffffff8b6c188000 x10: 00000000ffffffff x9 : 6c8413a194897b00
>>> x8 : 6c8413a194897b00 x7 : 74707572726f6320 x6 : 6c65645f7473696c
>>> x5 : ffffff8b6c3b2a3e x4 : ffffff8b6c3b2a40 x3 : ffff103000001005
>>> x2 : 0000000000000001 x1 : 00000000000000c0 x0 : 000000000000004e
>>> Call trace:
>>>   __list_del_entry_valid+0x98/0xd4
>>>   dma_buf_file_release+0x48/0x90
>>>   __fput+0xf4/0x280
>>>   ____fput+0x10/0x20
>>>   task_work_run+0xcc/0xf4
>>>   do_notify_resume+0x2a0/0x33c
>>>   el0_svc+0x5c/0xa4
>>>   el0t_64_sync_handler+0x68/0xb4
>>>   el0t_64_sync+0x1a0/0x1a4
>>> Code: d0006fe0 912c5000 f2fbd5a2 94231a01 (d4210000)
>>> ---[ end trace 0000000000000000 ]---
>>> Kernel panic - not syncing: Oops - BUG: Fatal exception
>>> SMP: stopping secondary CPUs
>>>
>>> Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
>>> ---
>>>   drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++++----
>>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>>   mode change 100644 => 100755 drivers/dma-buf/dma-buf.c
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 8fe5aa67b167..e469dd9288cc
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -240,6 +240,10 @@ static __poll_t dma_buf_poll(struct file *file, 
>>> poll_table *poll)
>>>       struct dma_resv *resv;
>>>       __poll_t events;
>>>   +    /* Check if the file exists */
>>> +    if (!file_count(file))
>>> +        return EPOLLERR;
>>> +
>>>       dmabuf = file->private_data;
>>>       if (!dmabuf || !dmabuf->resv)
>>>           return EPOLLERR;
>>> @@ -266,8 +270,15 @@ static __poll_t dma_buf_poll(struct file *file, 
>>> poll_table *poll)
>>>           spin_unlock_irq(&dmabuf->poll.lock);
>>>             if (events & EPOLLOUT) {
>>> -            /* Paired with fput in dma_buf_poll_cb */
>>> -            get_file(dmabuf->file);
>>> +            /*
>>> +             * Paired with fput in dma_buf_poll_cb,
>>> +             * Skip poll for the closed file.
>>> +             */
>>> +            if (!get_file_rcu(&dmabuf->file)) {
>>> +                events &= ~EPOLLOUT;
>>> +                dcb->active = 0;
>>> +                goto clear_out_event;
>>> +            }
>>>                 if (!dma_buf_poll_add_cb(resv, true, dcb))
>>>                   /* No callback queued, wake up any other waiters */
>>> @@ -277,6 +288,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>>> poll_table *poll)
>>>           }
>>>       }
>>>   +clear_out_event:
>>>       if (events & EPOLLIN) {
>>>           struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
>>>   @@ -289,8 +301,15 @@ static __poll_t dma_buf_poll(struct file 
>>> *file, poll_table *poll)
>>>           spin_unlock_irq(&dmabuf->poll.lock);
>>>             if (events & EPOLLIN) {
>>> -            /* Paired with fput in dma_buf_poll_cb */
>>> -            get_file(dmabuf->file);
>>> +            /*
>>> +             * Paired with fput in dma_buf_poll_cb,
>>> +             * Skip poll for the closed file.
>>> +             */
>>> +            if (!get_file_rcu(&dmabuf->file)) {
>>> +                events &= ~EPOLLIN;
>>> +                dcb->active = 0;
>>> +                goto clear_in_event;
>>> +            }
>>>                 if (!dma_buf_poll_add_cb(resv, false, dcb))
>>>                   /* No callback queued, wake up any other waiters */
>>> @@ -300,6 +319,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>>> poll_table *poll)
>>>           }
>>>       }
>>>   +clear_in_event:
>>>       dma_resv_unlock(resv);
>>>       return events;
>>>   }
>>
>

