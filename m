Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77193B37108
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098F289C7F;
	Tue, 26 Aug 2025 17:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5S/VNh35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2589C7F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCNhYFDZMx/9Jc0oU9lZNL08VUA7v0/572fuWKqi8H+4ilo9VsPjuBXBL7fH4/FVmt63RcSI3utcKMA/lbDXEif7O3QynnTJdygfBleWP/Tj1sUPBiw5VhXd8jdTCvvM0Zzl0VNQgOe7drkVDb88HaqiW+gCqZmOCuhA5D3U90vVqZavXlN+tyz97NOfF+26559cwIOsi9rUWwfvhNU7FlPXA0s9XB3lePp2cSzByH4I0EsjL1hTsLirR/C3JirSmV5wyBNi6q3pDglgs3Q763NJexYCV0oztt/sn2+htfY/2wXmHY+t9Hx4K7vHP5H4BCQySWFA8liIKza9JSxu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/POmVxlKME2U8PuwT1bApSbrCeM7fhPqKDQTyclAEFY=;
 b=SGCw1LVN5f4Q5g8TDGXWzHAf5ER1OudQtnBRAzhxs8nT8Tduki5oJROBStc9AvS93iTxDOkYptc+zP+EtGqcNL6vaENO4iI6sheBebBHALc+m/AWuvAGBGSSU5syKbb8owiFpWbN0AnmWyXupU2D2Ce5Oor8UrFAAEEBMhHIqZ9JSN7Azh2sBiYCNWfWzK/FuuipItvciI/Yf7N/hjMxg1IrmYPn7yzmlL6QIjDMonoKVmKsTAJ71gQQNtslMsQORY06DCHdqal8luo9q3QPGcK66DbcGc1sxQKQebWga+k8/VObXDVlTvUcIN2+CXaDCkTUJzk4YwmmKsbfIf4M2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/POmVxlKME2U8PuwT1bApSbrCeM7fhPqKDQTyclAEFY=;
 b=5S/VNh35GvUI53r4oq0wrPiaWxhXgX4LnyMEZHN8ytezhvLtnuYaRNzZs+mCRV0DOvW1A7Ri8KWnotUjwUAolFRKaHm23KHVmeNDPJERh3c9difGWTJWsiOKNeuqZMP4aO6fEn7we+XJ0WyxvkRpLwe+LRcmvtEDK94zXuhoS1Y=
