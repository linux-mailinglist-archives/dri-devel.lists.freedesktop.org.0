Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D039CD9CF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 08:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6810E230;
	Fri, 15 Nov 2024 07:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XHshoLmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275AF10E230
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:20:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb49510250so3539391fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 23:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731655241; x=1732260041; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wPIErhR6I6EwwNiPLqKd9A47+Ja/f6vb06uINjKnwUM=;
 b=XHshoLmbe6r+PJEjGisp4qKLq84xzrCAOz9lgpo/rPLEQL1z/2NuRMCdUpIbPzMdR6
 pLNzaa6LoGv9HLfTcNqHDRMKYS7kpliIlUMJuSLov1hfIOw9VmN806koCY6spQoPqXeP
 Xk/V1cZwBV9MW1K+f7yjmJD8ckhlxWadAGaMz5jt/dVw5YKvUmLl+Vz6RIYJdj1zJ7Hc
 she7umJbT8XCw4OIeMDV68Ox/PmCQOGaqx+vj0X88MfwliAa81QvBjyyTXVan6DiblM9
 4OJh/+DIK76X/01KBkEXGTVYagLp4Zsqne4v0OSi34FFmS0APJpsEGczpIhTtM23JoO1
 IOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731655241; x=1732260041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPIErhR6I6EwwNiPLqKd9A47+Ja/f6vb06uINjKnwUM=;
 b=YkyoicqkLYf26Lnt/EAky/RdZzjAf3UGNpie7NVfv/Rwo4v4F50gvpb/CLrU4Qwj+B
 ZllEji27USDC3t8M2xH0yeOPa3mVn+1C+Rft68l15BOH4wTt82UV+MyDtf6QnfpGjV1J
 SC2GJl+qlrFOXxEUcgsT6MJ2vf9SmXukkHOCmc1RgMktci+IRudeKYkuEWaJPndJpqTS
 HAYmH/cSdWx76mrNjKaCxNWhXZbPBIdbF/mRGoOBDEgaNsFSQNOTXbdixa4VaBOBfstd
 m0Ih5LRa/cn7y8d4JEghh6gdHvp7uqgnvZzmfYlDIxFRXdzH9cJXALzgq2T9t1YgTn5k
 pg3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTaYUa5/UYG9YR+LNrSEmHybz++JAXEE3cnEU7aQZpe0HoJVSG7NnT+0guXvo6bTrOxr+gJtOH6Z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO53M3rKLuXJ0K9GZLs/IVpXfWNp6vrjEVpzhhIjobrYZ5C0/8
 UTzyM2hfLA5nGtZhpeMn0mu/EjeLKX/NSTgbwYLJt0OehuvKxEzQGZWfL5XVAOM=
X-Google-Smtp-Source: AGHT+IGJ5vrdwJ0lrMV74Duf/kalA5C5NAMItpfRNsFzL7/HAEBczJ19OPzuTQwaZicRg26t+0UOnw==
X-Received: by 2002:a05:651c:12c8:b0:2fb:8920:99c6 with SMTP id
 38308e7fff4ca-2ff606944f8mr9639431fa.23.1731655241129; 
 Thu, 14 Nov 2024 23:20:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff5985ae14sm4620931fa.81.2024.11.14.23.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:20:39 -0800 (PST)
Date: Fri, 15 Nov 2024 09:20:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
Message-ID: <p4x7rodp2qpwfb3hljtbi36mxjdrt5jr3xhad4rebsldlfxart@cz23of57gvrd>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-3-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-3-3b8d39737a9b@linaro.org>
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

On Wed, Nov 13, 2024 at 04:48:29PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> In order to get the vote values to be used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be send to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> The vote array will be used to dynamically generate the GMU bw_table
> sent during the GMU power-up.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 163 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  12 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>  3 files changed, 176 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..504a7c5d5a9df4c787951f2ae3a69d566d205ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  #include <drm/drm_gem.h>
>  
>  #include "a6xx_gpu.h"
> @@ -1287,6 +1288,119 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +struct a6xx_bcm_data {
> +	u32 buswidth;
> +	unsigned int unit;
> +	unsigned int width;

In bits?

> +	unsigned int vcd;

What is this?

> +	bool fixed;

What does it mean?

> +	unsigned int perfmode;
> +	unsigned int perfmode_bw;
> +};
> +
> +struct bcm_db {
> +	__le32 unit;
> +	__le16 width;
> +	u8 vcd;
> +	u8 reserved;
> +};
> +
> +static int a6xx_gmu_rpmh_get_bcm_data(const struct a6xx_bcm *bcm,
> +				      struct a6xx_bcm_data *bcm_data)

Is there a reason to copy CMD DB and BCM data to the interim
representation instead of using those directly?

> +{
> +	const struct bcm_db *data;
> +	size_t count;
> +
> +	data = cmd_db_read_aux_data(bcm->name, &count);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	bcm_data->unit = le32_to_cpu(data->unit);
> +	bcm_data->width = le16_to_cpu(data->width);
> +	bcm_data->vcd = data->vcd;
> +	bcm_data->fixed = bcm->fixed;
> +	bcm_data->perfmode = bcm->perfmode;
> +	bcm_data->perfmode_bw = bcm->perfmode_bw;
> +	bcm_data->buswidth = bcm->buswidth;
> +
> +	return 0;
> +}
> +
> +static void a6xx_gmu_rpmh_calc_bw_vote(struct a6xx_bcm_data *bcms,
> +				       int count, u32 bw, u32 *data)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		bool valid = true;
> +		bool commit = false;
> +		u64 peak, y;
> +
> +		if (i == count - 1 || bcms[i].vcd != bcms[i + 1].vcd)
> +			commit = true;
> +
> +		if (bcms[i].fixed) {
> +			if (!bw)
> +				data[i] = BCM_TCS_CMD(commit, false, 0x0, 0x0);
> +			else
> +				data[i] = BCM_TCS_CMD(commit, true, 0x0,
> +					bw >= bcms[i].perfmode_bw ?
> +						bcms[i].perfmode : 0x0);
> +			continue;
> +		}
> +
> +		/* Multiple the bandwidth by the width of the connection */

