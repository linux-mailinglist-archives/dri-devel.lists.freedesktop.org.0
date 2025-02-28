Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E05A4A0A8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0704410ED1E;
	Fri, 28 Feb 2025 17:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="KlUXyLNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2072.outbound.protection.outlook.com [40.107.105.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE4410ED1E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGBrk8Jym0CEcouUcsDHPnk3xRnz4VE+UXJXq+AxDI1oBfSMqia5uEA/zy4BeVLaVcee7PY51nmWzXZNLOYPUm+NBjmOklozf1Ep9CIjlbefOshlyNuQe30uCW4q0psVXJwl0giwRv6I7gV2qjkXZZS51ZuVjQOxQ/puP07zCX8auMoycv0J7o93wX0Njoy4IydVQV4QSZHXXRHrO4OlRf8K7YRf2xjdBuRx2pgCtVyBF/kJaKeQ+mLlVLMKKPoftACFq2KlkwHiZr8MSJMeE+P68Q7liw+GqPJFnXNbvn7mznQqrcHQZupmXD2pztgzLBBkAo1WHcrmsEUfIQOF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwFIJqZhw7Zjp4CUxUEC8Os5pZD550qehwXib2dXzLc=;
 b=qyGmmWzOWPTE3GJo0cZJjUBcqRR6akfqZxsJvdxrskergMuFXdqxH71I5m+Go97hHOITj2NNSmCuxuKZkDXeRZgpc6AK0NJMipuoxrrOqArUD0yjgbxPZMyNbNx0A6QmFJPf4OQKYrtysv49vWD877mAdqiFyObNWqEV/8nxh21GRuPM0fZOejMzpJKn/cGec9YVZ+C7HfLZCzKKiY4Oy0+y5RaTboHZoXVr7LuneN0bj3ssGWqw+Ld2pCPgTzdI5GGWkJLBjllof3ixlX334fw2dcuFB/VlG3mLw3N3kHrWC2ipquiAO1jUASbjrTsW0drzzJfFb2YADVHZIqqvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwFIJqZhw7Zjp4CUxUEC8Os5pZD550qehwXib2dXzLc=;
 b=KlUXyLNvjX5VfFpaBbJ6SahyTo/Xaf1+a046LkMgati5bPASNk3Pnn0UVrj60yoc5OBUcIHNuxvL8TN76A2gXi+ITc+5iBsbQnf0JnTIMjgcLKUDKjAuk0OEZGnvel/OdiPZVY8XH4gMrwEhxSKx7YmeaBFCW4XA/Or5N8BKLOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 17:42:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 17:42:33 +0000
