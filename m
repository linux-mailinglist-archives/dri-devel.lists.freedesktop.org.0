Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0EA1AAD9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA8E10E890;
	Thu, 23 Jan 2025 20:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fdmdh2tA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9B810E890;
 Thu, 23 Jan 2025 20:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9tp57srG7e79enndgRgRxXi2/4EnfHg0qteShaZHHI2psNffOirdYG/MIZVJJETb9Y+8WMimBwx2nVtNilDvzIqkeiunpcJ7H9ACAobbywI/3nevqRqzAmJ0FvfW8s4tv9msAjTzUi0dnAAdNKfCfBnSad2VDRo7uU0XauiMRr/zTh0H0s5ZWN9A3nvz266VxU8q33U72IqEZdciNnN5jJIMFPs4NbRpLTmOhOE5vXWWAySlQ2w4bl0Yq5+FzeHZBJwrUFYni2SZQX4vLjVvgpU4W8JUTBbDz2x7D5c9SnA7XxPg7USVCZOthmg/U4w0Iv8PepTouV6xIVcZ3aVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zNLZ6In0WxBxMdjk/eyflSCSXvXRVOjUvGeXSJv+Z4=;
 b=VO4lA2R4V2N+TVcdu1ioYxlY26++w5uCo831rDjqlBBCQ5JsrcLwn1nymjFKucNOGQ7mV8IwatPGwsIkDx9kZT8c/VKQLrOZwk/pmr7Nrc2rDUPGvdsK7YD8m+xrIstWN2ki6zctjCguAUBY1skBKUI8n6Epr3wfQEVFWs4OGnIuAEa9SXskS56Dbb52Aq2hQ6qj+DFvt6XYF8UYkJs4ANMtyObj/X+syIz3JoKgBikxlywZ07EfkPEXV6e4N10vfppuZIhY4654U05oeQdY8YoNz7QaYO6lypajgmDNaAZZAE2si106lF60BmFo9mAc007d8VHUUMLHoIbDZziiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zNLZ6In0WxBxMdjk/eyflSCSXvXRVOjUvGeXSJv+Z4=;
 b=fdmdh2tAUKRsQQQO3nUJStp6NiMoHuqWsZqpgRQfK0h+qK4ueVd5e25n9aJ+4Imwk7CIah3dcNvUgv1Lh747Kwx/0sXgjTpBX8FAqOwtr9XsXBLROdS0IV87OngRRkeOoYdNrQmuK4JgMSH58G7Il9uTTf8JSbDhsU8aydS2DbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 20:06:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 20:06:47 +0000
