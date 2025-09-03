Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E3B422CB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0FD10E8B6;
	Wed,  3 Sep 2025 14:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zH/R/zma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC2810E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf6z3WbFC/pf8K5rlf5P7pSM0WjU0M8bJBd5xQY9Q4kcUASXSf5JYXfwJwQnpRjZqSFVlAfFlnNKGzivm+rvL8M64v2XcdTm2JwfvpQdWgLElgZaCRj0OgfTQKWN0xibe7K0OjzC/tWGoE/Mix8SM4uaNbaFvl64VBNUg6JWbB94Pa/oYpG/PLVDBDiMp7dMOIBh6zqodnq8L1BvUS7ZcY1OF5LuYo14v4HtkjIgjdgt5SQS1pNrKZzenarOiODSKf+ownF0mGvDBgCvrmdBdjBy00+wMFOLQPiEpU/LitH/+dQPByJq2cG3GB3uL90iAz4Zm9WK3f02+P54aouMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSSRZsHqJUQjDQ46vilDrUmwAV+1cCodc6fmtc5ztJc=;
 b=D7ci/zsu0NniSapCNLtzhqd1+gQjocr/zspRR7Ah3/ELQyZli/hKzzWTsA0FS5yEEqtIC9MDGtyvOjt/Nq43MCGO0ZioxCxInKX89iON/7PlPCC5h081TKF77RpurI+ul7DW8yahKpekto6nXM9Fysx4g/yfmF7rrjoYfywN898MhxKoYy0dbfftNzSxlsCKPK0tWHg7O9NooT1nToyX7EScFjdAhILEXsAAuIBhuB+EWefboMZcB5qV87jO2j9R14k8kQv54sJ5dKeZJF+pmqNVlFmztdk0bQFL3maFgmPewbGIRdvCdX5cIFXKh+WzChYlL9YmUq6ZdAG5JFykGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSSRZsHqJUQjDQ46vilDrUmwAV+1cCodc6fmtc5ztJc=;
 b=zH/R/zmacs82d4Vx6++pl8v37XbLuzLp4+fiorsFQMHlPDgbND0RU7Hlgf5wfC2FcvVwrO/23j/CFLETKdneB+i36N83Dx8iS2d67xrn3V9A9D2oDscF6SY/ThWkxiHov+i2c9V3za76WWEhXZVdDzqJWOBISOnQv5xaxe4rdMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 14:00:12 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:00:12 +0000
