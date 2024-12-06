Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED99E7857
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5010F168;
	Fri,  6 Dec 2024 18:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f+VLjBLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DDC10F167
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgdI76bBSwyyUyss95C9UWGOcNt3vAzVkdmFFLgl5qKUE57uJQ9O8np6Vc9NlxDjx6mcvIsfy3rQvCJtGxlY4gQDpi+79l33jB4Tk9TGt5PnPRsDhCpB8DaSYY2mXwklz/CICaAPHjIC7qEJoAQ/lm6DvuAPejLKYG59St01XBAVUICgz2NsuEURxRms0wKFgv0yn1tZwswj9mqmHI/Ae33TcN8wvxNJB0cm2MaDbJ2cT2BAtPD1KJyaDHZBeXsF60dDUTIIuDCdxwAMKtrxysnWROn5AFC0jUMtagQICtWuu2OGlKxyzJc3fSRlusdAzHMgGsLmA4sadFeCGA9BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w00/GHHYrwK7M9gn/mOyJ5NhHIh05ryQNVfQ8O7Qo8E=;
 b=o4UdYpkfF/Id552sXX/LzuyLqfsmQUltPTvnGpmScLFW8N5B6olV+Qh2sFuPXW7MeTFRuRwonZI3EJHm+2uKmNjVsTY1YR9ChNeybfAtNToidYH+Gc8EShTEgERS+ioHbqnQY1kJWOFUX21+/mrGRR8JChAjWAhEC0q4XMEEDbrjQLetCOY8bhjT3gbNpnjQ6F13Q7guS4JX3cejmLAZJ2F7sb6Bby0ZLuvS4/xaXaxFrB+R1PzWuX/g1e+4EAbZ+oppOeBz92BiKeUqVPPR5zlRmNP3KaqmlIAWT+9assvto1f/FH63uncCPtYkeBjly2/x9ejaW75g7knGLHA46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=fireburn.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w00/GHHYrwK7M9gn/mOyJ5NhHIh05ryQNVfQ8O7Qo8E=;
 b=f+VLjBLnuBLxezMlgMqAvM5WYs4+HLUQNcJ2GhZWdNl7clD+DWrPdUFNFLMA6z4VxfGYWNh3RdgOQ8Pk/76rvsgDmXBgMvFX5VkI6LslRI7rlh8A4tRCjWT2qgj5wJcFcOOCancckYIOQIsbq/3UQfgIwt/ndTU++d510AnGujE=
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 18:47:38 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::28) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Fri, 6
 Dec 2024 18:47:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 18:47:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 12:47:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 12:47:37 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 12:47:36 -0600
