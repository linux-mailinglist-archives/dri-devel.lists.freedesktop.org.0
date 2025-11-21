Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DBC77F87
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 09:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6B110E0E9;
	Fri, 21 Nov 2025 08:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t+HBRgp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2FA10E0E9;
 Fri, 21 Nov 2025 08:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMkbNt+JGMH4L2ffG7n0mmDpNT6lT2vEk1lzRJ3LXy/YfblMm8ZveYXP+CUEdinVj0TTX+ulnXcBmRthMUPMMFyIes5UJfm6QS5S9oaVBEZgUxBVMWdhrlXUrtCA2rKrARhUBLN26ae7WXsBm5U6I/pgTSi0xhm8NQf2+UO9rIrDMLwEULNMUOG3mBOhIl6PxcYa0W3cDAsGpBZjj2JlYroOliHmLHPW4jkiy4gO8y3KYoYiEFUrp2AvHGYXMlpPl9Ya/eu/wdzG2ws2/12Asgnmu6EcMPfcPqeSCfOGy1iYPAb4cNVB1zhMGJtbltbY9PT4+BA+IHnkVIU0Fhhihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj5KusQDaFzN1gT2jH+sWc3EisknCn+zY1CXqTO1JAw=;
 b=pYhm7RQp/6HshhI7IOdZhK978TrpmFldQSK1iEw/HVkFAKg+znuXgJ3YuZ7/A4q7dJX3BlrA/3J3Y5VnzAS7LDZCUgNIPXJp4edgnXggVzCtkq1M1EPmMwcZXIF0RMfBDV/tc7QZUo9h9j/ZvKFH5FOBsMxz0YNH+7FaEPwPUVF99ixyxGUbDe8if2Fye27Pm3Wg20KaP7hTxp5GnKHsP5Gz0bPQEbLt73msvyt0nDLnHzbRO8+7FKQ5rC+xmAs/HWQLc3lYIZPXYnZXiU/gbjlvcDbkB5FfU9oSbv/rdHn1sIEk8XOVoT/dBVJIr8c2QQhoOLRlVfNfrTp8fL7+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj5KusQDaFzN1gT2jH+sWc3EisknCn+zY1CXqTO1JAw=;
 b=t+HBRgp9zHSIxVGDvp8Y83QSSdmOlVUcyBjQK8lEWZQ2ild1GAZ9TQaMM6ngDgHCQpFxuu/B9wpDyDAv7Je1a0P5kNk381iQTjlX+UdlhtNxZFHMX/Oe35LIYiC+H0nrKk2f/EQeINv3r39g+JVjC81f9RJdNA6ACaLAmpcLkAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 08:46:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 08:46:27 +0000
Message-ID: <c10c66d4-ab12-474a-865e-b732c89028d7@amd.com>
Date: Fri, 21 Nov 2025 09:46:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/26] drm/amd/display: Permit DC_FP_START/END only in
 non-FP compilation units
To: Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Ray Wu <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Ard Biesheuvel <ardb@kernel.org>, Austin Zheng <austin.zheng@amd.com>,
 Jun Lei <jun.lei@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
