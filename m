Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5163C55B2D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D366710E1EE;
	Thu, 13 Nov 2025 04:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3+O5eona";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D383E10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 04:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVAvQGSpGKu2K/gBMoYRlJ3xHUH8E4SFZW+CZMoZdGOVAxhNxGDO7mHcFuD2sSOiXjoUKj1D75vHu/gZx/Z7ValCzDbSJ3HyF4OAg2wsEXJajAtclqEP31R+4+4hWkuT8QhLOcUEsvmOV2VqmJqz/RoLrz3jwfkv00A5r9zC9iJe8boP/jQzy6GOKFm8tPZQhU+yz7D7GvFNCvJxN8hk+eASNWqD2KQP6RhN8K+RAyx7IiqRwcipRsCt5mjmZidcBH/8W+v3dxz+RoAKstkdy5dMIG8w6VT5giEfZOVhy90L7p7taXhCckfYlF5S04aKOe1QIf8cOAOjVF7zcwZOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzBZ0aDmrY2cK1q+Gc47oLEjSql4jXB+P/YPdLi3Aok=;
 b=J1APL5hlz8ci3urW4vPRCu520v1Q0DiID1YubLzojJC0+HLju/ebyG58Q/5pGyIdhurZtVWvGLlRHFWgGWi/iEpwi4Y6mhNUcS1snY+VlJ97nEIlVHQZugwnriv40SE3/SN7v9OXxcqvsXFU31kT6H48K/AeSl7VY43/k+Kv8tvCMEFXAEGODbW7ak3+uwGnWL+HJEfc7m+dJo28MPgdC+sFACgbtcvFhg7zpvrGbzzq29VLzSyY97z53bbwcw7wjX+3H8W5q6giF6OhIdUnbotgfcEf5glu42EysiiomsJE0QotAqg1yQjkWK7G1+LPoy4n0wcdhH6LimD6WJRswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=wanadoo.fr smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzBZ0aDmrY2cK1q+Gc47oLEjSql4jXB+P/YPdLi3Aok=;
 b=3+O5eonaVjxRuNxLERIjwoN3vpGFZUtTsHOK+tPgdR070P6U+18hU3vrl4YfIKbL0cb/IQnMsBm2aO7+VWXh4bNdRy52LWnYBNoFLY10otPCbqQhy93lxRBmQIiGuNSie0v+ti/yj4cU2Y1hju1UECsOVGAr2RBVoFjU+2/nOvE=