Message-ID: <16986d2f-abd8-41d8-b150-55d6b1c6ba6c@amd.com>
Date: Thu, 23 Jan 2025 15:06:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-30-alex.hung@amd.com>
 <owMi7HF_zONkAALlmHM6WhUNrOAyMbEYyjD7We0OGgWht2Tgj7o4OSByObPiwf8lZ0qwyy80r8kuf3pTea1ayGXzSua0oZc5OtydzYkF-M0=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <owMi7HF_zONkAALlmHM6WhUNrOAyMbEYyjD7We0OGgWht2Tgj7o4OSByObPiwf8lZ0qwyy80r8kuf3pTea1ayGXzSua0oZc5OtydzYkF-M0=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bc42d6-ff87-4a3f-0e77-08dd3be9771c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0FWVG13RVNTdjFON0NwVW1tSEd4d25OdVJYdjcwYTRPamxpSUhMNnRFY0Rl?=
 =?utf-8?B?SFgrbnh4emJHNlFEazN0MEZWYUdKT3VPbnU0ZVdLRHU3UVhQaTZDMU9JK3Q0?=
 =?utf-8?B?OFZGMFBFcFB3YjlST3VzNVJ2LzEybjRIV1dVekRtMlFLY1BoeDcvbGs2Ym5w?=
 =?utf-8?B?SDQ3K1htYnNucGNBUzQ3aXZTeUJvNzFmV0tuN0tFd284elJldUlqU3BnRHRG?=
 =?utf-8?B?U2xoVWk3bnF4N1RJanBKOGtwa09kWjQ5MFd1S2JsUjh6RlBIWEV4UUNBSFU5?=
 =?utf-8?B?Nmpxd3QrYno5U2s0TE0vcVZWNGw3cVR4K3JEOE1XUnRRQW1ITG83UVpTZXZB?=
 =?utf-8?B?SjdhY2U2VlJVc3BHdVE1d0pvbHkrK3NIekUyTC9YTVdvZUlBZmtWaUJ0NCtG?=
 =?utf-8?B?cEt6bFNlMUxqekhueDExNStjK1YwS0lmbUphT2RjWHNsNE9oQkRXblBVdkxm?=
 =?utf-8?B?dVAvL2dndEFsNlZmQlJiS05VaTE2eHBsQ1hXVzRSSUhyY1kxckwzZGhTTVl1?=
 =?utf-8?B?VFp4YlVkQm9sZmp0QnZnSklKcXJpM2ptSWFOZldWd3VzOStZQzlnZUdLaENL?=
 =?utf-8?B?S0s4d2Y1TSt0ckMwaUZKK1k0aEdLRGY0SER3ZU04QVZRYjZYNmpld1ZyZ1I5?=
 =?utf-8?B?OTZYN1BuYkVFMEJIaWFxTnRJM3F6USt1aVlTdXBrL0FLdWxHcmJ2a1lvbk5E?=
 =?utf-8?B?Y3IxNFhaTFdlZ09EaVBMczNSSldNRFA0ZWdZcmErUG84ejFZSmJHMWpwL3Ri?=
 =?utf-8?B?Ny9HQ2l5V2VkNUhHbTd4azlSWkp1WEY0Y0tiTSsrNkF3eUlYc2V1WHRWQ3FU?=
 =?utf-8?B?ZzBsNnZUVHI5cWM4UG1sYUU1TkcxN0VtdUJmZmdRUjNtZW81MUpYMW9tQVBu?=
 =?utf-8?B?cHhoWExockdHRVgyZmlVM1dPZXRXNjVrQkhkOVFybmNVZTUvUkZwRlpGT0t1?=
 =?utf-8?B?MEVpVG91L1BGdkg3VzZWM0tGaUFHVjFobjFZRVV6ODZaRmFHSG5aSFVzNlQr?=
 =?utf-8?B?Njd2SEZWMSt6K29NNFVVVzVGU3hlMDhOQjNmOTRnVFBWS21uQU1abGtaeTR1?=
 =?utf-8?B?NWlROWtpRzFpd1BnWXdUVlg4NWNObk5Xclp1TURmZ0QwYm5CTE8yQ3h1STha?=
 =?utf-8?B?L2RRR0pBNG9mNG14ZHVUaVpCdkY3Q2NLZnhSNWxVVXBHNHA1REgrb0RjTHZt?=
 =?utf-8?B?K1J4aXlJMnVjODdCVFB1WHUzRjNHYng3RzBEOEtvM1IxTjN6cEc5d3NoZHRI?=
 =?utf-8?B?ZTJ3TkVINHFoZktLeE1ZaXJpZGUyZVd6Yk5zNTRNL29JSEtacUFuNStnR1I1?=
 =?utf-8?B?WEFOSDEvdUJUQjA1aGJ5ejBGUkdLc2JoRTNlUzJZWEc0VGlrL3ZQdXhiUSt1?=
 =?utf-8?B?NlRYYlNGMnZaS2JrK0k0U21PbTJHeTRIbEc4Sy8xdUMzVGR4S0VVcFZmZHZO?=
 =?utf-8?B?VmJOb2k5VmxhSTRiR0RjMEJ6MVVtVWx6c25OT2NmeEg1NlROUWZ2QVFTempP?=
 =?utf-8?B?NXZITjdEeTI5K0FlOEtMT1NoWUxrRkNZQ0l5bG9tWWdSVncwTkRnMG1kZVRR?=
 =?utf-8?B?Z1grakI2d296empiN0xGNmZGd2FBYUlwVFkwRi9qaGI1WFo5NDNZVlVGa09m?=
 =?utf-8?B?ZWI3UllYMi91WCtZV2syUFRQaDMwcUZLQzFsbms2Q1VPd3lpOXNXZDl3ZW5i?=
 =?utf-8?B?VlhQc2pVLy9jcmVmSlJIOVh2UkJPb3ZVSWFSb1JoaSs1OG5FQjZiV0o1dmln?=
 =?utf-8?B?WXBXUjlzWUFpQTJUWGl5c3U4aVBRSitrZGszZG9EdHFJK2ZaRVR3NUQ2L3p5?=
 =?utf-8?B?TjJ3MnFhelNUVXpVeW94UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y01QSTluV0FadUNGY28zTVNxeVp5b29GQXduMlZjWithYm5EdTVzQ3ZuWGQ2?=
 =?utf-8?B?aktYQmRMbFc0SWgvQlBiOEYwVHN5Z3VvTmozbDB1WDZ0SFJ0OWpGUEMySHIx?=
 =?utf-8?B?ZjJHdGk3TFE0WGU2M2lUS0VzY0pRdUxkTi9vZTNPb01nOHRySDZXU2VUZTFI?=
 =?utf-8?B?aml6WHVsM1Z6dm5mMERpRFRXMi9RK0I1TElCQk5zaG8va3RNaUpXWnZicTVO?=
 =?utf-8?B?cWM2TTZjTnVBS0RPb1dLU2ZNYzFvcTFjVkRKSGVWdHdpQWZhWkk2Vi92NGV3?=
 =?utf-8?B?bUlaOWo4ZjdCUzk3cnNyS1h1TzlOaDdIS21qUkZ6a3g1Y2Q0VTdkcVJwanNl?=
 =?utf-8?B?Nm4wbFJPZXJnQitnc1UzNTFpYVFKbCtCeGE3dEZBSU1QYUxHL3pqRlZXK3hY?=
 =?utf-8?B?OTRPQitWUjhGQ0Y0Ui9oY0FkQVVWelpvL0JLaG85b1o0Q2xlY0VidHhGYUV0?=
 =?utf-8?B?b1NjOXpxVlg5ZklON0JsMDk1cWZCUlFocXVqZEltNFVDcUpTanpsZGdEa2U0?=
 =?utf-8?B?Q0RINVdsUXdTKzlqQkwwNmNEMWluMW1VWHZCQW5LdTdMbkg2WmdkR2tkNTRk?=
 =?utf-8?B?bWYvSjdYZmxMT1hQZ3ZCejJJWDN4c2FuaVdFVGlxNGlqR3Ixdnk1SFRpQ3Rw?=
 =?utf-8?B?a0dvWFBqbllKQWozM1hTck5JUTk1Q25FQ1E1aWEvYlpvMEY3Q0xicWxLY1lX?=
 =?utf-8?B?bmhPdXUvM0FrOFJaNDZBdnYwWHVBRmtHaytaV2F6bk1nQTN4V2k2ZlFWamZj?=
 =?utf-8?B?ZDRqNGRET2Q1STlXOHJWdVE5eVZJcVI5cEtnQ25VTUhVekZ2NWh1eHlLWTND?=
 =?utf-8?B?VUMzYzBzYWM0ZFdEZ1Rnb0xzeTB4cENXR0lod1kxMHZ4cEVXWmVwbWk1NVVD?=
 =?utf-8?B?dk1MOHdjZitvajIzalpCTGNBUDkxSkRJQnVkT3dWYXEwKzM2NURrRXczbXhu?=
 =?utf-8?B?bzVXNDdUcGhDTEJ3RGhzKzlCcDE2d255bVNKZDdQVGRaVVFjeFl1em0zaW9T?=
 =?utf-8?B?bXk3SUZSOURXbUM2THZjNFB5RlVsTkFQclVmODNRbTVPWmZTTjVxdCtwc29V?=
 =?utf-8?B?cVVzV0pScWhJK2cyM0s3VThpQ1JYWFVsalNmRXV1VGhhN0dIcUwxMDBTNTN2?=
 =?utf-8?B?bTVLTjVLVGpKU0JoZU9tZVFXL0k4YTdIQWFKOEpCSDQwZm00S0JDRFJ2RDg1?=
 =?utf-8?B?Y1NLaURQRkI4TG51bW1SaXJCckw2L1RvbTRJRjBLYldIM2h6OENEQmg0Wlh6?=
 =?utf-8?B?OHZBZmVyQzdPdGFla0N4S1JRWm42V21INSt1alR1V3NWbks4b1BtZVlOOFEz?=
 =?utf-8?B?RitqR0dEbUxzeWk1dHVtck85TmYwTlR0ZTFKNDJYMUthVkt3UzgvT2R5SFo5?=
 =?utf-8?B?Sm5qVm1QL25xVXBTeHMzbWQ0ZUxPUG11dmNqMDRzNGxHNlZ6ck1LMWNUSEs4?=
 =?utf-8?B?dVlQWCtWUFRtMmdXc1dpUnRxYlJjS3YrakF1Y2YwQ1c5Y09QZ05INGpFa1Yz?=
 =?utf-8?B?TVluSW9JN2V6cnJtLzJNc3FHNFJJMFRZTVd3R3g5V1lSWE9uUE9nUDVHSEJG?=
 =?utf-8?B?cmJtWFlGdlpVekF2Y1ZGK1ZTbjJGd2Y5czdDODIyRmZSamVFWHkyalp3UVNG?=
 =?utf-8?B?WFNsYlE2Z0dkTlc2RjdEN1Y3SDNvR3NpQ1I2ZXRIbUMwNWhhdTVrMXh2d1lp?=
 =?utf-8?B?V0IxVUU0U3pCODlqZ2kvUGk1djBpZzk2YVEzNnJ3c1pRdU1vMVRubGdCcDdi?=
 =?utf-8?B?eGlWS1AwYWxqRlc3bnhLTitjYUZobXBPdEpsWFlkRjg0bVhOTlplV1lha3lj?=
 =?utf-8?B?ODUyejJxRnpCaHY0ZDRCMGs0OFh0dVZiUW9hQXkwdm5sWE5yRzQ1a2RTdUZC?=
 =?utf-8?B?d0gzMyswaUpQZjhoRE5PY1lzc09kSUt1bk9OeHRkZWV5Y29OVU45K3MzTGxE?=
 =?utf-8?B?aU9TMExLUTRyMnE1UmNPTTlreUtzLzk5YmxwOWFma1NxUFppaTV1d2IrVzhM?=
 =?utf-8?B?NnRXRUd1Tkk3TDU0NG9LbDhkL2hjL2c0ZzZEOVZMQ2hFTmR0WjFlay9HY2N3?=
 =?utf-8?B?dlJNQjIwZmlkWHhRTlBnNXFqU0pHMWVUbnhTT2xrNldYL09GMS9iSXZaWHRw?=
 =?utf-8?Q?m/Oupd9Rj5qzEdcP6JIPwL7Ny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bc42d6-ff87-4a3f-0e77-08dd3be9771c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:06:46.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t73Ms66A8D4nv0aNQhTB5GKJKkIZ5dSaxZzzux1qM42FzOHpGEcyyn66xSiJLMso0+qVOdojyBTtWN3TRzF4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
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



