Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5EAE6551
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE1310E588;
	Tue, 24 Jun 2025 12:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c/gJKeD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1010E587;
 Tue, 24 Jun 2025 12:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHE0HELNym+IWXuZ2teXfwWt5MrpWdNpz2THAPy+lPVqMOZZ0aOvR0htwJ5Q0PTvX3d/bPuuoznrBndxjG9KCBljXHUTrQLVNoFTn2+XG9FvCEqxPxXqFaa1iL8kX66SUN7QoQ8T1sgj7F7vTTqL6bQ5q2EzQgQcOmvRw9RAoNmVuImxh0x6/czER3nP2Fz/lkc9kQ30alE4lMnXGB9xcB9tNWS7z2HxAUSZtZG+yG4EUIZ4GvGcGRneJ1GMy103d2bpxHfpLHj68CRs6dmvz+0GcRy1dpswVVj/WjWT+49lccsly5JvVRJonMW/aEQbmgmSm8iHV+2eZyZBU0E1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzAeFroxpj4hg6f+/wJekLqZk80+xVyZ2ZcLYVjoZc0=;
 b=wQ+Wkt9DUnGwb0IH278v9m/Xfh0mf7a9i1p3OkXF8gutvj+TpeYJhBKEQD5CuU+whme6cKw/ZXIyGASfnUAfZNQTMN0FJRx6pexk+dX0TdURy7SPB9dGKsfSWyhStw78VsVAAP7Z5cXCLuzZJElqgvYjTRdZpgXifshpSByOArbgtx1GqlRDBpCp2hP044BRjpf+vma5WbSLWS7aocFcmVTJgmTqVG2Lulu7z9I2cG4DHc9RMK6ZKvX8/zq9/ROeKZiavUUnOs49lGJi4MZjUQH8cRK1faVzAuMhhind/N0dw1tY0mX0VYDKdc+Z/xcAYe0jqWWgA6bIAx9ZQHV1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzAeFroxpj4hg6f+/wJekLqZk80+xVyZ2ZcLYVjoZc0=;
 b=c/gJKeD61cAHx5AQpEahTK0PWjiZ+n0uXJSOmyk2skU4MKleogz4egUrpPGG3LZwL/XmCFSjIUZ+m1eCafUpRMWd6oSG3Gwz3UXiWWbfT4rS9S9qa4PspcJCPA6tAUEHCR/r/qBoWT8zMu0lGa4HS+1AsdUKKjqg+F95mfi8J8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Tue, 24 Jun
 2025 12:46:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:46:05 +0000
