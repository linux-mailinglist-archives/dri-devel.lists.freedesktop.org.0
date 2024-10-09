Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051C997106
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 18:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00F10E783;
	Wed,  9 Oct 2024 16:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QMpxoriW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BA410E783
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 16:19:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpwYgNw/2jGPR1NUmlYiz+KFM3We87JqKplS9n6cYJXbaKrCGzpGFFvecas8ye5++E09GHwADT0x9y+DyoBFPO03cfrK5zbMyI83NhJvfoH91YF7E0yMtr1IUhC2Bm9BbXPbSO8ymxR044U6N/T5lUtumA5aqpMOKVlAANZdo/lMAoRrUf7OyXs5Htb8aAArqMVCyjWtunn0PpqQwrq07NuPoZzAxfA8ngsKggEswU2wmsBUyg0gq3zWOfjwG2zqeM9ZxEAy2UOSmMxB7nNXPyrKTWbAndyRyhCIqU/yDkUzYo+9vxdZY7wm0k/FMgauo6UBghGZ6DK+/Ox7Ts8fJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK5eC/qo7y+1fSeUOZoXGcQ2MogRUa9CELv5k9VqGlU=;
 b=h8wePR+ySvb27Sax+rvNhC74oAuis/8ZFWH29bThQr7j4aGT70BFIP24xKFWv2bhwz+uOpQg3wO8mTVVNfhztXaoBzTgtUKCRYfg1afF2j+pCA0i/Mrxmq6oOHPBzY6tYvrNY+pUdj5vzH3eV0qdJFfcTnCYHugYx9PnnPcHpC6OaydChSjLqtd9xo5nFDVIsPQ9jRVFZg+IyO7pbytEw3zkwH9YPMDbPbp4rhQiSMV93hHyyGwwYEdn64Vo/TpvYRb9M0KjmZm/SB/7KoXGDVWUD1tb8dbaMRZWO6mBDi03qyhTBdtubOm4nQ0EefZlFM1jiVY3U+e9peZl/pUWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK5eC/qo7y+1fSeUOZoXGcQ2MogRUa9CELv5k9VqGlU=;
 b=QMpxoriWJPYCrY7IH7DI6RMalluaQoZTw1qrhBMcm28om5DLxcOCgxM7ZilIaYy+kxxc0B+eSkkS93C5SCm/slYCW4KcElHTy5JV9eLGkxoB9kx7a7HLoeelDH+a52HpjtTvHl5zS2GPIqKnQN80V4nUVPADKjc6UAshzPG18q0=
