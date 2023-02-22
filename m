Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B869F2E6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8830410E959;
	Wed, 22 Feb 2023 10:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41CB10E959;
 Wed, 22 Feb 2023 10:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dunOBNYRO0X4roEkZSNRrfPSIYwEeBdfwnLeppYHxvKDE3sBaYoK/608R5NLzQOT0HTaaKfeAomSW90on2gb9K/P2zGzjTuZrzAgqdHnGDGXQhQiJ42IMY8BcD/Z7hxJNsgK9LOz441Plexgjd0Wpmr4L24YfmrZw22W2UidI4J21/qJ1c+4Bq+QTsHfKPgq+P8DmdIoEpZ5/CmyRwMsSVJtR951XLBmF7Ip9KwM2fpEwG2x+ffEyoPvjetGVRkweKAtHPrEGMFyc/txyiS6Bwj+7hZKGte1m8BQgXjh2earTJdUf7lyRMvzvuMlRvQNlf/xn5AoGuFJFNEebcXY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IocLp5Si+wHCKSufOnqhKpMrx2BJh9lWuBD+7R/o210=;
 b=CSM//U2h/2AW7gc5kzJXB9OuE1DvYIZM/OdptA1BcspBj3CaMLr23R86sQAfs+y/nkD6xgrI+VfXE3bn5YCEayy/+an3ZIlJQGXZhdcYBQdUYXEk2hQNkCx2AysMPCGZke49u3dp131lnhRMYBxVDdtKeoFuerJEU2kFUbWGeFVhffpHrEdNXBt8Qzd6tnRBOHvwcMfa1Yqw04BkktVFUi7vugkjEgG32sgy6Dl+WW139vULqz1Rmg3b+2rwNAhXJv3l+2JZBI7IEKWNoddCKG28EQ139db7oNQjHih9dL9sNH1AudMnTicKGHVEOgENkhyUXX7uCPHwMZIPkIcMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IocLp5Si+wHCKSufOnqhKpMrx2BJh9lWuBD+7R/o210=;
 b=4Mg/Mu63oX3rA25ZzqgONxgQ+SenFDlV/yrjXFghyB1LKUm3vwj+Mz6rkAAlMuoN53L5qwso6UbIS5lYAZBMmrvYuRNOavovqc/NJlX0wq4U2fScSHtlx/lqwBz7jpGoKoTn+yyRKsEzhh7K2L26Gy8LSiptfV/5dSHpp15ZeH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Wed, 22 Feb 2023 10:46:46 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:46:46 +0000
