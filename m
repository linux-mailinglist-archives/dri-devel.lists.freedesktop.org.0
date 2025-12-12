Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48ACB7E01
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 05:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA6710E16B;
	Fri, 12 Dec 2025 04:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JjOhooZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012060.outbound.protection.outlook.com
 [40.107.200.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3587410E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 04:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzALXdXl7y8GItsvVImQQlqfyYFhdrd2tC/ozGljxP2kiQiKs+Ck2y8Js9nAUbW7iSlvG4hIDsIKrIBVsoxgZNnsQPlPwIppOnJ30HjOWqnI203hI6x3UABdQChWNfiOo9v/weUTa0v3tDchsn1v6zcXPYUX0ZQCAdjlTIW/fCL7mLTVItk40EM0LrXcdshDyIZ1peLwcphcMlPbc0lCbIRp4luF8yJUGXb3lVpW0al7HL5DH7CAAa7QPokscJW6d0NHMUJnxJCc11fXd8yA+eCG5Ft9ZNn6iUDkFirMrVOq66UZmb58XRWL+DZEOJr7XPpCoPtud7iFdaKiTZ06Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a93Jx5A9ejvdNJOJbKWOUfMbe3U5NjOSTe9KTvgQp8=;
 b=oN/BxU/kyIhdM/Pl2SrHxIZSbvnU/yRgXIQxh67Q23uQh6yWlHGNWvKRbYs0kcei/dWuXQiOkE7Wi0eDTRRSzegFF6BJDjctuLMP1CbM35CYrsfu5I7fkZmUY1wSrr+ip+OZaLI91scUHI+ZPR2fmRT6e/E90gmIBKlOLKvmK4VoIG55iTvBsG9O3Og/bvIoBsyo5ayo+DIya3qCx3jWzzi9qx6Sn0ZWTTV7VRg6FeXGwkYk8sIngYI5xV014h9MJm+SRikImCIxQOc5fY2UBYj7USlLXFoSAefgqzLnhCsx+98815/rfEZTe6C7meEfLs0yjPvajGJIV9pTm56/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a93Jx5A9ejvdNJOJbKWOUfMbe3U5NjOSTe9KTvgQp8=;
 b=JjOhooZCiWo051plqpU9eVFsObuafs63xYwEEkpZHfmSlr9sT4RpCpZk7595D6K8YAPbTqSr1+Oci3WC03G2hgNUi/Njx1O5Vah2CeVBJVtW0aUb6bbel60qMgMAHDRxyLQMFJ7qF3MrJUSTwBRQkH7PCeO2zV2G8eBn9S/6Rww=
Received: from IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::17)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 04:41:05 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::f3) by IA4P220CA0012.outlook.office365.com
 (2603:10b6:208:558::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 04:41:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:41:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 22:41:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 22:41:04 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 20:41:03 -0800
Message-ID: <6589ed1e-498e-0f3c-740d-ada6d3e02c4a@amd.com>
Date: Thu, 11 Dec 2025 20:41:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix race where send ring appears full
 due to delayed head update
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251211045125.1724604-1-lizhi.hou@amd.com>
 <b6286dcf-d9a4-4dbd-b8e4-5b0640c7dae5@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b6286dcf-d9a4-4dbd-b8e4-5b0640c7dae5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6125d0-2b10-4f61-bf54-08de3938a90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmMxaGVvaVAwZjhacXY3dEpRb1U3RmhOWS8zR2lseTdNZWlNYnltSXora3J1?=
 =?utf-8?B?aTd2MHFaTWZpOUFKWFdTSlRjTnYyUmtxYjl3NGx3SHRtUHluNExaUld0VlBO?=
 =?utf-8?B?SU96bWpqMFY2RnM1eFpPaVBwWDlFMndBcHYvVUVYY2o5RGl1VGpha0VrZVFE?=
 =?utf-8?B?MlZ6dm5VQzcwMFRRUGV1eVNxeHdLQWhvWnFDWldRZkZ5YVVrZzhWVTdRbEZq?=
 =?utf-8?B?OUNaY2ovKzdsUEhlN3JSRFZ0NEU0anNPb05QTVJJTldiYWtWd0JTYytkN0Na?=
 =?utf-8?B?cFpPUWQwcGJOQ1VXYzdtVXA2eUtDRjVkQUo2REFXZHQrZStEMXdHd1JzeHpx?=
 =?utf-8?B?Q25TbEIwRk1UaG4wSWtkS3c0Nzd6bjd3VEVCMDVkMjJCKzJ1WWd0VmNDSlA3?=
 =?utf-8?B?STY3RWhxWUU1NjJybGlRYXptL0JMbXpPZFI0NWppdzc2VzZzaXpQVmRhY2dI?=
 =?utf-8?B?OW1BTXdzRVJsZWxrbnh5TDduRGVWRmV0cG1tTjl1T3FQZTFCY3UvRlhyd3Rz?=
 =?utf-8?B?RHlHTmdzMXJlSEVlemdBa3N2ZjdhREtNa0pZN2xCb3JiSTJ4REpuemFMV1Ja?=
 =?utf-8?B?d05pWVpLTEh4U0pRQjIyOUtWWEtVdklUQUpFMXRqUG5pQXNScVpBWEZVYUFE?=
 =?utf-8?B?aVJuUzdmTDFFWkVUblFMT29HbG5aM1ZiWmxZWjlEYXJROC9NQ1ozUFZ5eHhK?=
 =?utf-8?B?N1JYRkZHZW5yR205d2VpWmVkc1MvaHlVY1Q4SmFoUmF6SHd0aVRDMXByZmFM?=
 =?utf-8?B?dTZITWhqZVM0TnlLM0ZSMDFsam80RXJnQmVZMDdTNVR2Z3k0ZWh1RzhmbXZk?=
 =?utf-8?B?cVZydzdrekl1NngwbjVLMDhPT21hYVg1T1Rtdy9VMVd5TWpzMmV4T3Z0b1Rh?=
 =?utf-8?B?QjlMZUxVcWlRelpnM1h2cHNpcnp0LzIyNUJrRG1PT2x2SFhwOG9uUm0zQVMw?=
 =?utf-8?B?emVNMzY2TGwzMUlZUVRqWWNER01aSldLaWV2UDF4V01EdHZyK0dIYnIvanJs?=
 =?utf-8?B?V2hwUERIUVdRQ2l6WHB3N2kzZDRldnBUcXZDakhEa2ZMVTZuRHl6UHVQUjJR?=
 =?utf-8?B?YTRoR0FCVzU3QW9sdE9TUjZtckErOUpocGg2Mm5zcGZkdFNrMHowVjJVankv?=
 =?utf-8?B?VUpUVTdlSHZDOS9RZ0ZCeW05WkhaV3RVdldld3ZhdFQ5eGRBdVZ6Rk9rTklw?=
 =?utf-8?B?WVQ4YkhIM1JSaTRIaE1CSGFzMTRidmJGamkrN0RQUVdNbXp1aWUzOFg0anRp?=
 =?utf-8?B?V0lXaG1QdWR5N0xtejMrSHdKRU9CTGRPZVhxWWszRzh1WEI3WUNQR0JxaDZk?=
 =?utf-8?B?N3c3c0dDWmIyT2dFVWcvV1N1UnBFMVdiZ1dpYWF5NXNnRHBqNENXNlVWekpr?=
 =?utf-8?B?aVAzN1VjZE9nZEV0MGgzMi9VVEtDVUR2dGtscVlNK2F4RkZIekkwZGxFMGNy?=
 =?utf-8?B?c1pGSE96c3JCMlNUd2p0VXljUEZRZFRmRWRCUDJPSFJ6RDd0UVl5ODM4RytW?=
 =?utf-8?B?YlpoQ3JLcnpnWTR6ZHZlMWN6SGpsU2t0bVkrOU41V3Z5UTJhV2VJUStlczdO?=
 =?utf-8?B?Q0dpcjFKT1Q1L0k4bjJpUnRzYTdQNjhLd0JVbGFHQzBsb0tVQ3RSeVVtVGFE?=
 =?utf-8?B?YWhidUkyL3gyaXRXdGJZb0ZPd2dkU1pHUm5uWC81bVJqdVJKR2RiKzRaMVoy?=
 =?utf-8?B?KzRNZGkxbW5iM2pkUjRvcEpZOHdIaDZaditMc20xNSt2ZktrNTE0ODVvc0gx?=
 =?utf-8?B?U3NxRTJ5VFpnQnk1clRMZy9TcXZLVWMwWkFjQUo1Zm11aFUzbE8zTkcyQXEr?=
 =?utf-8?B?TGtncVR1Tk1KbXpDc2JtTUg5ZTJFY1dicXc3bVQ4bkRhZytlelU0Tm43Qy9q?=
 =?utf-8?B?a2ZROXdrbjRNNFNjaHN6NFFvcUhpNG5QOUwvN0Z3QndDOUpUMkpaaHlGdys2?=
 =?utf-8?B?UUVOSmRYTGNkUFBteVV0YTYvd2FSamw4L1NrYUF3WHBhSURDdHhrUkRhYmhH?=
 =?utf-8?B?SjhzcUdza0ozZ2FuSk9Mdmk1Z0ZVbWdRT0VZR3U3L1ZEUVg0WmJ0NUhKeFd2?=
 =?utf-8?B?RDdrZlE2dEx5Q0ZuZ3orUFdnZjUxYXVqcEZvT3hxMGQ3dVFRZUc5VFpOYTds?=
 =?utf-8?Q?nX0Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:41:04.9761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6125d0-2b10-4f61-bf54-08de3938a90a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111
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


On 12/11/25 13:48, Mario Limonciello wrote:
> On 12/10/25 10:51 PM, Lizhi Hou wrote:
>> The firmware sends a response and interrupts the driver before advancing
>> the mailbox send ring head pointer. 
>
> What's the point of the interrupt then?  Is this possible to improve 
> in future firmware or is this really a hardware issue?  If it can be 
> fixed in firmware it would be ideal to conditionalize such behavior on 
> firmware version.

This has been found recently with a muti-thread stress test with 
released firmware. My understanding is that this is a firmware issue. I 
am not sure if it could be improved in future firmware.

I believe this driver change is more robust. It does not change the 
logic but adds an polling instead of returning error. If the firmware 
updates header quick, there will not be any polling. It works for both 
current and future firmware.


Thanks,

Lizhi

>> As a result, the driver may observe
>> the response and attempt to send a new request before the firmware has
>> updated the head pointer. In this window, the send ring still appears
>> full, causing the driver to incorrectly fail the send operation.
>>
>> This race can be triggered more easily in a multithreaded environment,
>> leading to unexpected and spurious "send ring full" failures.
>>
>> To address this, poll the send ring head pointer for up to 100us before
>> returning a full-ring condition. This allows the firmware time to update
>> the head pointer.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 27 +++++++++++++++----------
>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c 
>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index a60a85ce564c..469242ed8224 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -191,26 +191,34 @@ mailbox_send_msg(struct mailbox_channel 
>> *mb_chann, struct mailbox_msg *mb_msg)
>>       u32 head, tail;
>>       u32 start_addr;
>>       u32 tmp_tail;
>> +    int ret;
>>         head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
>>       tail = mb_chann->x2i_tail;
>> -    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
>> +    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) 
>> - sizeof(u32);
>>       start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
>>       tmp_tail = tail + mb_msg->pkg_size;
>>   -    if (tail < head && tmp_tail >= head)
>> -        goto no_space;
>> -
>> -    if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
>> -                 mb_msg->pkg_size >= head))
>> -        goto no_space;
>>   -    if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
>> +check_again:
>> +    if (tail >= head && tmp_tail > ringbuf_size) {
>>           write_addr = mb_chann->mb->res.ringbuf_base + start_addr + 
>> tail;
>>           writel(TOMBSTONE, write_addr);
>>             /* tombstone is set. Write from the start of the ringbuf */
>>           tail = 0;
>> +        tmp_tail = tail + mb_msg->pkg_size;
>> +    }
>> +
>> +    if (tail < head && tmp_tail >= head) {
>> +        ret = read_poll_timeout(mailbox_get_headptr, head,
>> +                    tmp_tail < head || tail >= head,
>> +                    1, 100, false, mb_chann, CHAN_RES_X2I);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (tail >= head)
>> +            goto check_again;
>>       }
>>         write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
>> @@ -222,9 +230,6 @@ mailbox_send_msg(struct mailbox_channel 
>> *mb_chann, struct mailbox_msg *mb_msg)
>>                   mb_msg->pkg.header.id);
>>         return 0;
>> -
>> -no_space:
>> -    return -ENOSPC;
>>   }
>>     static int
>
