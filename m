Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2CCC943D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D0310E90C;
	Wed, 17 Dec 2025 18:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="06bT7+3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5619810E2C9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIUs3Bo1iOmXMkfWxxHk0NggyH6OPJWmUVHk+WedsyGZV7AOPam1UuZFMCn2seIOCzNfR+4EcRogU6w6kkUFEArnVi2GIruSVjN1zpqB+ZnGYiPs7Q8+evYBXIPvAb2CqiH6iIIngJNxx5EAgVpjet88E3cRFV3E0ES8MEraX+YNolMk739vTeipcUzrsia66kCvSmmPYhS48ACM5KhF+tWJkJoaZ19VLC2lfg1X4H8kCGO46JvNp9wuGCLTHpQfN17Bka8usILgtimPFTg2mWY8PoSf/Axh+P/XXbK0NDgDmS6HZYrQxg6J0bzSzJBUYeBLQml0g90X56fy2OkCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Os91+IRnqBd2MEzZqXCYPHmm4S9Y5ZEFcEbIDvoEP0=;
 b=Df1QGEgmjLRtcMCCTQ9v9t8UCXBfJch2xbNyqzpulkv5Xoq4Wey1Lo1q6VZE3AmzlFP4uckkudHO3TCKzE/vyuJ3kMgHC/iWV/aGC6RpF1drxuud6OdLUM7AcdLS7aQmqFr4UlgLUEoO9wGzt29IeqVAONOj/kktSSZeHsEHTuz32cUMc0CGeEvsLVhQqYLSK4j+AcuGrtDnTzjbZPqgep3tfCGThRSfRuLuaZCH0R1u8sV2soznpdVPSV/7Y5zD17h+cBG/DUgBVbWDvxDjVaDAAKnIkICC4PywXlRpYHOq2zDr3huNSraYhJmZtXVb2l3E79PDb2fu/lwew+NHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Os91+IRnqBd2MEzZqXCYPHmm4S9Y5ZEFcEbIDvoEP0=;
 b=06bT7+3i70ggBm6c5bz+qnXSXSEoHvhWL2M2VY520n4g28K7mSFX+ZlXgwoSJbd6n7qRUMAKncGskSzYuAcOSYQugRlB69/k0DsvfYHR/WPID3ets+6cQTdBL2U1S/YaErH9/wLFzOrSo+AXDPKApitrDHXdk7HrqVvJsiXtDac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:20:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 18:20:06 +0000
