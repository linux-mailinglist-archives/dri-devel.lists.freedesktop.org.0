Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54419EB650
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0269510E3BD;
	Tue, 10 Dec 2024 16:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MF5LklWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599610E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDGVQVpC/QwdxUn8J/D7eA6Yu3KUnKh23JVpTWf3AvgHS2eT71kbERGuVLHUJ+MBfULdoF9YyYUIp9fcQPvWvZ8iD2dksAKjYVb1H5I64vpxV/1+HvwWJ0BThlTlDy+VXTHlM3G9QbZicHAPHLZerZbwwzhOclUu7QZjEM1v04Mikua5e/CCWOYrwQBMZusMvElKjVoMv06Ok4iKWyKkueWAo6GmbaWuvUeGiTe+td8tguzznJKv8W1vcCx10GyobyuhkkoFXdDJ1j0Bvixt7J1wkxsuwznlW87xSAx/SYYKTwNPZ2vOnln9dQjMX7gzgld9mpnxNF1J6cVlFDmXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx8LhDdB2+K+F9bQurRYhczkFRv1b/JTHvkkWt3iXSo=;
 b=OzrPE8J/KiR5fjf0jBI3R993MpbaYCqW5sQRtPvQTwe6WHLIvQs0jDymCGFmZN6q7CLQbedlAG6qR9qMW2ORLjbCIbluth5fdsG1gj2auB8zERZS6ISIQnrZYAcGQVh6cEcpLKN3cCHQ3b3bZOcB3htiIf5lvHiU3kZXRSuP4LdXSE41EZyQiDU3SFoOBh8GQv53rXADlePHcm1evzn0Pa6610RThKkl81Luzdg35IHlbGqraS9soOMLKAao2xAUnegOewiCFSHswk44+aT4M276liZGSzhQLbTCqteSDd0ANZxMJcZhRgRe6n+H/8dno6NLdyGFsjCWjpBhoSUN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx8LhDdB2+K+F9bQurRYhczkFRv1b/JTHvkkWt3iXSo=;
 b=MF5LklWGlKBMoWWL1v4ds4HFfA9ty1dUay4IMK6/Y22joyDeCK3B1mj23hubRjoXzfrgLzhiY3hddMSlC9DzzARrjVrR+B9Ah2s8AECBVWfeF9rxUwi2pureKC9qGeF0xMGFRkAAGWEaqWrlEj+PzTjwpNfoMq+8FFVaOyLKUDQ=
