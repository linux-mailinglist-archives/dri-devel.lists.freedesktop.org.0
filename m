Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD6B261E9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06E10E83D;
	Thu, 14 Aug 2025 10:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Tt9706Fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBCC10E83B;
 Thu, 14 Aug 2025 10:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifbPyoq2iKTPJLfmlJ6sU3B8bxEf/iNWHoQF7NJJFEmQSpWjPnfAeP+cVfL0duRGF79MaaXUE9nWQs9vd+ZjCYne7oIoXrf0/RDquUTXXzHGtU9a4f+sbXyU8ZElEKYR+wXwxphwsZZmmAOksYLlw+3aRnPDpgtonn3Dkx5dgwrElt09Ol+xvwLQMClnHJvDVtt07fxV9JlHTcD8sY7LhNd1b0wbQwl/bR/JElpboBXbbZ44H/C8/rI+2lpOBTh0/vitNql0d5Oo5pme1BhuWvspndZsnrkalItfuAlxzNHTjg8H6UE5NTFVhcFPWVdVkEfTmqujuOjRC0igVUvtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+X8i0uvTuUII2l7132ZsWp6AcKbQ5MCMn9XcXnWggE=;
 b=KsmmLKwmOkqSoXtEAKTK8toDklFimXMuFVL45El/S7CB/UgqjjoB/qj+Pmtz0EUOy0tXVbBF1cHPjeTyChttUKoldwjvp7/bGPFN1X5LWVYBhcSFWdLqpCcrifNoH373fdNRqEQcB7KJI45PXtwyJSdoMVinp8cASg3Nv0hdahhHJSs3Io5GaGAhCf5TPHz+xWwo4nFhBa6zFdc+fMGjfQ2G4bmgww+7P3Fu5GKft1OQses59pt2Gk3WjSsu7a2iUm+EUyyleGljQ3dm+kN09mmxZfwUsZXRGP/UYkwG7A5++sb6bmvPxT43Cl4nZXDzoRGiAIkL0l/td7HoXdaMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+X8i0uvTuUII2l7132ZsWp6AcKbQ5MCMn9XcXnWggE=;
 b=Tt9706Fxu/U4SoGH2EGdbZWqBYJR+0Tg2n8BM5PrBux6GTxuwbqWY0OuMpWW5IDC35o28wV8Bhqn+zGli+woV7JxjBWaJnbfPhZsK+BeAOlqpFJdlq0nmpRGmyI1nJ6mH1FeoME8J2zg79t6l4jdcuvhKVbEA1id0ztWDZASlPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 10:11:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 10:11:55 +0000