On 2025-01-15 03:00, Simon Ser wrote:
> Is this 125 magic number something we can expect other hardware to
> implement as well?
> 

It's based on MS's CCCS interpretation of 80 nits as 1.0f [1]. Based on
this definition one needs to use 125.0f to represent 10,000 nits,
the maximum value PQ can represent.

It's hard to say whether other HW will implement it the same way,
though most drivers for HW that supports HDR on Windows might have
a similar concept somewhere.

> Could AMD use the HDR multiplier or another block to behave as if
> the multiplier didn't exist?
> 

Gamescope makes use of this scaled PQ EOTF and its inverse, so I'd
like to expose at least one color pipeline that we can use to move
gamescope from the AMD-private color properties to the color pipeline
API.

We only have a single HDR multiplier but three curves (1 and 3 are EOTF,
curve 2 is the inverse). We could only mode a PQ curve in the range of
0 to MAX_VALUE (1.0, 255, 1024, etc.) for the 1st EOTF, not for the 2nd or
3rd curves. I'm not sure how useful that would be.

[1] https://learn.microsoft.com/en-us/windows/win32/direct3darticles/high-dynamic-range#system-composition-using-a-high-bit-depth-canonical-color-space-1

Harry

> Note, I am no HDR expert. Maybe others have a better idea whether this
> makes sense or not.