Message-ID: <a4a72b25-2db3-21c4-c8c0-bb027db59d61@amd.com>
Date: Wed, 22 Feb 2023 05:46:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-12-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 11/14] drm/atomic-helper: Set fence deadline for vblank
In-Reply-To: <20230218211608.1630586-12-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 9915105c-e387-4e41-8601-08db14c217ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTjmXxUL0NABcOuThM7M9Yi+ilRgOHRs7YPP/bcUJhYTa+uNj1YsC5/qRA0bYDdqGdvEUBAbJcfUVO7FqJjsbbY01HKcgpsj59vOXKsqpYIjSQijnAcf+0XQzg8j/32KUA0WkJjb8FLU7IVV8NpbKszaS0d6IljUT490goG+1t7RG9nWre/Ygn3R+GWlqsMjWA14f2fqNtdoAXSHiq8S0MBRlAnXvAneXXEoTbS0FBJu67fw1FejdwLIk50iBJBbc+RYB/TOcz6vvpZ6m2k7Zm9nueEzOKBhqxUv7hsAEV7A31Nde3SKDAsfscyVetxCdJrCpIITJkP19dew2niJ9QMpqgyvlvHkB0OP2PgX27EdEtrbdu6LaUS/R7QJTc0Wcv+SBjHjVkzeLJvMrCyowxAIUkz2yxDOQkRj7MV23+v77AgxJtuh4rcsbhQEdL9L5uZqQ4Oag353XDIDP48NUV5JQbL91fCHEls8rjMUnuSPTQnTh2m1mtA4tNOmhbeCubOwoLYpOappjtFDGcp5NFgYo/MASje8rSg8yAXGC4aPMVS3//Id73LOHAXd+1VkM3Go4AKeKN5tTdxRuCHrw52D+N/VVLyg/4lVRCaL2FkdCQUHagOBzMAHiLyTMGH3VDFfbOPTQqvq0JS5BcRddt5HTMWpen1s/ox8ymBEcE0yItO5MetqAIFzMR3kYl5LvFsldJPCmmL9SwXFVuCzkdUv4/ECslVVhsW9QlwP7Qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(66476007)(83380400001)(66556008)(478600001)(6512007)(186003)(53546011)(55236004)(86362001)(6666004)(6506007)(26005)(44832011)(31696002)(36756003)(316002)(66946007)(8676002)(54906003)(2616005)(6486002)(38100700002)(41300700001)(2906002)(8936002)(5660300002)(31686004)(7416002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEovRFFSL0FINEZPV3F5MHBCSVdQZGhOdXRiZDIwQlNNcGlJNC8rWHpTdFhN?=
 =?utf-8?B?STdHU3ByTmMwck1SbWJDU2pSU3lwSDNvMjZjUksxajFSclpJTUFDT3dCUDdP?=
 =?utf-8?B?MUMyM1ZMS2dFYVdkeTExZXAwZnBvWUd2bi93YUVXVkExczVBMlhrd0Q3N1No?=
 =?utf-8?B?ZVNiUUNpN0RHb2JHdnhGbFNWbUZnR08rcE5yOVdjamRaTWcyVldvWWZ1VkhV?=
 =?utf-8?B?OEViQ2JVWUNudFBRd1VZZWZyazNKOG9iRHBsZjJFZXN6eHhxSnIrcVlNNitQ?=
 =?utf-8?B?U2JjMnlxcUVkeXBueFlnKy9IbXZrcU45VEZDdXhGZ3hsRCs3Y1RwU3lMU2wx?=
 =?utf-8?B?UDZBeSswYVVpb3ZwelYwZjhyeFVkN0FrbGc2ZlBObFZDWVhJUDYrMkd3MGUw?=
 =?utf-8?B?elE3c3dXRldRb1NQam5Kb3ArckNYOWFabzdsOUZrRy90V3pobVRYWGFTZDVS?=
 =?utf-8?B?NE1iZXlkeXFRakVaRWJCZzdma3d6TWFrL3BDd0ZQQXp6UXd0NHNmYzFKNVl3?=
 =?utf-8?B?MEd4czh2MXU2c051R01FbUpvRWNnUmdCcGFpaG15MDFYa3REY29vd3BjU3dN?=
 =?utf-8?B?a0Zhd3NkY1U2ZFpzVnNicExFMithMmF3QitYTW1nY0hldFJwSXRsamYrbk1L?=
 =?utf-8?B?Vm5rak1nc0lJNGJQYlRnOXdaLzE5Q1llVVd5R0xoeGpjYm42ckVkdTVGbnE1?=
 =?utf-8?B?TENmTlpmbWtMTUFUYUlWaHZKOFY0ZndqaWo5endFS1ppRk53S1JvdlVKNzJq?=
 =?utf-8?B?aEwvcGFWOFZZbFNRUHdEUFRwRlFNbEZuNy9zQ1ozQ0dpQWZ1UEluNFIwU2Zn?=
 =?utf-8?B?dER2Q3dub2xOSnFlcnhVa0hZaUxDL0xYUTk0YlRoVHV6c1ViY3cvd2QwSFJU?=
 =?utf-8?B?dGJMaUFkRWJadFlJemNPSU11NW1OVUVnWU1lQjRNVEh1RFZwTi81bXBPRzVt?=
 =?utf-8?B?eXl4aHBYU21ibkVlZnF2YkRpU3N0ejZQZzJ5N1YvZWoyN3BXNWRVQ0xGZnNo?=
 =?utf-8?B?cFVZS1E3Nkw0MENzZzhOUURFK0pieTVpdUFZRVRYaEJ5N2lpSE5JL1NqK2ND?=
 =?utf-8?B?WXdzcTJaY2d6RVo5RjZPUFkrYmtMd3phSktqckIrTTIraExVaWlSSldMelFz?=
 =?utf-8?B?MTVoQ3h1N2w4SEx6S2tpT3F3VWVBcW1kUzdrQkNrRkRkd0N6Q1Y1QUZ1OHdL?=
 =?utf-8?B?K3JwRXl1UDJRMWxFQ2MyN0FOZWVxZVZCcnpKdHhUL1IxTTVBbllhMndQa09z?=
 =?utf-8?B?Z2FHRDJNcjNwdEo4NmdFMklzOUxIMGQ2cUh0Nk9LV3NtQVNqK0ZpQ0lPZ3BO?=
 =?utf-8?B?aHRtWnhneUtJT05oN0RWeTdKSVlkZ3JwN292bmtyL3l1SGljcTJDdWlpRG1k?=
 =?utf-8?B?NHJYOXpMaFZEYlVrbS9TYzk3bWlsdUVSZC80cit5YlEydE5nZVlqdmJNSVkw?=
 =?utf-8?B?REVpdExaNGlROVF6YjNLckYrbXd3Y2dhU2ZxNE1HM2FPRmxMUFIySUdNNUJE?=
 =?utf-8?B?MmNMeTlzbzRya3BNdytqeEY5TUpMRE5YcXR0VWsxNGVsUXF0RUo1VjJYMXlh?=
 =?utf-8?B?RC9aMmJzd1RFTFZmV1lwSW9HVUZzN1QrZHkzS2o0b1FwK28yWDVmalJWYnQy?=
 =?utf-8?B?WFlHRzJGZVhSREN4Sm5QdnQvQk84cWJkZHVjVFV4Y24reEtCUmJvaCtiVURr?=
 =?utf-8?B?dTEzdzlkYWU2UlJEa203MERnQXNUanhlK2RQcFVFdUFzVVdBSTJpQWJ3OE5k?=
 =?utf-8?B?WUpubG8ya1RhTWJyUnRHZjR4elZEYTNwWnRrOW9icTBLL2xPRjBDMmk5VjRW?=
 =?utf-8?B?NnNKSDh5M3ppbTZ1OXVIeHNtTmcyblNWQ2VaOFNxQStEUzUxa0IyWm1Ha0Y1?=
 =?utf-8?B?ZUQ0LzNvZStpNldqUzd2aWpFWDdrbWxyKzJ3aktPaXN3WTVXY2ppYStacFhQ?=
 =?utf-8?B?ajdHRHR3eG90enBBRVdlRmN1dHZ6RzNqZ0tsTHpFcG4wN3NLYkJXaVJMNWxD?=
 =?utf-8?B?WWZ4dkxPd3VlVXFFU2pPUTludUFtL0JMRDZ0bFlmTDdRbDNZaDg4WUpaMU84?=
 =?utf-8?B?YjNWYzhnR2tzbWZKMVduWlBxUDdBUVVsZmk4TkxBOWMwWmJuRzg5QUd6VGMr?=
 =?utf-8?Q?zNbIjeoxec9C33FiL/EIk2Mbf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9915105c-e387-4e41-8601-08db14c217ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:46:46.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PqekLzisNGgT7TQm4A5Xg122uu+GrF0nmK7uOQvlsQCB66L70/Yy9y43ps8kwJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-18 16:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> the next vblank time, and inform the fence(s) of that deadline.