Received: from BN9PR03CA0104.namprd03.prod.outlook.com (2603:10b6:408:fd::19)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 17:15:18 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::5f) by BN9PR03CA0104.outlook.office365.com
 (2603:10b6:408:fd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 17:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 17:15:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 12:15:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 10:15:16 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 12:15:16 -0500
Message-ID: <5cf854fa-a871-20ae-8373-16874c1d941d@amd.com>
Date: Tue, 26 Aug 2025 10:15:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect type used for a local
 variable
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, kernel test robot <lkp@intel.com>
References: <20250826160321.795866-1-lizhi.hou@amd.com>
 <b2f4a70f-62ff-41c7-b0bd-ad8723f70ba0@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b2f4a70f-62ff-41c7-b0bd-ad8723f70ba0@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: d56dfc0c-16c0-42eb-8818-08dde4c42146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUQrV0YvVmhLMDNLWENlQ2FnSXNHUE9wOUtuU21qYzF5eGRYdEg5aVIzT3lU?=
 =?utf-8?B?QWM1NTM5Tll0REdBYUgvUEJxaTkzYWdMNnI0VzF0cXhVYSsyUzliNG1qb25X?=
 =?utf-8?B?RTZSN2lWbHE4TUVkTkVyRG4xT2VTdlF5U2xyUERuUXBLVERLaitrVDNVem1p?=
 =?utf-8?B?QlNvTlJ2d0ZxZGhCTWdxMVVTNzRWcTE3VDJRRUVLSjE3UDNGbk1HU3dnY2hD?=
 =?utf-8?B?NlAwMjJjV2FpYk94WGtsQXZ6TDhPVTloYy9Sa1FHazhDSFA1SzVFZGFQSWkz?=
 =?utf-8?B?VmFBbzlrYW52MXU1bGY3WTFlOFU4Y0NVbjA5NWdLMU9aOWdaRTBXOTdUV0Q0?=
 =?utf-8?B?QllVNGVQMHlzNnErcHlwa2RjNHNic2RweVVMVFF0akJRemhhZ29Maks0ZXRo?=
 =?utf-8?B?a1dXcWxkNFB2ckhyK09HZnVzMGtBb1R5eFkwWmxnaHRkQ3lZRk5ObkQwWWVh?=
 =?utf-8?B?TnJZZUxITVFheHhYSVIwYkVlUWRBTWhOUDNFTXJPMkd0SFpFQ0pOemczVWxk?=
 =?utf-8?B?d0szSnozRzRGV09mTmtJZWo5dGY3bkFvbzFFVzBRc0V4VTRCSjdydm9uTFVT?=
 =?utf-8?B?UUxhRE5rZjFQa2ZvUkVWOEhtckxnMGFzYisyWitOVDNOSWMzOU04R2lubDU1?=
 =?utf-8?B?enh0SWJhaVdrcUVnSDlqTnNoU2tWc2xwV0ltaUlybVRPVGtYRXgrcXBkWVd0?=
 =?utf-8?B?VkxIMXkxUElyMGdSMjcwTDY1NERid1g0cndZMjJTK25tTTZMZWJZdVBkejR2?=
 =?utf-8?B?TzZxdnB1WWZTSG1DU0hJY2hveWdxekNqOGxyUlV5cnBOTEpaelpzMzFGTXUw?=
 =?utf-8?B?WVVVbEVUclR4RjdjWForbzJRak1QbE4xaWl4RnlTNDRxN1RoQjU2TXZFWXMr?=
 =?utf-8?B?Y3FEaExBSGFVcjQ5VU5ZamR1eHd4VEdjY1MyTWczbGk0alhOV0pDOFBmd3p2?=
 =?utf-8?B?bG1ySVNwNi9HWHk1aXdDS05QRHdGYTc4aFVqNjlXWjEwOTZYMm9DbXdsQTdT?=
 =?utf-8?B?bVZvL1NZSGFvT3ZaTXMzdURDZkdZdzNMU291TzhQOG5OL3ZvZTVteDZjT0RM?=
 =?utf-8?B?V2dpd3YyTHhhdnVIeDFXQ0VsSGcrN1ZGSEJWRmlxc3JSdkFSUFlFM0Y1dkVr?=
 =?utf-8?B?blZxQXBpQlY4WW5SS2lzRVlHMmxWTGdEbWUzcVdrNldjaHgxaUlCNU51azUy?=
 =?utf-8?B?bnd3a2R3Tm9WcmREK3BHUDJCSEdvUHdzSkdjZDM1ZVdGZVNiek80cCtrbmZQ?=
 =?utf-8?B?ZHNFaGdWRkhMdXQzVGpsTjl1RFRGN0R4bHd2Skx0ZGE2bFpNTWdFTTNVVDBH?=
 =?utf-8?B?SjBCS1lPOWMrSWZFV3pST1dSNWkyZU1CQ2pQRS8xa1lhVHNyY1lpS2lsS0RP?=
 =?utf-8?B?ek9kLzdEd3RVQ1ZEcHJDS256am45alRKUUFqYkFjVUFGNzZTRFR0cVhyaUg2?=
 =?utf-8?B?bWFpRWlCaHk0ck9iZHNRdHpBRlI4UlozUlloQ2JlM1NVNmh1ZFl4KzArYzZm?=
 =?utf-8?B?T1RJL0NFSEVIWWpvaXEwVVg5Y3BGSktzQ3poSEpadXJFSmUvRkR3N1hhWVhF?=
 =?utf-8?B?NW9EQVh5dU43MjBBeVdQM21YRlVaZzVVTERVTHJCRHVoc0NvelRCNzVoT2wz?=
 =?utf-8?B?SDF4Qk9WZkJjWC84bnRYM3NZc2JxeFE1clZwK0dPYlpIaFNJUnRJNWpFME9P?=
 =?utf-8?B?eFE0T0tTRExRLzB6OE9YMVBoVmx2NWpqNitzcUtPVFJudFJnQTNmaFhsTHNY?=
 =?utf-8?B?d21kd2JZcWFKY0hZdk05Nlh0YVl2WTk4SDQwUU5Odnp3VkM3MWZ5bXJHcUZY?=
 =?utf-8?B?Q2dGMmhpdUdXZUdyRDc3R0Zodm9ESDNlL2d1QURpUnJjWnFqaGF0RVJEZnJa?=
 =?utf-8?B?M3lra0ZJNXVLWXowMnU4Rng0NFJVTFAydkhPRnR2U0Zic3pRVzVkUVkwN1pl?=
 =?utf-8?B?NWNpMGtxcWRQTExZS1pqL1FOVXZmcHROQk5kbENhMC9hOWJ3R0JkZVkzdUlm?=
 =?utf-8?B?aFFnYXFiY3pHVkt0OUJNZElPUEtzSndWMEYva3VQZi9jdnRxTzlXWm1kSVl4?=
 =?utf-8?B?QXgrc1lCOGx0cXJGS0U3YjRSbWdueHQwOWxuZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:15:17.9029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56dfc0c-16c0-42eb-8818-08dde4c42146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
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


On 8/26/25 09:50, Mario Limonciello wrote:
> On 8/26/2025 11:03 AM, Lizhi Hou wrote:
>> drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect 
>> type in assignment (different address spaces)
>>
>> Fixes: c8cea4371e5e ("accel/amdxdna: Add a function to walk hardware 
>> contexts")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 16ac0cab4f44..2885a3c17e89 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -785,7 +785,7 @@ static int aie2_get_clock_metadata(struct 
>> amdxdna_client *client,
>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void 
>> *arg)
>>   {
>> -    struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = 
>> NULL;
>> +    struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL, __user 
>> *buf;
>
> IMO it would be better to just split these into two separate 
> declarations so that we don't have to worry about nuance of order of 
> operations resolving the type.

Sure.


Thanks,

Lizhi

>
>>       struct amdxdna_drm_get_info *get_info_args = arg;
>>         if (get_info_args->buffer_size < sizeof(*tmp))
>
