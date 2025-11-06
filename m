Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02178C3D0DE
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A277210E9A7;
	Thu,  6 Nov 2025 18:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m9Uxi/Io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012008.outbound.protection.outlook.com
 [40.93.195.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6A810E9A7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqxZZ6iDsdA/nyQJ37xEj4WTNzrpJDitUvpzO1OZBcfWFywH26oxZU0Oeroy2mM5Qv1nQffcC11ZYL+hSwiDkUTVyLb1qI9thCBZJH2zvox78ih1ARxpNe/OD6IHJdOXsrBf2L8+pzL38NTWjPjeyMZlyKGXjlW77ALDJkORDfGPto8687F7nknu1kPiNbYZRWgteIjUyZCMnpuTZV41mJUYYt8jj7dzs+3xw+zzWSPP/vJjXaA94j07xTEgYqlCJvq9ape4uTM8ExIHPma/rlDRWNnQhMZ31HJLFovgHmTubBqLpYbRhqoxgJVCLUWnFi6ZIIJva0naa8WTyj2mOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toC52pIZO2naKHgGV0Q0MJ6H9Fa2fCgEd+YWRr+VKD8=;
 b=lTjXS8/LIKiBqAhRj76CHPVCJX6eCqYkXIMPcB1s9FhPhhd0NtMXa33imXnf+E8H8rgKcP0o/3jlwjMSH43wbg8DbvALGXblc4BXM56dXRH95cSQ/DvkOvXrAbwZIn1eg62QAmqYvReuaVosts5ivkPCTA7QBZO4I4dRl5X3WJ8tJ32r/WRvM/rCz42q7Z04hywpUK7P0ceSjW+D0Tmmefr65ZJVX1yOBPhmqa3BhnvwMt9KLhbKlirMABeSWDrG66RyHS+qUQtpdsnQfBCiBkeDgKhMlq4x9Y0/fduqtP4+ZDJjBOSjAKGfi3jVwk1xUvGDCIHmAM2YH90Xn0yBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toC52pIZO2naKHgGV0Q0MJ6H9Fa2fCgEd+YWRr+VKD8=;
 b=m9Uxi/IoD+GRL7uzLd6IQlZk/3mg7NSTiHci5qrhuk/bHEpAcUeaD/bTQQ7Vx9XaTXKqLcng3wekFfBE9ayBk5wrsVGAyfDKl6PuNN6cN/otlg+nraXAbIbS7AkuTMJ112LcUwTQW42WpFxRPRb86d7s3Vg6wslqSb3m5AOmaV0=
Received: from DM6PR07CA0105.namprd07.prod.outlook.com (2603:10b6:5:330::8) by
 DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 18:20:00 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::36) by DM6PR07CA0105.outlook.office365.com
 (2603:10b6:5:330::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 18:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 18:20:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 6 Nov
 2025 10:19:59 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Nov
 2025 12:19:59 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 6 Nov 2025 10:19:58 -0800
Message-ID: <978dcea6-4d25-3b33-695a-632a9f58884c@amd.com>
Date: Thu, 6 Nov 2025 10:19:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable
 error
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251106180521.1095218-1-lizhi.hou@amd.com>
 <d21ece5b-d27b-447f-8a8e-5d672fa0c473@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <d21ece5b-d27b-447f-8a8e-5d672fa0c473@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: bebb817d-27f9-4dd9-2f7a-08de1d6118ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWVXMzhRTmFNTmRITUxhR29WeUZEaGNoS3hhakV3TGNZL3BDSXcwNjJmeGVG?=
 =?utf-8?B?NXEzUEdzYklBcjVPQkIxb1RTNk9Tby9rcURCc3NuYy9lcmhsa0Q3RUtHT2gx?=
 =?utf-8?B?RlBEM003azRJYmlhanZuZVJ6RHhNdkJuSTJ6TzJHOTJ3T2lja1V3ZGVqdG9r?=
 =?utf-8?B?dTFtT0pqY2JsaHg5WDE1QmlzSkVDVWRXUVJvejkrQzI3ZEw4WlBwWEpLakJ3?=
 =?utf-8?B?Vmk0TVVhem14U3RTSGtWdzJvWlNwOHlsb3pYZEVnend2bERub1I1dU9iZGtp?=
 =?utf-8?B?YTIyYW5Uc3dZbndjSlJXNVN3L2ZaUEtzZ1NyR3BnOFhsUUJSMG9Edll6SFFV?=
 =?utf-8?B?ZlYrQm05REhaK3RkTVd1TGMwd1VidjlPblg1L2xBNHZaNTcyUDBPZDIrV25x?=
 =?utf-8?B?akhvcWpkVHR1TnFLVmRxQWwvM2s2dGM5RjRzcEJQU29JRnBFOERsZEFMUVlE?=
 =?utf-8?B?bkdzRmlQUTlqdGsxdDJWZ05Cdit2OFI4bHgvTFgrRjBNd3hyd0hkRlNid1dJ?=
 =?utf-8?B?NmlmRm1seDYzbDBpQzltamsyZlUzSURMRC82MzRxdzZXWDJSd2dHMEI1U0R4?=
 =?utf-8?B?bVNXTnZDMEEzSXhIdERHNDVVOTZnREJqTlRISnhVT2VGN1BFOGJtOVZ3Qmgx?=
 =?utf-8?B?a3FORmIxNHVzUzMyNzE0UVozdkRIajBmRnVxL29aNnpMZ0RqeDA5UDh4eXRv?=
 =?utf-8?B?R3RYOXM1a3lvM3NBODhVZjU0Zkh3cyttQ3BsNXRRZmYxQXBpVGNLZGdseDRD?=
 =?utf-8?B?U1AvR2wvNGJyazNqekJaY2tGQnZIRVdJVWl5WDhFaHMzUkdIWkZvVTQzM2dU?=
 =?utf-8?B?a21UdkF4YjFIeCtiQU1uNm5ncEFOamhyelNCdUNVelhzTVJpTnVTSVVrczVu?=
 =?utf-8?B?SHhjZyt3NWZJRGJlUTJJMjNGY01XUER1eWZVaVlmQ0pvcTJvMDhPOVVYK09Q?=
 =?utf-8?B?TWxkY0Y0VDYxdHY4cS9QSWZWaXVzUWJkeVFndHdXalFVYXY0OTZLRGY4T1V5?=
 =?utf-8?B?R2QwOExjMzF1eWxnakpzQTJyelFCb0NhZVpLd045WjQ0cW55aDBqSXZTR1Vy?=
 =?utf-8?B?UjBQNnVOQzVENXFLb3kwR2lMc0kwbi9TTHBNT0VEZXB0Sm9EOEtSZ1Y3a095?=
 =?utf-8?B?OTE1dWExTUM5OW1ZR2pOOGxneHphb2hxak1JdmNiZmswSkVURFI3M0VQdk1T?=
 =?utf-8?B?VkNoYTVEeXdWR3BGUTczSGhJWjZES0RmcVlvZDE3R3JtRXNZNmFIVHpwdlAx?=
 =?utf-8?B?MFF2M0h6cEQrT1hzVWxRYVFRMVZZV0ttVGtkajdURUxVNTVseVJOY0o0eElj?=
 =?utf-8?B?U1IxbHBvM2J2RGRnV0ZSc0k0WEc0T2FJQ2NaMXQ1VTFieXRzQ0Job2piQ1Vy?=
 =?utf-8?B?RmJtaHVIb2EwUWNHcUQ1RWxoclVqU0FnUitseUcrZWpKSDhSUnJhMWxRMDJH?=
 =?utf-8?B?Q245ekczanNWVzkrM1hqelZWVGJtd2VhMVpoYitCaHF5Wi9vS1FGQ2dGcXR0?=
 =?utf-8?B?V2RSaXFDM2tiaTE0bWxZS1FYVUk2MGh6b0VLQXg5VnFraGxYVENBVm10aFI5?=
 =?utf-8?B?LzUxSlJhSUNTTW1lY1VGeThQSEJQN0R2dkZObWxKVGJUM0ZYRE5zNnN0eVF1?=
 =?utf-8?B?NHQ2NDA2aHhjbGp1VlR1c3ZpVVcxWTNQQXd4Znh6ZTJVdTF0cjdIRGVkSUJS?=
 =?utf-8?B?a1lCN1ZHUU9ra3NiWDVIN2FMZU9ZMEhGYWNoc0luNHFMaTg0YlQzWXpkZ3Zq?=
 =?utf-8?B?MHV0cUErMG0yL0ZBTXNaYVpaSEoyeFZRMytCYUVWMjVlVUlUVUd5UlJ0VUtZ?=
 =?utf-8?B?VHhJSlhpd09vQ1lEbFpvQmllcjRCYlNpd0N4eDZJd1F4MDhHdkprSEt3YTN5?=
 =?utf-8?B?Tktqb0laY3laSk5lSzBkTGZUcitNQ2dONnk5OVM2NE5LcjVlNXpxWkNiVWJW?=
 =?utf-8?B?cGdaVEtWRHk5aThLbDhOdDVXMmRqVUFub3FGRldlNTY2MkZ1NVdlVGZCT1Rs?=
 =?utf-8?B?UC9JRlA0ekVjL3lKcWxOc0Y5bndua1FhRXRDbDBHK2hmNkdBQUFDWE5SVmI2?=
 =?utf-8?B?K0NnMWhTNFBJU2JEK2xSRW5QWHo5MVFjdDdwTkhNQUF2dko2OWJQa01BYnZ1?=
 =?utf-8?Q?Q97g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 18:20:00.0809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bebb817d-27f9-4dd9-2f7a-08de1d6118ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399
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


On 11/6/25 10:12, Mario Limonciello wrote:
> On 11/6/25 12:05 PM, Lizhi Hou wrote:
>> Failing to set power off indicates an unrecoverable hardware or firmware
>> error. Update the driver to treat such a failure as a fatal condition
>> and stop further operations that depend on successful power state
>> transition.
>>
>> This prevents undefined behavior when the hardware remains in an
>> unexpected state after a failed power-off attempt.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Presumably all versions of hardware in the wild can handle receiving a 
> power off command if they're already powered off?

Yes for the aie2 platforms. This was verified by xdna-driver pipeline tests.


Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_smu.c 
>> b/drivers/accel/amdxdna/aie2_smu.c
>> index 11c0e9e7b03a..bd94ee96c2bc 100644
>> --- a/drivers/accel/amdxdna/aie2_smu.c
>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>> @@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>>   {
>>       int ret;
>>   +    /*
>> +     * Failing to set power off indicates an unrecoverable hardware or
>> +     * firmware error.
>> +     */
>> +    ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
>> +    if (ret) {
>> +        XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
>> +        return ret;
>> +    }
>> +
>>       ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
>