Message-ID: <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
Date: Thu, 14 Aug 2025 12:11:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Move the memset() function call after the
 return statement
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250814093957.137397-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250814093957.137397-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 20319a55-8275-4978-b4b5-08dddb1afed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGt5M3E5dmtmcVpxUFBKMklMRFllYlBBbTJDcTdaOTk2Mlo5NmszZHlQNmRO?=
 =?utf-8?B?Vi9zSFhrUlc3MnA4ZDN0NGgxK0ZLZ2xzYTIwOHVNWXpra2EyMWZ3dnIrdTIx?=
 =?utf-8?B?UTlYOTNEWlp4K3lXdGllNWo3ZXBjQklYbktOZ1VuL3h2d1ZBQWFBQlBUNHBM?=
 =?utf-8?B?cHh3NjJSUEp3eFdOWW1MSDlDRW9SNzliUVFqaDRsTktsdmY0NTNwVVd1NlV3?=
 =?utf-8?B?aUtpNHpmRmJwMHpnTlpKeVRkSldDK0c1TUIwbVJyT2JBOHdhYldSQ3ljak1R?=
 =?utf-8?B?OHlZS3prMDlMazBCYVNVbGI4Yk1EVEN6aTBPNzJ1UXpGMmN6dkVtaG1ITFZ2?=
 =?utf-8?B?cTZHV0hjQVNZR3cyQlBETnJ2VTdvcVVYT1NFbzNnUXhzRldPL1R1OE14bVQx?=
 =?utf-8?B?VzNyVElqcUtCQ3B2dHdIRStHL1hlMGd0STdZcnNTZlM0TjdZM21aUTNPb0Vo?=
 =?utf-8?B?TjM1N0NYMXRUZUpoSjVrVjNXdlNvdUhTZnlzb2tWWGJvN2tSakNtOEJERWxm?=
 =?utf-8?B?YTZndXR2NXo5ZnB4WkllZGlNODdzWld4MFVma1dMbFpiY1RITjR4VXRic0l3?=
 =?utf-8?B?RlczYnU0alY1SEZNLzRoQTFCOFoydlkvZU9mKzJycVZFUUR3dmo0bHpXc3VM?=
 =?utf-8?B?eVh6eW1KWkdsbHJpc1lEaHpEVjNVbmtHb2lLU2hnOC9nK3o5dkx2c3hROVln?=
 =?utf-8?B?NEU2WUxsMHQycjc3NGJndzFEYThmWStMVitRUzFBY2ZRTEY5K1djeHlHKzFm?=
 =?utf-8?B?Y1I4eHlsOTk3MGxXa2lBaysvRlFuV3k1WkRONGNJdnlHSXJLZ1JCQnpPVHN3?=
 =?utf-8?B?TUpoSWdlenpkVXZMNWx2YzBCM2hBMWZGUW4rTm00d1J5Q0VPOTdwWmtZWEhh?=
 =?utf-8?B?T0pocDdnZGpQZVZmekdKL2NoUVk1RDZTWEh6ZldFMGRQSzZrRWJDVTdvNTZl?=
 =?utf-8?B?ejNmNkxoWi93ZzhiUlBaeG9FWmo2UE9TTWtOaURnOHZUUE53UUl5UHpsQ2pW?=
 =?utf-8?B?Njl3R2MyWE1FTER5SkdsQ0RETHg1OGg4YTdBZ0hkbTZZZ3FweW9DbzNFdkNo?=
 =?utf-8?B?d0RoUUdHMWRZZlJLU1JCSWM0b2Z0SGh2dWpWWXduR1h4MENyaFlnemhmR2pu?=
 =?utf-8?B?ZFg0OTZpZ080MnB3QWlxNmszMThNZHpQOXF2VmxLTHdoZUZNWW1wL28rS2hp?=
 =?utf-8?B?dFkwUGZUNXQ2Ujh5T2dZT0tYUHFLOVFrVk8xaHAzTVVHRTdBb1pWb2k1VUM5?=
 =?utf-8?B?UlBYWFBiZTJsTlVSQjlnU0MvTlRBdndhUnF5bzZsNldvRWJOTEw0bnNtVXJD?=
 =?utf-8?B?eHVycERLdjZyb0Z0S0xMbHIya0pxSjFwdkxveEFORmVsVVkvKzlwbno0QldB?=
 =?utf-8?B?djhhOENickZQVVZpMTFpVFBiS0VMd2JCcUgxUmdTTHlOL0tCYyt1RDNrWGpt?=
 =?utf-8?B?QmdqVE1KakN5RjBEa1JiWmNFQlVQc3h4NmM0SVkvMzkydHArRFZnV01rV25I?=
 =?utf-8?B?UWt1b01FcnVVYkoyQUJyQUI3eHZORjA2RzR1eFFBNVU4YnNPOUhoeGFFY1Jr?=
 =?utf-8?B?NHpmNXdqeld3cVJYNGRsOG1oUk9VSjFCK0Y5eWF1S3VYRlNBUTBzWFhnaGdZ?=
 =?utf-8?B?UmoyZ3VCWWR0dEw1YTU3UzBsdlAzZGEvRzk4MWQvVmhzVHFrYVFzNHdHTnow?=
 =?utf-8?B?aUxyb3Q4Y3o0REJIY3kycDgyMTFjSXRibThJbFZOR1lPSXRHTUJla3ZpU05Z?=
 =?utf-8?B?MFZjakJ2OC9lTytZaEVTSmxxZmhRVDczeU9SMURCWGNIMUF6OE1mUUkzK0Fl?=
 =?utf-8?B?c1Nad2NZMlRsZVhqQmd3cWcrNHJKUzdzaU9CamdjOENLeHEwK3orODRPcHQx?=
 =?utf-8?B?cTZTeVpxR1dnZDFVRjgwVC9qR2dpUTFRRmRhVlN0eW02UXdYOTFPVUJZb3Zr?=
 =?utf-8?Q?l3W2yVZQVEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0YyMEZ5WjRwTjdaSXl0Q3dEYUJJRjAyWUdSWmhYTXg5NmlzRGRXcTFmK3Uv?=
 =?utf-8?B?NFNTVDUxT0JoaWNYbGpBTHMrWHdsb3hOWjZFK0l6NlFCOTNGcWVRb1lzc3dH?=
 =?utf-8?B?aGV5RG9DUHdnalI5ZlBHanVVQUNaejhLa0xUUEo1WHp2VWN2ZTYzaWlPaXRK?=
 =?utf-8?B?T29OZ2lIdDhWV3RGTmpRNmVXN290eUJkaTRXMkRqSnBoR2M3cExwVFF4cVhz?=
 =?utf-8?B?a1YxcGRYY043VGF1V3Q5VVlwa09Oa2FiNE9md1lJSkhhYmJDRjMxRzN5M1NK?=
 =?utf-8?B?c3IrY0k1N0dZaVBrYWtJZExvaUJQNUd2WE9FRkVPejZVNWU3VlNOV05HT1Fw?=
 =?utf-8?B?UUV3aUVraG9aWU5zdFdxalNtR1JxNTdGV3p3eGl0bkk0b2tzRFJjRUJZbU1v?=
 =?utf-8?B?cmV4THQ2dXoxaUUzWmhyWG9GeVBBU2NWRWZiRk14NkJ5MEQ5Zmw2SGdnQTJ4?=
 =?utf-8?B?QTZIcU5PaUh5dWRySi80bWx4N3grZXEyK3k3dkpzM0YwTERhSThDbTR3amVh?=
 =?utf-8?B?WVYvUmwxRGh4bk11Q0cvTVpRUmJka1RUZWkya2dPVzlFZWlFQ1lVV2xvVVNn?=
 =?utf-8?B?VzUvV2pBM0tSbm54Qm53V1hxVmhmSWQrUDdEdFBIYzFDVndrdU1HbkpMS3Nz?=
 =?utf-8?B?T3p6MENGYzluSXZmZjZ1dFVna2FZS1F5ZndwTlMwZ25pTHJ0OTNIRzBGVzRL?=
 =?utf-8?B?YlZ2RUlHRWt3L1d5cG5lOXNyZFFERXVFenJiTVV4a0Y1b2k1a3VrZ1J4eVRV?=
 =?utf-8?B?UzJwWWRnMk9VclNaZjRLdmRwMFcxL3ZWdVN4WXJEVDVoRVhiUUtzNGtvM1lX?=
 =?utf-8?B?N2ErSkZmOWdrajJjTWNidmxHSi9wYUxPeEc5N2FWNjNXSnBBbTJLdDQ5UzhZ?=
 =?utf-8?B?d2VCMEFiT2VWcGFRZEUwbHBWcDF4WW05TDh6TG9zZGk0NzNYODBzUkM3WU01?=
 =?utf-8?B?aklBdjJZclhCR2ZWMnFhNnY3eWt3SGRydEFIb2hlclRvUVllL202SDg0TVNz?=
 =?utf-8?B?WjFyRnNqUUhELzdYbDhKd1YrSGRtNUZCblRDVHNjNWJIVlFwRFFkT3BscmZj?=
 =?utf-8?B?c3UxWGVqd0crclIxNTZPaE85MWNRNjhzS093VzMxdzNHMXRuTVpPdUxlOHBP?=
 =?utf-8?B?VDJ0R0FqWWxuamZjTjhsdTB4UmdMVE9leHkrNUs3NjBIMEpmejdka1NGa2g5?=
 =?utf-8?B?bEIxRjRrbjNtdFM5ckV1cjNoOG9tY2s2WUtqN29tK1RjUXZjTmhXbVFBSGZJ?=
 =?utf-8?B?dEF6Tm9iRjY0cWdXZHh6cWtWNURXYXdudGNWV1lQZzQvLzJNcEtKczVtWThL?=
 =?utf-8?B?RDVlRFk5WGhybE1XTkVtb0lmMmlSQnZINWtEY1p3c0M2QzkxcmRtTHNzZnE0?=
 =?utf-8?B?RTNhYVQ4ZWJPWlJQUE0wZ3lDNW1PWW1NSitCRjN2QVZDQm5QTlIyVzJXektV?=
 =?utf-8?B?dG5INU5MM2RhQW5ZNVZSWGVPTnRnZENsT0xZZm9LTlRHcVErS1AxekFIZ3ov?=
 =?utf-8?B?cDBDS21wZmxzTGxnRTdTR1o4SFVBVklCbG9WWjBGTE95b3BVWHdKc0xNN28v?=
 =?utf-8?B?NExWOU5ubytXaTI0VGhoSlVxS2ZQWlh0OWYrZ2dsSjNoUGdneXpaeHdFZUhn?=
 =?utf-8?B?blZKbEhOYlBzN2dlQXMwV3pXM2lYUTd6MGthV2swTkpETk9xcitUREcvMko1?=
 =?utf-8?B?TGJqQm1tQkpTMnhGZ0I2U0tFYWhkWjRvZ2QxTWl4RURtbUkralFEODUwT3JX?=
 =?utf-8?B?cEdTZ1Z1VUVYVVFKY01MaE5vWC8wNmpoL0Z4cHJkNkI4Zi9vT0VFbGxxS2VD?=
 =?utf-8?B?M09MRWQ5YnEzd1UvM2JoZGMzeEg3eU5Qa1lXcG1mSnFXSDVaT3R2WGN4TUVK?=
 =?utf-8?B?NTRMV0hXQ0dSUVVkSDREOEJjdXB2RkV6Y3RVWEltQ3JncEZWbDA1Tlo0cjA1?=
 =?utf-8?B?aVFLTTR3U1dIbm5EeHFHbDRtWDBtSlBpYWpxaEFpNG8xbm83dlViRkExL1FY?=
 =?utf-8?B?eVorUzM5NXBvNEJQQ25HZ2FOTW01Q2dZaFJCSUNyVGtMMEwwSUdVL2J0cGVM?=
 =?utf-8?B?amhCeDlrZ2plMTcwcUk0cmkxN2c3Y2htMnRueE8vdUNwbW0yQUlCNTd6eUd0?=
 =?utf-8?Q?Z5el3IZPiEo+1yw3O+GhCKf1I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20319a55-8275-4978-b4b5-08dddb1afed3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 10:11:55.0540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7NNPmH4DamlxeEmYxSqfAsFXSSf2s1YzeDepbHdD7iiV3qTTB1OvvtSGF97NBKQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108
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

