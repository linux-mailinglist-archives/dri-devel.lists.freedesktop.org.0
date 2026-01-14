Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6414D20730
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 18:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F610E632;
	Wed, 14 Jan 2026 17:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iVv89TNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012030.outbound.protection.outlook.com
 [40.107.200.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF5210E679
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 17:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsitVI1P4o2fmIE7lN9ZejRkZBF6Pn6RzO3/ZpyQCekJTAUGrX2CwQ7hObFp2AJDQWUKpNFWh0nUtyAr23v0dt5rqnFeI8EnYJwsNRqG2+6anCiMaZdPoX9iLWmWr3bVef0y7KyBm20LzLCvjQsntqcYDzW0cnt2lGVfCtJ2bbicrO745CMjJXLWO1QmrBskLOFbE8oPqWJLG+iMo+QvmlRsyFhj7QuJF36hZIMe6WKyhMMr1gu2zS99JPXBbd2AXtljxErrE7OLpXMWhSPPkWXPXu8wnB5HK6Vb4klO0/VC7UrCxnMPwxXPF2Duuqcph8nUekbplWuT3Lm6gL3PNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuFvMAP/L/AFqGmefQBwNs3lwksxbGU+7JhYMoSd2oo=;
 b=HxreGj5fZBHyXwl5INrQfUXl7v+epmn4HK00BubIPYAXmcdJ+N/oGs7EB7raCP18TY76O9YiaTZdETq90/56Fc+0Os3+0QLwTFgN5N1nSSd1wHNBzZFz01KyYX+xM5Tip0b0ZFCLyDOVaoE3on6vsPbb/u7ncOXligPkJZiFWftC5/CgLhD3kyiWH7NXIVnzsJhmZZPEwSyvpcm+eARWVOi+RxHgYfxz8afB3I78BTqPtw0DvbfyE8iTAABygBBytbbyVdGJALM/duCqAcUz3xfngRV+NkE2yFMPVbnjfHxft+Oq4KDhICUH3gsUT7bvBmqc/fT1XKu9g3yUcEWORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuFvMAP/L/AFqGmefQBwNs3lwksxbGU+7JhYMoSd2oo=;
 b=iVv89TNA8MsT/lsr1qxgtFZV6x9iRXabpPHdm3EUku8x6bDTxfX5UQOpFTKkxiiObYGfTCSHm/X0ZRjiuGqPgpCH/iH+Z+diSOsHPwdOHVUAxceB5DhvUm1SN88FnFF2zLlhGckor1t3ekE67CfIyQcUQbd2Cf8gm+WROkAYvHU=
Received: from SA1PR04CA0001.namprd04.prod.outlook.com (2603:10b6:806:2ce::8)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 17:12:16 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::20) by SA1PR04CA0001.outlook.office365.com
 (2603:10b6:806:2ce::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 17:12:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:12:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 11:12:13 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 09:12:12 -0800
Message-ID: <c5c0aa8b-c6fc-ea7b-020e-9ab6bf25cc68@amd.com>
Date: Wed, 14 Jan 2026 09:12:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix notifier_wq flushing warning
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20260113173624.256053-1-lizhi.hou@amd.com>
 <cf84b137-5bf7-4688-82e6-49c185ca9cb6@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <cf84b137-5bf7-4688-82e6-49c185ca9cb6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0b834b-132a-4c82-18f8-08de5390100a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1NPVVJDUlR0WW5lcnA0SVNyaGV1SnRLVEJUc09xRStzWmtyd1RWZTFiWi8y?=
 =?utf-8?B?emVaSFRuK0JVcEZNTEhncDJNcFQxYTdmMjBOQUVHdkYyWmJQcjFBaXVsS2Zk?=
 =?utf-8?B?ZFZCbWc2emRVc0JZUWMvMWZJbjdLdVZTamRmSkRIOUNFYVJRODFteTh4czdj?=
 =?utf-8?B?bEVPSWtjLzFyN2NnWlV3U0ExRno1VHlYaDY0NGlzM05nV2FPVUtXRTBReGJI?=
 =?utf-8?B?QzBPcWJJWFNXb005bE5YK1p2Y1B5dnAySlRhZ3FWeStYQ0xWbHlBeTBaWXN4?=
 =?utf-8?B?QWozYWpFNDRxdnNic1hmNWlueHh6YzhrQ2YzSmZjVFFob0JVV2Y3T0NLakh3?=
 =?utf-8?B?T0tFQlN3bld1VDI0VEVOVEpVakxtZjNJU0V5UHlyMDRJSG9MSjVqNmFmY3Mx?=
 =?utf-8?B?YXI0ZUI0NGhBWWNPN1hQUTVrOFNYQ0VIRVpBRVVqWlpFbHZWN3Y0aWx4MXRs?=
 =?utf-8?B?bEdHcWUzUDB6QlUwWnkyaFdRUDZrWFJKNGNMSEtWMURPNlpNV0JQQ2RZQ1RU?=
 =?utf-8?B?NXdhcWI2dVFhdmxEZTJDMDVVTDk3dW9tZGhSMW9jNEZ4QWJadStTWFdhNUND?=
 =?utf-8?B?aGcraXFWZTBSRmVRcmV4cjlKQUNpMG9CaGFPYnVDclhObEhTYys5N0FBT0gy?=
 =?utf-8?B?RUZaekVPbHZYU1JZanJlY25BbWFuTWRJSlRSR0RKMHM2UE1JSHp2R2c3MThM?=
 =?utf-8?B?cGxOMHR6SGF1anFqUmFQNk1QYmRNN01FUmFpZFZZN282eWtCWEJIM0JTRUw2?=
 =?utf-8?B?ZHdUS1dXL1JBejZHUTdMNHNCcmRRQVYza2FOcTRhTFFSZTJIQWo5WVdVZDJn?=
 =?utf-8?B?SjdsdmYvdlJXYTVWNkhQenVpd05SK3pKWUZmVlhaVkhTU1JlZldtZk5HeHo0?=
 =?utf-8?B?NzJPZ0NzaUY2S2JBeW9TTisrR0VoNEh1UTN6V3VJdjd2L3FjY2xWNllZdGRP?=
 =?utf-8?B?S20zMW95aEc4eUpEUmtrTmhLQjFseTJ0NDd2MzN2K2FzeFNKKzEyWFNCR0Nl?=
 =?utf-8?B?RDd4eWZoTXdWenEzd1pjRzZ3c2sxTWtDRFkwSkp0dlRyeFEwYXVvVjh6Wkll?=
 =?utf-8?B?dTNhTUQyMytZWXhwMkNHcWhFM1lYY1NqZngvQUVucURhdkd6V0h2NnNQOUFx?=
 =?utf-8?B?VWVRVWVyOWlMd2JNWmthNnBVbG5HdUdYdkZML3AzY091OFNNa2NKWnR0QWJy?=
 =?utf-8?B?bkREMGZ0N3N3RUpGblEzbnZTVmYxMEEzb2xKM0RnYk1NSlVUNmNSRUJrS0Er?=
 =?utf-8?B?OXp5UHI2V1BMT0Z4R3djQUNYQlFLNGZncDg1NGtEb2hzTitPM3RWUjBtWUZn?=
 =?utf-8?B?V2ZyMWpIZENPcndaWnFBVzRkcmVZeTE1aFB1MGcyVVF3WUdkVG9mbmZlYXBI?=
 =?utf-8?B?RHBOc0ZlNXNCamp3eW5wUHNlYTV0aUduUFBZeStjQm44NHFsSGE1R3VzTVcy?=
 =?utf-8?B?SElkT0dXc0w4QkVla1gvNktTeVQ4TlBibUt3RGtzSlRla1FHQUc4cjE1NXdj?=
 =?utf-8?B?YjBwZVp1c1hWWjF1elRRd2dxdEtySHVsM2ZZZlBNVm5mdmw2S2p3SmxYM2Jt?=
 =?utf-8?B?V3FMdzl3NExhazhrVGhhMzJPM0tpR2FSMENUMHNsT0ZFVURzRFhDRkxQMk80?=
 =?utf-8?B?UlFCemx3YnZ3aDFZRGJEaHI2ejZqcXNGUWoyY2dPMFlYL21Fcm4wcGNubXYw?=
 =?utf-8?B?VFJRVlVoRDhyTWVNVUo1aGYxemdZS253MlROTWJJWWNTQ1k2eVdjU09keGc2?=
 =?utf-8?B?ZXdSaTNTOWJWYmdZQXlUaXhaeHhNRU91VWJuTXg2SE5VSitpNDNLVGdXRVp5?=
 =?utf-8?B?OHJkaTZFZVpIQklzOER4OUxOU1hqYUFrSjFCWndzQWxMQy9nc29KWkdkaDcw?=
 =?utf-8?B?ZEd3dHM4azZXb3VHYnc0a3BwOEtsVDJ0ekwycmhRYnJXLzI1MWdyWGpyOHZi?=
 =?utf-8?B?cG5SOS9iRlM3SDdpQWhsTDJNT04zaGc0Y2VYTVViMk05OGtOUFdIQnhxS1Jx?=
 =?utf-8?B?SDN0ZWxkVkxCQnk0SVdBTW1GUis1V0syYUZWenVCbHBONWxvYkJINVVzUk5W?=
 =?utf-8?B?ZnlJcjNhdlFqaUxRWE9sL1Jjb2E2Z1pYSGlveW5zYkFEUkpYZDFpYmpoOTVt?=
 =?utf-8?B?U1RzZGl4Zi9LQ01qbXJFWExpREJGY01GRGNEc3Y2SjhZOUZXWkRuaGZGMml5?=
 =?utf-8?B?M2JiRW4ycnZBcFpnUy9PVmpjd1dSWnFqK3JyOVZOK2pLMUVabDR4b3E0OW9N?=
 =?utf-8?B?b0UrdXNNdGFKNkN3cXArQktVSW9BPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:12:14.1937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0b834b-132a-4c82-18f8-08de5390100a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
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

On 1/14/26 07:04, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 1/13/2026 6:36 PM, Lizhi Hou wrote:
>> Create notifier_wq with WQ_MEM_RECLAIM flag to fix the possible warning.
>>
>>    workqueue: WQ_MEM_RECLAIM amdxdna_js:drm_sched_free_job_work 
>> [gpu_sched] is flushing !WQ_MEM_RECLAIM notifier_wq:0x0
>>
>> Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index a7968fd140a9..1c83efb51f7d 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -277,7 +277,7 @@ static int amdxdna_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>           fs_reclaim_release(GFP_KERNEL);
>>       }
>>   -    xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 0);
>> +    xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 
>> WQ_MEM_RECLAIM);
>>       if (!xdna->notifier_wq)
>>           return -ENOMEM;