Message-ID: <d7b0cc20-1ee9-8d21-7a8f-4dc84be3b7f9@amd.com>
Date: Fri, 6 Dec 2024 10:47:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>, Jeffrey Hugo <quic_jhugo@quicinc.com>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
 <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
 <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 4210ae01-f537-442c-2ded-08dd16267504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FsR0puc0NYUXlKMkk2Z08vM1diM0IzY2FXM2EyRkNEaUtXL1h6WFpJMHFu?=
 =?utf-8?B?Ynd4cEhWYmhlYWxaaklzNTlhcVE4aWFRSmJWQlRsZ0QxMWNWaEFlREdSZEwv?=
 =?utf-8?B?ZndiQnF1WVdETHI4a0RtM0p3VFlTVGNhZWNkTS9JbDFXZUZaTXNpTVBzRXpv?=
 =?utf-8?B?Uk5TVXliU3BNRFhOUWJENWtJZnRGVzQ3TGVRNXp1ZUNwQ1dyYWJuNDhoQnZB?=
 =?utf-8?B?RjRiUkZNKzRLSzZHWmJ5aGtWUVp0VHNZT0xUOHB5Qkh5QWs3MERIekZuemw5?=
 =?utf-8?B?SjMyVEFjVGtCSWl2d3U5MFdlSnl4TXl0ODV3d1BEWWRmNEVrU1B6blZDaXNX?=
 =?utf-8?B?NkxucnhKK3I2WFBQbEN0Qllhd2VhRlpmb3Zpd1RKNUNNRVc3YVhCeTdKUWI3?=
 =?utf-8?B?TDF4VUs4Z3RONjVXb1hPanJ3US9EREFSaXc2QUsxVlYwSXZiKzFaV3FaZWlQ?=
 =?utf-8?B?Qjk4b2Jua05HcGpFaDBnV0FBWW94ZU5kbWtLS0oxYU85T00xa2pOTDJIQzdK?=
 =?utf-8?B?b1NzTUxRMWJPcUVON25nbzk2dFNUYmt1bmNrd1RWOGthU3hrS1hBb0JQS3JS?=
 =?utf-8?B?MHdPcSt2NlBKdUFIZWlJQjk4UDkwU21rZnN5VFNlRlpIeFRHK1owbjZMQkdx?=
 =?utf-8?B?VEc5ek05SS83VjRjZ3lyaWRVMzVXZHBFQzRpTnRHZWlIc0hGUDRjcFJ4Rkk2?=
 =?utf-8?B?L3hoMXY2RWJCRCtEeHc3c093aENYUThRTW1Eb0pKUjRNTnBacjFqOHUvOHJ3?=
 =?utf-8?B?aFJpc0Rnb1B0WHZyemMydHI3TXpUMGx0L2tNaWJpbUpEbXFOUGxYdk5wdCs0?=
 =?utf-8?B?S0ovZnBuMGQrd3ZFYTJrM2xEbFBOTlpUK3AzdVZkdGpyRFMzSVprRnlCbC82?=
 =?utf-8?B?V0lxUUpIR0ZkODJWYTRSMjZUcUJzOS9TYUx5dXFWUGNQbm95NUd2YkpBb0N6?=
 =?utf-8?B?MFpLNThXQXhIYklaUHJpZkZneHc1S0V5SUZTNzNUb0Uyblc2dHd4TUI0cm56?=
 =?utf-8?B?MUR4ZmM2MVlpbEpEdlEwTnplai9uR1JLditWc2FsU05qaVcxSC9GWXJTVjIv?=
 =?utf-8?B?dGhaVGZ4VlRyOWlzbHJVZUNmQk5rZEFYNzZHcVN6NWkzT2VwV3VpbE5HdTJ5?=
 =?utf-8?B?QWdZMDBJU1hqdi9mTkRXREdVUGk3Q3RGa3paVkVPTk1tVWt1SDNnT1crVmRx?=
 =?utf-8?B?UUc1L1daODVmbGxaSFRTaHB6dzhnemM1MzJTSWhqbU1HTEVpam9aek1xa0d4?=
 =?utf-8?B?c2JKUzVwbEZVa0J5NDZ3c1ZtMTZ6NzFwbk5PTzB5WTRRMEZ2TXBMeGFnci9k?=
 =?utf-8?B?ak9BOWZuUklKbEc5Q2xLWHl3MjlrTFdKMHMvNEkrQ1VzYkVRcnovOXdNRloy?=
 =?utf-8?B?ZEVOckNHNnhyR2hhVmRlUlo1MStnbE9HV3hZWDhWaDBnNDFOMGJiaHQxeDVW?=
 =?utf-8?B?QU81RXZvRkN3U2NlNkJwT2VOUWtjSXA0MGdmL0FWWkY4Z0hzcSt5ZTlMVmEy?=
 =?utf-8?B?RTNyM2ZEb3lXcXVhNjA2R05LTjMzZFYzSVFTZDZtL28xTHAyRFcrK3ZtdzRY?=
 =?utf-8?B?MWNsNnlYZnhONTU4elB5Wm0yeGpKOWtVT0k2dmhUa0ROR2J3aVFkSFdaVERM?=
 =?utf-8?B?aWU5TTdjeVVoUk53ZWQ2SEtzcnVjR2VvdFYrVERJb2RhS1VjU2Y4bXl5VjN2?=
 =?utf-8?B?eWJQQURLL2E5bU5oZGpMOTEyVno1SjJ6S0sySXBVc05sazJRTERMNFF4TmFT?=
 =?utf-8?B?SlhXYklWVGgzcWZCOGVBMlBYcE1kaXNUdnYycjZtaW5BMnoyOWxkZkdqWVlk?=
 =?utf-8?B?d1BKMmVOcm9MWTErYndqVmsvRGg4NStyNWxpWDE4UWtjS1ZWL0ZEZkpxczRj?=
 =?utf-8?B?K3JsYkFsbVhxTTQzajlQWDd5QUlIRGtuUmNTNUlzSDVlalE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 18:47:38.2692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4210ae01-f537-442c-2ded-08dd16267504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911
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


