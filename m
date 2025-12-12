Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5BCB97DD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 18:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2A010E344;
	Fri, 12 Dec 2025 17:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="igvtCe3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010063.outbound.protection.outlook.com
 [40.93.198.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0D710E344
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 17:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTBwS8cvio6B9wLcrVPYfTNzlJqs8CY7wPnnVbJIrIiVr4NWxlGtp7wWdqFzd6rhvTzFUCuaeNLAyjLA35ZNqoyhvgjOe1vyDT+Jve1U9V1mmkmECh+62BGmDT8AHArUthkmG/dbcFkG71eO01l5GJDOkIVKP6R3uIVxq9FBtuVuX0jWS81NGYZEXtEhxFtdeLEEWyRRR53UcHrR8c/JrpC8QWwQZ46idy1iLKGSZQ6Stc2wvXMEXo5vOiXHZcTLxfTlT8NhJd0iDzyo5VdXYOQG10xxCLEvXdaMznNnAt1XJ02XJkK+cSyH5J612e+YSVLc3QiY4p9keVjLYOJxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxNulCP4Yfh6R5p+FpB273XZPwKfLFphtDJIfp1V6NU=;
 b=esbxJLo+EeiMpvpEHkMkp/yaFutxw0mFi40imBQ1OPwthW+YRP3aXFXqmCrr/65zmPWAV4wy1oYUPwhcTiyHF4RJMsus+SoVtn+VCEjy1G+ZbxO4OpD7gGY0E+Vq/arTrXqsnspTZbtjucfhgSHlCYCkubl8+KiofUL+pweRC5E4bGFYFix6Z6WfZdSkeql4hLDPjdCU3viJZzvQhwX+y9h/B+C52+nY0yKh6muumvgDthEpqjf5W+y+96TZ1CLiNAO4eSxsfzWxR3Qgab9Hs7d89ChN/U1FZ7yY3zKWShUvqBFU+PZi9CW3FkbXgD7gB72prm5c60yjNHL9OYA6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxNulCP4Yfh6R5p+FpB273XZPwKfLFphtDJIfp1V6NU=;
 b=igvtCe3X7jXZ50eVoufL353z4TbF6WrY5MKN8JpfKOkj2sFHDW1Ko45P6SU9O/1gVaAWrbBGwc9OobGX9knRUdg1e3bA1GIXykbKuG9kyv5fwH1NowIb+eAzlNkkHFUgexK7/0WEsAT9YCMak+v+sI86XzuCQCYLZchzUUpQgWQ=
Received: from SA1P222CA0122.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::17)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 17:56:44 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::1) by SA1P222CA0122.outlook.office365.com
 (2603:10b6:806:3c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 17:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 17:56:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 12 Dec
 2025 11:56:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Dec
 2025 11:56:41 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 09:56:40 -0800
Message-ID: <b17b259f-626a-c62a-3d57-777edbf303d9@amd.com>
Date: Fri, 12 Dec 2025 09:56:35 -0800
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
 <6589ed1e-498e-0f3c-740d-ada6d3e02c4a@amd.com>
 <15ee6051-0639-4c4a-bc1c-8762a5ae5128@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <15ee6051-0639-4c4a-bc1c-8762a5ae5128@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: b4715286-5db3-42d5-ab77-08de39a7ce92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkZ6U2UzL2hyV0NmVW5XYnZpWkhTb2pHZFVlV1J0S0N3SmVaeEZjOGVTcVA4?=
 =?utf-8?B?MW5vNTQ2dURWS05EcTY4WHEvWDhVWGpsUTV0Z1BQR0ZQNjJrL2JqYld2dGp6?=
 =?utf-8?B?ZXoxSWdmVXo3WlA4bndUQml0VjN2YkFWcERBRzV2VUpxM1lCQmYyT0g0SEdI?=
 =?utf-8?B?ZXc4MS9hOTdFRTNpdUNSK0h4cll0czVNOFNRZERZZ3R1TTNMMnJQVnJoalpZ?=
 =?utf-8?B?YzBlSlV5SU5mc0hIeFVQOXVrcnh1d1VJNWhkNGxFVjFPQ3pZZkZJUVVpOXNX?=
 =?utf-8?B?WEFSRndIQW9EYmxRUEl3Q1JMSG9tbzA1aHFZYVF6ZnI2dTRVaHlyK25kL0VI?=
 =?utf-8?B?QXVFSlRUUmxOTVdTUk41QUJYRTEzZXhJclhiMWl4YWk0U0lpeVg2QVgvaktu?=
 =?utf-8?B?UzR5Ykg3RnIrSFRqRlMzSUxnclZXLzlPYjVKNldkMFZMVElMZ2ZiWDJ2aFNt?=
 =?utf-8?B?NFFuTyt0R3l0NmxWRXlzbTQ5TkFJK0dEVzVlT0dzVEJlcnhGS1lTSlREZitw?=
 =?utf-8?B?akJPOGJ6Rk9URk5uYjh2ZmozQVFrcDVOY1hyUDNqNlJlYWdjNnJ5a3A2UUFH?=
 =?utf-8?B?NW9Uc21jZ1ZTSkdROHg5M2c4S1dvdTg0TkJTMVdOZUY5cEVCZjBqeVpsVDJq?=
 =?utf-8?B?REg2S0xmYjc2UDVsSW44bXNsNWRnNjVveUxzRGNNelFUMytXMWs2cUs2d2Qx?=
 =?utf-8?B?MFk3M2lVUjAyV3cyNHppMTZ4MUdsNjQxTUFxMkJIRVZJTFZiclh3a1owNTd1?=
 =?utf-8?B?QWh0cDUxQ2xVVGpWUm5xTUYwZEREQ3k3eHNwTGFocktsZG1GTUszLzNYWE1P?=
 =?utf-8?B?RlJHeGtQWDRkck5HMGVBZWlOUk5nVXBqNDJDUHd1Z3NqeTR0dHlzVmhhSTVD?=
 =?utf-8?B?eVlDWmtxUzRROTFKZjhRdk4wTmt0TGU4M0N6MGx5ZVBFQ0hDdFhuTExldmIz?=
 =?utf-8?B?UXQ5WDBDYnlWSk9iblVXUXE1YUVuRHFrM0VJZUI0ZXY5d0F0Mm5XcXlVNjJt?=
 =?utf-8?B?aHZtSXA5a08vNm80cHRSUU9LbHU1ajRaTmJjUWQvYyszN2Nrd1lJK2JRckRU?=
 =?utf-8?B?U0NLSWRpYmdpWGhud2p3cm5VdUwxUHVQTENQVDlKTHIxZ2hvL1RWazlySXhK?=
 =?utf-8?B?ekhENGFLeGJBQkxmUnIzR2M4cko5anBja3ZaZEtvY2dvVlZhZWt6cmhPVFNv?=
 =?utf-8?B?dHBpK3VGUnFMaUtKbGdKV2UvV0s0UEExMWV6a3N2THduSW11ZitlODBwQ2VK?=
 =?utf-8?B?OEYrekI1cUl2U3lMekp5bitVbTJzVnJMNndxZVhVclIwaE8ybmZmclJlSitQ?=
 =?utf-8?B?Wms2UGpqNmw5T3FER2I5VEtoSTBoTFY3UmFWZ3gwNENNOFJlRHlqTW5KTjRC?=
 =?utf-8?B?NjQ5ZU5kbUFQeWtJVzRCQXdubGV1N3gzblBRRGFGaTB4cXdOSkVVdmZKUmlS?=
 =?utf-8?B?L1dvYlFvd3RkeWNVQ1ZiNDdET3F1STI5ai9wUGZVZ0lEYVNUb0IzSWgwN0pr?=
 =?utf-8?B?RWRTMTlJZ2graGVjYnRNOWRMS2N0c3ZnNWJLbUlMM2cxTEJBQ2Q5aTVaT2Zj?=
 =?utf-8?B?d09PU0lWdzFYeVpGcmhSM1Y0aUxFdkhLSEhrdUVvdCtVYzc1NXVqbEp3Mkh6?=
 =?utf-8?B?N2d6RG91aThINW9pK2lVVnBEV21OTExtY2x4MEoyYUIxQ0crK3VXRXNGbXV5?=
 =?utf-8?B?Z0FsYkRac21zVGRUeFZCZnArWVNEa2pqWjBmaG8wZy84ZWFnb1pWaHZRL1po?=
 =?utf-8?B?RE8ycGZ3Q0E2cHg5UjgrOE0yTERFcU9tMkQ2WGNKOFRmN1dCSEdGRC9mdHhU?=
 =?utf-8?B?aTRwY0xidVM5WTNZSCtBRGdZNlZWUytwZHM4THRYT3dyMm1FbkRucDkrbzd0?=
 =?utf-8?B?bWt1ZTdqRVpiNTRvZzlxdTl4eFlVQUVuQWhkUUdPMDd0RjhuUWpKYVBpTjcv?=
 =?utf-8?B?ejBnMy9NZGxoWTVkcjgzZlMvWWpJbzBHUlovdmJDeDVpUE9xSS9zSDMycC8w?=
 =?utf-8?B?QXFhSnNNZ3M3VU8rVTBtNmRQWXh1OTg5RXJmM0tlbE5vZUVUZ3FrRG1mdTJV?=
 =?utf-8?B?cWt1ZmgwZEZrK3AvZXJReWVXOGwvN0IxdHBmMDBJR1NCZlJWZ0UrK0hnZkhm?=
 =?utf-8?Q?oh3k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:56:42.0537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4715286-5db3-42d5-ab77-08de39a7ce92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
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

Applied to drm-misc-next.

On 12/12/25 08:43, Mario Limonciello wrote:
> On 12/11/25 10:41 PM, Lizhi Hou wrote:
>>
>> On 12/11/25 13:48, Mario Limonciello wrote:
>>> On 12/10/25 10:51 PM, Lizhi Hou wrote:
>>>> The firmware sends a response and interrupts the driver before 
>>>> advancing
>>>> the mailbox send ring head pointer. 
>>>
>>> What's the point of the interrupt then?  Is this possible to improve 
>>> in future firmware or is this really a hardware issue?  If it can be 
>>> fixed in firmware it would be ideal to conditionalize such behavior 
>>> on firmware version.
>>
>> This has been found recently with a muti-thread stress test with 
>> released firmware. My understanding is that this is a firmware issue. 
>> I am not sure if it could be improved in future firmware.
>
> OK, thanks for explaining.
>
>>
>> I believe this driver change is more robust. It does not change the 
>> logic but adds an polling instead of returning error. If the firmware 
>> updates header quick, there will not be any polling. It works for 
>> both current and future firmware.
>>
>>
>
> Yeah I don't think it's harmful, it's just unfortunate to have to land 
> code like this when it sounds like a firmware bug with interrupt 
> handling.  If the firmware can be improved at least it will be right 
> on the very first read in the polling.
>
> Reviewed-by: Mario Limonciello (AMD)
>
>> Thanks,
>>
>> Lizhi
>>
>>>> As a result, the driver may observe
>>>> the response and attempt to send a new request before the firmware has
>>>> updated the head pointer. In this window, the send ring still appears
>>>> full, causing the driver to incorrectly fail the send operation.
>>>>
>>>> This race can be triggered more easily in a multithreaded environment,
>>>> leading to unexpected and spurious "send ring full" failures.
>>>>
>>>> To address this, poll the send ring head pointer for up to 100us 
>>>> before
>>>> returning a full-ring condition. This allows the firmware time to 
>>>> update
>>>> the head pointer.
>>>>
>>>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 27 
>>>> +++++++++++++++----------
>>>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c 
>>>> b/drivers/accel/ amdxdna/amdxdna_mailbox.c
>>>> index a60a85ce564c..469242ed8224 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>> @@ -191,26 +191,34 @@ mailbox_send_msg(struct mailbox_channel 
>>>> *mb_chann, struct mailbox_msg *mb_msg)
>>>>       u32 head, tail;
>>>>       u32 start_addr;
>>>>       u32 tmp_tail;
>>>> +    int ret;
>>>>         head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
>>>>       tail = mb_chann->x2i_tail;
>>>> -    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
>>>> +    ringbuf_size = mailbox_get_ringbuf_size(mb_chann, 
>>>> CHAN_RES_X2I) - sizeof(u32);
>>>>       start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
>>>>       tmp_tail = tail + mb_msg->pkg_size;
>>>>   -    if (tail < head && tmp_tail >= head)
>>>> -        goto no_space;
>>>> -
>>>> -    if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
>>>> -                 mb_msg->pkg_size >= head))
>>>> -        goto no_space;
>>>>   -    if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
>>>> +check_again:
>>>> +    if (tail >= head && tmp_tail > ringbuf_size) {
>>>>           write_addr = mb_chann->mb->res.ringbuf_base + start_addr 
>>>> + tail;
>>>>           writel(TOMBSTONE, write_addr);
>>>>             /* tombstone is set. Write from the start of the 
>>>> ringbuf */
>>>>           tail = 0;
>>>> +        tmp_tail = tail + mb_msg->pkg_size;
>>>> +    }
>>>> +
>>>> +    if (tail < head && tmp_tail >= head) {
>>>> +        ret = read_poll_timeout(mailbox_get_headptr, head,
>>>> +                    tmp_tail < head || tail >= head,
>>>> +                    1, 100, false, mb_chann, CHAN_RES_X2I);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        if (tail >= head)
>>>> +            goto check_again;
>>>>       }
>>>>         write_addr = mb_chann->mb->res.ringbuf_base + start_addr + 
>>>> tail;
>>>> @@ -222,9 +230,6 @@ mailbox_send_msg(struct mailbox_channel 
>>>> *mb_chann, struct mailbox_msg *mb_msg)
>>>>                   mb_msg->pkg.header.id);
>>>>         return 0;
>>>> -
>>>> -no_space:
>>>> -    return -ENOSPC;
>>>>   }
>>>>     static int
>>>
>
