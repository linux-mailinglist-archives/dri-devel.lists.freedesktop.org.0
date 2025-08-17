Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A278EB295BF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 01:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BB610E182;
	Sun, 17 Aug 2025 23:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S8CuU+ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D6310E088;
 Sun, 17 Aug 2025 23:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/U7l0R6HSNA5AfSJkqhFk+JEY/e0ZnP43l6XZB1q7CeGKOR+K33AP5Z2wRhdhzeWxOwqmqf3ZUWoo3yi2E6TMk2wokErFMX373In+dzD2O2S5boPGrzTlCNDO+u+UuFhXrOzy3iGNm+wczslcJDT3yB2s3mEqVFzzgg9pCGTVFpWlTlH+3Cyl/DBBjwKLV3ysdLWYPIOTa31JnF8P5Pa73vjlIdl0eiEqKC2H3SpkIwW1WXoF7d+Xk1X+AY8vFDMdHb9Ep1gGJLqQ8yza32N13BzCjp4BjOzzSCPM4XtgbEdfd1SjjeVupHjMKdCgyVJ+Y31mpMcdqieFdCUnc1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXn6Bi7AZXyAcotQSi7ATkh7BOdJJGGX6MchlUf+RS8=;
 b=xZCoIis5HcD0wU4yOzFSo7w4R1hBKLDVhd/5O4Oht5n3PhuquaVrkCrfdhtJkVo+c/wP30p+BTvLRGdDj8r0cFbhQ2aAX/wS/7E9nvWqaSyENRct1sUfdHpHpEq+79uNNyyUxWZTK6ivjGQKs0JEHIE5quLwzNvqppJuQh2k1e7I4/y2ejUrye2E9H1DtgU2iTASSUg5A9d0msykCgGoPyhYcOPjM90OyFg2r8J5wE0W6ikG70kNo4V296IqCrGiJTSm2QcOPPImUCY8CIm00GI6PT+x86FPnus2F8YxPwAwe+r2ObWFjMk5+4owr9PPvT6ptz/tsbZUJVKObt7edA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXn6Bi7AZXyAcotQSi7ATkh7BOdJJGGX6MchlUf+RS8=;
 b=S8CuU+icOSdxmS0VnawpOtbJ+vhDGeWLeAAHWuJLW3svdlWCP6Hm9CdCMQE+1hoXeT9fi3j/HftZo/GiuDccokY1MZF5qhwGwz8PcTE2YLvwu3vjyiZU7tkYIESumoI3qlEgakcjAeaC5SwryXJMBVUTgVTyNczFhEyADWQbUyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 23:57:54 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.019; Sun, 17 Aug 2025
 23:57:53 +0000
Message-ID: <647d318e-b0f7-436d-84b1-eae2687932d4@amd.com>
Date: Sun, 17 Aug 2025 17:57:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Add null pointer check in
 mod_hdcp_hdcp1_create_session()
