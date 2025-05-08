Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CCAB011B
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 19:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5C110E20E;
	Thu,  8 May 2025 17:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oSSoZR+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3629D10E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 17:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfgZALkfHmZ8SI66hxWsktNxsTHg8o5i9N+2qVa2iW35zrp67taPcfKkCDFS12yl3B5yFZAwEoahYMrZZcJajva9/5VJMoTCn3dWO0AWa4ExrjDO6kp0q/X/7wMUmSbBTNMXg88Jpsz6LPztocna7UUco99licc4IntpopJwPcKcKJFCMdjGkT+ux3d0eA2FyIL47rGBa2/MYRn8dFsNbVbXJvdNL/qUM0mEMKlqjZ8Q9PB/dG3nxGhJo8JYQ6brzS/Edz/FBT8PQtqy5Hnp+uJ59IDV5VKfkuehlOMIMcpzFZgqQPhWbH5psQf/l/hXUpYfwHfmGg8+gijLvGkOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWobsUJ6S76Gn4QXrYF+8JHZurmdTgzvlDT4d3McWZ4=;
 b=piTUV28y2ZoqOd7qODlRgXfrLfsX7XdIMCH4IFZ+klZuGqJptx19/2bTcopRTJ1yVJAQOKmPiNFPhPw7pPiF1l+FstsQ/Zix043DQIxH29xuhfZtU1YX3gqQVG5Xvt3v8HrZfU9o2dWy+4K5W2Dyd0pXC+57tnzVcMlFYPXK/hX44/wl3hL4AWceT7K23fCl7gfdxeCQwlIbdYehpjciNn4QkAu03TvfUAx84PvAHQJ5r9lDAa2ntHZEIiAkDMOfML4xQFlRuxd2ntdgzfVs0jFPrx32b3ksQKOiUeLdvtkaB2uzfo8n3+fWxkIfuWNnSkaaNDULpgLEn9rCUHTjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWobsUJ6S76Gn4QXrYF+8JHZurmdTgzvlDT4d3McWZ4=;
 b=oSSoZR+vCGNQVBcEXO3hFb3wPw4gQJPJatTUVswJQ3RCIJmbc041aleL06D+Ho0crfAe5nIUnqhVF9oOgTeWh9vsVyOr+hzC+BpWKzMhGWpMX7JinO0p+cb7GwBBPp1/ClDTQ/kvYL+CuUHxqTahl6HcUQbuaU67CP9ZPFGHKus=