Message-ID: <767ca7a5-0450-4697-b35a-4c6fce58a3ea@amd.com>
Date: Tue, 24 Jun 2025 14:45:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Dirty cleared blocks on free
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: matthew.auld@intel.com, alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 59793247-efaf-41ba-dbdd-08ddb31d1556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clltNFI4a1lhRkh0QkoxMWRXelF1ZlROM2J0dk1RTU9rQlZqY0VIbmNRd1dX?=
 =?utf-8?B?SjhabC9mNXN4d2dpM20wVXFibkY1SVVEd2pRcFBVQzA4NStPTUIzUjBxcW9Q?=
 =?utf-8?B?YzI4SWd6TDE1YU9EbWxKdVEvRXJmKzFyN3IyeUVIYkFkYWY0Z0ozbDB0aktM?=
 =?utf-8?B?OFkvUnMwbWlJbUFhVzNsQUVZTk50RzRnb2lIQ2xxeittSWRDMHRwbE9neG5t?=
 =?utf-8?B?ejd4TTRCV29uK0VHQ0dHUnRBZmxNSENYNlVYVWR2Y1JOdEd1Y2x1Mnd4Mmgx?=
 =?utf-8?B?TnRaRDBMd2IydlhzWjA4SE5KZFFZdC9UOU9NZDU3UXNXWW1Qc1prNm00UVNt?=
 =?utf-8?B?c3Q2VWFYVzMwTE9nNXF0TjZJV3lNV0NkTG84NWtjeG1OZUgyR0gxOWdrajV4?=
 =?utf-8?B?Unl3NFVaaWdnTGE2WlErblRCdVVTaWhXNzA3dHJoOGdzRU9rR3pTNmhEQWhj?=
 =?utf-8?B?Y0I0TWtOU1M0cXFmR2lVbWtRelpOK3Vqam5JU1c3OUVSWVFuRmhnaG9uNStt?=
 =?utf-8?B?dDFIalpvb204ZjMvQXZ2ekVhNGVpeUZZYVdXNlA2Y1pLUHhJbkgrb1luWmZZ?=
 =?utf-8?B?TGNFSmx4ZjVJMjFwOEtIZnpLVjVvRngvQzlMZnFUaXZsWUZCRXpjbjFmZkdX?=
 =?utf-8?B?Zjc2OEFSTkpCRDlTc2FCSjJTL1YzQmRwSXVPS0k0UFhDQWFSZlFJbFFrZ3hR?=
 =?utf-8?B?V3JkRUJGMlFNVTRSdy9zUUdzQ2xyNWNzelBLV1lCWUt4MVFSakU5bHpWSVli?=
 =?utf-8?B?U3NSSlVqWWJLeUdpRm9DTVltQ2ZaMWZBTFRZSnVMS3EvMnlWVzh0eTNteTlp?=
 =?utf-8?B?WHluVUZidUIrcTlqUCtuNUVWUXM0UFpYR2d0a0dScXNWK0JaK3FNd0xOUVdU?=
 =?utf-8?B?d3BWaUNvUDFHK2VxRnBLZDQxdUR0cTNGR2NQT1U5MGNTdGp3T2xsQnRFdVhv?=
 =?utf-8?B?eDZuNWhkOHJrWlJPMlNyQUJhaXdDdE1NTHAwRUNqU1krUlJyTDlXNGxsdGlN?=
 =?utf-8?B?MHdYWmx6T3BVVHJaVXJuZyt2NWJMUSt5aXNFbVFaVndUb01ndkx0RmdHK1o1?=
 =?utf-8?B?YitwRUx5SEEvQnBEZDM2Qkplb0V4WXMwN3h4dm55U2RkRzFJamRPdlRnWmFI?=
 =?utf-8?B?WEYvTkk5K1JjVDRwZTJZRGh5amp0bThndHdoRXE1WkhvZ09qKzVNNVhMbHp3?=
 =?utf-8?B?ZXprc3h0UzRleU8xQXBScmxEbkRMcURYVTNRajhJWEtHS0NMVE1NZjBGMlhs?=
 =?utf-8?B?dmt3ZnArektxdFAvU1VBNWdFaTlBT0VwR0ZVRE9nZEl3Q082bVNuMmxKL2w4?=
 =?utf-8?B?MytJT1daWmZ0NFY3Z1pZdmNZczFWMXI4UHYzUlJQWUNBNlArOUt3WUdNcGJw?=
 =?utf-8?B?b2JIZS9uQlhucFlYTC9ORm1BWVlDTG1MdG5iaXlhMVNMOWFZOGRQclpsQkpY?=
 =?utf-8?B?MHVINi9VSjdXRGZkdFR0TFA2NDJmeHVQaTJOdWxoSU5lalJxa29yS1BLZFpE?=
 =?utf-8?B?UHI5UmxmVE5JeHBCdHgydSsxcWJXUXZ3SWJXVEpaQVBkcjNrZmxOVC9NVnhN?=
 =?utf-8?B?OEh3aXdMR09OU2VuRTdsUzhSUFZSZStqVHFFdG9YUjlkcE4yeU54UzlXUm9k?=
 =?utf-8?B?eVoyOFg5Q1FlRW5ja1N2QlhlZ1BNaHd5QjVPYWxoQm83bHNkUEcyR01KNzBn?=
 =?utf-8?B?UjdkRzE2UU1LU3p1UEcwRTB4c2JBZi85NXBaVVdkdzVvZ3NUQWJVV0RHcEdp?=
 =?utf-8?B?c1I0K0FBVlE1a05kakwzTVY2Wmc1VkV3WVNrWUpOWWFoZHFIOHBObEhFMkN1?=
 =?utf-8?B?eExJbXlDMHljQkZqdW15bnZ5VTJDRlo0UjFMbnhtRDR6SUxqc3c2T0ZWb0Zv?=
 =?utf-8?B?RHJWanY2eURhNGtpMlZRcjZLWDBIT2VXc2ZtSjdjN0k0cmhJTnJ1aHoxUUtr?=
 =?utf-8?Q?wYC8gZMYG3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlppOXI2ZzY0Z3B6cDUxL2NuV1hLOWtvNGprQWdiWTIxeHpoNUhLVzZrU0dZ?=
 =?utf-8?B?ZVpZZmJkci9FaE5PY3pMZnFLVGlsRmZ6cVFxdytxVFRNTnMzbitxR2twZW9m?=
 =?utf-8?B?UTUrcWs2bXJaaDVCUmw5UkZsVTlmRktxOEpRbndqSGJ5WHpvK1BUWUpSU0Jn?=
 =?utf-8?B?Wm9aQTNKdGV1cFJOTjRkVHkvZ0RId3BLZXBCM25ld3gzOUpCczVLalRvS2NZ?=
 =?utf-8?B?L08xY0lJdkZGbWZuYkg4R1gwbEx0cG5WdXBwQURXY0RUYUxXUUtMWEx1c1lN?=
 =?utf-8?B?a0RaM0hrOFYyd0FJQTRNbWpCWFJ3bU1TRC92QVBDTXF0aEFYYlFKQzBYUjBl?=
 =?utf-8?B?dU9rNURMWGRkZ0U0OXBFT0hLR1F6T0JnZzZoVkt1cHEwbDFhVmJlQnNCY3ND?=
 =?utf-8?B?b2FVakZOR1RzWWlnbUM0Y3g1WS9pRTBkZzhqN2NIVkh2RmFjK3FrWWNCT01F?=
 =?utf-8?B?aUtkemk3eWFZK0FveE5iODNCMjVqbDlEbWMwT3lIa3RBdUNjY1hKL2dwRXVF?=
 =?utf-8?B?M0lxU0I2T3oxTnVMWWo3bE5uRXFNWkVGSFFLNnlHemRxaEtISitvNS9pMjRX?=
 =?utf-8?B?d2Q4SHBXekRwWitnaG0wSFdWWEZTR3JkSWc3NmsveFlOT1BMdWkzOHFDMFZx?=
 =?utf-8?B?b0dVSVBIL3BMcFFxcG0zMjdBMTAyMHQ4cTBScW1xSkxrOHd1SXZKZEJNOFk3?=
 =?utf-8?B?aW5MQStBbzE0aXUvekNzbGRWdFdzZ3diSVA3cHNIVmZycVN0WFpCeE9ISGds?=
 =?utf-8?B?dG41dUNGM2FvcE10S1dEdlBWYnNRSXR4ZjRBeHUyeUppUCszR01tbXdycHh0?=
 =?utf-8?B?ZnBjUnBRMTA5NWtRRTVCRGNtZFBZMmpObitCaXZKSVZOeUx3Q1Vhb0JrSTBN?=
 =?utf-8?B?WHJ4dmd3cW5TdFRlM0Z5bzl4VEE5aC9vdDVVdDZ4STRMNVJ1RUFxYk56aEhT?=
 =?utf-8?B?TWVLb3NPNFpud3FOM0pnQkRybTByTmUwMUdtd1RJaCtjNGlPU2VpVXltcDFF?=
 =?utf-8?B?T0JwOXNuT0hkVnJvNGM4TFVKaG1pdmF6cVd5Y1BhTHNldHdzQTl4U2ZMaklM?=
 =?utf-8?B?SXQrTkF1bnRkWmM2S2tpWkhDRGtUcnN0SndBd0NTbU4yZFM5M1VSYWtMS3Bx?=
 =?utf-8?B?SXRuVjR5RDJOYTUzV2hxbm5SdmtzVi95YWdGSk5LNytBNmZqNC9kNUloNGVn?=
 =?utf-8?B?UUt6MHNVQVJlVDFNV3hUZ0Z4RUowa29helNmMUZmRWhUaHFlcXBkaTlac0lz?=
 =?utf-8?B?NDRVc0F0L1c3MXdtRHBRcXZUQkhpUnc5RHc2WWxHb1Y3eDBLdXNmMUxnRUVn?=
 =?utf-8?B?Z2RvK3JhekhtQ1BWRnFIdlRTVFRZNE1abDBGVTY1Q0xCR2NuR3RqbVRBeVJX?=
 =?utf-8?B?ZGg3U0pvREg4b3BSeVRocjdNeDRKSDFYa1QvODR6dGxBaVQ2c08rcEVpbUZD?=
 =?utf-8?B?NmFoS1AxZUh2UFlXMWFjR1lRaDRjczFIbUdob1BIYldzNmlTUTJXMUwrSWVH?=
 =?utf-8?B?ZVhXREdXQkEwbzE3VWRzN2Yzb2FjSEhZMnNiVWY4Nmg1WDVaN1ZYVWdFc09G?=
 =?utf-8?B?aWxOeUlKRjQybUFZWFpVTUpJcnhUUnB1bmN3dW5nUkN0cGlzaWkvQmFtTlVK?=
 =?utf-8?B?K2xaeG5JZUZJbUZ1YUFZREZWUEZ1Smt4U0o0WVRpejJqcFMrck0vWmtnYTdo?=
 =?utf-8?B?UFBwaXAxcEFFMWQ0UTZhdGVXMFhGREtiU0pUVFJmRVJjVmVMUUdORXZBcFJy?=
 =?utf-8?B?ckFmZHEwNSs0TVl3ODV5SFRnb3FWRVQvMnVBT1N0cldFMlJ3TzJYNkZ3N1lV?=
 =?utf-8?B?Mzc0WllKUWlUTnZaWnRDbGxKQTgzYWtRVG1kTmVRdGxZNGNpeVh0NTJnM3kx?=
 =?utf-8?B?THVOVHJrQkhYV3VTYzNVNzllMk5tN0hTVFVqTllNYXgxc3pDZmp2UE90UHJU?=
 =?utf-8?B?VGVycUhhMzBxTjhZZTVNNFd0eXd3SjlIRVNwRkg0bjVjU25aNDBEbVFOdUNk?=
 =?utf-8?B?aXJjM0I5V2QxQndVTVdwQ2tSUWltWWtEcUsvZTV2UDlzd3UvOTlDbkJVQSt2?=
 =?utf-8?B?OXREQ3pOazZaRUhycnZkMmdReGp1ZG9rN3E0Q2Ztc0c1TnN4Ykx6UG9GZ3Y5?=
 =?utf-8?Q?dMgMQQoA3JC6oBh8Q/5U1NfNk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59793247-efaf-41ba-dbdd-08ddb31d1556
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:46:05.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbl8wV8B5PosthjH0TTHQhAD19X5rmPCP7XMCIZSlnyRIr4ViCfriGpIW9kl6erw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