> 
> v2: Comment typo fix (danvet)
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d579fd8f7cb8..35a4dc714920 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1511,6 +1511,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
>  
> +/*
> + * For atomic updates which touch just a single CRTC, calculate the time of the
> + * next vblank, and inform all the fences of the deadline.
> + */
> +static void set_fence_deadline(struct drm_device *dev,
> +			       struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc, *wait_crtc = NULL;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *new_plane_state;
> +	ktime_t vbltime;

I've not looked at the latest language spec, but is AFAIR "vbltime"
would be uninitialized here. Has this changed?

> +	int i;
> +
> +	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> +		if (wait_crtc)
> +			return;
> +		wait_crtc = crtc;
> +	}
> +
> +	/* If no CRTCs updated, then nothing to do: */
> +	if (!wait_crtc)
> +		return;
> +
> +	if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
> +		return;

We have a problem here in that we're adding the time remaining to the next
vblank event to an uninitialized local variable. As per my comment on patch 10,
I'd rather drm_crtc_next_vblank_time() yield the time remaining to the vblank event,
and we can do the arithmetic locally here in this function.
-- 
Regards,
Luben

> +
> +	for_each_new_plane_in_state (state, plane, new_plane_state, i) {
> +		if (!new_plane_state->fence)
> +			continue;
> +		dma_fence_set_deadline(new_plane_state->fence, vbltime);
> +	}
> +}
> +
>  /**
>   * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
>   * @dev: DRM device
> @@ -1540,6 +1574,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  	struct drm_plane_state *new_plane_state;
>  	int i, ret;
>  
> +	set_fence_deadline(dev, state);
> +
>  	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
>  		if (!new_plane_state->fence)
>  			continue;

