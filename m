Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C96AD922A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2B10E14F;
	Fri, 13 Jun 2025 15:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bMtv35hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D4A10E14F;
 Fri, 13 Jun 2025 15:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5R3nSbM8ltNwzGyelzOe57LN279T6If+rvQvCBFLnFRUq0iJqeTPIMozhbUZpRM8rQJQ89v2VOblEqa2ZUHmzdrJTxJ+T+IEj/B0meOMbppPvnHoGGjhdY0JByO6MzVfiKKTVin3Vuj3kVMFbtvTphwqwdBFXQzpAnBut6+wTe3GvyksupvG4/x9yv2V5zOJkEqGgRHSECPhSF+jjGXi5lbKwHj2PZEpygwuvqoTEeEiue97Nn/7NAo6safIRabAnHcC3/o+zrlDtXKtRWCyr8qji0UQae+iPxNd8khoZ+QrYq8A+wMVcmksMA4Tai7vyUZGvSGD3pxONznoPo8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLAC91iGvZE6fhCVd53YDbeBycldpBLXxCXGiGODkRE=;
 b=whD1KGXiVajI8CZ9K5jE5GmUSavPAYhVKvHJ+AodqiAldwe3tt08Jkkt20u4t3ktfxsaR95+oqTAJdHMzpGHXOngbxFeRaircvkc/WcZBVS2soyc0pId64eDf1ERuag0VDGLFtxAsfHbsppbxwxmNmc9UdSygPXUVg5LK22ELS3m8dzUpiG0M9AVv9O3e77BeRvipSoReYL2Cq0n8lJNo1cAJgxY1cwSMp1GYsxC3eEIFotSfI/exVs+Din3dQhdGX3pqE/z1tnQW4k97I+lk+06jZi7AA6UOKB7QZqhgUpT/ndhSqPL5qFi1U6JAPODFWFM14u0kxHzWDrc6Zg2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLAC91iGvZE6fhCVd53YDbeBycldpBLXxCXGiGODkRE=;
 b=bMtv35huCQgT4p/mbi8HVpdRyjOpdHunrc9YDRjU7vl06k8jE/Ajry14YtZZiKHb1XuoUFRP8793467far/9OT6Gs/UUB6x3GIlqBtTmhzWTTzNkxMHyJXbC7gVMQdT1YJGIIZ5Br+DSte0qyKJ95N4/9dDotlCgm8LL1/zpxhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 15:58:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 15:58:50 +0000
