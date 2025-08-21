Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35AB2FE64
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FD610E108;
	Thu, 21 Aug 2025 15:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vErziw+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BB410E108
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 15:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzyJ0AxsDk0KnMkS9yqivqYCDufEtxeVcvEMj40tt8pEP5ufazR9rkqfCoGXdlMF+ZwRgUC5BEPZuhU54h4ZxERXYxzCriQssyTkGFk7Jdj+4S+meqPs15pWn402JqahloZRbi1wF1YLc2ddethuVvshik3cb+Y+Fy6+tjPgWwaobtXCD7cnf6ATEtLd+0PPBUchoqhtBIOiNGhMUwYyQskP+t/0LZwn2n9w23m8d+E0sUr6mn1oASamd+v3BFxUh5+j9mdOrJD9PvLxw7JGUTho+Hrb02DGV098u6oX5a2hGf5GOEFJk3Fe5D6UWv/Atj9ck5G4q1I832+fuBSjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uX5itkZlCN/XTKlCvbZSsSljdVvVf0XKf6HDbpDZxBQ=;
 b=KRRwBB+ISORa9Li5mNe2Cebcqi9lJU/AzS6+DEkcBxAdOAFu3WVk5H5qNzYn1HgD+gk/f5mtLcdjU9r3eqeU0Gpm1FQey+F2j6pkX4fmzgTxVA0lZgy31tuO0C2np/6YGFHc1lmaJb+mFoRQpI4NhY7G07wkDStjRTnBULPpNmhfwo5hKk8Z5GF7zxIc01t7JqmR8oPcmonMoLcM/5aumFOE/+6aXBgxjP8/FJ+0+uexbksYrS6e609GC4sTUI6ZomSqDWYzOksbUv/YvHmdjYZFwpEZydDru/QbGPidT610e7h+xPe2oHHoV5N5o8l3GTlIeRFIg7H+BQKvQjv8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uX5itkZlCN/XTKlCvbZSsSljdVvVf0XKf6HDbpDZxBQ=;
 b=vErziw+imBdkPB/Ig39x2LfwtVo7IvCo3aJ//EssvgPqpdjAoJ/IYlSntmKmtJ7VnumNL8qWEfhXO8AkBxUjuXN/7mXZrkBeJP7RASyFyH1mpejXkPDm4H6czRUUbIxDygSY+CPyJLepVLUh9/pUquoRSRyPU/LCmvB78JJt6Ko=
