Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52172A3023C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFFA10E410;
	Tue, 11 Feb 2025 03:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qNFgSWP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DE910E410
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:40:57 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5450681b606so2441823e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739245255; x=1739850055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
 b=qNFgSWP+Km7RbLW2NF+4ioGvvftLYTor6XXMO6shRqIf+7F4bG79EjNweHl2nVMN9E
 G4J/VMAt0F09eEWQ53j21UJ13WfhLxFfG9LZZFUNQHvGY6R0cAXQ9SzLUPuVU6e1Axfn
 cux0OFMnWsdXEdVoGoX0/urCOZy2EHQ0BBhSL/ByxoxxEH+S5B3GNaqvL8l2HcQgOhlE
 n3C9m7x2K2Sm0P6hPN4ZbHZMIAZPvm67CH8NSJh9IXraA2DJEYH23BXNSbKKvTY3GW19
 Pd8RJMdbWB7oPTdcS1kEyIJSqZ0c553UYfCV5VW2q6lPlScabHCqp6auDwli3joT5fyV
 kHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739245255; x=1739850055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
 b=HrXFlTUH9EWaO6JnE95S06EULuUHMiVxot5ohftP144a2UBH5PJ9VSEwq+uPA3d+xT
 06qdQK8G42ita/icLDmSiPkDVp19+OgzIPhgsfc09kezjNJrGtLuLTBhf9njxU9FL7Z5
 8sLhv7+Z0/0i09fhCb98V/sE++oNF3w3fr8YspCBjzWmQ9EX9fcj8Dfs+M11LxFAGzvl
 nRkBy+/olXfD6Bp0KQP4VP9nnkcLRmUydhxD38oJnqAxXmkixLTzfFSKbhxD3hD3fEkw
 vLD3Rdrp+Osz6NvqFk3qLt28vGzP6J1VPYmGVV6WAo6TZ4LESLHP3VMuAoSHyYt/e/Fs
 sA7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRE5LXOT3XGdNsNZL/OkDbPs+RxkDfZcnNhuytbvjy27u2x3RcRA5mPLPlH1N7tmCw+VFIF5SK+0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXORHewr/WwjIzm2Meqg/rI9jcVOO5UWEvAlIVmt3q20kycEb9
 P579rp8Ha4yevEEeE6vZApQtvG09I9Cek0UQh/xUH8TlL56OleAdCDY0Phz0Q6A=
X-Gm-Gg: ASbGnctZw4G87uv2eJ2Fl9fVGkPwWRUpUh42OzDS1DqtEOcjERcC6wF1zXjbU9Z7bFZ
 ThLFnTuJARLuFQQvx5JDFj6wlxmuWBUp8pBSZiYLdDK3i/0cCjxvAmnnCuFpH+d9zH2wnAnt3VI
 GCSS6lcelEfmBUStWMCotAUMEg6xW4tB/fgd0QQ8J6Z9pq+VKW12+ggT7bZIZh0GoQ8ikaaSOGQ
 Go/uVLJ8hR5QoI65E1h0LafFiYI3QjjGGNFPSjJjHLqazCxfA5TOGCdjc3BFIF0nYvKqIxazfRm
 Oolh7LKMXLAzxaAw+XOeSJ/lPMFFIu/+xPK2tbsg+IdmRyvCidYmPQigMc5drFpjhc2BHlI=
X-Google-Smtp-Source: AGHT+IESIZIApI82KNped+F8rDYKVVEqRChUa6PLhZuvZfiXsjK12HtxB4DBhx1h10YT3mchL9bAYA==
X-Received: by 2002:a05:6512:a96:b0:545:10cf:3468 with SMTP id
 2adb3069b0e04-54510cf366emr965052e87.37.1739245255377; 
 Mon, 10 Feb 2025 19:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54501e3fa93sm957117e87.17.2025.02.10.19.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 19:40:54 -0800 (PST)
Date: Tue, 11 Feb 2025 05:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
Message-ID: <x6e3j2fbf7hjos7uel6b4kk5h5q7lwtqkacqxj43sntheguysg@k5weigzww6ac>
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
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

On Tue, Feb 11, 2025 at 12:19:32AM +0100, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
