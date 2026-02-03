Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KICeLKYvgmlFQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:25:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3BDCC1E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE10610E172;
	Tue,  3 Feb 2026 17:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ChnQ18dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84110E172
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcIFYYbgbTWlxLFS9ftMk+5Ir9ncIDQ1dMJSzV4ZA/XT9EcLHpTpzimVM4+GDTUGaHw7SABhJeiEdBU+ulsa8olRHaZ0UAuMIJrKKWgQXQMBNZPvtv8F0KTXQezMHF/yM5U/YUZ98RCBgUAYrk8REj9+wouzm9yE+u28DujUbrDTJN0QY32lDfyPA0Dni1FYGipTtRC/et9a7qNp1eRL7OuvfeyYdPDIJAmQQTrYPOoOf8MYDMxvG+xsWfCcGxOq+qjWRDr6CU0/FPmkEMCjsT/gCVM4iQd8hPI2fVKwW23oli5wZ1zo4I5bnQVCM4uZai+D9HJbD6r/IhGZ3YA1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5zO0cvDrx8BW1RH4gvwWYXa23085yVGpnf/pUmXvXk=;
 b=Vjfv0xNNAWGiSryvKK+UIcAfGJRo2hXCDUO99QVH9XuvQ3JRZTeCw29pSAxnsxGrtlK+udd3jHPIBKOmNd4qHT6+jdLCequR2yOvN+idcCer2qDetLCr5h/0C8T4VPLnZH+ZGzhoUWsK+jPOODPcAUZsp9j6LdIf+NCwhlSDyu0KLlKMx3VCkNWCLAtLgOD4xqgeq+YvXK0OEDQPKyAFfm3X0eXYw4Z3L9H0C/AYuGYxOyQeg70ENlcFG4lXeB8UygWc0KoAwp/xJSXuSfe5vKWmAgvcf5JBmBhSHbyPjwEjT1veyV/M5UoC8yija/nLrOmcTGR47Io6Didn5De2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5zO0cvDrx8BW1RH4gvwWYXa23085yVGpnf/pUmXvXk=;
 b=ChnQ18ddAxC7ZROs8V5PsZ+2xNbrAX+MPyxq64RuBW9/JGPYYr2gSxH3vHwex0v7iRARU8/3LM4a+sNPv94ZJw8YY8tDNrya1vZZlld+nc7yMvUZ3UtcuUQhLXeC6NFV7bSQpwyOU8mU5MCjy6B1C93k9VIg5JQTF2rK6KVznnI=