Message-ID: <e8f4fb73-cb63-4662-b041-4719785c5b37@amd.com>
Date: Fri, 13 Jun 2025 10:58:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] drm/amd/display: add drm_edid to dc_sink
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-14-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-14-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b45afd-5684-480d-d1e4-08ddaa933033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTN3aEd4MFh4clcvOGoreUJac2hxMmxvNWxuQU1MeFlnWm1pdFp5YzJ6U1Vi?=
 =?utf-8?B?a29QdGNQV2hMenpTSzliczZmNDJNSmdIMnR1K0oralNYT0tCWmkvZzAxNnN6?=
 =?utf-8?B?S2x0Z3pOeHdKeXhna29JcXphY05uekd3eUZQVlJwb1NicVE1YmVxWUFBanp6?=
 =?utf-8?B?aUJERjFHUU9OOWxoUW10RVZpNVg2QU1TbDRwQzZKWWVzeHAybU12bk5EMjRF?=
 =?utf-8?B?amVEYkdaVHRSL2s2SmtIQ1d2ZmhCS1c0RnRYNnhkelZZR2NtYnZLTXNoVm9t?=
 =?utf-8?B?elVVYU1ScFhZTlN3ZlFTd1ppdExzTk9KWFdkbXFEaHNhSXFseUI5TnpmUURH?=
 =?utf-8?B?VytDZ0tDSWxhUUJnV3FzUEtTenBuWTNZSGdYUUQxZXlYZFRHNjBrZ2tlWjFm?=
 =?utf-8?B?QnozelFaUFYyZUJjSlF2Zy9nbGgwR0xDVTd5aGlrbHJiN25yVVNhZGZaUVZN?=
 =?utf-8?B?TzNDNnA4WXhqdXloUGVadDJEWTFaWU9tS3QyZ3FwUlV1Qk1tL2RrQVdQaHhV?=
 =?utf-8?B?M0pPWDh2cXg3dmhhNlUvc0R0NTVRWW5pRDFSQ3RPVTQ3V0pWRVl1UVhUOHRT?=
 =?utf-8?B?aGM4d040Nk9xaGFsS1kyWlREd3J2ZmRwL2xDSytBSlZoTVJjVi9GWlZxLzVo?=
 =?utf-8?B?bFFPWU5MbVh2Mi94dFNyY1dJUW1hOWZNQi9sVDFqMFpOR1NMZkRDeUM5VnVS?=
 =?utf-8?B?K1RGYUpEVklISGt4djFwRmo4dGgwNjBTM3NoMTNKL29vYVVIeWhiekZHZzQ3?=
 =?utf-8?B?Y1VhQW9pUXhrTmM1MDhDVEF0NGNhdTY1WVRlWXdQSWpYVGpDNW5UOVJ0cFc5?=
 =?utf-8?B?Qjl2TVd0QkJuMU43eG5EWmxxRytkdGVscGtnWDdTd1dpcGEwR2xSVlhsMjF0?=
 =?utf-8?B?VWpKMjR1YkZLeTlDWk9haFJTdm1HUlR4VDE2VnVlV21ZOXUvMy9WUzJQMndT?=
 =?utf-8?B?VlB4a2lOWnRmYjQ0MWRQRWlTQjAzZUY4U3l2NkpFZkZSOUxEL1ZVdmswSXlK?=
 =?utf-8?B?ODFRTG9yT2lVUWQrMUlWbDloT2xDOUhVQVNEMUM4Snc3Z3R1dzk1RzJ4SkxK?=
 =?utf-8?B?TlVTWS9nZFk1Z1Z4c1diKzFFUU9kT3QxN01qKzhac09iaTR2RHE3V05zb3VL?=
 =?utf-8?B?U3dmWFZRUDY3bHlKMEEwcmpoODZUM2RUUUJjS2FZdDhpSDJjeFNJc2p3SkR5?=
 =?utf-8?B?MWFrRGRkZ3FLSzZVWktlRVZGV3pZd0dhOGtvNHcvWXlMalNlMDVma1lPMWdv?=
 =?utf-8?B?UXlIVkZEV3VjZzBQSXQvRHNpNUpJd2tkQ2NLNEVNOGFhN0F1R2dJa0VPOWEr?=
 =?utf-8?B?cjV5WmltUXRpb0t6UWlUbnBlTGlPSWpmaXhjZ3JwL3FmMTkybmZPRVExTW1S?=
 =?utf-8?B?NGh4aU9CVzdOdlFMeDl0N240cTRCaWphM05ocmt6Q3dDY2s4ek0xZDlXVkZU?=
 =?utf-8?B?ZnBuR3hpZENSQ01LanFtb1VJWTM0OU55VXpEazR1V2hyRDFNZkY4U3lDVmsv?=
 =?utf-8?B?cUp3WHNPbmpKb1lMcG5jSnAvNm15MEFFbmxJeGREb2pGMnh5Y1NteDhJK01o?=
 =?utf-8?B?WWpUTGw5aDRSTnJLSDAyL0V6V3A1RGVvTzU2eWJTTjBVRkwzaWxzSklLT3Nr?=
 =?utf-8?B?RXFpU2U5cWhlMVh0S3o4SEhOaW9TNlV5ZzErdWx3RWNxdG51Q0wxc1NMTWpm?=
 =?utf-8?B?d1NIN0p0cVYwbEhsQUtLeWIyeHBOTUdQRzB6Z1kyL1E1NUVGOFNheEtaNmM0?=
 =?utf-8?B?MFloMC9iK2NYZGs4ZzV5RmpWTFZ1VTVSZkV4MVMzZ09LSXlIMENaWmxPZ1RV?=
 =?utf-8?B?eEdJQWFLTWNrUEEzSWNrd2J3MHZjQlhmTmJxMmQzbTVWYktoT1p6VjdLNWxO?=
 =?utf-8?B?SU02blZrNm96Z0VwU202WVVIOGhzQms0aXUyQWpaaFpmUW9veUFLemVmRWg4?=
 =?utf-8?B?OTNQeldFY2pDSjEzOUF6UzRCMGpZb2RHSjRMeXF1Z1gwY2RGeW15Tyt5MHJ1?=
 =?utf-8?B?d1lISlhqTkdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDE4bnFuVDRkRFZPNlpMRGhVZWpWVDh4Tm5VQ3MyWUl1cHFHTDZnTk55eGZy?=
 =?utf-8?B?eHNDeWRTWVRIeFB0eVBIN0NIQnUvaDhDY3hINWtiVng5ZWlObDE3RWYwcThT?=
 =?utf-8?B?aTJqYTJLOHk5WTFrZFE0dDgzNWFXc29sTlEvTEw1dTNWUWpzMkQxeiswWjl2?=
 =?utf-8?B?MkkxTjJpKysrYzMxcXV1WURrbnQ5SktPdHZtd2R6M1E1TTdCRVkwb3Rsa0ln?=
 =?utf-8?B?ZTNRNEhLanE4WVBrd3N3bk5lcjdHOHc2TEU1UzNlazNrRHJUK1NYQVdTcFc1?=
 =?utf-8?B?SlBnYnRkMG16akdCTXlKeGovdW9lMm1oM1laNHNNZlZGSDlkZEhuRFh3SUdE?=
 =?utf-8?B?NW9pNFd3anJzRldRSHRsZmJqVnoyYk9Ba0ZtVnFhTTl2QWhqZ29HTlo2Nmkx?=
 =?utf-8?B?U05sNGpYNFIxdjJkSlB1bHJiWitvelFYL3pBUTJuZFc3VFdnaU83ZVVzKzNO?=
 =?utf-8?B?ZTlwYURDWkJJdktvWTBtRjNhSHFpdkZTVTlLdUx1QkZSeE5EVVdIZzl0cFJ0?=
 =?utf-8?B?aFNOUW5tSGE2OFVuUC9UWjA3YldmSWNlWVVKc1NjbWk1a1JpQ1RYWXd4YVNL?=
 =?utf-8?B?M3RjKzJ6OWFYckpkYWtseHNOdVBYbUVoazlxMlcvajNSYXByNk0zamhkaWo1?=
 =?utf-8?B?cHdHVnk1K2phc2E2TjVMZUh5ZDVYNmFsRjFsYXMyNDNsQmZDNEdLYU9mb0E4?=
 =?utf-8?B?VGpMZWtFLzA5YmZsdFo4SFhOUlRaakVJdkVKcG54alBmYzhTa0dZcGR0cHgw?=
 =?utf-8?B?NHlrSXhNbFFkcE5yL1VmSjY0T3ZuMkJjQWhOc3BIUGNzYUd1K1N5dzF3cG00?=
 =?utf-8?B?dVV2MTdvWHFIOXI1cmkvRWprVk9Wa3AzM0haTC95QksraVRhZkdGUWt6N1dY?=
 =?utf-8?B?OEhqM0dJNXV0QmRGUW9ua05DSDRsVWt6WHRkMDZvc1NBZ0VKcDFyYVI1dXk4?=
 =?utf-8?B?SG1PVEM2Z3phdlhOcmRqTWFnTU9sRDd1bkhaWVVMT0RZaFM4eDhiNXRsS3lh?=
 =?utf-8?B?RVAxUkdlMmw5eEY0a0JNNmtEeDVVdHpKeW5GR2ZUL0NzcEw4V05pbCtKTGMw?=
 =?utf-8?B?WDhIdW1kWW1wdDZlZ1d3NUY3NGdYeTdPWHBjYWk3blVsVXR1eElwU0trYTNR?=
 =?utf-8?B?VG5Kb0lzNGw0bTJaV0pQdjdUOEQ4MDNMNlRPeVBiWVg0Y09kVFhZRlZXUGx3?=
 =?utf-8?B?U1NTV0lkUlJYTnZiN1NKY2RBenJqZzJPQ09Jdi9zWnZiK3J3cm80M1kvRGh0?=
 =?utf-8?B?WFgySGJIa1BzYktKM25CMVJTMUFrUDkvdmlaYW1LK3RlT01uTkpuZktkMDgw?=
 =?utf-8?B?NHZ2SWdkcEMwNGZPRDdtbWlkSndnZWl5S1dlQU1sZXRPOU1SRThmYlpXUHVO?=
 =?utf-8?B?SERpQU8zSlRtaVpEY3NWR3VmT1VlcWRiOC9oSnBudUUzaVY2YVNRL2Y1Q2ow?=
 =?utf-8?B?RkxpMkxZY2ZEa0dvb1pER1pIbGVtUEI1YTBpUFIwOUJ5L2MreWNscDJYZHlq?=
 =?utf-8?B?bU9lK2lQWWdUMlJVM0pzS29kcnVjWXlodFVEd2tZRmZKcHVwZHkyWWlqb0Jq?=
 =?utf-8?B?YVgzK3pnZzhqdGlDMU44UWVYaVpKbnZJT05XVDhtZHFBRmd5TCttNEtXVy8r?=
 =?utf-8?B?UGJaL2VXeUNoaUxmNGo4MzNqeklNSW1OVG5wS0I1eERka1J1QVU2emwwTStN?=
 =?utf-8?B?b2czUEwyVk5JZ3pacVg1WUlWaFhMdGp2QmFJa20wUzBkSmNJRlovYTNNc1dI?=
 =?utf-8?B?aWNhelhsUkNEajFvckJqWDBaK1A4dFNUQU9yZ0d0S3YzUjZ0c2NiTVhqUVdY?=
 =?utf-8?B?eVVPRU9JOEFhR09PMXUyWTRhQlNjMXdoaU5BNW9RVVJhK1pmRVQyMytRdXVX?=
 =?utf-8?B?ZWsxMWZ4bmp5Y0NiTUFUU2hSZnozNzBiUTJJcUIzVTByUk9FNjMyVzZPTDlx?=
 =?utf-8?B?c2VRb0g2Zk1Ea1JFZnE4Vnl5MDIrOEV3U1dtbEdQaUtvTEFnRVNLRy9hbHhS?=
 =?utf-8?B?bXVZV3JCY05lR2V6NWR6K2UxY3ZYNmF4U2pXQlcrOUIwbXpHS05HbDdHb3Fv?=
 =?utf-8?B?S0FBSlJQTmQzMkdsaCt6cmQveUUxaDFnZ2ZVdm4xTUk2VE1JQm9CcUMrRDFQ?=
 =?utf-8?Q?EzsYkEH7X3KgxgEBq3XJLile0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b45afd-5684-480d-d1e4-08ddaa933033
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:58:50.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jihJTi8pmKrbhm15kAdEHFuJUK1GG954xyrb7Ub0JQ6YfKixIOnJOtOlKf8lHM0Dah7BAjbfE1xL8ReJkrSzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651
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

