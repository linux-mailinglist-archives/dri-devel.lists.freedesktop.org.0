Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4E74F4F3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206F10E3D9;
	Tue, 11 Jul 2023 16:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92510E3D9;
 Tue, 11 Jul 2023 16:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9PskqAaIxn1A0N8E59tD2TWsX+Wb4LJFpNvKif+EstprTN4giV24gRL9BqCLIrVofXZIw05uEFfKaGVCWzNddMUlmakIo/I0oYK0wp1RsEZ97+m0El9ZXxxLyCtIatuBeTfr+NbY1bZGSSujND6LSOq1V3EOA0/T7AmqG0Bg5BVT9GM79nyvSpX3OxSvQ5MDJQw3ffKt+sh/E4lA4/3DNgaGi3W/6DXNR+xxF7/BJMwDlZqD4kzzD97Po6XHi9O0Vy5P8XMS5WC/j8J4Q2SIzdzk+kjcMV3ZzFWSxgFTH0+7lvNPIVZZOe2tMTl0BLIeAzPWzTMVJbDuaBTSYWzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzhivMGtoMTJdCQnHDY8O1+nSf353x9ojtwSF2Xj1+E=;
 b=bNDsb82EZq/B7Wqz2e6f/VQDUQC83JDDcwKgiaRrw7JA86SAO5WXxA6Ttk69WWEIOBiFd7w3NTca+Vv7JW8EO0A0XjW73lQDmMrTn5OWerxL6qmiIjhW6kC5XXAymyRgfhgojTcQHS6HmfWUcxhD/XK0v8nLny++yxc86WE8OzLYGsF1S90MvoRySbmovy7dw4ELYsq+O5nIif48dpC5tzD/bmaj/8QZ12qzBrIdOYzRXVPhnURtuOPZXnn8r9OOjVQ29fmgVt3CgV15OpsBgeFC5iX9pZ4p8TwK2b90d26zUgB3LNMVQ/dUzzCNFRuZdga8xEXqlsBYdFc5VTTkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzhivMGtoMTJdCQnHDY8O1+nSf353x9ojtwSF2Xj1+E=;
 b=04yNvCcDdYVYGlXIuvKui0deJqAQxuTDnF9SrJslv25Pghn8RkrO4CPz8gYWgQT/OQtu6U7xCCSFdparogc+uFFqDiirYByAJPlqbo6I9vtwcbhE0gEGH5XhADyTDDCShA0UcUrBLUrC9wIW80tltUAfZRE6M2uqteWMpWeT0AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 16:19:33 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::68b9:3f7d:ca38:31ba]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::68b9:3f7d:ca38:31ba%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 16:19:33 +0000
