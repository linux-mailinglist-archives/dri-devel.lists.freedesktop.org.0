Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDEB295C9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 02:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21A110E193;
	Mon, 18 Aug 2025 00:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kz1p9BYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7F010E193;
 Mon, 18 Aug 2025 00:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdbvrGcLKw1G2MztSqrlQuMEGAcImI/Rdyf/R9xuQXey7QJ5rEv6EGZR9WfPCA7MHJKQqLP/8O0e5giiMycp74ED+GexLkEpSUjLU5h3NMXtyWggIgWnAhVDkPOBNaFJ2oiEfy/09Nx1WHykrqXkyocLZ8Va8YPH827xusKWGsV2WBCS3TgiLIu39p310mG3PtVsQZcEIDpgSxTmcFnm9l0TlhDK9/WMkSwEA2bjc2tQhNKkSGXlwxpdb/tZodvT+3gUNWBKN8CDyAclSUyg4Qsob6KFEqVuwhcRIUHQi/MA7SsB8/a4pC0X/MUnMZWs23CrY6SqrMs5EFfgEFiFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEUmMgUZLJ+cnmIBjwM+lESE/c/rBsNNiJhiREsc8dc=;
 b=LotaZsH1RwlS/mLy7QoyroFsQlZ4Omm11qIJbqhRtQdZmqTdDaUNFy5/Qjz52wChvV1xdXeWucAuqma09rNuopq3nEz2k5qV/dNYMlrXekI5BMSjrPBuiA3ZDz6qlW9PF/gb6q+xpmOYy6rZctsiI/sN/cTgg3q6Itc19AnwxnZjiPCPTmZDZTreiIuf7Q7LNBTBE8X9ZQsg8rXTjKyFn705MlviGeWFSiFxyzE//dT8VSAq0b5I6ScO0F0QB7EyQ9WYtC8drPeZmDlSCJwZILr41B6v65I0Ea+7X8Ltl8CORz+4jP7VZglGLjvgqmNTgDDQVys3FhgHAwnpLn4Nzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEUmMgUZLJ+cnmIBjwM+lESE/c/rBsNNiJhiREsc8dc=;
 b=Kz1p9BYR7PjHdnBYpFt1ucL1jxP2fV8/gOj/jI1ch/OhyNaKcA6ml+5JzJmQf2x714OvWT5zrcQZkHtXrgjpMrplfmW8w81ARBzRxOIDhV+MwedlqSPXYn1aMi24J/i4ouTInzw2kZVDYhVxaQukadhDP7Or0f3LsCUNA2IiZ4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 00:03:36 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.019; Mon, 18 Aug 2025
 00:03:36 +0000