Message-ID: <b09e5470-2392-4557-9f13-62b6586e5c7b@cherry.de>
Date: Fri, 28 Feb 2025 18:42:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250228165755.405138-1-heiko@sntech.de>
 <20250228165755.405138-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250228165755.405138-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e139fa-0bfd-4363-eb3c-08dd581f4805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzlvY1k2SW0xNWtEaGgyMUM5R1JTMVBsVDVDR2JHK3lFaHd2V2VvVWFOaEpH?=
 =?utf-8?B?Y1BRSGpMcGtwSGxWaGMvUEdSNXRKV3hTVlF4WCt6WUVQdFgzQlZpNkVXM0g3?=
 =?utf-8?B?UktPSlpHb2taRElsRFExaW9sQUpwUU11TC96b0xzdmdkY1phRFV0cnd6NHJn?=
 =?utf-8?B?YVF2V2ZTRGFsR1RSTjlSK01xTDVONGxKTDFLbmpWY2d6T2ltUUZUWUhkeCt5?=
 =?utf-8?B?cDRiNVlpUFBwdDBQODhNOHZoMmZIclMycU5WOXZnM0ljTXVaaGV0czJYZFpm?=
 =?utf-8?B?VWRJMnlwRnZGOGZYTmNQU29NUCtXWG1tRTRVdC9ucDh0bHduQ2NjN0F6WmMz?=
 =?utf-8?B?UGFhRGluNU9pNEFmVHZicFNoelhVRzJScGRjWTNBaTBteFVsRHVLOVVkZ3lL?=
 =?utf-8?B?OHJiVnFjZUNBU3hoOHBFS2FCZkZscFpKZmMzVHV0NllDQVNGUUJSV2JhMXRG?=
 =?utf-8?B?QU5Jb3NRTWtWT05rRTZTT3ZUQTQ5ZXE4a2dXaFlHd2VCTjl3Q0tmbGRaMlky?=
 =?utf-8?B?cUVBWUhKQmw1Ly81OG5KR05DTHhYTHhYLzg0RUUwMDJqT2hsb2xPRldqZDg1?=
 =?utf-8?B?M04yY3pZVTFNSFVOY3EvOCtOQThtMVVsdlZhY2FQdWJHQ3hvamNKOUpSNmVn?=
 =?utf-8?B?eVBOWExxR1UvQlJRNlpNRklvcHVTWENoYXU0VExhUTVNdzQrc1BBZDJqMzFS?=
 =?utf-8?B?ajVPVERQWmRMWXFhaWdQUjQ5R1A3bnlwdStTWXlBcWJ3L2YrSGdjSWcwRnZm?=
 =?utf-8?B?R0VvUFArMXcyY0F2MzNFaTB4N2Rqbk9lQ01JaGNLZ0FvQmR1dytNTEVZNGpW?=
 =?utf-8?B?ODMwOFFqT05hbkw2OG9tMkZyNFZIODJodWhzZGM0cDdiNVpPdlBPemFWU3dB?=
 =?utf-8?B?ck9aVVNqU0ZvL3hHVWFHOVBnOXdxcEFPRTJqQkMxM25tSTR4bVJzd3ZhZy9V?=
 =?utf-8?B?YWkzY21idzBEZm5WaE9nSEwyLzVBWXF6aHpPbFBoZUxLb2h2T0ZXSnRnV0tr?=
 =?utf-8?B?bytMU0RMeVNYdHppaHJpL3F1N3pGS1RkZzZLWElnTDJ0bUt5NkJoSjBEakZ4?=
 =?utf-8?B?QVFvc2diajQrVmJYOFh0dW5YOFFicVJsNkFjb05wYjN2QlFNaE1FdDJod1Nz?=
 =?utf-8?B?VnNXL0lmc2tLb050cGtFY0U3YTI2TUZlVHkvY29UOTdNalhJWmJ2dWRVcDBH?=
 =?utf-8?B?V04xaExhbTNJY09jeTAxQnVjK2MyOExCbGxNMEluRmIyWnBITUI1QzlvaUlw?=
 =?utf-8?B?ODNLZnlSaFpUNkIyN0s2eXdWZ05KNGdaRHpUcS9PaVN3NXBMVGVSQUZFM3p2?=
 =?utf-8?B?dDM3L2lueHEzU2FuVDdiS1FHQTZNMmhxMlVQWVBRS1JRcFUwc2hjN0xyRDdw?=
 =?utf-8?B?clFKK1U4YzIvclRNT3JxQmx4RnMyQXlpOE1UeUpvR2tSSms0ZW8yZVkxOFpY?=
 =?utf-8?B?MWtWYXpXcnlITi9BL1dMZTBEdnRaNUFrT3hEdEovR05IZzlYdVVsRlZXMmlB?=
 =?utf-8?B?SzA2M0xTbWNHV2t0SVh4NVBod2RHZjNIWE5qelN3d3VhY1FwWVUxYk96OEJV?=
 =?utf-8?B?NU9nTURZdFlmRWc1NVV6Y0pOZXBCbWtGMnRaQ0YyS0FhVjl4YVVMQk5SOERj?=
 =?utf-8?B?YlRQdmxheEx3Wk5OLzk0TXl6OTB2Sy9kcWVNTi9iUkJTWEp3U3JmbFlBbnFV?=
 =?utf-8?B?Q2FyZmJMYWc5NnlkV1NRUi9pVUx5K3ZyYnI2c25NM2NFUHVpQnc3aVpwaWo4?=
 =?utf-8?B?SUx2ZExtRzkyUmlPOVhWSkMvZ3ZRdHEzYWx2RmVGbjFQaXNncExiSGoyeEFk?=
 =?utf-8?B?aTBQTktrWlQzelRFMzJNRU01QlVwM0FLZldJSWlYUFVmc0hCd3dBaTd6MXpN?=
 =?utf-8?Q?WL4zmVMQgIR23?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXZwcHFqc0dTd2FiUGExRFFpZmxjVTFTc00xWjlBaDA3WnRoSEQvb05SU3Zs?=
 =?utf-8?B?VjNjdlhnTmFvQ3oyRWJiY2RvT2JGRFpPRGhRM1AyRjRSOUlQaWtPTzVreFIv?=
 =?utf-8?B?SWVwMnlrVG5aMnMrSHMyczd6dkFHYVIzWXdwb0t5NGxCS3BHb3lwSzBXNVdh?=
 =?utf-8?B?MHFwcVVQdGkxVEN0MVprS0ZGeGlWbm9aRlFTUm1CTURBTTc5aFMvbUJIclV5?=
 =?utf-8?B?a0xyZXNnTkRpWWJqVmJTRW56NFYyL1BYd2VxMXllZlA4eWlrVldOZnlWYjU1?=
 =?utf-8?B?dnVpckpDTUE1QUc1MUpmQjQ2c0VHRWg1dE5QOE1xZEp2Z1RHeXAwUldpNzlY?=
 =?utf-8?B?b2htNDhNS1hXcXJRNDQxWCtjcGlucnJNc0FOSEMyMksrQ1BEbUVHNFFiTVJC?=
 =?utf-8?B?OVMxeUcwMkJ0cTdZZTRjYmh3dU03TitQRVB4dFJCa0NhU0NYWUJURWR6VmF5?=
 =?utf-8?B?RDk2ZWdrOTlqdU5Gd3FLUzBWWDFqOXl5TXU0eHBKTFo2WmVPeFVEK2pneDUr?=
 =?utf-8?B?MjdETnArOVVZY05RYnRqcHpyeHgySG40bXhSbUExa1czWEpPV1RTa1h6aFBu?=
 =?utf-8?B?ZmFRNW8rSFoxOTg1WUd5RHlkS0FpU1VyZktRTzF0YUFSbzlJY0hQUkJGR3N4?=
 =?utf-8?B?TFB3ZFROR2VrMEZHZ3VwMm51SmpCMWhwcHVBdlhPQi9aTXdQSVlzdi84RDh0?=
 =?utf-8?B?cW9uQS9mWlhqTW1IejRXVUo5N0NHa2hDQU1JWHBJa3lMMjNvZzVUbVFqNFox?=
 =?utf-8?B?Rzk0U21IY0c2K1dyelFQcG5ITFh3VGVuZ2QzRFVlZU9FL1NWdTh6ejlYY3JV?=
 =?utf-8?B?WWtTYXRiaGVuODFWRmpLQ0c5ZFIzK3hUU0E5Q3kyaEUxVkwyTmhZUWNZZXo1?=
 =?utf-8?B?NDNjQWZCdm9OUno4QVlPTXg3VFdJN29uYUtMaTYzUmQ4bTRyb3F1RGlvemo0?=
 =?utf-8?B?V1ZlUUJtOVlEVDlQMTkxUUR1enpabWJXTmU4TUF0dlNoeVQzNTFxcHNORjdv?=
 =?utf-8?B?WEc1Rms5eWQwakxpWkpyOUhEc1hxU0JKOVc5WkpRa0kwUWFPazBnMWJtVzkx?=
 =?utf-8?B?UE1haldXYjhkVG0wZEx5MTc5WnJCbk1lenBtOVFmVlhjMTMrZmF5TkVWeUt6?=
 =?utf-8?B?a0lwRUcrdnB1bk5xVFRwa0ZoWWpRckVGekU3VGx1MFFxU044aVVLQUxkcDBC?=
 =?utf-8?B?d2ZaTHBVVlk3SENkVlFXaGNJaWpkNDNsMXRBYjNLa25uMm5WdVZaOThpRGhl?=
 =?utf-8?B?SDhZcGNUUHJhemxWQlhrNHhRaE8vcFIyekFIL01iOVpNNGFUU1ZwY0tWU0RR?=
 =?utf-8?B?RlRLaHdSRzhPa1U3ZTRSRWxZc1gzOWpQQ1Z5NlhtR1ZUdFJYelNySnZZaDN1?=
 =?utf-8?B?amg2cEY3TmZ6ZG5hSDk5RlBRNC9WaFk2cHVSOXlJSjREcXVBQTJyQ3Z6am9w?=
 =?utf-8?B?Y3hTVXhGS1VJM1lDYlk4SjNYUFltaUpBOWNpYnFIYllUR29EK2d1cHhkZW40?=
 =?utf-8?B?eG4yOG1tNkViZ1o0eFM3YmEwRUVRTytQb1NRZTJJWjlLemhjQld0VU9RbUNO?=
 =?utf-8?B?bUFaaVJvYlF3UFQzUVNMSWlHWW94eXhkTEw1d05nVDBiTHp1eVl5WlZyY08w?=
 =?utf-8?B?eHlXeVRjMnlVQXNoaU5LUHBwS0Vaayt1RW5xcXlyMFNzQjg3VVFWSTgzMDV3?=
 =?utf-8?B?MjUrZmlVNkJJTzFOcVdNMDlUblpqcGhHREJHZmw2ZVV3S1BiZE5JcTU5VnF3?=
 =?utf-8?B?MExLVnlGdGVEOXA3QmROQnhWMzdYaHU1bjQzV21sTW1Bdk5DeWZXam40TG5X?=
 =?utf-8?B?d1YzZ2IwQm1OZXlCNm9JVmdhN3cya2hJNlZ0eCtDUTcrSS9RYkNBZURsMk0v?=
 =?utf-8?B?UW1aQzU3VHlRTWdCT3ZFaTF4VUpJRlZ0WVJCTXBlYitvMmQ2OHJnNllhSXoz?=
 =?utf-8?B?emhWS3lBb3FDSjlnajE4Yks2WWxqdVdId0Q2L2grSzdRM3c0Nm5xMTNBZDVT?=
 =?utf-8?B?Y1VacEZ6aVZ5bUdQL1BnTkNzL3dZeDVtSTA4WW9sem9VU2U5SkVMVk0vU2dZ?=
 =?utf-8?B?cXNpU29oNjlpRnlLYXJDK0Z2T2tiOW5JR2xYc29HMUVCWWVrTmxlczQvbGEr?=
 =?utf-8?B?Z21EKzZ6UGkzY1hLWTdKZXhEZGpsc216d0lscTgvNGp3N2hnaU5GcWc0ZGxv?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e139fa-0bfd-4363-eb3c-08dd581f4805
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 17:42:33.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViR+maUByObRvQ95XzzLG3KFDairDPhGbepfQySGwxyzmISie/8Z8bHk8oB1jcX0LgWWMjmuE2477UfqhMmtYaSxWw43l2DjJ+5O5a6FbVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302
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