Received: from SJ0PR13CA0200.namprd13.prod.outlook.com (2603:10b6:a03:2c3::25)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 8 May
 2025 17:09:37 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::b4) by SJ0PR13CA0200.outlook.office365.com
 (2603:10b6:a03:2c3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 8 May 2025 17:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 17:09:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 12:09:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 12:09:35 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 12:09:35 -0500
Message-ID: <e8077e22-d9e5-7dea-439f-bb52d67c145a@amd.com>
Date: Thu, 8 May 2025 10:09:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support submit commands without
 arguments
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250507161500.2339701-1-lizhi.hou@amd.com>
 <4534597b-70a0-4c6b-9ff5-950e69ca7b37@amd.com>
 <670ccea1-5315-bbe5-995f-10aefabf9c28@amd.com>
In-Reply-To: <670ccea1-5315-bbe5-995f-10aefabf9c28@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: e24b0855-8930-447e-fc3b-08dd8e531c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDB4Ky93UGlCOWtMN0xZeU1RYkVna3hteGF4ZXhhZGxoY295eU83TXp3QUJL?=
 =?utf-8?B?ZTg4UjRSWVlGTndWc2FJWExCT0piTlZrdWQvcUJoNWdNTGFzUWlnOGFrQ2NK?=
 =?utf-8?B?Vi9sZjFjUzdlR2x4cFRZckpLSkNtVHJseUJXcXgrSEkyeTlYU3NqOVRLMzEw?=
 =?utf-8?B?SWhRTWMyTmU5bGlRRVhWTTZlUXB6aCtMNkcya1ZQQzRwMUFaaTVJZm5adHpq?=
 =?utf-8?B?UExwR3kvK1FxL2dLUUZhdm5MY3E4cFVEMzNZTWdYbTR5S2FuVW04OG5RY0Jh?=
 =?utf-8?B?UTJHVUhkR2FnMm5ETVN0ZGQ4VFI2M3ZyUkNTekhkV0x1c1R3R1BWamlYNG1i?=
 =?utf-8?B?MWFITHh0UjNNM3FLYjVYVE5TcUplTkRLZjB4ckNGejQ2UU5QUWw1R2ExYW5S?=
 =?utf-8?B?Q3Uwb0ZsOEJnTmY2NXgySm5hVWxlMVVoMEsrV2c5MUNFdmhXTmlQYmpuTWo4?=
 =?utf-8?B?RnZuNFVPK3hLTVRxZHZQaDQzYkg5OE9lUk1PQ2hEOWFQUU8zRmNRVXFyT0kx?=
 =?utf-8?B?WlNBdk9lejE1QkpSb3FUL3dvaE44dUt0bVYreXI3cVNhajk0SUk3SGFaMFdT?=
 =?utf-8?B?Qm1FanZaUEExOFNUekhPeTBrWHk0STFxRWVNZ1VuckcvZ1VmNDZQbEFxcGJ5?=
 =?utf-8?B?b21QQVlxUWU1eXBmMTh2WXZMd1dHcTUyaE9ZR3IwMCs0RzN3MlZNRThkUzdC?=
 =?utf-8?B?Q1U0RjE0RXY1S1h0TW9ncG5BRWJPOWhqNkE1ZlpqeklubjBHR1R2Vll5MXZX?=
 =?utf-8?B?Qld3SS9oaGZEUU1aaEhwTWplN2x2ZFFPOTZ5UTY5bEwvZ3dJaEtGeUlqd0F4?=
 =?utf-8?B?TzBLZHJrUlJhb0FzR1h0N1c2ZmN2TUhmTWhBaVZWSVNsVjVlMmtDUlNPVUMz?=
 =?utf-8?B?anVuUkFZOHU0NmdQN1hOVjFhL01sNG9YQWo4VzBHYmtaeWE1V1hPYzlVNitY?=
 =?utf-8?B?RnJWQ0hZWUpucFUwbFRKSEQrUGE5L0lVOEdSMllKK3NCTjd2M2xjYXJJUnRQ?=
 =?utf-8?B?K05JQ0xZUDhqVThkWm9XUzVRQU9KcmpEc3dqNzhYcXpXcUhpcER2L2kzSWFY?=
 =?utf-8?B?OW5XTmx0NzJkRXJvVnhKQ3I0b3duNmZSWFpBcUxhbTBTVGFIdFJwQ3VibGZu?=
 =?utf-8?B?TW5mQ3lyRnhOcGt0eldVVklEeHYwbVZFZnJGSGxaTVhza0FUWThaWHF5MkhK?=
 =?utf-8?B?c3dXMEZPQmJmd0xNVWgrOWFrcUN0ZFVxTHJhSG4xMHpYWUprZFhGOFVHR0JM?=
 =?utf-8?B?Y2cxYnhydzgyc2ttbmRENE9UaXRDK0VubTg1VmpJbEQxSVFaZlZ6S3BNbzR2?=
 =?utf-8?B?akdOc0dMdVBha3A0ZmVIVlhOcjZrV3pjRXpZSjg0bmY2ckZuSDV4VnZsNnFE?=
 =?utf-8?B?WFRDbzRObzZzRVRpWExCcjlUbzNVWktELzk5TTV1cFFEeGlTQU5hand4S3or?=
 =?utf-8?B?aW0wN2Zvcm1JaERDbzcxZXdPWnc2alZWZUpZTEQxcm1wTWNPNHE3cFpBd2ZM?=
 =?utf-8?B?Ykppd1hjZFVudlAzWGd5T3Zza2JSQzFrVWZCUUgvZnNWZGdvNG1ESld6cS96?=
 =?utf-8?B?MkYra0hiRm51SkVzOXhtd0I2R1RTeE4zWEwvVUk2ZVF6QitzWjRUSCt0b0hG?=
 =?utf-8?B?ZWJoRi9WeWFUUUNUd0ZHaGNLR25hQWQ1OE9tQVNCaFdkdEMxRzdQYjh3TG15?=
 =?utf-8?B?ZmgrM0s0MjlWQnZnaC9TcnNoWDFrcjAydDF3dnFQeXVZMzU4R1VEQ2N5cHA2?=
 =?utf-8?B?QVFuMTJQWW5VOUlCUVdGTkEvWjBIWmgvb1NqN2QzczYyK0lwZlgySEhGSHFM?=
 =?utf-8?B?S2Qwa3ZvYW1EeHNXUDVjR0YwQ3l5WWpjTlczU1E0SWQ4WnJCR3Q5YmdncUNX?=
 =?utf-8?B?bkJxSW9zSTlpR1YrSDR3b0c2T0E4SlJwRUZyTm9zREVrL3A1OFBRb001S281?=
 =?utf-8?B?ZUJuTEVZUTJ4OUZlWk5hTmtPL3JGOU5jOXZGc3g4SHF4SzViSkFVSkZMU1lu?=
 =?utf-8?B?dTJ3OGNDMGFmU0g4SHNnZnBYNWJNL3lMbkl1bTFSNWtvZzIzdmJFZks3MWZx?=
 =?utf-8?Q?7WVso2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 17:09:36.6921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e24b0855-8930-447e-fc3b-08dd8e531c7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
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

Merged to drm-misc-next

On 5/7/25 10:31, Lizhi Hou wrote:
>
> On 5/7/25 09:29, Mario Limonciello wrote:
>> On 5/7/2025 11:15 AM, Lizhi Hou wrote:
>>> The latest userspace runtime allows generating commands which do not
>>> have any argument. Remove the corresponding check in driver IOCTL to
>>> enable this use case.
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>> Can the userspace handle discovery of the difference?  Or does this 
>> need any sort of ABI discovery command introduced too?
>>
>> The code change itself below looks good to me though.
>
> Runtime will capture and handle the error with current driver.
>
> Even if runtime have a way to explicitly discovery the different, it 
> will just report an error and fail the case.
>
>
> Thanks,
>
> Lizhi
>
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>>> ---
>>>   drivers/accel/amdxdna/amdxdna_ctx.c | 22 ++++++++++++----------
>>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>>> index 43442b9e273b..be073224bd69 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>> @@ -496,11 +496,11 @@ static int amdxdna_drm_submit_execbuf(struct 
>>> amdxdna_client *client,
>>>                         struct amdxdna_drm_exec_cmd *args)
>>>   {
>>>       struct amdxdna_dev *xdna = client->xdna;
>>> -    u32 *arg_bo_hdls;
>>> +    u32 *arg_bo_hdls = NULL;
>>>       u32 cmd_bo_hdl;
>>>       int ret;
>>>   -    if (!args->arg_count || args->arg_count > MAX_ARG_COUNT) {
>>> +    if (args->arg_count > MAX_ARG_COUNT) {
>>>           XDNA_ERR(xdna, "Invalid arg bo count %d", args->arg_count);
>>>           return -EINVAL;
>>>       }
>>> @@ -512,14 +512,16 @@ static int amdxdna_drm_submit_execbuf(struct 
>>> amdxdna_client *client,
>>>       }
>>>         cmd_bo_hdl = (u32)args->cmd_handles;
>>> -    arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), GFP_KERNEL);
>>> -    if (!arg_bo_hdls)
>>> -        return -ENOMEM;
>>> -    ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
>>> -                 args->arg_count * sizeof(u32));
>>> -    if (ret) {
>>> -        ret = -EFAULT;
>>> -        goto free_cmd_bo_hdls;
>>> +    if (args->arg_count) {
>>> +        arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), 
>>> GFP_KERNEL);
>>> +        if (!arg_bo_hdls)
>>> +            return -ENOMEM;
>>> +        ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
>>> +                     args->arg_count * sizeof(u32));
>>> +        if (ret) {
>>> +            ret = -EFAULT;
>>> +            goto free_cmd_bo_hdls;
>>> +        }
>>>       }
>>>         ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
>>