Received: from PH7P221CA0088.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::20)
 by PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 16:19:12 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::89) by PH7P221CA0088.outlook.office365.com
 (2603:10b6:510:328::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 16:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 16:19:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 11:19:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 11:19:10 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 11:19:10 -0500
Message-ID: <378fabdd-69c6-82c1-55cf-d3e64e224872@amd.com>
Date: Wed, 9 Oct 2024 09:19:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 10/11] accel/amdxdna: Add query functions
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-11-lizhi.hou@amd.com>
 <bc45a66f-70d1-da44-808c-e924d8e06c37@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <bc45a66f-70d1-da44-808c-e924d8e06c37@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|PH0PR12MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: b04323a2-17a1-4931-9157-08dce87e1c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?allCSDB0bzBtQmtMUUFUTHgwWnBKU1U2aVFMUmU1SHR5NnlmNEFVR3I5SW9W?=
 =?utf-8?B?eWdXMlYwZ3JwNmpFRUpDWE94QmxqR1lQR1N6YWlkZkhvRi9xTjQ2U1owRXdS?=
 =?utf-8?B?MjB2dldiamJNME9EWVhRSWduNjRwMjY3aFZ5WGE1UElHV2ljK0tlM1VRMlh2?=
 =?utf-8?B?T2x4Y1E0WHpMbFZNQ2RoSm5JZEJBSTJud0NhNU51cmRQZzlaQU1HcDJVRUJa?=
 =?utf-8?B?QVVCRUZLYzVMRU0zQStaVFI5RDZ0VUwxWmM3cTYwbWw0eEhWOGpPV1VBb3RQ?=
 =?utf-8?B?WXVYU3c5dXdzVUhmM21jRStwZlhJU0VGWWNxUEc2cGFCZGdvTVJYR205cEY4?=
 =?utf-8?B?d1RQbEFSVzVWdVZjM29lNFhtZko0Yzc1NVoxZjd0L3RyNExPeVlvTUNPU0ht?=
 =?utf-8?B?S1hHTG9VSEdnRjBuTEJGaVNxaWRVYUdPZlpydnNLOTZ2M2xidVRNLzJoaU53?=
 =?utf-8?B?UEVhcXRYdGUra0NOWWtJYnEwYXA4L1JOTVFjRVFOUGMvN1NLUjlIYjNReDUw?=
 =?utf-8?B?WXZuenR3YWNmN2lpZFIrNCtHYUJsZ1BhemJPREpkTXIxUG1QS1J1WVdKRzA0?=
 =?utf-8?B?ZXBTZ3pQZlpFQXRHSWhBa3BBQTFvZGdnU2F2Ulc4ZlJBaTZLM3VBSDBoT04v?=
 =?utf-8?B?emZLVHBkWmg4TWF3VUlPU2J3MXNNdGhRSmdVbU83K1pRZVdraDNXb0hBVTFB?=
 =?utf-8?B?RDhHeUwyNUZUbzZPditJVG9LY2FpM0N5REhhQi9KQk1HRmtsZ3FKQnRzeGx0?=
 =?utf-8?B?WXhnT3NGZ2dPcGRNdlFWUmw0bG9xUXVrMW4vVmV5R1ByZWxqMXpZZytpcmJv?=
 =?utf-8?B?c0dzaThjRkVmeE9vbkZyZGJaLytuSlRoTEFnL0FCY2orZFl2SVBGMFpaQjZ3?=
 =?utf-8?B?eDF5K1pKZm1sc215Q3hobDNqN25RRHI0ak5mbTR5Q09vQlJDMWdsYjNJNXEy?=
 =?utf-8?B?R2x3MmhCbXdCUnZXVkZCZlRuVThDYmVkTjlwb1RQbWJ2VWdXbGI4M0NId0V5?=
 =?utf-8?B?L2VUdlQ4aTFQeWRRTENVSGRzdkFPN2hYQ3ZYbHdiSG1vQnIxZ0p0L0VKQjJt?=
 =?utf-8?B?OUVpNmNTYTBtWHBPeEpXVzBMZmIrY3g1SUVLbUZQbWM0YUlFQXZNWk9lR0E4?=
 =?utf-8?B?eTF2ZmJEL2lua21oQ1dsREZtTmV1ZUxEbFBRTlVlZ3pKRmd3alorNHFYQjJt?=
 =?utf-8?B?d2ZaVldWTlplNUZ2S2xnWk9xUnI5NC9EV3N6eUR1QTlVMmR3TUJJblNmWVJK?=
 =?utf-8?B?WTJiNEVFYlR6dFdDR0VEYWQxd3A5TlkyOWMwbDc3MjFTcFgyT0xKa0hGMTF2?=
 =?utf-8?B?VTVJZldZUE1QN0lsL1pqRnp2UVV3WGQ3eG15d2R6c1ZxVGg4L1NXeWhGS3B3?=
 =?utf-8?B?L1ljc3pNWTY0bmdHd2RSN1hsQ3kvczZzOVE4SXJCaGt1TFIyK3N4bktQNm0z?=
 =?utf-8?B?ZDlWQkNUZmJQR2IxVWxaMlk3bitKUFhHZnFKRkZZQ0pBZkY3VjhwRGRCUnYx?=
 =?utf-8?B?M1BSZm5ITHhxNzRIT2ViSFZodnhIRVY2Ry9SME5OTlV3VThmSFZQQjBYZ1RQ?=
 =?utf-8?B?TkZFd0NtYVpYUTlsNTRUSENWTkhMY1NSamQ2c2RZbk0zWGZVcjJ1QjBoMi93?=
 =?utf-8?B?emU4TFJPUlVINklkU1k2NU5kRUxmVkR1aExPa1UxczZJK1VBd1BQRnlZWk9r?=
 =?utf-8?B?T1JKdExMdWJGUzhIMUx0OHRGN1czdytqVUt6NkFiTjU3NDZrbEovZ3pYU204?=
 =?utf-8?B?Qlg4Y2NFRGhBazVBOWQ5ZzlPQmorVG5PSWJJUTZBMHVXTXczT3p2QTloWHpl?=
 =?utf-8?B?MjZlL001R2xDTnhaYmk0OGNMb09nVzRkeGd6a2VUUWVOU295SUhWZXhSTVlw?=
 =?utf-8?Q?qgz6KsuQ9rjAl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 16:19:12.0153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b04323a2-17a1-4931-9157-08dce87e1c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7957
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


On 10/4/24 11:23, Jeffrey Hugo wrote:
> On 9/11/2024 12:06 PM, Lizhi Hou wrote:
>> diff --git a/drivers/accel/amdxdna/aie2_error.c 
>> b/drivers/accel/amdxdna/aie2_error.c
>> index 3b8223420f5b..9dc44ecf2adb 100644
>> --- a/drivers/accel/amdxdna/aie2_error.c
>> +++ b/drivers/accel/amdxdna/aie2_error.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>>    */
>>   +#include <drm/amdxdna_accel.h>
>>   #include <drm/drm_cache.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_print.h>
>
> Feels like this should be in the previous patch.

I will fix this.


Thanks,

Lizhi

