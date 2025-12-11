Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D151CB6FD0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D7F10E148;
	Thu, 11 Dec 2025 19:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MtyKdMYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EA710E148
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVwXMz0YMI2KLoqcb/mldpsJjXyzIhacF1Xp98Qx6hN+um8EQsm1a4MKhK6iiyhb02gyzpnywuYhkKJwghDe8yP82mL7DFi2NDreAFIs+QQevs3HYheY/QwtBbCvT7HO6CHGjxFuXL4ay79NNVvRlos2MMdvInkdVyHr8mPrtxKtkkE5XB6nIxs/5uvqvBG/7+TRoBJj6yW5p/aInhtJb1KlcpbPl3nW+7acMb3EOvwLDd+t0988alw3pGGWvP25lyQcewXYtEECF6CEsk1k1AIa0oqcxodaLFjhbO2ETVy1XweOBHBcoZJBwJ4GiqOHR/CY7fuMz2/Jej5D0QCknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3bpEksMo7UkaxldXkbCkAV6uFc23dj9EkQ6gPpLmgI=;
 b=iYRKQBLEJo3kFuJlnOnVaC9vD/paJ7EK6U78zC12EetFcajg9gbT64WA49HZXNpo+AKhVNsSmFpqA2GU7l+DzanQDVJmQrwWPPXEmND5IRCcI80EFdaBy70wLN+oQDoikeeh/7RjFfWFCUHqUnyBrcS89CH2f7sgD64bobm14/fuCAQtQygY9VXVbyIs5nsc4Lck/Zz+r+0YI8BuTwmPI8b+AvMUUT3NhZiqeMAEaeDlP0x2f4RL5d3RNF1CaSr6WUsb7Q3QKjOh5sw/IbDcNUIN8/eMDo5woxfqBSpqO40sLqMAJQXh4Mqg2Dy5Bf7uwVKsuXTaHkIzZQvdkdoY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3bpEksMo7UkaxldXkbCkAV6uFc23dj9EkQ6gPpLmgI=;
 b=MtyKdMYAfQv/SyzhI+qREEOdfdCVigd6as3yYY//cS8GVrTFMPFu9Gcb2rBoHrGdhTI95OSZyGvauaEVnsUzkWZmW++dWP7+3J0QiLMq5CIN/qN1PA9/u+Ffo8oe+9JyNZmUJ7bbD+Sj9aGzMGNQFBQea66fpvLG0IK8hGIPR2o=
