Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA49BFFF5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 09:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FB310E316;
	Thu,  7 Nov 2024 08:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CeCLY56N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672F10E316
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xFM13f69DN5zzuT//cYCcdtbvVfoCE41XFFb2I+CZ3Q=; b=CeCLY56NW6OheVoHNdKG7icO/0
 vZ6D8Cy1a1fvc+TC3S6n2GXLkfvdIHZQh80B9gMvWzesw2JOGhcnJSet5XA1rPecCWf3tq2MriXQO
 su9JwQ8dIFmTBfKMWP6Js0d80XFka5t6fhgiUJEc/NRh7nt4hlgZSMLVozO5voHaiskgugAUjl+sc
 Qbl1wfZqQLLdd6OHZO6VZRAitttjP7nc/HEokwwT5lHx2OM+OOnzp1Hgd9/o1x45NRAssXzlRoLSq
 1IetzdophlD5IYtPdgs2IeWlqKq5hbbd3R/kChi0eXcEd/QCbizNNHjQajZ3CODHNe/DfT6IXfSnS
 /B5iv3Eg==;
Received: from 62-178-82-42.cable.dynamic.surfer.at ([62.178.82.42]
 helo=[192.168.1.12]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t8xtk-003U0j-CI; Thu, 07 Nov 2024 09:29:48 +0100
Message-ID: <678a86c2-ced4-4e62-94c8-78d559c605e3@igalia.com>
Date: Thu, 7 Nov 2024 09:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Fix performance counter source settings on V3D
 7.x
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241106121736.5707-1-mcanal@igalia.com>
Content-Language: en-US
From: Christian Gmeiner <cgmeiner@igalia.com>
In-Reply-To: <20241106121736.5707-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


> When the new register addresses were introduced for V3D 7.x, we added
> new masks for performance counter sources on V3D 7.x.  Nevertheless,
> we never apply these new masks when setting the sources.
> 
> Fix the performance counter source settings on V3D 7.x by introducing
> a new macro, `V3D_SET_FIELD_VER`, which allows fields setting to vary
> by version. Using this macro, we can provide different values for
> source mask based on the V3D version, ensuring that sources are
> correctly configure on V3D 7.x.
> 
> Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>


Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>   drivers/gpu/drm/v3d/v3d_debugfs.c |  4 ++--
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 15 ++++++++-------
>   drivers/gpu/drm/v3d/v3d_regs.h    | 29 +++++++++++++++++------------
>   3 files changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
> index 19e3ee7ac897..76816f2551c1 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -237,8 +237,8 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
>   	if (v3d->ver >= 40) {
>   		int cycle_count_reg = V3D_PCTR_CYCLE_COUNT(v3d->ver);
>   		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
> -			       V3D_SET_FIELD(cycle_count_reg,
> -					     V3D_PCTR_S0));
> +			       V3D_SET_FIELD_VER(cycle_count_reg,
> +						 V3D_PCTR_S0, v3d->ver));
>   		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_CLR, 1);
>   		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_EN, 1);
>   	} else {
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 156be13ab2ef..7df6dd933c63 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -240,17 +240,18 @@ void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon)
>   
>   	for (i = 0; i < ncounters; i++) {
>   		u32 source = i / 4;
> -		u32 channel = V3D_SET_FIELD(perfmon->counters[i], V3D_PCTR_S0);
> +		u32 channel = V3D_SET_FIELD_VER(perfmon->counters[i], V3D_PCTR_S0,
> +						v3d->ver);
>   
>   		i++;
> -		channel |= V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> -					 V3D_PCTR_S1);
> +		channel |= V3D_SET_FIELD_VER(i < ncounters ? perfmon->counters[i] : 0,
> +					     V3D_PCTR_S1, v3d->ver);
>   		i++;
> -		channel |= V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> -					 V3D_PCTR_S2);
> +		channel |= V3D_SET_FIELD_VER(i < ncounters ? perfmon->counters[i] : 0,
> +					     V3D_PCTR_S2, v3d->ver);
>   		i++;
> -		channel |= V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> -					 V3D_PCTR_S3);
> +		channel |= V3D_SET_FIELD_VER(i < ncounters ? perfmon->counters[i] : 0,
> +					     V3D_PCTR_S3, v3d->ver);
>   		V3D_CORE_WRITE(0, V3D_V4_PCTR_0_SRC_X(source), channel);
>   	}
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_regs.h b/drivers/gpu/drm/v3d/v3d_regs.h
> index 1b1a62ad9585..6da3c69082bd 100644
> --- a/drivers/gpu/drm/v3d/v3d_regs.h
> +++ b/drivers/gpu/drm/v3d/v3d_regs.h
> @@ -15,6 +15,14 @@
>   		fieldval & field##_MASK;				\
>   	 })
>   
> +#define V3D_SET_FIELD_VER(value, field, ver)				\
> +	({								\
> +		typeof(ver) _ver = (ver);				\
> +		u32 fieldval = (value) << field##_SHIFT(_ver);		\
> +		WARN_ON((fieldval & ~field##_MASK(_ver)) != 0);		\
> +		fieldval & field##_MASK(_ver);				\
> +	 })
> +
>   #define V3D_GET_FIELD(word, field) (((word) & field##_MASK) >>		\
>   				    field##_SHIFT)
>   
> @@ -354,18 +362,15 @@
>   #define V3D_V4_PCTR_0_SRC_28_31                        0x0067c
>   #define V3D_V4_PCTR_0_SRC_X(x)                         (V3D_V4_PCTR_0_SRC_0_3 + \
>   							4 * (x))
> -# define V3D_PCTR_S0_MASK                              V3D_MASK(6, 0)
> -# define V3D_V7_PCTR_S0_MASK                           V3D_MASK(7, 0)
> -# define V3D_PCTR_S0_SHIFT                             0
> -# define V3D_PCTR_S1_MASK                              V3D_MASK(14, 8)
> -# define V3D_V7_PCTR_S1_MASK                           V3D_MASK(15, 8)
> -# define V3D_PCTR_S1_SHIFT                             8
> -# define V3D_PCTR_S2_MASK                              V3D_MASK(22, 16)
> -# define V3D_V7_PCTR_S2_MASK                           V3D_MASK(23, 16)
> -# define V3D_PCTR_S2_SHIFT                             16
> -# define V3D_PCTR_S3_MASK                              V3D_MASK(30, 24)
> -# define V3D_V7_PCTR_S3_MASK                           V3D_MASK(31, 24)
> -# define V3D_PCTR_S3_SHIFT                             24
> +# define V3D_PCTR_S0_MASK(ver) (((ver) >= 71) ? V3D_MASK(7, 0) : V3D_MASK(6, 0))
> +# define V3D_PCTR_S0_SHIFT(ver)                        0
> +# define V3D_PCTR_S1_MASK(ver) (((ver) >= 71) ? V3D_MASK(15, 8) : V3D_MASK(14, 8))
> +# define V3D_PCTR_S1_SHIFT(ver)                        8
> +# define V3D_PCTR_S2_MASK(ver) (((ver) >= 71) ? V3D_MASK(23, 16) : V3D_MASK(22, 16))
> +# define V3D_PCTR_S2_SHIFT(ver)                        16
> +# define V3D_PCTR_S3_MASK(ver) (((ver) >= 71) ? V3D_MASK(31, 24) : V3D_MASK(30, 24))
> +# define V3D_PCTR_S3_SHIFT(ver)                        24
> +
>   #define V3D_PCTR_CYCLE_COUNT(ver) ((ver >= 71) ? 0 : 32)
>   
>   /* Output values of the counters. */