Message-ID: <142f0f8e-d992-4e9a-ba98-ac4b5436fe7d@amd.com>
Date: Wed, 17 Dec 2025 12:20:03 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Enable temporal sharing only mode
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251217171701.2138980-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251217171701.2138980-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:806:126::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dd2e61-c720-4dd2-7593-08de3d98e7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGN0Qkdlc082ZDR6TUk3K2MvREI1VzVjbVdsOXY4dmFNZi9Wd0ZFZ2NpYk1F?=
 =?utf-8?B?QXpYRUtkRXRxUmJ2K0M2RUV6ZzU3TG56MlFEa3VxMEpTd002aXFwL3l3c0tk?=
 =?utf-8?B?b1dUbERaWkRtTXlsTXZjZWVNTWM1ZXl2OXkreVRpVlRhMXZEREtSMzJGYjhS?=
 =?utf-8?B?ZzIyaWZkZE1Ra0VPa2p1QmhDY3F0d0M4RWxma29VRXBkME90UkZaNUpxd29X?=
 =?utf-8?B?UHZpVnFmeTB2WjlCdW5IQW1VNnVNZ3FHcnF6VDdya0NwN2xCSFlsOUZtUThs?=
 =?utf-8?B?S1dadTNDUzBNNlRleGM1RVVnM3ptZzhsWHZzaE00SzZMamlCU2VqaWpwZmZF?=
 =?utf-8?B?YzBCTW9TQVVudmVNVTN0amZaQUFwN3VZRjlSN0lPdlcyMURUR0pPYXhQNVRa?=
 =?utf-8?B?SmYva3FNSjlTSDJNNWFkVk9SMk80V1NyOCt6L1VlL1d2VWVCUGVwMlQ3UlZp?=
 =?utf-8?B?NjlhS09yR1pLbWxzc0pSNDNQKzc1dXdaNlZCUndMZ2drUmtNVXU3TU0wMnhH?=
 =?utf-8?B?bS93akM3TExZM2xYMno0RHc4U0xqc0prWlVRT0RUT251SXozWklXRVlJUEh3?=
 =?utf-8?B?U0psOFR0bDRwci9hNDNTdE1DSlRNNE11SzdIdWJkZ0hjL2FKaE9Mak0xS2lk?=
 =?utf-8?B?dnR0aTVWNmk3UitJUU9wdHNLWXlRelpGakdqVDN0MHBSU01jSkNpVHJqam1q?=
 =?utf-8?B?NUIwdTAvcThFUG5JSW4rTWFkRmFXN0pac2pmYWN4UXNiR2xhSEk3ZkxGTG1a?=
 =?utf-8?B?SmFTZDFvTVJ3N1EzWjJtYVVaZ2FrY0I5TU95TlZRRTh4MG0xa09GR2tjSG8z?=
 =?utf-8?B?RFY3TGNIVElYS3JWUnZnc2Y4cy9nWEUwc01TTWRKM3pzSjE2WXZ5OWRnWk1D?=
 =?utf-8?B?WWozRmpYMm4xa2pDWmUwaVNwcVhJT2grWlo5LzdZejlGNHo4cHBINGVicTJG?=
 =?utf-8?B?anlWeTBjR2cvdEZvVGUzTS9jUVJXMDA2dEhSYXdnblp5dWwzQW8yZHpmbnJT?=
 =?utf-8?B?QnFuaEdROE9Gek9uTGFHdUNuOHdPRDRPcm1zZlFrWnc3NUJaR1JBbDFuZEp5?=
 =?utf-8?B?MURQWTFVZEFucHVNWU8vRDFvUVlIVG42aElOTTRVQVZVeGNHZHBVbmZxYVg1?=
 =?utf-8?B?amdtSUxEM2h4amxnMFhVN2ZaMHNXTFFGSUdKcjFWVFEzZjVQRkdOV0VRZU0y?=
 =?utf-8?B?K2t4bU8xejJxbklLVGdobG9pVmprT1hvem1uVXVwYUVTTEUvaHBMcCtEQU8y?=
 =?utf-8?B?R0Fvb2xNQ0M2SjY4UEVUdUZuMlc0VEZ2OGxuTGNhVjFOZWwyTTQ4M2pKczRG?=
 =?utf-8?B?U09sOG12ci9qRnpCTmlHcEhtaXpZWEUxc3JGMVBEdzFFajBaM1pVbUNLdWVH?=
 =?utf-8?B?RU4rQVRObDFVWDNjWDVGY29IVE9IZ1VVOWx5em9CdHlxTlQ0OGg1TW5TMGph?=
 =?utf-8?B?LytETGZsaTBDSVVVNEM0Wm5qaG0vRVlPY1E0ejU4TUh3TktDVm5YVmJES0xv?=
 =?utf-8?B?MmhTMDUxZk1JREpqQmpOenY4NS9LcjF6S2dvSFMyUzRBU0pPUWU1ekdRQTRT?=
 =?utf-8?B?eUVZS3M2eHN3OHZCQTM2STdzM0J6NXl5cmEvbXJsTThkdmN1dmc4ajRPVnUz?=
 =?utf-8?B?VXZSSHordWk3ZjY5U0VXazB2S3ZrMUdLYkRVVUszNUpEMzkvQ1h0M25TczN4?=
 =?utf-8?B?MFVtamk5dmxCT1hjNzFGbk05TGlCVnJ5T2lCR01Wa0xDV1E0ZlgwUEwzbE9x?=
 =?utf-8?B?RXlwWnVmQ0R0ZHhlWFYvRzdXaGx3VkF5VnAyQlpPd1RXM0ZwcTV6a2lTYVlw?=
 =?utf-8?B?VXRoV09BU3dLSW5aVUhkdE0rMndzNys5dURqRm90SkZmbmd3QnY2ZURiM2JR?=
 =?utf-8?B?TlpDdVpNd3VuaktPNE41cGhJUTh6YitVaFlJWmgyd1Qzd0p3ZXc0N0RhQS82?=
 =?utf-8?Q?c05Ab8O/9j2J/Shma29Zngc68a+srkyf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEdoQkxwY2Nuak9TdG5CdWsyeStZaXJHTXM4RzRFTGFhMWo4dEpzNUF6aUhK?=
 =?utf-8?B?SjV0UmNoYlZTSHM5TUJMMi9wdXl5MjRzYlczcmhGemUrTWQ4WXVyYVhHMWhx?=
 =?utf-8?B?Qm5GclVrcWdidTlDYnRlNnljN29GRVhuMng2QWJ5VmFqMGR2bmpNRkszK2dE?=
 =?utf-8?B?KzRJYVZVSERQQWlkRC9Ub2hPZHBGTG5meWtETkUzTnp0NVZEbkFlRHNBdXZz?=
 =?utf-8?B?NXB1QUN5bVdtZ1U5bE82TjNKdE5ydUFmSms5T0dyRG9rYTVLbHpyVHJBd2RF?=
 =?utf-8?B?aEtBejhKL0Y0ajFsZ090aXpIdi9Sald3eDVVTlQveE9aRWVCcWY0TFZLeTZU?=
 =?utf-8?B?bW13TUlHWTJUUExlVWVzcllCVlBCOE1wNWdSaVBDNVEvK24zeERCMkhTeFU0?=
 =?utf-8?B?N0dyVDNSQWRJaGRkYWw5aEF1bWRhSkVpUURNQTVQcE1CSTRIaXo2aUJod2R2?=
 =?utf-8?B?SWlQOFd5anppRmY0d1hZaXRCdlB5L3FwTHNVaU04Qnk3Ym5mMXgxUjU2KzRu?=
 =?utf-8?B?dGpHODEyN01DNEF6WE1lT1VJYzc1bXVzMGNzNkwyQ1VyeHJBWE9QMTJEcVN1?=
 =?utf-8?B?NEhBQU9FZjk5ajEwbUdDNjZKKzRZam1KTkFVVFlWYnlpYmM5Ujh6bEVmNXow?=
 =?utf-8?B?aWlOdTgyZGN3UmpkK0hUOXFPV0Q3OWFVcitrVmd2Z044V3lySVpjRlhHNTJh?=
 =?utf-8?B?dHU2dVZ6TU5QdTRCNTNhek1mWlNZdXhNb1BYY2ZHZGNVYTgxd011SGV2OEpV?=
 =?utf-8?B?REZxY2RMcUF0WEFrcUZUMkpjdlVCbXBNSFM2Tmw4SGdJL0R0MGVaSVB0bGNw?=
 =?utf-8?B?MUVncE1VM254Q3llWkl4ZXRzazVqQ2VibkhhVzdaQ253R3hrTFRteUVXSmZR?=
 =?utf-8?B?SC9PSUlsUWJ5NFlZMjBvM0lFL1JwZjByWC96SS9CTVRMcWFmbXMvYzFNaDR3?=
 =?utf-8?B?UHpsL1VzMURCK1F0TXY3MlNBYzM5aFl5UDh4OG5YeHRLM0RnNi9CWC9ZSExK?=
 =?utf-8?B?VW9JcUFwQVJ5UE93Y0dlelJ0S0FuMEFscGhXSGtTZzliNVVwTkR1Z3BXSkVP?=
 =?utf-8?B?SC9zVWg3U0J3VGlGZzR1b2czc1NaZWZWVmgwTjIwbS9KMklLU3ZXWHdSRkZ1?=
 =?utf-8?B?L3BibVRHNmJNL3JGMnlKT2RWb0JWWGpWUHZMZkZpTFN1bTZ6YzR0SldJSXVT?=
 =?utf-8?B?VEtQQ3hSNjJJY1dNeWtMWHdkODkrTG8vNThueXFXWTF0Qm45RVlFM3VDaWZH?=
 =?utf-8?B?RzFkc2txcUJRcytVL2JLdmhLNEN0eWFBc0VYdnZNY001QjFIRVdERUJ5Ly95?=
 =?utf-8?B?YStTUStaaHpic25mU29rajF5VVVnVDNPalNsOWVOSG5uL2FFSHplbVA5MTZz?=
 =?utf-8?B?ZXA5YXgwM3JCQUZ3TVNZN0x4ZmpuNWZ3UjhjTXYxVzhJb05kL2dZOGpPRmNt?=
 =?utf-8?B?SnpXOUsxZC9VOGtQRjlXQVBhSVVWRDFHaW1kQlR4bEVuTTUxQ0RxSEFRNkwy?=
 =?utf-8?B?Z0F5a1RZcVA4UENiVFBZeEZsNXMwaWpxUi9oSHoyWVJDOWcyNFh0dk1JanUx?=
 =?utf-8?B?YWZoM2FHQ2FnaDdGTTBybFJoYkx3bWkzSys0LzFaVlp6cCtpd0VEbFlCWGYy?=
 =?utf-8?B?SHFKME9zd09hMVQrbStjd1Z0R1o3azQ3SU1PaWZWbE9weUhYT0ZJV3ErTEZS?=
 =?utf-8?B?akJRS2lPOWEwbGhLb1o0NStrVjgydExrQnZ5WGNxYjQxTCtMWGlIRGduem5C?=
 =?utf-8?B?M3NhNnFFZjkwaG14UmdOU0hxajIxS2hyL3lSQ3Y1L1d5MUp5SUlzUDlvMG9D?=
 =?utf-8?B?RUJPQUtXVHBWN1QzQ2xva3NScGY5Nko2Njhzcm85b3g4ai83UXM0dVNGN1VI?=
 =?utf-8?B?OUpISVJTUkJCcWlNVXBUMFlxSDhhVHBZWStYSUZjVk1qSzBBTnA1aU4zVFRH?=
 =?utf-8?B?eG92V25WbURGbDZ5bFJ6bXk5RVMzcHZHUkw4MDhNa0hGOGZBSGNCUTZwUlU4?=
 =?utf-8?B?TVJjNWx5NS90enZwV2hjeXNaMnRBbzc0UTEwZnNRQzFkWnhkdmNUbXQ5bjc0?=
 =?utf-8?B?RjlBNUNrdVloVE55R1NzZ0QycFp4azYyZHpkN0plVTFYbFBtaGZQZkpyUzMx?=
 =?utf-8?Q?rihoFJXkT+Pelftql9KEX/lbM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dd2e61-c720-4dd2-7593-08de3d98e7db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 18:20:06.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3titjQm0ilI/gRrFIdCsUxNcMEeshds+rahNi3aFZIOpW772ThgtiGrW4XZoe0HJbBelMM+KWRB2GDxFD8fZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
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

