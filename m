Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B4C1CCDF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BCF10E827;
	Wed, 29 Oct 2025 18:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HiOY3bU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315A10E831
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYa5UXtHV1znDUXMOlHbXoJqc48KfViev4/UDSQgUOHj51soB5ZLFQBV1dMETYMcLXcMMlCJFZfeF1Khm75qKyLhOJJuHNSzZn494kfHVXZ/SlbuHAx0mMBepmq8AfcGb4rEoZjllAop1BWXLkThE2uvaIUyAp6ZegjLfdssyoPjtZ4B/RY3U0IXbnVL+/xcrMM2lcHJeMBd4EVXQvNNIfcst/MoKhuTFg1znhyRlyL+ybt8Aekfq7rB3P0BWTmJEs6VzKzo9Ch14M2SI4Tfi+C6yVsYmc4pCTTmSdJWZVkR1lieAcPg137ykvpH7wAo+1O24K7yVFBir/px5XB1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW01VwgdVEF0VyMeS/hLpnPFBKJZSm9Cryi54hvmqbo=;
 b=hK8uhg3cRtNb37kJRHhRKErv4yFt4ha8flI2MufBOq97EU6ZpbyGiBMBYYs2M7TTMDI8gNxGHiQe6EB/6ECnoPAwmnM0LdTRKvpy37QEwQZkHMeJiYgniblduSnxr12f2isqYbzWYcl766SE8LHnDFHB7wmizQ9xhjUDtv3nCgSi3WbEYmbCqAal4TJiiFyQ+OOHw1YPvoLP1eca+AF457QzXswf+5dMwvA0Z+jEdSEqLkgmcrHzTbuPx0wmhCQd9WX86Dd1JZrqFBkVcMwyc/r4Kk9ppULey2BPFuITy6zBqvbfZihEVDaC/CCjNt9h1d/bOOw2dCKty2S5ZeAN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW01VwgdVEF0VyMeS/hLpnPFBKJZSm9Cryi54hvmqbo=;
 b=HiOY3bU8VcZxfjZGk5ydva5nRUGNpiRcC9wqvkslqRH5ryzg0Ba4GGAV3LwIxcIgnCs50YyMK8qXx4jBSGhcVvZBjzy9f0XrpmofRnCBoSMGnRhWEyBzMAKMLBSgps6fM1/OKljje74Dl/V8lYYfIF+O9uCXIQHIDe+iVb/xV3g=
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 18:38:53 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::a8) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 18:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 18:38:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 11:38:52 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 11:38:51 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 11:38:51 -0700
Message-ID: <e4c8b7be-588d-b0b7-00ca-e60cbde034a6@amd.com>
Date: Wed, 29 Oct 2025 11:38:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
 <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ac39b3-dfb0-4e4d-62cb-08de171a6978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGRySEV3d0tnSk5rR3pHY2xZN1BSSTh6ejZEdWEwdFd1NFd4dFFOSW9nelhN?=
 =?utf-8?B?UVNpNnh2Vk91RDM4VEU4aWdJdFRZNzVFK1JndnJ5T0t5Q0FkRG1reGhib08y?=
 =?utf-8?B?VTNMTy9SV2ROWk5uRDFOOTdwMndkZ2J0QzFNY2xUcHNuSFNGZVgwVlFHbkFx?=
 =?utf-8?B?UkhXeTZPUTIwWUM5N3h3YndmU0o0VUhYS1J0bGxUcll3dGFlVDRFZkpZcXFQ?=
 =?utf-8?B?R1NnYm1ITW1QZTU3d2VtcC9XNG9iaVhJMFE5MUFkekdtQlMxOW8wR2xvb0Zo?=
 =?utf-8?B?VGtTdnVLT2FhZy9WZHhQVEJ4c29Cc2xZNTl1am9DNjluQVkzYlhSN21lK0g4?=
 =?utf-8?B?RXNQcElyZTEvZVFNbXF3WE5abi9KdExLN3ZKME12SUViNkp2d3NjbDJEVThF?=
 =?utf-8?B?SGR0d1hKM29BbFNFTjBzdUpSU0IxbHhtdU5pemtnanUzRmtLcStGWlc4R01C?=
 =?utf-8?B?MWZlV3dKM1ZWK21uV3VQQUtsdDRuYnE0V0p6Q0VZaTRJOUpURFN0UEpiWHBI?=
 =?utf-8?B?WVo2R1VySFl1aXFmYlc1R2xvSk13Q3orcXZsN2VRSDMyZ0lkUVQyRi9nYm5Q?=
 =?utf-8?B?UWRnNURsbEJZS3padlBTb09SSDV3N2lhU3dkZVJaTlVvSnBIRVdZZ3hvWEp6?=
 =?utf-8?B?WFRNQjFMQWVBUUxFdGNuTTUvU3B1bENSdktuditVVG43TkJadFdYVWtHTGFX?=
 =?utf-8?B?RGx4bGxCQTFVU0ErT09nenpPSS84aUN1dG5pOFJNTXNybVp6YU9vVG5TMlRK?=
 =?utf-8?B?cU9nQitKWll4ampyaitpSXpWdDFRMy9lUVpWM0NFWVdDMHJIOUhZN1FrVHdh?=
 =?utf-8?B?a0NLNWMrSnlyNEE5anNubThFL0crL29tWE1hVGxzeU1ROGVmWUtLRGRwUEdj?=
 =?utf-8?B?NnJyKzB4Tm9SNXNvRXp6dGh4YzBJVTR1SytBZERwSi83aUNGb0RzaThjUkp3?=
 =?utf-8?B?Y2dLZFpXVDkwbEU1ZWJQZzZYR0xablRMRk1RZVdTaUE3YlZ1b1Q0SjBsWTE4?=
 =?utf-8?B?OGFxU0E5VTEzdkx4Ulk1cWFsMTdrUEdqTGxHQUVNUS82ZmtwU3ZoSVIyZWE4?=
 =?utf-8?B?MGlXMUl5STJUN0doNlJ3enMrTm0wMmtXdnJDakluRUI5TnNMallOejcwVFo1?=
 =?utf-8?B?Vnd0Nk5HL0t5T2FjR1hNeWJYMW1USGl6WWppMzdCZXZ0THFYNVlrVC9KdVUy?=
 =?utf-8?B?SDhmOVBMamx3b1Y2RU11ajF4RDFiQ2dOQTMrbmdPTGN4UTlYMis0ZDNEcnpH?=
 =?utf-8?B?VWhDem0wS3plZGtoekJGSXRSZFVqZEozcmplL3hqbEs1d1NqWVNPNmdnaTZp?=
 =?utf-8?B?RHV3R2o5TjU2WWtDQTZRT2QyaUVzeFpMQ0xWK1RhVGNhSmVSak5XaEdhbDV3?=
 =?utf-8?B?Vm5OMDhvdFFxKzFWNkxXWGxHcHFETW1PYTZnbGhGRFdkRk5XQmR5WG1xbHBK?=
 =?utf-8?B?dWhWU0FUVTVNMWZjbHlQK0pPNG5ZSkRRZVR0ejNOcTZOSnFsazB0T0dZdWFz?=
 =?utf-8?B?V0FCbDJUQWlydDlSazBWWTZvZGw4dkQzNGNDdTRaUjNqRXExSFByWEJwdmlx?=
 =?utf-8?B?ejI5cjE0MUR3K2JZdWI2R3NRdVMwQVhRM3A5OUQxVmNlekpjQXFYUTlmMkVF?=
 =?utf-8?B?ZkpaNzZMd0lBcG5sSm96cFRyMkE2QVFicnpOMno2YWdBUWU1d2R0WmtXNUhO?=
 =?utf-8?B?ZGN4WER4UEhucnVETGxuUG1EWDNOZ1RHS1dkVHFjRVFxa2RpVFRPS1Y0RzVi?=
 =?utf-8?B?YmU1V3lnSXdpUVVXc1R4dUR4MHdpblNoZmVTTUtmRDVXSEFCTHc4K0tXYzBW?=
 =?utf-8?B?QjJNYVA0S3U0Y1Mzd3JSZ1lsUC9KVExaK1RtTWRDZHhSYVdzNFBXOWM3VGxs?=
 =?utf-8?B?VDJxOE1hekFkL0UwNkJoK3FLZkZzdW1MNlJ1dmZqSTFBWnBjL0gwWEMrQVNO?=
 =?utf-8?B?MVdrMzRkUGtqOHB2dkxKdGtqSGRMTm9qemtZUXIwVkJhK0tHR1lNTzNJVTkw?=
 =?utf-8?B?SWRoZUZOaE1PcjZOcVYwVzZid29qRWJBbjdIMEhvcTZBeFZsRHpDOVhjaXEw?=
 =?utf-8?B?amtNc1ljaUFBWUpXaGVpcTZjL2dUY3ZWOXFLYWVTeElzdE8zdWoyaGd4ak1L?=
 =?utf-8?Q?hmIk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:38:53.8498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ac39b3-dfb0-4e4d-62cb-08de171a6978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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


On 10/29/25 00:53, Markus Elfring wrote:
>> What are the duplicate statements?
>>
>> Sorry that I am still a little confused.
>>
>>
>> The code change is to distinguish between the job which is  timed out and the job is aborted.
> Would you like to clarify the usage incidence for amdxdna_cmd_set_state() calls
> in combination with assignments to the variable “ret” (according to the implementation
> of the affected function “aie2_sched_resp_handler”)?
> https://elixir.bootlin.com/linux/v6.18-rc3/C/ident/amdxdna_cmd_set_state

Sure. amdxdna_cmd_set_state() updates the return code to command buffer. 
So application which issues the command will be able to get the return code.

The function return value "ret" is used by mailbox receiving kernel 
thread to deal with the error.


Thanks,

Lizhi

>
> Regards,
> Markus