References: <20251120181527.317107-1-alex.hung@amd.com>
 <20251120181527.317107-21-alex.hung@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251120181527.317107-21-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a1bd7d-73fd-48c5-e351-08de28da7557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE1nVTVQK2pGK1MzT3B0QU9jbERYbytGTjZrcGdETC9iR0EzY0M1ZE5aSUtp?=
 =?utf-8?B?OWtmTnRSNjd3V0JoVS84U1ltYlMxS0dvTkEvUHpramdQR2N2NW9uUU5JRkpv?=
 =?utf-8?B?Y0pFT29mVXVSYVp5SDJ6UHZPYUdvdzFsRmtNalNwL2hLRzBSRHB0TUZFTTRI?=
 =?utf-8?B?SXdHNmlveUZ1bGlyUnZGaUpsWnFNaDBQT1QxRmhjNW1BUmtGYkh3clRIRld0?=
 =?utf-8?B?d2U4RDRkSGpaMDlsWkJmU213T0Q2MHpZTnd3WUI2cy9IVnNFYmhVV3ArQloz?=
 =?utf-8?B?ck9Ya2ZMVFZqa1RvazRwcDJhT2hoQnhqNU54eXZUaFo5YWYwT281d3psQXkw?=
 =?utf-8?B?NWQ5ZC9TVHhEcG5YYnVTRXN6eE4rdjBmMFByWlNqSmJ3MENyVzIvTkN1SHMz?=
 =?utf-8?B?bll6UmRaUkw2VHVuV2p6RnpDM0ErUm1QOVlLQUJQYXk5VzlYNmF2WDBQc2hl?=
 =?utf-8?B?MG4yZlBRVXp6N01FMmpqWitHVUNpVUcyY0hMV2syWE42c0JZMG5vNTVaMHY3?=
 =?utf-8?B?cERoNmFaVkV0VTdxQ3BPQll5RXU4WWN2NC9KaXVXazRmU3RvUHBsNW5oMFM5?=
 =?utf-8?B?TkVVbTlLN0VGYTRLdDFjNTVmNEhpRk5JUnAvb3U2dkJuM3VEcjI4dkxzZWZ5?=
 =?utf-8?B?MGN0Tm16VXVJMDhvUDg2emlzRGVYWEh0ZitYa01DMjJaUmt1MVNGWkZsUzVH?=
 =?utf-8?B?SGlXMmc5NC9tQTJMd0JuUTVFbFAycUxsR1M5RkhsZVAvY3l1NVoyU3BNRWR5?=
 =?utf-8?B?a1BVdUN1eGd1andzOFlydHQ2SEVEZTNVdDZsellQL1crWDdXazlLRllEWExy?=
 =?utf-8?B?ZU5nZVhOaGpMSkpSNytUVU5sSEFqMTlFamtNVVhKa0djdE9aTDRib0REdjRa?=
 =?utf-8?B?VzVKS2owNVB5Mm9HckZlYzA0YUdpN1AzTjBzK2hBSWFVUmFEdjBBQXhpMU5V?=
 =?utf-8?B?bjhUR3dnZUVOaXpuMXhLclBIdThJSVZtKzRFQlllYy9NSzRTZGo5OW1EZE80?=
 =?utf-8?B?bUx5OGFudUZwSFovdWZiWWFGa3hod2ZYS2RnODNiTVNqYUR4K0hrUHFZRG5y?=
 =?utf-8?B?bkZ4YWswSU94WEZ5eFhFWkhucjRFK211UmhwMyt0Sm5zU3pOOWdleHpkbFk4?=
 =?utf-8?B?SEpVakx6VXlmWWlmUFNRbk5zcmt1bGx2UjlWRGlMN1FxOVJldFJva0xVcVVl?=
 =?utf-8?B?amVSRndER1pwZVdRRDdVTU5vY1hIUDUvSHB0bnVMSEt4cVAreTVVYjV3Y3hW?=
 =?utf-8?B?aHkwcGhWeGIydDlSQVluaGliTk84c05LRTI2MGNZMHA5VnFjd29kdkdHT1Ey?=
 =?utf-8?B?SU1qUlR2b3NVQjBrcE9rbFhWc0duT2x0cXdYOUpXLzNGVytjaWRWUzI2d0FZ?=
 =?utf-8?B?MDFOR1hGc2I1akk1MFE1OEwrUHNWS0JvNG9YeHd0M00vKzVGU2F2TzJrY1hh?=
 =?utf-8?B?N3hlNHk2c3VqNTRIUCtuTE5NQkJDYnRFRVdpNm1HdUNFRUUrc09oNGh1eDhD?=
 =?utf-8?B?cVZ1dU1nWklIRUNxbVJCSEptRkVxZWFmY2dXL2hVY1JDTFI2QzdKZVh4SHdl?=
 =?utf-8?B?SGtHWm1Tclp6SktOaWNLOE5rY0Foeko3dmo1czFEV2p2R2VrNEorSENaTXNm?=
 =?utf-8?B?NjVuYnpNMnR0QjU5enU1bEtlUFRzbC9ZdDlOZlhIanJ6dndlRktYNG1xNE9h?=
 =?utf-8?B?b1VzT29VaituRGJZS0JPeGJZZXhqdEtwMHNLdDJhWTJDdGZtTlNSbmRiMHVS?=
 =?utf-8?B?YkhmTDZMUHl0ZldpWVlEN0NrTFdkUWxSVTFaWm9oMXc0WElOamlCdFoyaTkz?=
 =?utf-8?B?SHJTR3U0bjRIelh3Q3dOeGFkVDViVGpRWlVrRU80N09sM28vTFBSZXlpb2gy?=
 =?utf-8?B?NVY1MTV0M1pRR3FMS2VCa1lnaXJvMmg1cGNyQ3FmNDFiRFhRSEF0dkw4SCsw?=
 =?utf-8?Q?vnv6Xj3ExpgmiAYXU6HOdIrKhZbj0Y87?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxhYlRTZlNmODNta3NMMzkzRUJDSVpucWxXN1QzZDhPVi9XZ0JXUHRvaThu?=
 =?utf-8?B?NTNmVkNvdnVnbXA0dWNocDdZZGJ0VjZBTHNIWXVCTURENjAwVHhBYjBkQ0Jv?=
 =?utf-8?B?d0NZQVZlb2lIZnVBZkZ6anMwb0xTNVpHcGk3R1ppRzFEd2NwWG9TcUoxT3NZ?=
 =?utf-8?B?SFNGOXlIMWdFVGxEVUV1VGpVb3lseExHUnFJMU01dzYwN2hlOURIQU15cHNV?=
 =?utf-8?B?OHdOanNpREZmemNzZEd2blpWaWYzb1ZXTS9mVEQxZDJlK3BJWVQxTzVkSUYy?=
 =?utf-8?B?M2htc3p3bG94dTVYNUhPd1gxZVhCazNQeVVrbi9Sc0ZqV01MTzFFT0FCU0hC?=
 =?utf-8?B?NXAwVGpmNWpNTklkeXVsUFQ5eVRQZHZNTFBMUm9ubzFFU0NnaXdiYkJaVEFp?=
 =?utf-8?B?dURUZnNOVlpTTTRxMUljQ3JiaVNZRFVmK2c5VkMzN2RDeFZqaUZ3L3dzNUw2?=
 =?utf-8?B?aGJKcFNnZnU1cmt0NSszMHYwamhOTzlnSUl5eGJEZTR4TGNhd09jOE04NEpm?=
 =?utf-8?B?cW5QdStJbmpLcjFKOWZsUHNwVXF3aWhxZEdQUFhZVFJRb2xsbXRUYUxDYmt4?=
 =?utf-8?B?ckQyUUs5a2ZtQlYxUXZKOThqWmY3MWQ4cGlpSHB5bm5IV2ZtYm95Q2dkWFNL?=
 =?utf-8?B?ZnFvVkFtRlpaenJ1VlNNeml2T0t3ek1uOTM1cm91cStlelZwVE1rdGJQampn?=
 =?utf-8?B?R2xxSUdaM1d0OGVyeFQ2Z3d6ZFdCZTBIa0F5S0NzZGl5NkZ1bHhRckpXSTMw?=
 =?utf-8?B?T0laQWpCRkJSNzBTRkppMHU3VnFvWFI1ZEJoclU0NzRuenoxaEdnK2MvelRI?=
 =?utf-8?B?MkpoR0g1VFBIR1Q1ME9yMEZQY3BaRFF6WmZNWDkyVkdDZ1lTODBseXhpNzRu?=
 =?utf-8?B?RmwweVN3eTl1N1pFeS9KNmJCT0g5WDZMVEhHUTNFUXRhUHB3WTREaHVBQTE0?=
 =?utf-8?B?SGF5aEc4aHFyZXFmdFh6VUo3aHIvTlUzWENLQmd1ZUZ3Vy91RnlYUkl6eVhI?=
 =?utf-8?B?MndwN21XVUtPS1hHYm5GYlhxMzUreFExTitFZzI1SGk5K0tqZGNLOEhPRyts?=
 =?utf-8?B?c09FWUpDNHU5bnNXUG5VNlhrQ213aWttVTVDa1BaUTZROUs2TzI2S0tzQVVp?=
 =?utf-8?B?WUVFTWozc0grR2FFbWRhMnRXUkZmTEtES3JOYm83VUtHMXdxNTM4MEVaVmxv?=
 =?utf-8?B?NGppZUVCcmVnQzJQTnVtRGwxQVA4ZEhzdncrWDhWV2JPcmJKMHh2dFhqK1Qy?=
 =?utf-8?B?am0xdWFXR0lhTm5MVDlaNEpWekhnZ0JOVXUzT2RrRElZRzhhYjI1VzNPZ0xU?=
 =?utf-8?B?OTVlKy9DandHZU05bDQ0akYwT2dvSzVQWmZiaGovSTRPaU9hWGlldmJJRHBu?=
 =?utf-8?B?YmdDU3d0N1AvRnBXcFF3WFFHNFFzeVI5WmduTDZOYXF0ZGhaNEQ1YUEzbmU0?=
 =?utf-8?B?akx5alpXSW1vbWFNaDJ0KzRJNnN6WWJobWhZWWJ0SUlSbzg1QjU0bWVTanBW?=
 =?utf-8?B?T1J2M0M5eG43YURjQnlYNHlqZ1RTL3BVZUtWYUduSHVIdjRuWjhGU2doQlVB?=
 =?utf-8?B?ZnV5KzM5MVZiNnhrTyt4NjU3SktHSk9rYTBveHdTR0NLeU5UUGpnYWZCNC81?=
 =?utf-8?B?a2lsRjlIYkMzWFZYZ1JLeEZHQjBkT1l5bUp0eUQ4b3plS3pkZFJsMDh0ei9Q?=
 =?utf-8?B?YzIvVTFkRzdKbHFqMkx3NzQzcWZBdzNMTENYb3ZpTXVTTXZjR3hrSWJ5NkhV?=
 =?utf-8?B?UXU3TnBybE85UXVjbkxWL29vdXQ5TUVvRmI4WVNRRXpvTVRPOGpoZkhzVEEy?=
 =?utf-8?B?a1grUk50VDJTN2tlVHMrOXFGbjNOMzFaL21RWURmZnVqR1dpN2VGejl0L2lS?=
 =?utf-8?B?dks2NEtRL3FDY01kS2ZsK2xkZWJRWUdQYlJ6M0M3Vm9OejA3MldDc1lzTVpl?=
 =?utf-8?B?YnRncjZ4T0ZBdGZGRnE0b2hpOHk4MFA5M296YU0xSVdGUEZZUEZ3SHZ3RVVB?=
 =?utf-8?B?Wnhiby9mT0Z0dG5OalZyNjIyMjhDcWxXYm9lSmprTzRYSmR6Ky95Q0Q2K0t2?=
 =?utf-8?B?QVRTTE9hdkp6eExnTDIxRFNuY1JGL0J4Nlhjb1VWRVFaajM0bWtBRHRBNjBt?=
 =?utf-8?Q?R73FinTJXEOpj/Fa1gVe+W9We?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a1bd7d-73fd-48c5-e351-08de28da7557
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:46:27.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I7v3PhUpUpLTc+XObei96OQAp3hkfhQO82toI/x+M2F8cSZrfezzBryYbfbLIaP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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