Received: from SA1P222CA0145.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::29)
 by CH1PPF5EBD457EF.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::610) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:31:32 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::c0) by SA1P222CA0145.outlook.office365.com
 (2603:10b6:806:3c2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Thu,
 21 Aug 2025 15:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 15:31:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 10:31:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 21 Aug
 2025 08:31:31 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 10:31:30 -0500
Message-ID: <9ccb22cb-1441-53ea-8a96-3e71aa6dc484@amd.com>
Date: Thu, 21 Aug 2025 08:31:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Documentation: accel: amdxdna: Update compiler information
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>
References: <20250820233817.4050006-1-lizhi.hou@amd.com>
 <CADnq5_NjpN79sWt9t9Zw2u=OkzpGOfMqjhUxSyyLNaFesdjObw@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_NjpN79sWt9t9Zw2u=OkzpGOfMqjhUxSyyLNaFesdjObw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 417d38b5-e424-46e7-c88f-08dde0c7ce0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHQyT0k4QlJKcEN4OUNBQmdDcmJMUDNRRWdrU3hvRzNWZi9XbUJVZElTajFK?=
 =?utf-8?B?RzAxeVRMNmdJdFZHUlpaYU5vTzN5UG5iODFJdG1NVGZmRUxtdFF6b2tKMWF6?=
 =?utf-8?B?U01vengyYUN2Yzk0dENKNGJQOCtPVDRrcGRzSmhxQkRNTGlIMXFIMnpwNmIy?=
 =?utf-8?B?YlhTS1hRZUtmbVllL2FjRFd2MnJPcjZqcngxeHY2YkRQWnIxNEJIMjUvVzlq?=
 =?utf-8?B?QmpnQnY4dHkraldPdjM2T3FnZHlmUG9KRTBVQmtjTzJZak1zMFhGWU4wKzNt?=
 =?utf-8?B?TEcybDMyZGI5U3ZwK3hMZUQ0WlZwTTRlQm5QelpHWjRsU0RCZVZDUWpNUWZX?=
 =?utf-8?B?eXdHLzBMa0dMeHhJbmU5UEJGaEt6TXB2bXZacVJWaTFiRmdDWjdRLzVFOGln?=
 =?utf-8?B?cWJJM1hCWXpoREN6VjliaWdBc0FJc2Mrd0Q0ZEtnLytEOGhJc1VCZXJEUUJW?=
 =?utf-8?B?UWY1Z0JGKzJFL09vc09ocTZyWlBhS3UvMm5HMTdLM3V0c1RpZ01CMGRBa2xq?=
 =?utf-8?B?cWNPaG1aTGtFS1g3Zzk1ZVN3cjV5NUNidkg2TkxUb2VlRHIrK0h4VkdkOGdN?=
 =?utf-8?B?OEV6akEzMDRJSzA2bjF2SStjVlpUZHhUWWJlV1l3RjFPZzAwcEtEREJwNVEv?=
 =?utf-8?B?ZlBDRkhEMEhNdC8wM1drYTFYWk9FVUl6MmNnd1F1emtaSlhPQ1BhTkxMamJG?=
 =?utf-8?B?NDFKYTV1TUZ2dE85OXhHU0xIUk9vMFRGNms0SGVOSTczbnlTbTg0NDQ2bGx1?=
 =?utf-8?B?NVFzdHQ3K3h4NW9ueEI0TFZzWnVIYXVnNVU0dklGWXVldnpxK2hhVjhMMGh6?=
 =?utf-8?B?YURiOXU0dUV4TGJRK2s3aFpvK05aWlBUQXJPaFRWbXZTN2U5YU1HRS90SjN5?=
 =?utf-8?B?QTMzbFp3VU9MRFBYeWZpdkZrL3ErM2dnVkZ5V01QZFdZc2tlbHNEZzh1b1hU?=
 =?utf-8?B?QWRHN2pjSXV4ZUtsckcrQkpsRWJrREVpSVRtY2xrYnVlLzRLNTNGWU5aY0FM?=
 =?utf-8?B?bmFnZkttQlR3YVpYc0ZRbjhwN3RGQjFZdm1Kbkh3Sk5ya1FpaU03RW1HRWZl?=
 =?utf-8?B?TmM0cXB3NVJXZHRJdVZKSEs2cW4zQ3JsZzgrTHBPVGZNaUVYQ1hJK3Fud242?=
 =?utf-8?B?MFVXZUVOUi9BcWU2cXB1N3lQMm5qeFd2d0pQa21hRWVpVlRoV3ZzRXBWTFg5?=
 =?utf-8?B?WnVrbFl3WHV0VXIrV2JoTDdndFNTRmV3Mklxdm9DYVVPVWNPQmVSWitvaTQz?=
 =?utf-8?B?NUIwb3hTM0tYcjNESnoyMFB1TDNBTzNHcW9DdDV6ZlIvUkNoZmVsQ1pmblRU?=
 =?utf-8?B?VG9FNy9vcnV4Y1p3NlgrbWorc28vcFpSWFpwQzJ6ZWwzblRUMEFjd293ZW9J?=
 =?utf-8?B?c3R0M0RtK1Q3V2pjQ3BMT1VvK0pDWGZQQkJndkpVWlB3Q2RXaitZSnE3OFI4?=
 =?utf-8?B?SWZPTGJ5cHFiYXhDTWE3d0pnUk9hd1M3TzZYazhNMmdhUVUza0VGY21COSsr?=
 =?utf-8?B?Z2dZcDZIOVZaaVFDUTlJUTdLZllTbW5pMGRYbUhrMWJhdFVGd3czSm81eGd4?=
 =?utf-8?B?V2pUT2J6YXpLT3c3RmpaUEZIbkltdnFsMXYyYTFjWkZ5cFFicTJJT3owS1By?=
 =?utf-8?B?Q0ZQTVN4anFkS1dMZG1QY2RTaFVpbDRmWFlNbnYraEYyUUR6ZTBPS1hjaEtC?=
 =?utf-8?B?MzJrTHo5Wm9QZ1NmOTVyQ2ViT1JUQ3FmWE8xRGNXNW9WcWZJNTc4S1I3T2Jq?=
 =?utf-8?B?T3RZak1BR2VXbWZ0dUU0dGsxMHZqRUJXeDk5UTE3VTQwVjJpMExyT2t0RHlw?=
 =?utf-8?B?MXBKZ1IzQzlSeVcxeU83eURlNTlHY2dHcjFkOFRpaHlVNEFZSk9rUjFqTWJK?=
 =?utf-8?B?UERQMDhnWUtjYmhXZDFEOUhGSzhHSW5lNlQxSWJrcVltbHg5NnlXYXErNm8r?=
 =?utf-8?B?ZFpSZk8rMDNxTXdmVk9uNG5rcVZKam4wVVhaZmNlUEx0ZEY1WFd1L0NLbXYv?=
 =?utf-8?B?YTBYRHNTZG9PaUVYQ1NMdnVDYWtHSnlMcW1FalVoMzZuVE9LYU9Nc0dDajBO?=
 =?utf-8?B?V2EyZ3hMUDN4ekRLSGNzd0VWOWFXZGI1RGFCZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:31:31.5797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417d38b5-e424-46e7-c88f-08dde0c7ce0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF
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

Lizhi

On 8/21/25 05:52, Alex Deucher wrote:
> On Wed, Aug 20, 2025 at 8:03 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>> The compiler information is outdated. Update it to the latest.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
>> ---
>>   Documentation/accel/amdxdna/amdnpu.rst | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel/amdxdna/amdnpu.rst
>> index fbe0a7585345..42e54904f9a8 100644
>> --- a/Documentation/accel/amdxdna/amdnpu.rst
>> +++ b/Documentation/accel/amdxdna/amdnpu.rst
>> @@ -223,13 +223,13 @@ Userspace components
>>   Compiler
>>   --------
>>
>> -Peano is an LLVM based open-source compiler for AMD XDNA Array compute tile
>> -available at:
>> +Peano is an LLVM based open-source single core compiler for AMD XDNA Array
>> +compute tile. Peano is available at:
>>   https://github.com/Xilinx/llvm-aie
>>
>> -The open-source IREE compiler supports graph compilation of ML models for AMD
>> -NPU and uses Peano underneath. It is available at:
>> -https://github.com/nod-ai/iree-amd-aie
>> +IRON is an open-source array compiler for AMD XDNA Array based NPU which uses
>> +Peano underneath. IRON is available at:
>> +https://github.com/Xilinx/mlir-aie
>>
>>   Usermode Driver (UMD)
>>   ---------------------
>> --
>> 2.34.1
>>