On 6/13/2025 7:58 AM, Melissa Wen wrote:
> Add Linux opaque object to dc_sink for storing edid data cross driver,
> drm_edid. Also include the Linux call to free this object, the
> drm_edid_free()
> 
> v3:
> - remove uneccessary include (jani)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
>   drivers/gpu/drm/amd/display/dc/dc.h             | 1 +
>   include/drm/drm_edid.h                          | 4 ++--
>   5 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index a90545b176cc..9e86dc15557b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: MIT
>   #include "amdgpu_dm/dc_edid.h"
>   #include "dc.h"
> +#include <drm/drm_edid.h>
>   
>   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>   			  struct dc_sink *current_sink)
> @@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>   	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>   	dc_sink->dc_edid.length = len;
>   }
> +
> +void dc_edid_sink_edid_free(struct dc_sink *sink)
> +{
> +	drm_edid_free(sink->drm_edid);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index f42cd5bbc730..2c76768be459 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>   			  struct dc_sink *current_sink);
>   void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>   			     const void *edid, int len);
> +void dc_edid_sink_edid_free(struct dc_sink *sink);
>   
>   #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> index 455fa5dd1420..3774a3245506 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> @@ -26,6 +26,7 @@
>   #include "dm_services.h"
>   #include "dm_helpers.h"
>   #include "core_types.h"
> +#include "dc_edid.h"
>   
>   /*******************************************************************************
>    * Private functions
> @@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
>   static void dc_sink_free(struct kref *kref)
>   {
>   	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
> +
> +	dc_edid_sink_edid_free(sink);
>   	kfree(sink->dc_container_id);
>   	kfree(sink);
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 86feef038de6..cf56a0405a4f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2466,6 +2466,7 @@ struct scdc_caps {
>   struct dc_sink {
>   	enum signal_type sink_signal;
>   	struct dc_edid dc_edid; /* raw edid */
> +	const struct drm_edid *drm_edid; /* Linux DRM edid*/

Don't you need a forward declaration for 'struct drm_edid' in dc.h to be 
able to do this?

Also you're missing a space at the end of the comment before the '*/'.

>   	struct dc_edid_caps edid_caps; /* parse display caps */
>   	struct dc_container_id *dc_container_id;
>   	uint32_t dongle_max_pix_clk;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index e7a9a4928b97..8617d2285f38 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -469,8 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
>   			      const struct drm_edid *edid);
>   int drm_edid_connector_add_modes(struct drm_connector *connector);
>   bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> -bool drm_edid_eq(const struct drm_edid *drm_edid_first,
> -			 const struct drm_edid *drm_edid_second);
> +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
> +		 const struct drm_edid *drm_edid_2);
>   void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>   			     struct drm_edid_product_id *id);
>   void drm_edid_print_product_id(struct drm_printer *p,