On 12/6/24 09:01, Mike Lothian wrote:
> On Fri, 6 Dec 2024 at 16:41, Mike Lothian <mike@fireburn.co.uk> wrote:
>> On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>> On 12/5/2024 8:44 AM, Mike Lothian wrote:
>>>> Hi
>>>>
>>>> I needed to add the following to get things compiling for me
>>>>
>>>>
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> index fe684f463b945..79b9801935e71 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> @@ -6,6 +6,7 @@
>>>> #include <drm/drm_device.h>
>>>> #include <drm/drm_managed.h>
>>>> #include <linux/bitfield.h>
>>>> +#include <linux/interrupt.h>
>>>> #include <linux/iopoll.h>
>>> Looking at the code, this is valid.  However, I'm not sure why this is
>>> broken for you and not others.  Do you have any ideas?  How are you
>>> building this?  Is the tree and/or defconfig unique in some way?
>>>
>>>> #define CREATE_TRACE_POINTS
>>>>
>>>>
>>>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
>>>> from npu.sbin.1.5.2.380 to npu.sbin
>>>>
>>>> Cheers
>>>>
>>>> Mike
>>>>
>> I'm building with clang 19.1.5, this is on linus's tree 6.13-rc1
>>
>> I've applied AMD-XDNA-driver and AMD-NPU-driver-improvements series
>>
>> These are the errors I see without the above patch:
>>
>> drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown type
>> name 'irqreturn_t'
>>    342 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
>>        |        ^
>> drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of
>> undeclared identifier 'IRQ_HANDLED'
>>    352 |         return IRQ_HANDLED;
>>        |                ^
>> drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to
>> undeclared function 'disable_irq'; ISO C99 and later do not support
>> implicit function declarations [-Wimplicit-function-declaration]
>>    380 |                         disable_irq(mb_chann->msix_irq);
>>        |                         ^
>> drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to
>> undeclared function 'request_irq'; ISO C99 and later do not support
>> implicit function declarations [-Wimplicit-function-declaration]
>>    497 |         ret = request_irq(mb_irq, mailbox_irq_handler, 0,
>> MAILBOX_NAME, mb_chann);
>>        |               ^
>> drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to
>> undeclared function 'free_irq'; ISO C99 and later do not support
>> implicit function declarations [-Wimplicit-function-declaration]
>>    521 |         free_irq(mb_chann->msix_irq, mb_chann);
>>        |         ^
>> drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to
>> undeclared function 'disable_irq'; ISO C99 and later do not support
>> implicit function declarations [-Wimplicit-function-declaration]
>>    538 |         disable_irq(mb_chann->msix_irq);
>>        |         ^
>> 6 errors generated.
>>
>> With the patch applied I then got firmware issues so I had to rename
>> the newly upstreamed firmware, I'm not sure of the code needs to load
>> the versioned file or if the file needs renamed in linux-firmware
>>
>> I'm attaching my .config
>>
>> Cheers
>>
>> Mike
> The attachment bounced so heres a link to the .config on github
> https://github.com/FireBurn/KernelStuff/blob/quark/dot_config_tip

I am able to reproduce with your .config. I believe it is because 
CONFIG_TRACING is disabled.

If you are ok, I can include your fix to 
https://lore.kernel.org/dri-devel/20241204213729.3113941-1-lizhi.hou@amd.com/T/#t


Thanks,

Lizhi

>