On 14.08.25 11:39, Liao Yuanhong wrote:
> Adjust the position of the memset() call to avoid unnecessary invocations.

Hui? That doesn't seem to make much sense to me.

We memset the local variable because we need to make sure that everything (including padding bytes) is zeroed out.

Even if that isn't sometimes necessary because of error handling we clearly shouldn't try to optimize this.

Regards,
Christian.

> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
>  drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index 9b3a3a9d60e2..0aae84f5e27c 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -770,13 +770,13 @@ static void atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
>  	int index;
>  	union set_pixel_clock args;
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>  				   &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	switch (frev) {
>  	case 1:
>  		switch (crev) {
> @@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
>  	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>  	union set_pixel_clock args;
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>  				   &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	switch (frev) {
>  	case 1:
>  		switch (crev) {
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index d1c5e471bdca..f706e21a3509 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
>  	int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
>  	uint8_t frev, crev;
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	/* some R4xx chips have the wrong frev */
>  	if (rdev->family <= CHIP_RV410)
>  		frev = 1;
> @@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>  	if (dig->dig_encoder == -1)
>  		return;
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	if (ASIC_IS_DCE4(rdev))
>  		index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
>  	else {
> @@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	switch (frev) {
>  	case 1:
>  		switch (crev) {
> @@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
>  			(radeon_connector->connector_object_id & OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
>  	}
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	switch (frev) {
>  	case 1:
>  		/* no params on frev 1 */
> @@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
>  	uint8_t frev, crev;
>  	struct radeon_encoder_atom_dig *dig;
>  
> -	memset(&args, 0, sizeof(args));
> -
>  	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>  		return;
>  
> +	memset(&args, 0, sizeof(args));
> +
>  	switch (frev) {
>  	case 1:
>  		switch (crev) {
> @@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
>  		int index = GetIndexIntoMasterTable(COMMAND, DAC_LoadDetection);
>  		uint8_t frev, crev;
>  
> -		memset(&args, 0, sizeof(args));
> -
>  		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>  			return false;
>  
> +		memset(&args, 0, sizeof(args));
> +
>  		args.sDacload.ucMisc = 0;
>  
>  		if ((radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) ||