On 12/17/25 11:17 AM, Lizhi Hou wrote:
> Newer firmware versions prefer temporal sharing only mode. In this mode,
> the driver no longer needs to manage AIE array column allocation. Instead,
> a new field, num_unused_col, is added to the hardware context creation
> request to specify how many columns will not be used by this hardware
> context.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c      | 11 ++++++++++-
>   drivers/accel/amdxdna/aie2_message.c  |  1 +
>   drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
>   drivers/accel/amdxdna/aie2_pci.h      |  1 +
>   drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
>   drivers/accel/amdxdna/npu4_regs.c     |  1 +
>   6 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 42d876a427c5..2ed087803628 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -468,6 +468,12 @@ static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
>   	struct alloc_requests *xrs_req;
>   	int ret;
>   
> +	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
> +		hwctx->num_unused_col = xdna->dev_handle->total_col - hwctx->num_col;
> +		hwctx->num_col = xdna->dev_handle->total_col;
> +		return aie2_create_context(xdna->dev_handle, hwctx);
> +	}
> +
>   	xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
>   	if (!xrs_req)
>   		return -ENOMEM;
> @@ -499,7 +505,10 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
>   	int ret;
>   
> -	ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> +	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY))
> +		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
> +	else
> +		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>   	if (ret)
>   		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);