To: Chenyuan Yang <chenyuan0y@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com
Cc: siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, vulab@iscas.ac.cn, Wenjing.Liu@amd.com,
 isabel.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250724023641.1258831-1-chenyuan0y@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250724023641.1258831-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc5337-2243-4ab3-8bc3-08dddde9e14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlpkNDlkdlcrVGVZTlFHZitTYW1EdGhSU1V1a3NCSnIyNDRHVVBNYXNoc3BU?=
 =?utf-8?B?bVdJOHowRCtNRGpROXdnYjRuSndkYWxLUVgwNFBjbVBtVFMxTmhxU2R5N05Y?=
 =?utf-8?B?NWdEREpQd3JOOVZHUEdCRzJmSVUrQmU3cXJmOFMxV2d2dXlpZU1JeC85bE54?=
 =?utf-8?B?akFZYXBuY1gxNGhnKzhMc0FzclJoQmYxV051cGdIaUhQTXlvUURJWTcrMXFV?=
 =?utf-8?B?ckFYL2VZOE1XSVFaNGdFemtBYXdaSjlQbFdxZnRNeUxTR0JmTnZvbko4SE9s?=
 =?utf-8?B?RGZHTURoRmxvTWNHM2xvQUZTQ1ZqMnVYd0I1WjZSeXZ0R0hLdm5VZWUwNUUx?=
 =?utf-8?B?SU9iMmdMdi8zdjA5VHUwS1ViSUw2bjZaL2lkYVBleCtPYmZVdHg1ZUQyNENo?=
 =?utf-8?B?eFpJNzVRKy9TQjJiQkJmOFFISzczMnowdjNsQmUyellmY2VTQzY4N2Jydytk?=
 =?utf-8?B?MFpVK0tCdUxKNkdVNXhkSkYyRlppVjlvblc2VGdBUVpIcG5LWkd5blRpaFRu?=
 =?utf-8?B?bDJUR1BacUlHWFNqUXRobTl0SWNVNjNxY083VkpjTWhQSFJPQnIxaWRVbElp?=
 =?utf-8?B?MS9meEI3ckVWaDlhV0pBYkFla3dIZ2xRNmdncUFNTlEyZzB4MXF6eHJhKzF1?=
 =?utf-8?B?d29XY3h5SllKQVJ3TXZGZFBKcTlBZm50OUxQTU83RzBqajNEYlJtSlZMRnZV?=
 =?utf-8?B?KzZIaU5Xc0NaN0hhY3hJSTd6SjhzK21YUEpuT2JEaVJpQ3EvclY4eGZsQmhq?=
 =?utf-8?B?MUREOW5kQW9IVXY5dGpnZ2JWQnYvTzVWVjdMOVh1NjdJRmltS3ZVT2tsOWlL?=
 =?utf-8?B?ZlpIZnFRNk1iMW1GTGlLWmZscmtWejlxT2VyNEpsRllRbWdTVlFrTXc0TkhO?=
 =?utf-8?B?YUpPMC8zRm9sQ2xBdkdNa1RjaVdBcXlQeld0L21ad3NwMkx3WjFJWFRVRnBn?=
 =?utf-8?B?VE16NndOVVFEM210SnBwMm9Zb1MySkhQcm9XQWQ0dEY5QXU2b2hkSk1OM1FE?=
 =?utf-8?B?aWpEcGR4QTJhTEVEQTl5dkNhWExiQnBNVzM4eVptWlA2aDQyUkxFTytvelh2?=
 =?utf-8?B?bXR5ZWhWcjhRcE1rSXdGcEgxbzNZT1hFK1pCVGh3TSs2cUdJOGp4OTdHZnhR?=
 =?utf-8?B?eXFlSjQrU1ZSSWxyc0p1TW9qYk5WMHpRVXA2WDROSFo1NEFGcmw5Nkx6Qm5X?=
 =?utf-8?B?eUZVcmozRjVUVzJiV044ZDVqdVg2TVdBSEtQdnNFZ0Z2T24xUHB5RGtENGJu?=
 =?utf-8?B?WkVpV3Qzd25zdklxWEgvSjFqODhGUXJ3cTM4UXFJNkwwV080VUl2ZWZJZEcr?=
 =?utf-8?B?bEN4K2E0WC9Sb3p6cFh4dkptNmZjOElZdnNjekh6V20xOUtIZU5sQlRZc0lH?=
 =?utf-8?B?dlVtdDhXbjJuSjA0NW1icFJzVG1sZTVLZWkwRmZpMDJRcld5WGtwbVNUM1JO?=
 =?utf-8?B?SkNOVDdtYXNUOVNNL1g1dEpNWGlxRU5ITEdHZDZLcm9OUjQzWW1UOUh1WHFN?=
 =?utf-8?B?UGYxOVBnQ05KZURaTGR3emZXcUprV3B0cjdYMmlXWkZtdFVYYmhBN3dYNEV2?=
 =?utf-8?B?NnNXRlpYeEowd1Y3eXFpTUhFY2E1VjV4dDFacEhLYkd6N1QvSXhmakZVWlZh?=
 =?utf-8?B?ODNqZ2J1WDFKRXR6OG9XZERjcWxvTEZ2NlhJWTlkbUN6d0lvQ05Ra3kxRHB0?=
 =?utf-8?B?QzNrVDlCc0RyWlhuZGExaDl2aHczR1k2Wk5UMU9vNmRudEZDcEZIaXJoNm1Z?=
 =?utf-8?B?RWRhSzdpRTRDYkFvWjJoUERiMHR2SzIvRE5hdy9ma3ZiQ1R0RHNnbEwvdkFl?=
 =?utf-8?B?VUd4QjRGMGYwWlZzQS9IdzNJcVZQN2FTdXlPTm9mUkNySlIxY21IV1NLMVZZ?=
 =?utf-8?B?TGNxNW8zSVQ1cEc4YTNIQVNNWUtVbjlhTDVselNsQml3QWRwd2lJYXEvQldl?=
 =?utf-8?Q?MVUybGuQK6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBJZ3hFT0VsOGtuT2V5bWFRaVRKZ0tMdCtQK0ZCUFhRNzQzZkNRaG5ndTVW?=
 =?utf-8?B?QWtqSTRCSC90OHdROXVlY01seGoxOWpBdGFVVXpQemxCOGt1alNIUmJCaUR6?=
 =?utf-8?B?MFYvUWY3cEhYNzlWbXdRUHJPZmZLQTZ3dVhZZHFobU1RMmNYUVFYcm54VmNm?=
 =?utf-8?B?dUpjM3hDWk04RkhxbDUvbUlKYjBETFA2amJkdm13QmhqZ1E3L2dVbkpZWk1j?=
 =?utf-8?B?Ri94MUhYSDAyaEsyMysrMGFDYlkxYkxjaXZxUXRnT3R5STZMMlpEUG1aZHcy?=
 =?utf-8?B?bGJPd1JNcWwzdDM2azJsa3gvazNjaHZQOThHcVVvaHg3eGFwL2Z2TWhMeWF1?=
 =?utf-8?B?SkpqUDZGWEJMeTBWNXhIaEEybndhYXlwbUFrQnlyb2tldDR0eERwM2hOY2Fr?=
 =?utf-8?B?UFU4QXViMDBjbHpKd2FXWHFPZFlWa3N4T3F5OFpyczZ2RkNON28wODdtLzNU?=
 =?utf-8?B?eEhtb3BVVEpBdU5SYldpU3EyRHVwYUlaOGU0cGZGVm1aaUU3SkFpQjVnZFlM?=
 =?utf-8?B?UEFJeHc2TUlacDNkM0hVai9GaEV3WTUzWmpQYlBRNXlLVlF4STRXNENhb2hj?=
 =?utf-8?B?a3lHNDFxd0U2eTljVnVPSnRlMzJZK2tybHBxNTdqNWMvK3JnaHpIOExmRTRu?=
 =?utf-8?B?N1FhYkRmMVF4K29XbktJL09PSXM2WHpPQXF0YlBFOXNQT0dGcHZTNXQraUU5?=
 =?utf-8?B?Vkh0aE13SUZqby82d1J0R1BUNjQ0a041VjJKVmlhWDg4U3h4aGdmd3A4OFJa?=
 =?utf-8?B?T0JIYnNXVmVYV3RNbW4wL1M1czRaM25HdVNoWmxaK0p2RVIxS0d0SXRSVlFj?=
 =?utf-8?B?azNMUUVFNlpvU2hYd0RzbHlEZitoWWdsdG52aWI3aS9LWnZ6VTc3T2dZWENG?=
 =?utf-8?B?cW1hZkFMZUFFUXFPbXR2V0NVMEZ3SmovaStPQ21Sa1N5N1ZoRTJQVmxXemNC?=
 =?utf-8?B?KzFlVHZGNkFrSWlINjNMYkNVblE3K1I3d2F4SWh1VWZHZ1UwWHJYRFRYbWdC?=
 =?utf-8?B?VG5DdHhTNW5ObWdqVlJDN0hTK1BuNThvSUFEcnFGQk9qOFJTUy9KLzdhRnJ6?=
 =?utf-8?B?aGRwbUVySkhKdm8vMDNrbVNlbjBrcFVqUzF2U2Fkc0tCYWJ1Mnh6cHdkaVE0?=
 =?utf-8?B?TTlNWTBRTGNmQ05jVEVLaW1QeHRZQkpyVThEMGdwckIranM4RnNDUktYZDg3?=
 =?utf-8?B?RnFSV0dqaS9QUDUybVAvbUlRUVNTbUJkSnhQaFp3RW5OZTJ3RzBhclNrTFFL?=
 =?utf-8?B?N3RKaVVTTGY0ek40dU5zWTA2bzlKTFhTemJUTkptbWNuZGMzRzVRNm00M292?=
 =?utf-8?B?YlVLMDRDQzRidE8vcXZDY0Mwd3pBN3o2bDJVakZ4ak5oclRtU2FZN214RUtR?=
 =?utf-8?B?L1A1em53UzlOTkZXMUI4VFdsWjBRSWJZQU1tRTRFRnMwZTFoWG1JazNtU1NX?=
 =?utf-8?B?NTM3bjBWU01mQnJBbnhpVUhFZ0JxRGR2cGZIT0NpdXBJaitGOGxlMmRRMzVx?=
 =?utf-8?B?VnAvOXpqS2ZHVmVLUFhpUGpyMkpETTA0ZDgwQmUrZ0tpNjdpb3pNTmFBNFFK?=
 =?utf-8?B?aWhQaVMyQ2xKQWZYT3hBVVBZZVI2TlBkdlZDdk9SVGQrNjUvVDN4SGZGZ2lZ?=
 =?utf-8?B?cTBielh1MCtNZW9aTUZiNEJHL0xRV1V5VGdGV05NTjhLY3dGd0JyUXFLMndU?=
 =?utf-8?B?U0J5Yzd1MzhpVEYybXZ4UnVYWU9LU2xoR052WTNBNzdvODJXc1hQR0VpTVRl?=
 =?utf-8?B?ek8xaUpRWFBhV1BIbVV4ZWVnZjRyelFZaEYxSHJRUXdiVWRSVm9ZeDhZdk1r?=
 =?utf-8?B?NE1mK2lCendpT2Vmd2VHSWJ1RHgzV3o1ZHkrSUMwRUEyUTQxR2NqS1pkSlZr?=
 =?utf-8?B?MlhyRldOa2hDVDdsQzVOdGFMdnBOa0xBRkpvcWhLS2lNc3p3aU1mMDV0cUpu?=
 =?utf-8?B?Z1N4R0NCTzRMTUVuWjRaOGtTQjdmZnkrSVE0QzM1NVZUcjNHeVNseUl3cmtQ?=
 =?utf-8?B?YWVkZEtSRVl0VW51dzdpZndmMHJQSHByaVhaUjRwQnFXMDY0dzc1TEx2RGUr?=
 =?utf-8?B?ejAxNmo4bXVKTGNDdGZycTVXMlFJTGwrQ25BemxrV1BSekRVY0E4R1M4clU0?=
 =?utf-8?Q?gCuH9iLWCU5BtQZTZeEZIwW78?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc5337-2243-4ab3-8bc3-08dddde9e14d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 23:57:53.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaxmnohfS1JA90pphp4S4nri0kwDi6ohG8iFGEg60x7y0FAKNsJdTvX24lpTsOQsHmMYzpIAD5SYUIQloBizmw==
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

On 7/23/25 20:36, Chenyuan Yang wrote:
> The function mod_hdcp_hdcp1_create_session() calls the function
> get_first_active_display(), but does not check its return value.
> The return value is a null pointer if the display list is empty.
> This will lead to a null pointer dereference.
> 
> Add a null pointer check for get_first_active_display() and return
> MOD_HDCP_STATUS_DISPLAY_NOT_FOUND if the function return null.
> 
> This is similar to the commit c3e9826a2202
> ("drm/amd/display: Add null pointer check for get_first_active_display()").
> 
> Fixes: 2deade5ede56 ("drm/amd/display: Remove hdcp display state with mst fix")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index e58e7b93810b..6b7db8ec9a53 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -260,6 +260,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
>   		return MOD_HDCP_STATUS_FAILURE;
>   	}
>   
> +	if (!display)
> +		return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
> +
>   	hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.context.mem_context.shared_buf;
>   
>   	mutex_lock(&psp->hdcp_context.mutex);