Hi Heiko,

On 2/28/25 5:57 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
> probing defer") already started hiding scary messages that are not relevant
> if the requested supply just returned EPROBE_DEFER, but there are more
> possible sources - like the phy.
> 
> So modernize the whole logging in the probe path by replacing the
> remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
> and drm_err calls.
> 
> The distinction here is that all messages talking about mishaps of the
> lvds element use dev_err(_probe) while messages caused by interaction
> with the main Rockchip drm-device use drm_err.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_lvds.c | 59 +++++++++++-------------
>   1 file changed, 26 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index c19b7b1f6cb5..2b5101a764c8 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -453,10 +453,9 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   		return PTR_ERR(lvds->regs);
>   
>   	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
> -	if (IS_ERR(lvds->pclk)) {
> -		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
> -		return PTR_ERR(lvds->pclk);
> -	}
> +	if (IS_ERR(lvds->pclk))
> +		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
> +				     "could not get pclk_lvds\n");
>   
>   	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
>   				  GFP_KERNEL);
> @@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   
>   	lvds->pins->p = devm_pinctrl_get(lvds->dev);
>   	if (IS_ERR(lvds->pins->p)) {
> -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> +		dev_err(lvds->dev, "no pinctrl handle\n");
>   		devm_kfree(lvds->dev, lvds->pins);
>   		lvds->pins = NULL;
>   	} else {
>   		lvds->pins->default_state =
>   			pinctrl_lookup_state(lvds->pins->p, "lcdc");
>   		if (IS_ERR(lvds->pins->default_state)) {
> -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> +			dev_err(lvds->dev, "no default pinctrl state\n");
>   			devm_kfree(lvds->dev, lvds->pins);
>   			lvds->pins = NULL;
>   		}
> @@ -547,11 +546,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	lvds->drm_dev = drm_dev;
>   	port = of_graph_get_port_by_id(dev->of_node, 1);
> -	if (!port) {
> -		DRM_DEV_ERROR(dev,
> -			      "can't found port point, please init lvds panel port!\n");
> -		return -EINVAL;
> -	}
> +	if (!port)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't found port point, please init lvds panel port!\n");
> +
>   	for_each_child_of_node(port, endpoint) {
>   		child_count++;
>   		of_property_read_u32(endpoint, "reg", &endpoint_id);
> @@ -563,7 +561,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		}
>   	}
>   	if (!child_count) {
> -		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
> +		dev_err(dev, "lvds port does not have any children\n");
>   		ret = -EINVAL;

What about

ret = dev_err_probe(dev, -EINVAL, "lvds port does not have any children\n")

?

>   		goto err_put_port;
>   	} else if (ret) {
> @@ -581,7 +579,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->output = rockchip_lvds_name_to_output(name);
>   
>   	if (lvds->output < 0) {
> -		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
> +		dev_err(dev, "invalid output type [%s]\n", name);
>   		ret = lvds->output;

ret = dev_err_probe(dev, lvds->output, "invalid output type [%s]\n", name);

maybe?

>   		goto err_put_remote;
>   	}
> @@ -593,7 +591,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->format = rockchip_lvds_name_to_format(name);
>   
>   	if (lvds->format < 0) {
> -		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
> +		dev_err(dev, "invalid data-mapping format [%s]\n", name);
>   		ret = lvds->format;

ret = dev_err_probe(dev, lvds->format, "invalid data-mapping format 
[%s]\n", name);

maybe?

>   		goto err_put_remote;
>   	}
> @@ -604,8 +602,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
>   	if (ret < 0) {
> -		DRM_DEV_ERROR(drm_dev->dev,
> -			      "failed to initialize encoder: %d\n", ret);
> +		drm_err(drm_dev,
> +			"failed to initialize encoder: %d\n", ret);

All the above are using dev_err, but starting here, it's drm_err, is 
that on purpose?

>   		goto err_put_remote;
>   	}
>   
> @@ -618,8 +616,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   					 &rockchip_lvds_connector_funcs,
>   					 DRM_MODE_CONNECTOR_LVDS);
>   		if (ret < 0) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize connector: %d\n", ret);
> +			drm_err(drm_dev,
> +				"failed to initialize connector: %d\n", ret);
>   			goto err_free_encoder;
>   		}
>   
> @@ -633,9 +631,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
>   		if (IS_ERR(connector)) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize bridge connector: %pe\n",
> -				      connector);
> +			drm_err(drm_dev,
> +				"failed to initialize bridge connector: %pe\n",
> +				connector);
>   			ret = PTR_ERR(connector);

What about using dev_err_probe() here as well?

Looks ok to me otherwise!

Cheers,
Quentin