Message-ID: <49a904d3-0d58-4827-bd1c-d8e51aa51ab8@amd.com>
Date: Wed, 3 Sep 2025 16:00:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-6-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-6-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0018.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::30)
 To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: cec5d5a4-e8d9-4b5c-b6bf-08ddeaf2334c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzY1SjBiU0p5dmZNZi9YK29RNkE3T0NTRmE1RW5rTTZHcnNEalEvaVEwbWxP?=
 =?utf-8?B?NjlYOURCYVNyK0VQbFlKY2tINFNDZEZWWDFtYTNybVZLOVd4RTdDU1gyYjJv?=
 =?utf-8?B?WGtobFU5aU50MGJHNDJyUDBmbk1VQlowSHR6VXR3UHFwb1A2MUNyK2xOaDFV?=
 =?utf-8?B?SFBDTDk2dUtiOFE4WHlRUlp0NFRlelNtOW1MY1hlRjhWSVJvdVFlWDAyaDVn?=
 =?utf-8?B?TUttT2tqaHBEWU5aaEhKaXRjeHF5NGc2YUJrUDBIVFZuZytQR3dJSVlnS25p?=
 =?utf-8?B?aUUwaFlZZFdMVk1SNGw3YnY4em9Nd3lyUjJQd1JsMVdJa0dFQlpZQndmQlJm?=
 =?utf-8?B?K0p3VzRnV2U3TmUwVTBNOHd1b0lqM0RCNzUxelRodlkxeUowSjdhN1VwTHBq?=
 =?utf-8?B?NEJBRHdCZ3M3VWgzVkluMy91QTRRSWZRNDAyY0h1VkY5L0hUTXgrZHB3dENx?=
 =?utf-8?B?aVViekxoUWZRTUJ2UTFsdXVNdU9YcExuYW9QdXY5UFdFZGlLMk1QdzVlNWxO?=
 =?utf-8?B?L0R5SGdWRTVXcXB3c2l4NEhoYVpOTGJmUllIRzV6WU10RmxYNnlQTDFjMmpm?=
 =?utf-8?B?Vk1qMjl6V01YMEhQQzJoN0ExY0JCc2doZ2IwWk1USmdKTytYeXJqVUFnU2Mr?=
 =?utf-8?B?a1NZT2x0cTJmcm00NVNDNkdGYmw1YnVoYlNORnpRMkNKY3hPTUdwejhNTTVH?=
 =?utf-8?B?Z04wK1I3MkM1T2I1RWsvaTBLanpsWm8rR1FvZmd4Rm55ejQ3TFdrU1lZZGRZ?=
 =?utf-8?B?VGIvMHdxNEMwMzB3STNEYUJVRFBWd25TbHNkVVZTY2Q4MFZFOUIrV2JMRDJ3?=
 =?utf-8?B?MVJNY2dpYTJOcWtUYmVSMnJPUzdMa3ZCTTlMNkFYSUZCMytJVzBFRExJdzhJ?=
 =?utf-8?B?Vzl2ZmVielVsT0RiNHRBRzZMR29HS2pCbldSN3N4OTFKTHJPUFhRbnIzc3BV?=
 =?utf-8?B?bUNLYkRjS1BSU0lwd2V4YlJKNWtVSVBNaDUzL1BBV2YrN0JETlBwbWpsYU9Y?=
 =?utf-8?B?TFkyN0kvdTNkNVhkNlgwamtnSmE2U0JJamtqM2JsaEhqWm0xN0VweG5YTjFV?=
 =?utf-8?B?M3lIandUbzFmQ2NMVGRQYmdUdEo5TWlRQi9LOG1xSEs5Y3ZaSS9WRm84dk5O?=
 =?utf-8?B?eHFRQ2pvUFA1WTlCTkk1NmVVWVJkaXREeWJ4SE1tcm5MQ3E1RG05TDhnUERE?=
 =?utf-8?B?V3dCNW9VYTlSaDZ0RmNMaWhuZ3NnMEhMWUhNL0xZUU1BR0ZrT2lkMjlOUW5y?=
 =?utf-8?B?TVE3Rk1OQThSdXoyOXkrdjl2NEpUSDkva3ZlaEI0cElRUTNpMW9CQkU1YlEy?=
 =?utf-8?B?dFhFM2pwcnNFVDVWSkoyaVZHZkVTT3hNTTVsT3Y2YkJsdGdKZ1kyQklUTTV4?=
 =?utf-8?B?eGtic29MaGFwU2x3SVhRaEFqNzJFRHNQeWN1c0FwcUR2OGpBb1RXTDF3WlRK?=
 =?utf-8?B?SVZrWEhJT0ZGeURxLzRyaW5iT2tLRXVveHdnN1B1SG9UdUpNQ1dBaXdra3Jn?=
 =?utf-8?B?UEdrN0ZaZGFOcVNFOEZnRTcvK2t0WXM0d1dyQVdOOENMNGlNMXlFNm16Nm1a?=
 =?utf-8?B?RjJ5Slo3dU1jQjdGL0lXdko1VmxSRjBFNjhiVTZYQno4OFlBZUNSNUZSeDdP?=
 =?utf-8?B?Tm9VajdOVFdNcHo0cGwrOExQV1czUEc1TnZJZWVVY1o0YjNxTzUyZDYxdFVU?=
 =?utf-8?B?cS9nZ1pFbnRJRTdNdGVKQVRIVytUUnNXa3BRa3VpSHlYSmFVd2lMKzhCNWlt?=
 =?utf-8?B?VTMxcnROUVhuRzZnU2FNQzZIMkNTVnVybm42d1luNW9nRkdjRzNHdE9ZNnRq?=
 =?utf-8?B?YmF2MlBlMTMzaEFPcVNadWluUlV1WTF1cVE0K1U4RVhGVTFPMWZwZFdRcnEy?=
 =?utf-8?B?VzEyR2lsV1ZxSWxlVjA5MUdTZmRpM3dDSnpVNitJaUFuZWx5bURjWGxCaWhG?=
 =?utf-8?Q?J4HZH+TC2Z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGdRc085eEZjS0pKUG0xTklaVkNXajd6ZFRXM1BNM0VZajBFclZyT1JDK3R2?=
 =?utf-8?B?c2xQNUNtU29zZnoyc0VWVXlZZjUyb3BmbUc3WDJPRGtnR0FtQjJZcTQ3K01M?=
 =?utf-8?B?VWdwQW13UWJ3SXdXNGJFY2MrbWhSbUtiN3lqNXlDUzBNSEdJQ2RHeVNqUXk0?=
 =?utf-8?B?c1ZwS25wWHMzZ1kzZVRoSDFoQjNPang5c2pHWkt4Z3N2Z21ldWpyMkZaM1R0?=
 =?utf-8?B?Njg2MFBxa1AyODBRNVFJT3hKQkppYnNqdEQyT29ZeDRNT3o1LzBhYTZ1N1N5?=
 =?utf-8?B?MWZMUWt2RCt2dkF1bDhqY0tCQi9ydHBOMEpKajNRbW1ZNmFSRUswbmVnbHkr?=
 =?utf-8?B?LzBINEZrUUpDTXNQYzJ5TFF2K0t4dnQ3RW9MUDBVMC83c2FqbzgvbnJCWTVp?=
 =?utf-8?B?bytwcDlybWR0YnZVNXF4QlN2c0lVUlo5Wlczbm9xNHBTRmhxazBxVVpjNWds?=
 =?utf-8?B?RFFpbkx3TGIvTFptY3gxWkR1QlQzQXhhdEF3N1g1TVdyYjdTOU9KdHVvRXpJ?=
 =?utf-8?B?R2hxNmxjZVBtc0VPL09jM1Z1eFR5cjFNQitjeFJoSG5CdVpwWlZlV013cXFW?=
 =?utf-8?B?L3RsdjFzY0lyMkpISlltSlFiUXljOUtjVGN6bHZGeEIzRXdITFlvUWtJRmU0?=
 =?utf-8?B?N0RFejBFTVVKdkZHWWcwZ2ZCeXRIQ2NCVFNLQ1JXQy9RNEFsNGpWUTNxYUpx?=
 =?utf-8?B?VlBSc2tsRnpSVmo3OUVGb2FwNXpxU1lzVEJkaVNFM3FhTytoV0kwZncxOWNP?=
 =?utf-8?B?MG1BZE1hT2cvMjBGbytpQThNRE5xTVdVN0F1NG5iUEVwYUp1bHozdVNCQzhp?=
 =?utf-8?B?dU1JamtKSUUrcDFxZXlmUzNIYXViWU1ocXdhVkJ5OUppVGIwUm8rUzl6WnVu?=
 =?utf-8?B?N0xwaFU4WDd2NmZuOTAyMjdsMGJoenhzeDhwbmJFK1FlQW9ON25FeTJOQmEw?=
 =?utf-8?B?ZFZjdGtKOW5VQTNqQ3NGNFMwWWlNMnNMQ25IT0ZodzJIYXBDcmo4T3NiSWYz?=
 =?utf-8?B?R3JmYllQN2w2dWVlMmZvREtIOXkxalFlNnlubmpmUVlDMk10V1UyQnZheGVO?=
 =?utf-8?B?UitVQ1FyRFB3bHdkTWR1TWt3eEQ5dGl1UzF0ZEYrVUtpR2dMR2ZySEgvMjRi?=
 =?utf-8?B?Z0tyL0NtaUp2Nnc1d0VBSjEwNU9qWGR4NHZhTjRydm1ZWm5hMjNqRFNkR2Vt?=
 =?utf-8?B?MkVHaDVGK1U1eC9XY25pYmRrNHdYcGEwVk13d096aWQrWUtrdUpDZkVycjZ5?=
 =?utf-8?B?ZUZLc1JjRnJKMTRIN0lFd09Wd3ZiN25MNXlmYUJFR0V0QlpsRVkxd3BPK0l5?=
 =?utf-8?B?SmtiN1EwbVM5a21aRVJMY3hYendqclorMjhoQzZINUtSS0cwWURSd0plNFdB?=
 =?utf-8?B?bW5Id2xTL3dMTWlVcTU0UVZUOVBuYTFOeXg0WXRjdTdLaS9DYTZMNXladmNo?=
 =?utf-8?B?R0lUQTlPclVobXVrTVRDRTlqeElTSndwWW5aMzMrb05QNERQUHNjcEZEb05K?=
 =?utf-8?B?dnJyTVNHdU0wRjBWS0toRjlqVFVpMWlCeFA0ZFZGRGhld003dHZac3NGbkxa?=
 =?utf-8?B?RW94cjJPRGNFbS9veEgvVXM0TklGdzJrNEM5RmhaVm1CZ211M3pxeVpiU2o2?=
 =?utf-8?B?TGFtbk54QW9OWHBXRGNZMUppOThBVStDa1FsOWFTaStOV1dZQmhLV0NneXh6?=
 =?utf-8?B?M0c0MzUzWktCT3U2dS9mZTlJcExHT0I5YytIVjZQbzRrd1hlZ3hhQml3OEJo?=
 =?utf-8?B?cVc1QWNNeUU4UEhOTG9KcVF5YW5pQnl6azNnTklCWVkxZ1FyQzJVM0dlcWtC?=
 =?utf-8?B?VE9VTUtha2JRaWJYUkhLa1FKUHdUcFFuQytSWWU4TWVid2FRQi91VU9GcTU4?=
 =?utf-8?B?MHd1ZVludlJTNmVpZWdhMFJtdnUxRTYxYVBVN3N3dkU1WDQwUVlreExZbHF0?=
 =?utf-8?B?czRJUzF2WEl6VTFjL2Y1WnJSUHA5S1JMRkhtRVVWNFNVZExxa2pzbjNiVW9G?=
 =?utf-8?B?bFpxdC8zWlE0enNpd2JXTXNGeENMUks4LzFLNUpFWlkrZUlhQ3c2RXFZcFFC?=
 =?utf-8?B?SmdJTnNJcVVwbGlMNnVmdmpSYjU5cGdsaENzK2ZmbVNJaURWNm5ZWVdsck1I?=
 =?utf-8?Q?iMnnfE0mox6T6T8vWjB+9ivIn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec5d5a4-e8d9-4b5c-b6bf-08ddeaf2334c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:00:12.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5tQoUG8nR2mI/EZAuBBQ5V/Hn+fUNaM8p0hM3FlRLo/yW0G+6iqF2X/OFMB7Fiw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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

Hi Tomi,

Thanks for the patch.

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> container.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  | 1 +
>   include/uapi/drm/drm_fourcc.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 60684f99f4a7..81e5fcdcc234 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
>   		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index df3dbc36c26b..562fb7ebed29 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -246,6 +246,7 @@ extern "C" {
>   #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
>   #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
>   #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
> +#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
>   
>   /*
>    * packed Y2xx indicate for each component, xx valid data occupy msb
> 

Looks good to me. Feel free to add -

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