On 23.06.25 07:52, Arunpravin Paneer Selvam wrote:
> Set the dirty bit when the memory resource is not cleared
> during BO release.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 26 ++++++++++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  7 ++++--
>  3 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 73403744331a..ea6ce53c3a44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1302,28 +1302,40 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	 * So when this locking here fails something is wrong with the reference
>  	 * counting.
>  	 */
> -	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv)))
> +	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv))) {
> +		if (bo->resource && bo->resource->mem_type == TTM_PL_VRAM)
> +			amdgpu_vram_mgr_set_clear_state(bo->resource, false);

As far as I can see this is illegal while the BO is not locked, so please drop that.

> +
>  		return;
> +	}
>  
>  	amdgpu_amdkfd_remove_all_eviction_fences(abo);
>  
> -	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
> -	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
> -	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
> +	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM)
>  		goto out;
>  
> +	if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
> +	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
> +		goto out_clear_err;
> +
>  	r = dma_resv_reserve_fences(&bo->base._resv, 1);
>  	if (r)
> -		goto out;
> +		goto out_clear_err;
>  
>  	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
>  	if (WARN_ON(r))
> -		goto out;
> +		goto out_clear_err;
>  
> -	amdgpu_vram_mgr_set_cleared(bo->resource);
> +	amdgpu_vram_mgr_set_clear_state(bo->resource, true);
>  	dma_resv_add_fence(&bo->base._resv, fence, DMA_RESV_USAGE_KERNEL);
>  	dma_fence_put(fence);
>  
> +	dma_resv_unlock(&bo->base._resv);
> +
> +	return;
> +
> +out_clear_err:
> +	amdgpu_vram_mgr_set_clear_state(bo->resource, false);

As far as I can see that is actually not a good idea. The cleared flag should not be set here in the first place.

>  out:
>  	dma_resv_unlock(&bo->base._resv);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9c5df35f05b7..9ec14ab900f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -407,9 +407,10 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>  				       false);
>  		if (r) {
> +			amdgpu_vram_mgr_set_clear_state(bo->resource, false);
>  			goto error;
>  		} else if (wipe_fence) {
> -			amdgpu_vram_mgr_set_cleared(bo->resource);
> +			amdgpu_vram_mgr_set_clear_state(bo->resource, true);
>  			dma_fence_put(fence);
>  			fence = wipe_fence;
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index b256cbc2bc27..1019c5806ec7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -64,9 +64,12 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>  	return container_of(res, struct amdgpu_vram_mgr_resource, base);
>  }
>  
> -static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
> +static inline void amdgpu_vram_mgr_set_clear_state(struct ttm_resource *res, bool is_clear)
>  {
> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> +	if (is_clear)
> +		to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> +	else
> +		to_amdgpu_vram_mgr_resource(res)->flags &= ~DRM_BUDDY_CLEARED;


Rather code this here like:

struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);

WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
ares->flags |= DRM_BUDDY_CLEARED;

Regards,
Christian.

>  }
>  
>  #endif