On 11/20/25 19:03, Alex Hung wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> [WHAT]
> Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
> when building source files that are permitted to use floating point,
> in the implementation of DC_FP_START/END so that those are only usable
> in non-FP code. This is a requirement of the generic kernel mode FPU
> API, as some architectures (i.e., arm64) cannot safely enable FP codegen
> in arbitrary code.
> 
> Cc: Austin Zheng <austin.zheng@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> 
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Suggested-by: Christian König <christian.koenig@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h | 8 ++++++++
>  drivers/gpu/drm/amd/display/dc/os_types.h      | 2 --
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> index b8275b397920..4e921632bc4e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -31,4 +31,12 @@ void dc_assert_fp_enabled(void);
>  void dc_fpu_begin(const char *function_name, const int line);
>  void dc_fpu_end(const char *function_name, const int line);
>  
> +#ifndef _LINUX_FPU_COMPILATION_UNIT
> +#define DC_FP_START()	dc_fpu_begin(__func__, __LINE__)
> +#define DC_FP_END()	dc_fpu_end(__func__, __LINE__)
> +#else
> +#define DC_FP_START()	BUILD_BUG()
> +#define DC_FP_END()	BUILD_BUG()
> +#endif
> +
>  #endif /* __DC_FPU_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index 782316348941..6af831710489 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -55,8 +55,6 @@
>  
>  #if defined(CONFIG_DRM_AMD_DC_FP)
>  #include "amdgpu_dm/dc_fpu.h"
> -#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
> -#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
>  #endif /* CONFIG_DRM_AMD_DC_FP */
>  
>  /*