Message-ID: <783e135b-b167-132a-fcd8-0ffce52ec259@amd.com>
Date: Tue, 11 Jul 2023 12:19:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] amd/display: only accept async flips for fast updates
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230621202459.979661-1-andrealmeid@igalia.com>
 <20230621202459.979661-2-andrealmeid@igalia.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230621202459.979661-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::8) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: bdac076d-b080-4140-c810-08db822a9c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1s5HVyl4SjLIdZYG9oDhEWOJD03IQh/hPTsNG18Edhap3X59P8U35hxlSKrEYayfxpbTuhAPvJkP1uuSgf2KaX3FNKYZKtakHeolEGY2q/zRoS6GkJLGjofYkoDSVLNReyh4jkc24/AWEZ0SFdCjutHSpxn18WOVfLzJzBZNMuUZdhyt50S272JoUJUbqaNBoJsL2g9SH9Lb3VdraUuGHbcD1jCC/yFW7YUYbmMXDo4e1s98KiZKfXFdDRvC8ZMApaqHe71k4cvjr+6zPYJUCDU67SKUruYJx4fnjb59zXVTw6DnXXrSLdXMmDsG9jwU0iIpMRlI6LfxR5n3PHdBv2MPotLghwOxfL4AqcWD5i+ZV3vYBMzoUEsDBBFJdigaYTqJ0DgyGxHcMonB0Bs5xSuqAi/lgE0oU4d1ZvhBdFAv3ZP5a6jvmDldOoOwmtkWha64KxV/sI8PXtiEkAruMxj6/1vUpfCYqhn1Hg0qHHH+/UOaaICKgh/K+/JkuHmuRxwiPk4RNuiQEs+CwkUXa+XT37mzrALeJm9TcHbw0VS8mn2juiu4Js2iOOXMeSMLENpsaqRh5Ff4Cc2vHU4lN6AhcfJ0Hez0f3PgQ7UoTEoz5oTMl231EM4hMPQDWukd3V9m3fyF6AJnBeNl4Y1UCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(6486002)(478600001)(54906003)(8676002)(5660300002)(36756003)(2906002)(15650500001)(86362001)(8936002)(44832011)(4326008)(316002)(66476007)(66556008)(66946007)(38100700002)(41300700001)(26005)(6506007)(53546011)(31696002)(83380400001)(31686004)(186003)(2616005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9qMmlFeklaMkFFYVlqNCsraFlnU3VqYU5vNmIwQ2dtd2E2S25YWUw0Smpk?=
 =?utf-8?B?MnZKRWhWbkt4Q280ZWlCVXBVdS9lR1IvY1ZrSG8zdWl2L2NMWHEyV0JGSGNY?=
 =?utf-8?B?Tmh5UTZOQ2JDS04va2d5a1g1b0pOMFJDbnBQdTdMam96MHV6ZWV0UXp6WU16?=
 =?utf-8?B?d0J4OC9RYkFXQmZ5bUZtNExLV0hsb2sySkU3Z3JyY1pMS3hkTWRKK01pKzBp?=
 =?utf-8?B?bnNGWW42Q3VuNElnODgzWkJ0blc0SXNZdGU5dTc2TWcvc0dKaTRBcFlUNU1B?=
 =?utf-8?B?S1JUVEVyOS9pMVhUWUNOY3JqNWkvYVE0RkhCZHVzY0NPc1dhQUgrZHVNdGlF?=
 =?utf-8?B?dUErMW80NldST21nQW9TVUtJWEoxN01HQTdBbnI3b3lRcTUybFVLbzJFUURV?=
 =?utf-8?B?eitXSTcybGY2Y015djdObHdQL2dRZU5LN3FRZE85U3RWNzNxTjhjdnpwSTZB?=
 =?utf-8?B?bnlYY1Y2TmlKdFM3SnVKNHpvR2JCRncwdzdIakwxOTlrWEZlN0N5ZmQxUi9F?=
 =?utf-8?B?Vi9QclRIU0hlVGZlOThOeGxEMTdmL1E1b2ZuQnZOd25kS1pQaGFraUoxOWN2?=
 =?utf-8?B?REl3Zyt4RWR6VU41d0t3U3JWUHFaQktWYXIybXRYQzF4TTdJMHE3aEJhQWZD?=
 =?utf-8?B?c1NZSkt5UnNBdVp1TkE1NDRiaU5qNmM2cjQ0SXpiTmREL201WWlNUU16cDE3?=
 =?utf-8?B?MllpRGkxVDdzc1RXdG1CSG4vL2lJVmE4UVVBTHQ1TWMweGhkVE1MaS9sL1Zx?=
 =?utf-8?B?Z2hyMzZBZTdEZHptTWl6bktueGdpTlJ1NDYwU0NhOU1YMFptRWw3MmI5WDdY?=
 =?utf-8?B?Y0NMdlRGbHJNTzY5cmw2M0NSZ2pQSkRJUDd3VStxYzl3NW4yS0hycldST1pZ?=
 =?utf-8?B?bGY3Z3BMRVI2L2NIeFdpZkRBZEpEM3pVM21nemo0TEdNMEJNRGsxMG1vc1V2?=
 =?utf-8?B?QmtkWnBFaUNTUFNxRU1RUjJodzR4bThwUnhhbkFWWnBweDdQbTJZa09acFZa?=
 =?utf-8?B?a29xR1dwL0JpNCtVSWxNL1AzSWVUbWZQVGVUVW9DNzcyYnM3d0ZYRC9sNzhW?=
 =?utf-8?B?UExZOFZ6OTdWWU9PaWFJeHcwY29Zb0FxR1dCQjRFYnZmaG5qbmVLRkhXUHV2?=
 =?utf-8?B?Sk8yeloxOHNGMmxRM0U2RlhFMndHRm9iSzNINmdVK2NKZzN0L0hubElaQzF3?=
 =?utf-8?B?MzR2MEQwK3pMSGlFQW96WkNUOFYzYnRhUENsSGVYcmloK1hkakN6cXM0WGdE?=
 =?utf-8?B?cDdDYW5mK29CM2NXMEVOazhmZ01IL05mZkc2aUJzcFRuclU4bHFIME1rWjZy?=
 =?utf-8?B?TXF5YVRsbk5hQS9yck1VWXdEVGU4bjBKd2xsOGNsc0JGZFVnWnhmdHV0ZWsv?=
 =?utf-8?B?VGF0bFlvUWwvWVl3Um4xVnJ5WVB0eDdRWmV1aTI4cWNQRklFczZsVUJRREFy?=
 =?utf-8?B?OE9QSlcwaEFubkc4dU42OVV1cWYxeXRQM21QSGl0TWlkRW5Vb0tQZldxeHFN?=
 =?utf-8?B?dm1haEdjQ0FzSTEyMXh0dWpkeTA1V0JsYkJhcHM0RHhSOG9SVHBaVzdkSW5F?=
 =?utf-8?B?UCt2SmRESi84TnRXMUlqMHdKelRiSThadjJwV25uenpUd1l0U1JLRFczaVBF?=
 =?utf-8?B?TFhkdWZnSTRkOFpib09WUHZlTm5xUzl6NWFEcUpwWVVCYTBvTmJwZXV6ZHhi?=
 =?utf-8?B?TmcwUFNJZHBRYmpOVE1OVy9nQTBTaDgxR2JyTUwxSEJGYlVySUN3U2pWUzda?=
 =?utf-8?B?SDIzVFFDaStGMXJKa1dieHNvMVpnR1MrT3AydkNyblY1bVJOT1kwZU9nQ2JK?=
 =?utf-8?B?aktSMnFBTStHSVA0VG1DRHNUTmdvdHdTYWhRMjBPRzN0T1VKaHZ6VUNFV2ZT?=
 =?utf-8?B?Y3QxNkRPbU01dVJYZC9COForVzRxVnowblJDcHdHTFNQQTdoSjNIT2dZVE9L?=
 =?utf-8?B?Q1Q4Z3dlVi83cjZKeDZCaXc3SEFSSUpNSmZaQ01sZkhmcEVRWFRXeWVKdnlX?=
 =?utf-8?B?OHd4dHNVeWN2eEhoVUgxdEs1R0dSUjNDUG8xVnZXWlZzZ0RDSzhIQ1o3N3Z6?=
 =?utf-8?B?ZEZvWDFMeUxMcHZxcDMrQjhMcU1HcGljdGEydlYzWnpHU1R3anV1UngvY3hw?=
 =?utf-8?Q?98e/kcfrnhQCACcx3qCcVvsRY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdac076d-b080-4140-c810-08db822a9c6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:19:32.9540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLGnculFAHzeqX8rCbETr8fCok1Q4uL44m04PNn6LDGF0zjBuMgkG+0H1qCHb/Mja48IgsmqIGZ1luUDWbBjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/23 16:24, André Almeida wrote:
> From: Simon Ser <contact@emersion.fr>
> 
> Up until now, amdgpu was silently degrading to vsync when
> user-space requested an async flip but the hardware didn't support
> it.
> 
> The hardware doesn't support immediate flips when the update changes
> the FB pitch, the DCC state, the rotation, enables or disables CRTCs
> or planes, etc. This is reflected in the dm_crtc_state.update_type
> field: UPDATE_TYPE_FAST means that immediate flip is supported.
> 
> Silently degrading async flips to vsync is not the expected behavior
> from a uAPI point-of-view. Xorg expects async flips to fail if
> unsupported, to be able to fall back to a blit. i915 already behaves
> this way.
> 
> This patch aligns amdgpu with uAPI expectations and returns a failure
> when an async flip is not possible.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  8 ++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 12 ++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 514f6785a020..1d9b84e5835f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8136,7 +8136,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		 * Only allow immediate flips for fast updates that don't
>   		 * change memory domain, FB pitch, DCC state, rotation or
>   		 * mirroring.
> +		 *
> +		 * dm_crtc_helper_atomic_check() only accepts async flips with
> +		 * fast updates.
>   		 */
> +		if (crtc->state->async_flip &&
> +		    acrtc_state->update_type != UPDATE_TYPE_FAST)
> +			drm_warn_once(state->dev,
> +				      "[PLANE:%d:%s] async flip with non-fast update\n",
> +				      plane->base.id, plane->name);
>   		bundle->flip_addrs[planes_count].flip_immediate =
>   			crtc->state->async_flip &&
>   			acrtc_state->update_type == UPDATE_TYPE_FAST &&
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 440fc0869a34..30d4c6fd95f5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -398,6 +398,18 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * Only allow async flips for fast updates that don't change the FB
> +	 * pitch, the DCC state, rotation, etc.
> +	 */
> +	if (crtc_state->async_flip &&
> +	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> +			       crtc->base.id, crtc->name);
> +		return -EINVAL;
> +	}
> +
>   	/* In some use cases, like reset, no stream is attached */
>   	if (!dm_crtc_state->stream)
>   		return 0;
-- 
Hamza