Received: from CH0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:610:119::32)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Tue, 10 Dec
 2024 16:26:30 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::b2) by CH0PR03CA0363.outlook.office365.com
 (2603:10b6:610:119::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 16:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 16:26:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 10:26:29 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 10:26:28 -0600
Message-ID: <82c4fe4d-d118-6c50-d2de-78b126c06b87@amd.com>
Date: Tue, 10 Dec 2024 08:26:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Mike Lothian <mike@fireburn.co.uk>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
 <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
 <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
 <d7b0cc20-1ee9-8d21-7a8f-4dc84be3b7f9@amd.com>
 <89496055-5564-edcf-ff25-cbbb2bf9dd33@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <89496055-5564-edcf-ff25-cbbb2bf9dd33@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e5b5f5-73c2-4daa-7aa5-08dd19376707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BSamI0UTRiYVlUQ0Vac3YvRU5ORUhVV2dTQzlTWEdIN2tEOUpqc0VOeWxS?=
 =?utf-8?B?elFWRit4TExTNC9PWEczb3RlNFZ1cHIrbFRsVWp1b0crNUtJSlFNcWtVWE0x?=
 =?utf-8?B?cmh6d1hiVWNRZUlPbys2OTZpN0YyZGlxZFZtamc4a0dKZldnMnRBb2Q3SS96?=
 =?utf-8?B?Nm9IOGV4UDc0Y1ZvbFJxV00rRi9MWTZWRVZvcXFXYmp2eGFMYWFXdEtYK1dJ?=
 =?utf-8?B?ZHZOOE5URFh5ZTE4R0lzVzBUaWRJa1kvNjVYVmtSeWdHK0xCOTZGcjkvSEpz?=
 =?utf-8?B?bkhGK2VlYkJmanNEbWpnazJYSG1VOEtOcGFJa0RIL0tBZTg1RHk0eU5Wa2JU?=
 =?utf-8?B?NFVmbldtck9iU2lvbXhmVnhhckhQb3dBR0ZoYThwZmNvYkM1R2ZaVVBtTm93?=
 =?utf-8?B?aUxmOXl5cHIwYjRGYlRXM1NJbGNtYUxLOFQyQVRlUFdlRkNPZVlJYkNxQm9a?=
 =?utf-8?B?K0h2WEVzV2tUb2FYMWxRb1Mxem5LbHBiRzJod2VNZ0M4Z3E2bU9URGZrRHZY?=
 =?utf-8?B?TllhQU1QMUcrby9wTlFuZVo5Sks2ZTV5VU9nM0JhVU1USW42U2FpdDBBZEFQ?=
 =?utf-8?B?dWRHUUwraGpLWVQxRlJFNlBMR1hCb2dRRHhFWm1qK2o3V2JuZ0Y5ZGhnK0hU?=
 =?utf-8?B?T2t3Zytxemo4UTRQRnNWNWZ2MERscGdKRjBva2dURkNUVEpWY0V6MTdVVnps?=
 =?utf-8?B?aW9GeE53SmFOcGJ2VDN6WTVzN3lQWVowVWlxSVpOak1RMGFzTGVlcXRQRjdE?=
 =?utf-8?B?VzljVjQrd05nTUcrQ3hSM0xzVFlXNnhpSVBUUGNuUXllUXlzL0VZMWZCY1Jq?=
 =?utf-8?B?RU9TUnpOWjVmYjBOc1A4a3VxQk9GZlY3MXJ5eEtwbDBZb0VRRjdFZmljQ2lu?=
 =?utf-8?B?NFQzNUltcDVKcDY1TjVRcEhQS0ZsZmR1Wk5Ga2tTTFhCSENvbmF5QXhMWUd2?=
 =?utf-8?B?VzR3OHhWKzhYRjZJWWdQbmpob0V1ZXlldHluZEw0cGdaSTQ2WTFFT2xhNFg5?=
 =?utf-8?B?OG1IaUhjNkV5VXN3ZkwzaGdMQ0tpWEJFR05xa0ZYd0FMNTBtcE5GN0wyS3Na?=
 =?utf-8?B?QWRnSExWai9wQUREYzVFU09ZdFltRUROazNFL0tidnd6Zi8zTDJlQWt6YWNG?=
 =?utf-8?B?MmU4MFpGZnhIWDgxZHBCbi9oMll2N0dXelJnakZ2dCtkVERFRE1YaHhrdWVJ?=
 =?utf-8?B?MHZwYzJ3MEtnV2h1NnFqc2lpU2FTM2FtZUZCQ2E3ci9VbWJuZ0lmM09TalUv?=
 =?utf-8?B?TUJQMDkvZkxVYll2KzA2dWhZZXRkNGY0VFhoZjEyMno0d05rMk1hVHZMTm9v?=
 =?utf-8?B?RDNKVHEvWGtWVHFUTXFYOXJ1WmJQTHRZZGFJM1BieWtxejl0QjFBTngzSFQv?=
 =?utf-8?B?OWl6SDhQRXdHZmQvR3Nwam45aS9EUHhQU2d0aTRPd0dMRGtZQmpJemEzQmo2?=
 =?utf-8?B?ZDJUQ0ErWTFIQk5RU0g1c0g0eTRpUTVDWW10VkdjQWR6YjBxbzNJZkJRbi9K?=
 =?utf-8?B?MUNiVGRpMU9RMGdacGtpSEtSdXZRc2JqRTA3MGZFMFB1MUUrR2ZSUEhwZWZ2?=
 =?utf-8?B?ZW5TZlJ6RWp1RGRkTGFQY3cxeEpFUkp0K2dLK0RTelQvTHFRWVVGcko3dHl2?=
 =?utf-8?B?V0dGL3F4U1k2cEM2NWJkMHFXa0dVSk5IcmJYdCt2ZUlsZmtiZWUwTC81Y0Nl?=
 =?utf-8?B?TUpKa0Evd2FXTFZJMTNXRFVJQWlGcDNzSnkxTFBNcXIwVkVKTDVWWUU2REJm?=
 =?utf-8?B?NVVsOHFPMEowUzMxL2p6bnpDc3FFWVRyL2gycWQ3Q1JQaEF5eUc2Y2Rya2ZF?=
 =?utf-8?B?MXRFWEZHaFNaVWR1YzFtQzRmdUpWYWlpbE9oejRHUWRHVm1xcENPTGtYS2ln?=
 =?utf-8?B?MmxzYlJzSFk0QldTK3czTWFpeEt4K2V1b0lld2ljUy9GaEE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 16:26:29.7980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e5b5f5-73c2-4daa-7aa5-08dd19376707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028
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


On 12/6/24 14:55, Jeffrey Hugo wrote:
> On 12/6/2024 11:47 AM, Lizhi Hou wrote:
>>
>> On 12/6/24 09:01, Mike Lothian wrote:
>>> On Fri, 6 Dec 2024 at 16:41, Mike Lothian <mike@fireburn.co.uk> wrote:
>>>> On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo <quic_jhugo@quicinc.com> 
>>>> wrote:
>>>>> On 12/5/2024 8:44 AM, Mike Lothian wrote:
>>>>>> Hi
>>>>>>
>>>>>> I needed to add the following to get things compiling for me
>>>>>>
>>>>>>
>>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>>> index fe684f463b945..79b9801935e71 100644
>>>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>> #include <drm/drm_device.h>
>>>>>> #include <drm/drm_managed.h>
>>>>>> #include <linux/bitfield.h>
>>>>>> +#include <linux/interrupt.h>
>>>>>> #include <linux/iopoll.h>
>>>>> Looking at the code, this is valid.  However, I'm not sure why 
>>>>> this is
>>>>> broken for you and not others.  Do you have any ideas? How are you
>>>>> building this?  Is the tree and/or defconfig unique in some way?
>>>>>
>>>>>> #define CREATE_TRACE_POINTS
>>>>>>
>>>>>>
>>>>>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
>>>>>> from npu.sbin.1.5.2.380 to npu.sbin
>>>>>>
>>>>>> Cheers
>>>>>>
>>>>>> Mike
>>>>>>
>>>> I'm building with clang 19.1.5, this is on linus's tree 6.13-rc1
>>>>
>>>> I've applied AMD-XDNA-driver and AMD-NPU-driver-improvements series
>>>>
>>>> These are the errors I see without the above patch:
>>>>
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown type
>>>> name 'irqreturn_t'
>>>>    342 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
>>>>        |        ^
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of
>>>> undeclared identifier 'IRQ_HANDLED'
>>>>    352 |         return IRQ_HANDLED;
>>>>        |                ^
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to
>>>> undeclared function 'disable_irq'; ISO C99 and later do not support
>>>> implicit function declarations [-Wimplicit-function-declaration]
>>>>    380 | disable_irq(mb_chann->msix_irq);
>>>>        |                         ^
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to
>>>> undeclared function 'request_irq'; ISO C99 and later do not support
>>>> implicit function declarations [-Wimplicit-function-declaration]
>>>>    497 |         ret = request_irq(mb_irq, mailbox_irq_handler, 0,
>>>> MAILBOX_NAME, mb_chann);
>>>>        |               ^
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to
>>>> undeclared function 'free_irq'; ISO C99 and later do not support
>>>> implicit function declarations [-Wimplicit-function-declaration]
>>>>    521 |         free_irq(mb_chann->msix_irq, mb_chann);
>>>>        |         ^
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to
>>>> undeclared function 'disable_irq'; ISO C99 and later do not support
>>>> implicit function declarations [-Wimplicit-function-declaration]
>>>>    538 |         disable_irq(mb_chann->msix_irq);
>>>>        |         ^
>>>> 6 errors generated.
>>>>
>>>> With the patch applied I then got firmware issues so I had to rename
>>>> the newly upstreamed firmware, I'm not sure of the code needs to load
>>>> the versioned file or if the file needs renamed in linux-firmware
>>>>
>>>> I'm attaching my .config
>>>>
>>>> Cheers
>>>>
>>>> Mike
>>> The attachment bounced so heres a link to the .config on github
>>> https://github.com/FireBurn/KernelStuff/blob/quark/dot_config_tip
>>
>> I am able to reproduce with your .config. I believe it is because 
>> CONFIG_TRACING is disabled.
>>
>> If you are ok, I can include your fix to 
>> https://lore.kernel.org/dri-devel/20241204213729.3113941-1-lizhi.hou@amd.com/T/#t 
>
>
> It should be a separate patch, with a reported-by and a fixes tag.

I have sent out 8/8 patch to fix it. It has all the tags. Maybe it is ok 
to use it?

https://lore.kernel.org/dri-devel/20241206220001.164049-9-lizhi.hou@amd.com/


Thanks,

Lizhi

>
> -Jeff