To avoid confusion, I think you want to pull the error string into the 
if/else branch and have a unique error string for context destroy 
failure or release failure.

>   }
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 9ec973028221..e77a353cadc5 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -218,6 +218,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	req.aie_type = 1;
>   	req.start_col = hwctx->start_col;
>   	req.num_col = hwctx->num_col;
> +	req.num_unused_col = hwctx->num_unused_col;
>   	req.num_cq_pairs_requested = 1;
>   	req.pasid = hwctx->client->pasid;
>   	req.context_priority = 2;
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 1c957a6298d3..cc912b7899ce 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -112,7 +112,8 @@ struct create_ctx_req {
>   	__u32	aie_type;
>   	__u8	start_col;
>   	__u8	num_col;
> -	__u16	reserved;
> +	__u8    num_unused_col;
> +	__u8	reserved;
>   	__u8	num_cq_pairs_requested;
>   	__u8	reserved1;
>   	__u16	pasid;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index c6b5cf4ae5c4..a929fa98a121 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -232,6 +232,7 @@ struct aie2_hw_ops {
>   enum aie2_fw_feature {
>   	AIE2_NPU_COMMAND,
>   	AIE2_PREEMPT,
> +	AIE2_TEMPORAL_ONLY,
>   	AIE2_FEATURE_MAX
>   };
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index b6151244d64f..b29449a92f60 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -98,6 +98,7 @@ struct amdxdna_hwctx {
>   	u32				*col_list;
>   	u32				start_col;
>   	u32				num_col;
> +	u32				num_unused_col;
>   #define HWCTX_STAT_INIT  0
>   #define HWCTX_STAT_READY 1
>   #define HWCTX_STAT_STOP  2
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 4ca21db70478..a62234fd266d 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -90,6 +90,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>   	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>   	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
> +	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },

Similar to my comment on other thread, is this really NPU2,4,5,6 
feature?  Or it's 4+?

>   	{ 0 }
>   };
>   