Received: from BYAPR06CA0022.namprd06.prod.outlook.com (2603:10b6:a03:d4::35)
 by MN0PR12MB6127.namprd12.prod.outlook.com (2603:10b6:208:3c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 19:16:31 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::73) by BYAPR06CA0022.outlook.office365.com
 (2603:10b6:a03:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 19:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 19:16:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 13:16:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 11:16:25 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 11:16:24 -0800
Message-ID: <1b4e61c5-bf4b-4044-0dbf-bb16a331d8bc@amd.com>
Date: Thu, 11 Dec 2025 11:16:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 0/2] Get real time power input via AMD PMF
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <Shyam-sundar.S-k@amd.com>,
 <VinitKumar.Shukla@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <a77c3b39-49e2-481f-af53-70b5fbe58ffd@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a77c3b39-49e2-481f-af53-70b5fbe58ffd@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|MN0PR12MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1c075f-f2ff-4270-ac6a-08de38e9ca8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ris4RjYxY1BPWkhGQXQvajhuTXN6dy9LLzRZYnRHTnBGaStTKys3aHhackxv?=
 =?utf-8?B?TkJqMTlWTGRIZTJ0eVNlYmRXdHdaaVFSTVRzL25JOC9TV25vcEdpd2dxb0FR?=
 =?utf-8?B?T3ROUDh5K0N0bld5RHRSZjRTa0NIT1hhMFU5NmlOUWVIYmdrYTJ6UlFwM1dD?=
 =?utf-8?B?MnZlODFRYXNpQ0hvcVh6dHkyUG96b2QvQUJNODdjRTRKTkhlS2NrZE1rTjVV?=
 =?utf-8?B?MEFId1RjQkVWeUlkNUxkMVlmTzJEM1d0UVc0dVo2UmgyQlJCTHBWRVlVMSt1?=
 =?utf-8?B?d1NCUlkyWmdxMThneHZQSC9UL2VIcjhJb3ZxbENyVndpUlNzYTNVZFp4U1dI?=
 =?utf-8?B?UHZuVEU5ZTN5dzBhZUQwSW9UN2wxaUt5WTFsd1VOQ1hMYVVocTFlNTJGcVVC?=
 =?utf-8?B?ZVBRZ1RSTGdmSUFvODg5OHozMTE2L2tpZTBUZG9mdVlIc2ErMUNqVWszTWRL?=
 =?utf-8?B?SzliWVh2Q0xMSTNENS9oSTBLNGlWYzVkQ0NqeE95eTZKN2FOUlE2V0laeXZT?=
 =?utf-8?B?bU54dXpuQjR1eHlGL215RlFuOUVMOHkrVytsb1p1S1RXNGpySkxZOFBtaVVQ?=
 =?utf-8?B?YW5xS2VYeEJVcTVVM2N1SzZFU3VMaUlnUWUxeUtTVkd1WldIV1FnYlNvSTNB?=
 =?utf-8?B?MmFSc1pKY0xUT3VRb0t0bUdWb2ZwcGRtc2p1OTN3WEJ0Mk1ucDF0Y0d6VUtJ?=
 =?utf-8?B?N1FXZThxa1lZa3BiMno4Yk9JNkhscTVlQlMya044dkNxbUNWSW9uNHc2Q2kr?=
 =?utf-8?B?M3lCZGk4T1RITzZ0Vi9rMzJaR09BdEM2RXpPNWQxYUthSDhDZ3NqNnpLdjBO?=
 =?utf-8?B?Q1NPcW9pRkJqQ3hPejAyRU52NE4vL0JPQkg4WGJPcnJyNFdYNHhoZDFnM3Av?=
 =?utf-8?B?MXp2TG5jVGlZc2FyUWw0aytaSHA0c1htemc1NEFMbDFiU0xBbzBMV0lJTHZL?=
 =?utf-8?B?WGpXQ2U1RWNtVnBIbGl5cnBYb0VXNjRmOTYvaU8vTDNESk90VjU1T1E4c3NY?=
 =?utf-8?B?MjVMNkl0Tmt4OHdSTTIwbHVzTjRNNmZaQ2VTV0dsdGVBUCtLd0ZGTnBwRDNo?=
 =?utf-8?B?VmZTS2FvMGFqaFoyRUVKZW56Yk9leDZNemRLdzA2dXZhOXhWVXZEbTQwdmJp?=
 =?utf-8?B?RmlsTi8wNi9LenQzOGN2bXhMUTRvcWV3aHdMMDdmWjkvRk5razVnZWdIZWVW?=
 =?utf-8?B?QWNOaWNZYWdrTHdvYzhrL3BXU3A1Ung0eU1vamVmMTR1NWJmSEgycGp2YTN5?=
 =?utf-8?B?WE9Xb0ZMb1Q0RHVKWXFJZlZkdVU5dkEyYnpNYVlORmRwQ2tQV2VoY21Nc1oy?=
 =?utf-8?B?Z3dhTEtpWm52dXpnNGtqbUtJZ2tNLytQdWtuaDVVQnY0NFVMTk1DaWYvb0Fp?=
 =?utf-8?B?a2lPYWY5dWgzWUdhdEtLRkVMNWp6YVRRZEMrVzBWRWZ0U3A5RHMrNjJxNm1F?=
 =?utf-8?B?dUhmSHFQNjl3ejVrenFBVjlNZkxhc2RWMDU1d0ZKVU81WHRFYkl3SjVIdTRE?=
 =?utf-8?B?N002dHJKTmJxb1Y0V213dkFiOEpjS1lHRFVHbUc2ektZcHN4R1FDL2RESE9l?=
 =?utf-8?B?bWdnNGkxcDFMYjh0UEpBWHE2QTNSVzBxaFdhckZPRVljbU1rUnFhSjU5N0JJ?=
 =?utf-8?B?TGJwM3VSU2ZaU25RV3lQWmZhVGU0cmI5OE56OUQycHFwd0NNK04vZTFlSncy?=
 =?utf-8?B?cWtOdnpIS2xVMmhIQkI4ZTU0VTZXSWVHWnM2ZW9oeUNoL1ZWR3VUL1l5RG9B?=
 =?utf-8?B?YXFtQ3hpWWU0azI3cEsxc1ZBY2JyRFcyQTZKcE9PYVQzMmpBVWRwQS9pS2dG?=
 =?utf-8?B?OHVoWS9ZVmV3RGVvTGp4bHhwd1BRSWdyb0czdXNNdWFzUEQzNHIvWmpwZjJu?=
 =?utf-8?B?MWdUZWFwVEdZNm5lWVZhbFA3bDU1V0M5aEZJR3hCRmxBcXl1YklwVDVRbjBI?=
 =?utf-8?B?TnBEVFk0WUNsZmF5RHJXSVQvZUlHcGJwZ0lPTlhWN2pMZmpUak9lbjZZS2F1?=
 =?utf-8?B?Mld2WFBLY3c3RDRXdDNxZjNNREtsWEg0SzIzNy95S0o2SC9Sc2I0TVYzVVZs?=
 =?utf-8?B?WVdDWWV1NFZDLzU0R3BxZHFsczVrOW9MVVdPWTIrNWRLLzdVZ3UzYm1tTm1E?=
 =?utf-8?Q?R6lE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:16:30.8664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1c075f-f2ff-4270-ac6a-08de38e9ca8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6127
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


On 12/11/25 10:22, Mario Limonciello wrote:
> On 12/11/25 11:58 AM, Lizhi Hou wrote:
>> Adding new NPU metrics API to AMD PMF driver is pending because of
>> lacking real case.
>> https://lore.kernel.org/all/d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com/
>>
>> Create xdna driver patch to fetch real time power input via PMF API.
>> Here is an example output with xrt-smi(1) tool.
>>
>> # xrt-smi examine -r all | grep Power
>>    Power Mode             : Default
>> Estimated Power          : 0.563 Watts
>>
>> Lizhi Hou (1):
>>    accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate
>>
>> Shyam Sundar S K (1):
>>    platform/x86/amd/pmf: Introduce new interface to export NPU metrics
>>
>>   drivers/accel/amdxdna/aie2_pci.c        | 29 ++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h        | 18 ++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>>   drivers/platform/x86/amd/pmf/core.c     | 75 +++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 +
>>   include/linux/amd-pmf-io.h              | 21 +++++++
>>   6 files changed, 147 insertions(+), 1 deletion(-)
>>
>
> Do you have a preference on how this gets merged ? Should it go 
> through drm-next or platform-x86-next?
>
> I suppose whoever is going to have more development layering on top 
> the next cycle it would be preferable to put in that tree.

I do not have preference. :) And this depends on Shyam's previous patch 
which is not in drm-next yet?

Thanks,

Lizhi