Message-ID: <884b009a-d3bf-4d7f-bcf7-ae50ee01c7a3@amd.com>
Date: Sun, 17 Aug 2025 18:03:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Use swap() to simplify code
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Austin Zheng
 <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250806124120.381818-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250806124120.381818-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a8cd6b-c1ee-43a9-c244-08ddddeaadbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZQcUV1TXJUaHRLTU9Sc0tjNGk4TVlWcU1FdTB0YUlGd1pJVCtDODN1Skwv?=
 =?utf-8?B?ZE1ZMjNDNFdRMVBSNUNGZ3ZnQ09HZmE3TS9Wb21WZlIxWEx5OHU5bmg5V1dC?=
 =?utf-8?B?TEZ2Z3JzLzRzUkh6RlFGWFFyclhWcjFZWjVNTzhYRkUvOExsUFI1SXNEZHFC?=
 =?utf-8?B?VzFDa1VTLzlWaE5sVTFweEYvSjFOdWg1SUxkOEYvb2dhU2tYSXRQdytMcW9z?=
 =?utf-8?B?Vk5rSFAxTlVLSjRPYitpZlFCSVJkK0pKb2x4SUcyZnZ1MVJHNmpTdmdSRnkx?=
 =?utf-8?B?WkV3NGJXYm9sNUtTaHovOTR0OGpPTS9nMkVKQ3Z1UlliZ1N0T1Q4YkttOVdr?=
 =?utf-8?B?bjUyWWk0SGpXTHRmaHY0YVpLdXVwaFZVZmxicVE1WjVEUEhBZFgxMFFVOEJV?=
 =?utf-8?B?UVcycDY0OTNGUDNTVURmNnExbjFFT3hJbmJXWStSUFgwS29LNSs1Q0IyMEJO?=
 =?utf-8?B?YTVldTBTOFJWU2dMTlJ3S1JsWXR4Z3lpVno3d3hoOHdaOE9mR2JCNmROQWY4?=
 =?utf-8?B?WWc1dzZyYnZ5a25pNG01WW1BYjFybnl0a0J5NUJsQWk4V1JoZDc3STliRVFl?=
 =?utf-8?B?SnMvcmVTQThEMTJLdXFRZGFHbW90cmJ6aDh4dzBWdDRsSXAyR2NncHoySk5K?=
 =?utf-8?B?ZTEyQVFKczlIL3pwVVdSb1hqUzdtSHpNNkk5ZVJ4TUtUMXVGbGtPK1k4K09r?=
 =?utf-8?B?YXRkU3N5KzNOVzBWSUNJQnVoU3NadVlJUW04UStNNlZzRVNwbE5uaGlFeFpI?=
 =?utf-8?B?QXF5SHhmaFQ1dlpaZXkxOWdYaXVkRUd4ZG11ZjhicnoyeEN3VFUyaHdVYnRO?=
 =?utf-8?B?b21yclVoY3BEUE51YkdoOEZmM0hVajhiTUR4WUNvcWNReVU5RDVmRlJIb1Zh?=
 =?utf-8?B?aEVGaGczbmpkdENYbWFWQlR2WUQ1MUp0ejBsWEM0dVFuN1EzZVdoT1dzMStx?=
 =?utf-8?B?cGtMNkJUMFJuQUFydm9aOE53V1VYcWhYZU91djRiTll0ZkpDckV1c2JzS1hE?=
 =?utf-8?B?NmZUY2RLZFR5Mm1Va1VOUHpHalh5SDd6ZWNnNDNub1ZwK3Byc1ZxblNvY0xI?=
 =?utf-8?B?Tlc5aUwwb0h6QVBLNUkvVXl4SjRBVHdSc1RPU2xkWlFHMmdkdlFQV0xRdktZ?=
 =?utf-8?B?ZHY1ajYvVitMemVpN1ljeFBYMGx5Y1dPVHU4cEkxRldQOHFWcjd1eEpRVStq?=
 =?utf-8?B?UDlHNmtwcG91YnpheGU5dUJ5V3hzKzF1TGFLNHZqcWJJc0hPLzBsQXUwZ2V6?=
 =?utf-8?B?UmZlK2hBQXg5akloUjQyMytKbjRySmZ2emZpZnBpeUF3K3IzZkZFSm1icjdJ?=
 =?utf-8?B?Umc5OCtHd3I4WmNVU0tBTmJHZ1dPMnI0ejl5czY0cFdHMWpiTHlET2NpUGhu?=
 =?utf-8?B?SWd4UHlLeWFrL1dmTGhDN0YzV1ZlOFNBWHFVMGxxOEhJaUF6VEJEVFVraVJF?=
 =?utf-8?B?STE5RE9DVFdPSU5EZnA4aXo5Q2FPQ1JGSVZQUWZEWWlmM1p4MjdoNElOQVhw?=
 =?utf-8?B?QjgzVkhaM2lUNGg3QzVhZEZYei9MMmd2azRrMmY1VW9WeXo3ODAyYW02bnkz?=
 =?utf-8?B?eE1MQ2xuemh2UTh2aEVUdDMrU3VZNVNoQWtVRTd0aEVndUZRMk1XZlpjV0JN?=
 =?utf-8?B?NEVkU29ENUl6UGQ1R0dzY3l1eGQvSHBkaEdnYnpuYjFkTFErVHk4TDl0cEtH?=
 =?utf-8?B?Rm5ZZ3JjUm9XbFFvTjd0R1N3eURDSERpQ1NNVnhpdnI5ZDU5VmM4NHBkc3Zu?=
 =?utf-8?B?QnNmREZPWElRRmRTY0pyYjZnUTRTeHhhWDdBaEdIYnlUTTF1VGxaaGxqalBO?=
 =?utf-8?B?Q0VBcWZYSWE2amo0N2c0M1Y5cVVPQTFVZW5UdW8vRGNNUUJueGwyUml6dEg2?=
 =?utf-8?B?ZVRXb003UHNEOWpmMHFmNWp1bWtnRmxyMzlNTjdDYmpiRVJJdXRTTkVvQlgw?=
 =?utf-8?B?aGU4bkpZVGRva1RObkN4MlF3Tkc5dWxDcUNGcURPWm5FbFQ2cEYwbkdIS3hu?=
 =?utf-8?B?QnhjSTVtUkZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzQ3bHY1aVVIaEJlNVVsK1pJeHdUZTVNTDI0cnNuZXpjVUV4dXRPNGRQcWp2?=
 =?utf-8?B?U1VIalpveDVxMnFEV1NTeXFzd0xEcXNIWjNRMkdmSzBUaXZVeGpmMlJYR05x?=
 =?utf-8?B?VlEzQW1KRTBiLzE4SFFGa2lxWTNJUzNCK0NnU1VlMklvSGp4TWdoRU94V3pp?=
 =?utf-8?B?M0RQL1YwWnBRZnRzT0cxSFNLOFlJRy9nU0lyUkJ2NDk2TnlzUXBJbnR4L3pu?=
 =?utf-8?B?d25iUFIrbEc0MEtFR2EvUmdGNUk0c05mKzZWVHBraXJPbkFQTy9rNy82NVBy?=
 =?utf-8?B?TFhoUGtKYnkwWHpvd2poOFBiWXcwcC9kNXdYNW1VbVM1WjNBcUVaQlZkK0Qx?=
 =?utf-8?B?NWRqVmh4L1NOb3lleWQwUWJzc3ltTVNHczNOY3IxZVdxZ3NXUVRnS0xSOWh4?=
 =?utf-8?B?eHB1Qkt6bTZzVVhpczJGTDR0ZllxRzVJdWEyNHJZL2h4L3VyRVliajYxQmJq?=
 =?utf-8?B?U25JV25obUNucnNGQTR0QzV4d29EZjNpNmVBMEZ6N21wMFg5SCtEY1hGNG9M?=
 =?utf-8?B?S0F1K0NTbzNsRVZkc0tQdmNXeEJQRjZCcDZ2aTY2ODQ5TFMraWNwdlQ4Smlk?=
 =?utf-8?B?aUM5T3NBV1gwQnFEQ2h0T2tsYUM5ZlRvVzRrRElMRWVaM24za0NWbUxwZHRh?=
 =?utf-8?B?azVLcGtkellqQ1JPaHdjQWJEem1Ma2ExdUR1cTVGSzNUTitvRUpJWmF5QkVM?=
 =?utf-8?B?NzVCN3pjdndLNUxaUld1U0pnalJZVFczN3Z6UWVVdkd3WlZqOStKWTB0ZE9G?=
 =?utf-8?B?M1FQQ0FQTS9KUEpvMENBMlBxNnplaWFYeUltOUZCbmFOdk9QR1IrMis0ZHFF?=
 =?utf-8?B?RWgybjZaRVdnWnI1T3lFMEV5QlRPMlhoRDY0S3cxWDdrdzIvcnJ0VXY2Z2tW?=
 =?utf-8?B?RnNaczVNbGVCWXJ6bnMrMmw1cjM0OGdUTGc1cWRGd2FCVHFaWWlKRXJhM24w?=
 =?utf-8?B?eURDcWYxdUYzMmRsR3NJMlY2SVF3aXc1cFBZeFpacElEWGxVZ1VkOUw1ZHdN?=
 =?utf-8?B?RUtHOXRMMHBrVUN2K2V0cnl3amlhMWtSOG1SdmNlanptQjFKdmxJSGFpajF6?=
 =?utf-8?B?SDNlTEk2aXQyNmRScDRxR2YySG1GRlVMME43ck9ZNFBCd1p4MXY3OGdCMlMz?=
 =?utf-8?B?UjVPTHVKVGkwVXVMQVR3ZVZKY1ZnYzJrOWFkT3R1eE5DaE9ZWExXclJjUlc3?=
 =?utf-8?B?ZTNjam5ZazVYcE5pQ0k5RU90VmF4WnM5b1BBRW1VS001Wk9ueDc4ZURnTnk5?=
 =?utf-8?B?LzlrOElGVWZ0ZEp0WjdHZkVWckQ5TlQ1OFZmWUxiV1Bzc3BmRG83bWx3QjZw?=
 =?utf-8?B?aytFZk11Z1p2ajNCalNCVFRacVdvR09Wa0tSOVJCQWh5WWVYQmpIcmZuN3pM?=
 =?utf-8?B?TkJlR052NkllamprL2NteEliOStteFc4ckRjMjdKcDBkSHZtZzEvQXNkWEh3?=
 =?utf-8?B?QXNtZ0d6M3AxWDBOWGNJSkVXbU9GS2pBZXJ2TmxNMDNJRklKajlJbTRPUEZR?=
 =?utf-8?B?NFJRN004VjZ0MEVvM1hjN2N2OHpGTVc4UmlwVzRkaDdPRW9DYzlHbmVrcVQz?=
 =?utf-8?B?bGJoZEpqRUt6QU9zZVFmV1VSRGNhK25vekN4Vm1oRGkxWU8wTVhSVGNpZGZF?=
 =?utf-8?B?NVlDY1cwcHdYU01BSGRsS0IxdjBaTHByZkowMHovYjZLcWVSTkJxUjhpVHF3?=
 =?utf-8?B?T0p4S0laeUJvdjRwejYxUnM1VkozTFNTenZsOXozYWtSTVlIdFh2S21ENU55?=
 =?utf-8?B?RG5sMytvanB1bUpLN2pWUVVBVUFSQUlNdWZ6TFJBdGs4K1lTUEdNWmY5V2NK?=
 =?utf-8?B?S05lZzE1alUxb1RFdHFsOHpMaWtKK3VNOWhmOW93bnFibXZ1QThXU1hWNXJS?=
 =?utf-8?B?L0ZRMFFscWRFSU1IcU9XM3pxVjFpdWV2cDdFeXBvVGdaWlR4TDZrdlFSVkFC?=
 =?utf-8?B?Wjk5d2F5bndTVENyak1RK1BWNnF4SmQ5T2Y2Tk9VN2Z6ZGkvTUFQYVAxYzlk?=
 =?utf-8?B?akd4WEI1MTJ3RUlvK2NiNjJUZUNlY3doRGtUWm9pL1BRVmp4N0hCVXFqdElm?=
 =?utf-8?B?Sm1nK2l1aHJUWmd1TlpvZ3A4VnJMTTdOc01JeStWZUxMRURranloVjg5bGZW?=
 =?utf-8?Q?Hk7WJql7J3TNiWbxTET4d/4+9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a8cd6b-c1ee-43a9-c244-08ddddeaadbe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 00:03:36.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K54tuwDZlzhG4vrupHp8KZ2SWy4nnfsR0pc8iPDST9cDws1bMFT723SI+IplszgJnG3+Fc1V9Ld40larEk9GFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 8/6/25 06:41, Liao Yuanhong wrote:
> Replace the original swapping logic with swap() to improve readability and
> remove temporary variables
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> index 5f1b49a50049..4cfe64aa8492 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> @@ -473,7 +473,6 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
>   {
>   	bool sorted, swapped;
>   	unsigned int cur_index;
> -	unsigned int temp;
>   	int odm_slice_index;
>   
>   	for (odm_slice_index = 0; odm_slice_index < pipes->num_pipes_assigned_to_plane_for_odm_combine; odm_slice_index++) {
> @@ -489,9 +488,8 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
>   		swapped = false;
>   		while (!sorted) {
>   			if (pipes->pipes_assigned_to_plane[odm_slice_index][cur_index] > pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1]) {
> -				temp = pipes->pipes_assigned_to_plane[odm_slice_index][cur_index];
> -				pipes->pipes_assigned_to_plane[odm_slice_index][cur_index] = pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1];
> -				pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1] = temp;
> +				swap(pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1],
> +					 pipes->pipes_assigned_to_plane[odm_slice_index][cur_index]);
>   
>   				swapped = true;
>   			}