Received: from BY3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:254::11)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:25:48 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::b9) by BY3PR05CA0006.outlook.office365.com
 (2603:10b6:a03:254::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 17:25:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 17:25:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 11:25:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 09:25:46 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 11:25:46 -0600
Message-ID: <fae549e2-e581-b7f8-b67c-b7bc52cf13bf@amd.com>
Date: Tue, 3 Feb 2026 09:25:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Remove hardware context status
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260202212450.2681273-1-lizhi.hou@amd.com>
 <f7f9aa14-6fdb-4470-be51-edac7b54cf4f@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <f7f9aa14-6fdb-4470-be51-edac7b54cf4f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ad8a64-5404-4f3f-26f9-08de6349454b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTI1Q2F2NnVDQWJNR1NKS0VtTzJWWlh5N0FMSFRsRFZRZS9jcnlhMGhaQ1ZC?=
 =?utf-8?B?ZlVzMlc3VXlSaDVVRlBidWEyZ3hRWk01S090ZngwTGUvNG9MK1lCVWx2UnVy?=
 =?utf-8?B?alRhVTRKTXlOWU9FU1VBb2pINWpnRjRmb1h5Q2FuK1ZxNUhDS1FOZHcyK3c0?=
 =?utf-8?B?aEo0WG1yUHhQdGNwekpwNjNKeE9aT1RrRjZ5QWhnVW1aQWtXWXN3ajNyY3ZE?=
 =?utf-8?B?VVMrREVSK25MdWQ3QnNSUmcrc3pKc2JnTFNXU0xVWGRLYlZpL21lWHdXRUNM?=
 =?utf-8?B?VTZLTExKUzY3UmZvWW8yOTBUbm1hdUhBSStpQWE4eVdMV3l6VEp6aWtkVVd2?=
 =?utf-8?B?MW5lNEF4bEVJTHN5R2ttWnkzZlB1b053YXFSYUFxelpzd08xY09xUkhJTjVw?=
 =?utf-8?B?Sy9BdVUraVlZZkZTQXgvb2tTYUdPUXkrTGM5WHlML2FDVGdSWmVscGN6ZjJx?=
 =?utf-8?B?NnVFMER0SXVRZ1F5MTh5Z0J0c0JLRWtxdDd4MTg4S2NmL1NoL3Y1c1d2T1JP?=
 =?utf-8?B?ZmhpeTNGaitRVG1RQXZ5QmdXZkVUMmZLMlNsUTZ0aGJqdWdMaytXV0krZlN2?=
 =?utf-8?B?STVHWVNVUEE1c1hRT24ySGphM2tNMnNYTkFOYlpQb25ZejFHUFpQRjYwaEF3?=
 =?utf-8?B?NVNlZFpUcnUvUW5vVFgyVXp5V3dTblFkNnpKdllNZXkrSEJIR0VicElLelR6?=
 =?utf-8?B?VXhmcXppUHBVTjJSZkVMYVM1K0FOaFVoa0ZhaS84cW53QXUyd1NPZStsdEd5?=
 =?utf-8?B?a0Q2Q2tLSlp4VEtMckJFUWN5aVo5TjVPN3VtQ2lQMDRUa2Fmek5vMnc3eFdE?=
 =?utf-8?B?UUJMZEI0WmNJQTZSeE9aNXNaM3NyZ3dLRml0cGlqZk9QcFY5ZEI2QmFHV2FE?=
 =?utf-8?B?d2Mvd3FwY1dYdEd2RnFXbWl1R0hkd3A5T0lyRzRHSGJ0WCtFMGpDV0QrRlNt?=
 =?utf-8?B?ZTZhWVBGVTRQVktQcUd5ckdKeVBSRy8vczJRRm50USsvdmh4WGZYMHJJNWxQ?=
 =?utf-8?B?Q250ell4MnZTazRSZ1hoSEsyQVlkd1RDOW51MVdiZFV0RmlpVUtsMXRaNDJq?=
 =?utf-8?B?K0FMYnd4UStrdHFtVnBsUXNHdmZVNkdkMlhYUVh5MDlXSUpmNW9RQnNPamx2?=
 =?utf-8?B?SXBrUkVGdUJSM0ZkV3hISnp2anQ0VUJQTEN0SmY4SEpDbHlvZTlRRkF3cmRm?=
 =?utf-8?B?NVJlYmdHWXMvYUFobDFDVE1TYzdvQUoydjNrMFYyeUdsVFMxMSs5NmN1T0I3?=
 =?utf-8?B?SHY5V1ZkSlphbUw5MUdPVEVWa3VOUThoN2lpRktuR0xHdDFFUDBtUTV6cTZu?=
 =?utf-8?B?WXRDNk8zNFRTVGhYNVlpSGV3WlpVVFdBeHZTd29Ubkl6eXplUlArVVdFWVlE?=
 =?utf-8?B?ZXY0Sy9zYXU0RllYQWRXOGtDNW01cyt2TW94am1HTWx0WjNEYyswOVBOT1VL?=
 =?utf-8?B?emxzQVFjZnNrRWlDZW5iVnBYY0FPNmtrbmFyUFVzREN2Q2hBV2VuT0o5eFFU?=
 =?utf-8?B?UkRDcGFRNllnRkRGZGhxTVhxaHN0WlYzRk1aaTRvenRTUis2a0pGdWI5UTRa?=
 =?utf-8?B?cFpONDJyK1A5WFhKZ2d1WHh0N0I1d1RxTUs1dndUZUdSbzJROFJDOUsrNzdK?=
 =?utf-8?B?cXNvUjR2MnVDdGc5V2VFa3o3WVpqUncwQzIyNUhPb0dyaVAwazBxSm9QTG1T?=
 =?utf-8?B?Y3dLK21uRXJERVgwRUh2bjl2Mm94Y2pOZkNuRTkwNUNTK0VhTm00N3RDZkMz?=
 =?utf-8?B?aTRYOGE5YXhJYmU4MU9CeG1kZlFGQWlLYnZJMXlQcnkxT2Z4VlBMWnBtZ3hp?=
 =?utf-8?B?T29jZlRWaTB6bS9WNHdlcXd4cDNJU3Nrd1hNZ01odXkzTHNIai9od3ZYcmcv?=
 =?utf-8?B?aE5DNDNDWVdhcExrYVg3VHJxRERuUXZuTW1UYnlOWktpeGZWTTVmOHZ2aHVN?=
 =?utf-8?B?YWF6eTdhdXRZZE0rUGFOTmpFbGZWRXl5MHI3SUZqZUEvc1BsSzVsT0ljNkQr?=
 =?utf-8?B?VTlFNnRaUDBRS04wTnVINVplbnVsWk5TVXo4a0F0QjgrNCt6ME5jSWVpU2tJ?=
 =?utf-8?B?Vzg3YW9QTXNPcEk4VXRzUFRJM29lYlRydmNpemJ3T3o2d3k1bmJKVlFqaEI0?=
 =?utf-8?B?dnVhMDBqTmc4S0VNQjJjVFpRdUJuUW9PTnpybGp4SnppU3FRWDZpeHI3QzBP?=
 =?utf-8?B?QktNWFJqNTZzK1pzYldQQm5CRGtqQmg0bEoweEFaaWFKRWt0SkU3eTE5amJ6?=
 =?utf-8?B?MVMzem5zWWNQVVg3ZnhLNUZ2Mm1nPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0qvbeKHK7F11XQuc0gHdw4ULZuX4/tKG1wJPbSHI+MsUeMN46g5YAPcJrSaWVf9qZewTYZlziIX+5d3kYbUYiwDtz5mdap8kHMqKV6WtUv9zyN3R+BkETzqTpjp30T/bpG1DZcO5tFxjV5k51eJYufOOfKGhHMrQvB12G2mmsjmBN63zIsMoGUytUuCfF6e44lAqrFHtNHlgAfYv57OpjdLdoM7r2AMR+9mP0YBkHTFZs4DZOmwJurOQ2WptMbIX/vCZmmj/r4xY3Njsp3Em+gLQgr/2FXP7TejRC6qvy2g0sCGhU7MFtCHAoIjv0AGRKl95tFvR3DOEDfBMPut1lC1IJltP5yaLqqPZX0WMyeCXjPRVmmqeAV42Bckr4VqMLAMVF9dz63x5K0xkM6iKeZrz3fC1Nc7yHyeYhCw5RSV7iNUG2+BfEvutFG6iCvcu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:25:47.8416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ad8a64-5404-4f3f-26f9-08de6349454b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 05E3BDCC1E
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes

On 2/3/26 06:04, Mario Limonciello wrote:
> On 2/2/26 3:24 PM, Lizhi Hou wrote:
>> One newly supported command does not require hardware context 
>> configuration
>> to be performed upfront. As a result, checking hardware context status
>> causes this command to fail incorrectly.
>>
>> Remove hardware context status handling entirely. For other commands,
>> if userspace submits a request without configuring the hardware context
>> first, the firmware will report an error or time out as appropriate.
>>
>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c     | 25 ++-----------------------
>>   drivers/accel/amdxdna/aie2_message.c |  3 +++
>>   drivers/accel/amdxdna/amdxdna_ctx.h  |  5 -----
>>   3 files changed, 5 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 208ac5b0579e..db0658fa03b9 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -56,17 +56,6 @@ static void aie2_job_put(struct amdxdna_sched_job 
>> *job)
>>       kref_put(&job->refcnt, aie2_job_release);
>>   }
>>   -static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
>> -{
>> -     hwctx->old_status = hwctx->status;
>> -     hwctx->status = HWCTX_STAT_STOP;
>> -}
>> -
>> -static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
>> -{
>> -    hwctx->status = hwctx->old_status;
>> -}
>> -
>>   /* The bad_job is used in aie2_sched_job_timedout, otherwise, set 
>> it to NULL */
>>   static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct 
>> amdxdna_hwctx *hwctx,
>>                   struct drm_sched_job *bad_job)
>> @@ -93,11 +82,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev 
>> *xdna, struct amdxdna_hwctx *hw
>>           goto out;
>>       }
>>   -    if (hwctx->status != HWCTX_STAT_READY) {
>> -        XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
>> -        goto out;
>> -    }
>> -
>>       ret = aie2_config_cu(hwctx, NULL);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
>> @@ -149,7 +133,6 @@ static int aie2_hwctx_suspend_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>         aie2_hwctx_wait_for_idle(hwctx);
>>       aie2_hwctx_stop(xdna, hwctx, NULL);
>> -    aie2_hwctx_status_shift_stop(hwctx);
>>         return 0;
>>   }
>> @@ -171,7 +154,6 @@ static int aie2_hwctx_resume_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>   {
>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>   -    aie2_hwctx_status_restore(hwctx);
>>       return aie2_hwctx_restart(xdna, hwctx);
>>   }
>>   @@ -334,7 +316,7 @@ aie2_sched_job_run(struct drm_sched_job 
>> *sched_job)
>>       struct dma_fence *fence;
>>       int ret;
>>   -    if (hwctx->status != HWCTX_STAT_READY)
>> +    if (!hwctx->priv->mbox_chann)
>>           return NULL;
>>         if (!mmget_not_zero(job->mm))
>> @@ -716,7 +698,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>       }
>>       amdxdna_pm_suspend_put(xdna);
>>   -    hwctx->status = HWCTX_STAT_INIT;
>>       init_waitqueue_head(&priv->job_free_wq);
>>         XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
>> @@ -760,7 +741,6 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>>       /* Request fw to destroy hwctx and cancel the rest pending 
>> requests */
>>       drm_sched_stop(&hwctx->priv->sched, NULL);
>>       aie2_release_resource(hwctx);
>> -    hwctx->status = HWCTX_STAT_STOP;
>>       drm_sched_start(&hwctx->priv->sched, 0);
>>         mutex_unlock(&xdna->dev_lock);
>> @@ -805,7 +785,7 @@ static int aie2_hwctx_cu_config(struct 
>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>       if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
>>           return -EINVAL;
>>   -    if (hwctx->status != HWCTX_STAT_INIT) {
>> +    if (hwctx->cus) {
>>           XDNA_ERR(xdna, "Not support re-config CU");
>>           return -EINVAL;
>>       }
>> @@ -836,7 +816,6 @@ static int aie2_hwctx_cu_config(struct 
>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>       }
>>         wmb(); /* To avoid locking in command submit when check 
>> status */
>> -    hwctx->status = HWCTX_STAT_READY;
>>         return 0;
>>   diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 578eaa7bf137..53e13858077b 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -493,6 +493,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>>       if (!chann)
>>           return -ENODEV;
>>   +    if (!hwctx->cus)
>> +        return 0;
>> +
>>       if (hwctx->cus->num_cus > MAX_NUM_CUS) {
>>           XDNA_DBG(xdna, "Exceed maximum CU %d", MAX_NUM_CUS);
>>           return -EINVAL;
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index 4f641926a272..e90204edfb7d 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -107,11 +107,6 @@ struct amdxdna_hwctx {
>>       u32                start_col;
>>       u32                num_col;
>>       u32                num_unused_col;
>> -#define HWCTX_STAT_INIT  0
>> -#define HWCTX_STAT_READY 1
>> -#define HWCTX_STAT_STOP  2
>> -    u32                status;
>> -    u32                old_status;
>>         struct amdxdna_qos_info             qos;
>>       struct amdxdna_hwctx_param_config_cu *cus;
>