Received: from SJ0PR05CA0078.namprd05.prod.outlook.com (2603:10b6:a03:332::23)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 04:51:01 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::8) by SJ0PR05CA0078.outlook.office365.com
 (2603:10b6:a03:332::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 04:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 04:50:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 20:50:59 -0800
Received: from [172.19.74.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 20:50:58 -0800
Message-ID: <106c75a3-812b-47aa-8736-9e5ef302a56d@amd.com>
Date: Wed, 12 Nov 2025 20:50:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/5] accel/amd_vpci: Add Remote Management(RM) queue
 infrastructure
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Nishad Saraf
 <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-4-yidong.zhang@amd.com>
 <269e26c5-556c-47c5-bd1a-163bf2386365@wanadoo.fr>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <269e26c5-556c-47c5-bd1a-163bf2386365@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: f9053730-3086-451c-db39-08de22703dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHdWVFAwN01KUEFEUGpSeERZcGd6eENmRnE2N0JGa0V3RmoxT3Z6aGpJLy9P?=
 =?utf-8?B?cnYyUXJuL0lZcG0rOHpST2dsc3R4T1RpMGhzWjV5T1YrZ2NUVGw5WXA2OHBy?=
 =?utf-8?B?cklwdlZ5ZFJwWTFsRTRXL1V3R2U0UlpsL0wxYVVZVnMxQUs0YkQ1TEFHNmxI?=
 =?utf-8?B?YXJvSEZwaHlmcXJyUDN1UkZaSXV5T2IrQU5WeGVWWkkxWmJpRHBSU0ppdlVi?=
 =?utf-8?B?Vm1UMkFjL0RCNjRNT2pySUFYN0V0alpkQzBsbmloS1lRY2VxcENmdk9LTVRL?=
 =?utf-8?B?Z3ZwTTh1Y3EvdDdwYzdqUFNaSXJEQlRxYlNYbTdLLzBpL0labTY1S01jM1JY?=
 =?utf-8?B?WXZtQm5ESldRV2JGd1JDY3EzaEw2c2NGWjdyb2VlNjhtM3VwUjhEN2Fwbkcr?=
 =?utf-8?B?dHZ1R1ZHZXdNeENVUmh6dWVzcnp3UVZNUmZDZzB0UWU5cFFySlNBbjlCSitq?=
 =?utf-8?B?dk1reW83NXhLb1YwbFpRd21SdFQ3QWFFTWhLME0rQUdKMk5kZEdHWHdkN205?=
 =?utf-8?B?bTU3cUdZeUZWUTB4K1YyT2RJZWZkWmNoVnN4WkhNSjVtcDQ3TDdwMC9La0gw?=
 =?utf-8?B?ZEgvWlA4RnBjSUxaVURBeXVKMDZjMFh6OStlQzM3cWFFZUVzeG1uY09VU1E2?=
 =?utf-8?B?NEQxWTJGK2VkRUN0QW1MUStlbWg3NzF0UVByV0FXT25VUTlneFc0RllCN3ZF?=
 =?utf-8?B?M3Y0MG9HYVpFS0RJV2czR1lXWU9qeTdWdjg3VGxzbGwwVUVzdTd0a1pnbzlu?=
 =?utf-8?B?Q2U2SnNKUG9BbEVEWFZvR202cWFXbnhrS1hmNkdaSkxkQ0RGczlwblVCaG54?=
 =?utf-8?B?Uzh4RU1qVW50Vi9MZ0R3TE1lNmw3c3VrTndIWFQyV3VYRXVyTGxRRmdDSVJk?=
 =?utf-8?B?NjZyaFNLbEw2d3prOG0ybjdrS1BmamRaa2xKWXBoNlFyR0kvV2gwcHBjNU5H?=
 =?utf-8?B?aEVvTTFSbDZLWGRaWTZTVkhnZ01kSXp4U3MxTmJUTk1rcjZPbDNSYWdxSlRv?=
 =?utf-8?B?R01vTTdLa0p1S3VwamFVVGJJZG0zR2VUK0liR3ovT3RqN3ltV1RTTHRHaUpa?=
 =?utf-8?B?cTQrWGhTY1NXeGdjbm5QTzZ2Qy9jc3FuMVM5Zjg3UysvYzl5Rk9hNCtvT0ZM?=
 =?utf-8?B?OUc0NHNYalRYa2hvdnNCOWlhVkhtc1o0K2NIVjBOQ3pQQitNcVVWOG5CMndh?=
 =?utf-8?B?NlkrNWx0UW9XVWQ1VmJpVDdxY3I5cUF4NjdMRDZnYm5yNStVK1Z5V21CUjNv?=
 =?utf-8?B?L1BsdlFGc1NEd0RoREgxUzJ5ZnYrcVZKaVNUMkdrQ2VzcGJEMlJGQ0Noc2VX?=
 =?utf-8?B?elNiSTB2Z1ZQZ0dpclJ2YlVQSFFwaVgvTFRqZ1BEd1lCei80d2QrcWhveTRR?=
 =?utf-8?B?V3lwNjNHUzlCVHdPOHJReU1zUElMd3VJR3h4MTJQcGw3SnF4QkFialU2RjZQ?=
 =?utf-8?B?cUxIR2xoUU5HbEpvY0RvSFpDTnprMXlZZWM0NitWMDVDWXJoelVHc3NxTkFN?=
 =?utf-8?B?Q2lwbEttWHNMb3lzQWJHaXc2aExPWmppRlhCanJBVk1ZL3pRTWZPcmpxMU10?=
 =?utf-8?B?RnMyYU9aNEhZZjRpbDlyR2xPZnVXTnUyOXQ2eWxTV1huRURZVzRqSkNBaWJ1?=
 =?utf-8?B?N2lBSVFJeGlDejQ5Y1FEc2tENlV6R0src0krck15T1IySUg3N3ZZQi9RQUd4?=
 =?utf-8?B?QnhiMllMejhmWXdtM3NWZjhkUXdPbjhuNlpSRmxWUkJjVUM1TjBTSXJiTkNI?=
 =?utf-8?B?V21NR2RMWHhFLzNGenNLOGQwV0dMR3Q2SFN5ekg1a3k0eDc0NG1jRXNxOEZI?=
 =?utf-8?B?ZWxlRFlacGExRUlyakdiSkNtbGxZdWtkbUdjSmZTbkE3UVdaU0pvVGRNaXhS?=
 =?utf-8?B?VGw1NDJ1d1YrOCtlbjBDTGhFeUw4QVprS2pRSjJyU1QwN0x3aDN6QnVETW9a?=
 =?utf-8?B?M2tTdTlTcVRBNDVFUGhUSDRXWVpWYUhIQ1FDZHduSzR4VW1TdVR1a1o2ZUp2?=
 =?utf-8?B?SXlyUG14OWNDK3IvaTg0MXJ3WVQycWhveW15YnlCZ1FIRWhZS05pdldoK0Zu?=
 =?utf-8?B?dDJyY0tySld5YjlwUEZxb2tNeWRvV1hBOFdBSEIyL09zWm5rY1d2YlFrbUZL?=
 =?utf-8?Q?OWTM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 04:50:59.8399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9053730-3086-451c-db39-08de22703dae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335
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



On 11/11/25 01:44, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 11/11/2025 à 02:15, David Zhang a écrit :
>> This patch introduces a Remote Management (RM) queue service, which
>> provides a way to communicate between the management PCIe function (PF0)
>> and the embedded firmware running on AMD Versal SoCs.
>>
>> The RM service implements a hardware-based ring buffer for bidirectional
>> command and response exchange between the host driver and the firmware.
>>
>> This patch adds the core infrastructure for:
>>    - Initializing and managing the RM queue
>>    - Submitting commands to the embedded firmware
>>    - Polling for command completion
>>
>> Subsequent patches will integrate the infrastructure with the firmware
>> management logic to enable firmware download, status query, and other
>> control operations.
>>
>> Co-developed-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> 
> ...
> 
>> diff --git a/drivers/accel/amd_vpci/versal-pci-rm-service.h 
>> b/drivers/accel/amd_vpci/versal-pci-rm-service.h
>> new file mode 100644
>> index 000000000000..d2397a1a672c
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/versal-pci-rm-service.h
> 
> ...
> 
>> +#define RM_CMD_ID_MIN                        1
>> +#define RM_CMD_ID_MAX                        (BIT(17) - 1)
>> +#define RM_CMD_SQ_HDR_OPS_MSK                GENMASK(15, 0)
>> +#define RM_CMD_SQ_HDR_SIZE_MSK               GENMASK(14, 0)
>> +#define RM_CMD_SQ_SLOT_SIZE          SZ_512
>> +#define RM_CMD_CQ_SLOT_SIZE          SZ_16
>> +#define RM_CMD_CQ_BUFFER_SIZE                (1024 * 1024)
> 
> SZ_1M to be consistent with other xx_SIZE macro?

Thank you so much. I will fix this.

> 
>> +#define RM_CMD_CQ_BUFFER_OFFSET              0x0
>> +#define RM_CMD_LOG_PAGE_TYPE_MASK    GENMASK(15, 0)
>> +#define RM_CMD_VMR_CONTROL_MSK               GENMASK(10, 8)
>> +#define RM_CMD_VMR_CONTROL_PS_MASK   BIT(9)
>> +
>> +#define RM_CMD_WAIT_CONFIG_TIMEOUT   msecs_to_jiffies(10 * 1000)
>> +#define RM_CMD_WAIT_DOWNLOAD_TIMEOUT msecs_to_jiffies(300 * 1000)
> 
> secs_to_jiffies() maybe to be less verbose?

I will fix this.

> 
>> +
>> +#define RM_COMPLETION_TIMER          (HZ / 10)
>> +#define RM_HEALTH_CHECK_TIMER                (HZ)
> 
> ...
> 
> CJ
