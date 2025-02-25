Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE48A44964
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2610E78B;
	Tue, 25 Feb 2025 18:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HimF5/Mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B17E10E785
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 18:03:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54524740032so6045771e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506609; x=1741111409; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
 b=HimF5/MrniaWKHFoKSNWSzOBwvSNININaIFEhsmMEN3GOgxWT0Wel0hnzYm8Yttyty
 EpjGJN3qa8waKkh8dpx2KQEucgYeycpexUmLFs/finWN+fUxnX8BlSFtF4tIudE2imiR
 4yekKTTL1JWJz3kZ1/LAneCxvNM6yQL9UpOVSGRLZFFh92Es62Ln1BoPDpZj03vwy8g6
 /eS2dCokluIlPCrnRVK2y48kBSX8WHQg5jo3mFFKpj1WaLrGh04B7AA8TmCbowAdIQaQ
 3FDi1vsIKTxewcT2rf3r3ePpGElBsB2m1sdVxo6M+cROzeeQVBsZob+jTKg7+j8/wdty
 NQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506609; x=1741111409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
 b=JW12UjS2YC/x4DrUVXD/0bOMaVbTj0V9DfohzHTIu79cz/f0BQNDUBOtI4szh1HXgI
 zrH3hYyiZmuoVJnkm1B11Xc0bFsUS71X8DfsJy0l6WIucIM651sh1RCYEjFkB4U26ntL
 FDmpx1N/eC1Cn3HIWkxBWtHaU+ZN8XiHNL6MpkqBL/Gp+9FLI/RbuwMZNhR76r3+vt+C
 XRZ9jHIeV11Q/0oxcEhy+hRpM2gCR2IgbaFjlIU953eYoJUSvWWUz7eZmnKbnNe8FJ2C
 pzofhGJLtzhHLHBKq5WmCKnAKpG4zxfupFqxSmhhgIkjHzWR+UZrRRF+wAtPcniXVPU+
 6BvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQHxhw725/0PFhoAAKf1g4O0sKJtNQLIJacht39Ep/sLA2IEesafJu4Ib0N0wBjwR+huF2SFah5sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCG7Xfp4esw4fEzPbsp4jdmBQHnFeyimf8Pd4vUR6reCBx45ly
 iBNwxi89t3HX8NZKJETchbMEQWwv04y0zyFk2Y6j0+aTWeae4eacysgJd4JbCL4=
X-Gm-Gg: ASbGncs5QMTC3FQu2AV5yu2ImC3X/MZWFBac6vJzb/gVCRXqBO4Mgk4XRrx85dfXhOH
 d4W3+FwbyAd/D4BFZ1Xm+koJCdTut2kBzjZx4IA4kEsG9M1Dqj3zd3C1PDf9klcGFmANyaenLCy
 st7zEKZ7jq3fb26raTe/75FPirCz8H4FDe4ac79LmPfRekfeThuEWB5GU0V5EZRyLH/0WTDHoo9
 8vsQpBMWWX3GlbGfqkF0/FyxPNJUTm4Ia0lfRLDt+UfTndpnMCXj2aeSxzLQAHWe5ShAM60bw6Z
 nbi20FBgq81Cv2VK5uoqXYcIhqpJHrD7ptaH6WuKQlrk6C93y7kKAAwCsM/6ioIRDOtCxw4QkD6
 VNf0FzA==
X-Google-Smtp-Source: AGHT+IG0Zc7wZsxG0nheOFfzzmCVwdzpAM4bFH1CEvsvsI0SU1fbCv6O1tOWiwsm5/goJ00WgZzfcA==
X-Received: by 2002:a05:6512:b05:b0:545:8c5:44cb with SMTP id
 2adb3069b0e04-548510dc89emr2751908e87.31.1740506609286; 
 Tue, 25 Feb 2025 10:03:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fb084sm234263e87.221.2025.02.25.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 10:03:28 -0800 (PST)
Date: Tue, 25 Feb 2025 20:03:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 11/11] drm/bridge: anx7625: change the gpiod_set_value API
Message-ID: <rgdujikhrizof6p67cztu3oh4svy7do4okvowlgxg6rddeoqkq@hjc7pni57ilb>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-12-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-12-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:24PM +0530, Ayushi Makhija wrote:
> Use gpiod_set_value_cansleep() instead of gpiod_set_value()
> to fix the below call trace in the boot log:
> 
> [    5.690534] Call trace:
> [    5.690536]  gpiod_set_value+0x40/0xa4
> [    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
> [    5.690545]  __rpm_callback+0x48/0x1d8
> [    5.690549]  rpm_callback+0x6c/0x78
> 
> Certain GPIO controllers require access via message-based buses
> such as I2C or SPI, which may cause the GPIOs to enter a sleep
> state. Therefore, use the gpiod_set_value_cansleep().
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