... and divide by the bus width. However it's not clear why you are
multiplying bandwidth (bits or bytes per second) with the width
(probably also bits?). Or is it not a width but the number of paths
between units?

> +		peak = (u64)bw * bcms[i].width;
> +		do_div(peak, bcms[i].buswidth);
> +
> +		/* Input bandwidth value is in KBps */

Input or OPP / Interconnect?

> +		y = peak * 1000ULL;
> +		do_div(y, bcms[i].unit);
> +
> +		/*
> +		 * If a bandwidth value was specified but the calculation ends
> +		 * rounding down to zero, set a minimum level
> +		 */
> +		if (bw && y == 0)
> +			y = 1;

Is it a real usecase or just a safety net? If the bandwidth ends up
being very low, maybe we should warn the users about it?

> +
> +		y = min_t(u64, y, BCM_TCS_CMD_VOTE_MASK);
> +		if (!y)
> +			valid = false;

This can probably be coupled with the previous condition.

> +
> +		data[i] = BCM_TCS_CMD(commit, valid, y, y);
> +	}
> +}
> +
> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info, struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_bcm_data bcms[3];
> +	unsigned int bcm_count = 0;
> +	int ret, index;
> +
> +	/* Retrieve BCM data from cmd-db and merge with a6xx_info bcm table */
> +	for (index = 0; index < 3; index++) {

Magic number 3.

> +		if (!info->bcm[index].name)
> +			continue;
> +
> +		ret = a6xx_gmu_rpmh_get_bcm_data(&info->bcm[index], &bcms[index]);
> +		if (ret)
> +			return ret;
> +
> +		++bcm_count;
> +	}
> +
> +	/* Generate BCM votes values for each bandwidth & bcm */
> +	for (index = 0; index < gmu->nr_gpu_bws; index++)
> +		a6xx_gmu_rpmh_calc_bw_vote(bcms, bcm_count, gmu->gpu_bw_table[index],
> +					   gmu->gpu_bw_votes[index]);
> +
> +	return 0;
> +}
> +
>  /* Return the 'arc-level' for the given frequency */
>  static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>  					   unsigned long freq)
> @@ -1390,12 +1504,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>   * to construct the list of votes on the CPU and send it over. Query the RPMh
>   * voltage levels and build the votes
> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
> + * and BCM parameters to build the votes.
>   */
>  
>  static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret;
>  
> @@ -1407,6 +1524,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>  	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>  		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>  
> +	/* Build the interconnect votes */
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE)
> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
> +
>  	return ret;
>  }
>  
> @@ -1442,6 +1563,38 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>  	return index;
>  }
>  
> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
> +		u32 size)
> +{
> +	int count = dev_pm_opp_get_opp_count(dev);
> +	struct dev_pm_opp *opp;
> +	int i, index = 0;
> +	unsigned int bandwidth = 1;
> +
> +	/*
> +	 * The OPP table doesn't contain the "off" bandwidth level so we need to
> +	 * add 1 to the table size to account for it
> +	 */
> +
> +	if (WARN(count + 1 > size,
> +		"The GMU bandwidth table is being truncated\n"))
> +		count = size - 1;
> +
> +	/* Set the "off" bandwidth */
> +	bandwidths[index++] = 0;
> +
> +	for (i = 0; i < count; i++) {
> +		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
> +		if (IS_ERR(opp))
> +			break;
> +
> +		dev_pm_opp_put(opp);
> +		bandwidths[index++] = bandwidth++;
> +	}
> +
> +	return index;
> +}
> +
>  static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> @@ -1472,6 +1625,16 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>  
>  	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>  
> +	/*
> +	 * The GMU also handles GPU Interconnect Votes so build a list
> +	 * of DDR bandwidths from the GPU OPP table
> +	 */
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE)
> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
> +
> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
> +
>  	/* Build the list of RPMh votes that we'll send to the GMU */
>  	return a6xx_gmu_rpmh_votes_init(gmu);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..95c632d8987a517f067c48c61c6c06b9a4f61fc0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -19,6 +19,14 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> +struct a6xx_bcm {
> +	char *name;
> +	unsigned int buswidth;
> +	bool fixed;
> +	unsigned int perfmode;
> +	unsigned int perfmode_bw;
> +};
> +
>  /*
>   * These define the different GMU wake up options - these define how both the
>   * CPU and the GMU bring up the hardware
> @@ -82,6 +90,10 @@ struct a6xx_gmu {
>  	unsigned long gpu_freqs[16];
>  	u32 gx_arc_votes[16];
>  
> +	int nr_gpu_bws;
> +	unsigned long gpu_bw_table[16];
> +	u32 gpu_bw_votes[16][3];

Is it is the same magic 16 as we have few lines above or is this 16 a
different magic 16? And also 3 is a pure dark secret.

> +
>  	int nr_gmu_freqs;
>  	unsigned long gmu_freqs[4];
>  	u32 cx_arc_votes[4];
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..d779d700120cbd974ee87a67214739b1d85156e2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -44,6 +44,7 @@ struct a6xx_info {
>  	u32 gmu_chipid;
>  	u32 gmu_cgc_mode;
>  	u32 prim_fifo_threshold;
> +	const struct a6xx_bcm bcm[3];
>  };
>  
>  struct a6xx_gpu {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
