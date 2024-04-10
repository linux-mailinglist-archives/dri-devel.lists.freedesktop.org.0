Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826C8A02EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 00:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6441F10F0ED;
	Wed, 10 Apr 2024 22:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PqolnPgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350910F0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 22:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712787086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9ZaDdsvv6WC5wTEQulDSBBsBWUVx4JFTYwinWsVjD0=;
 b=PqolnPgC4D+X5xrQibxf9IDcppdeOc7YOLhdX6F5Q93RS1NdIs58BjhlKQyiNzuRzCkOnp
 XHDV2C7NORvgp+DtHKlD1zyztpYgrLnpNOFpzi8ZD2EAuSOei7TxwyQCim1q/+Um2B0lBj
 EXz7jSUevaCWI6dAPigGCMjG/kmEups=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-mq00BaNUPOqAu3SQ4BQNBQ-1; Wed, 10 Apr 2024 18:11:24 -0400
X-MC-Unique: mq00BaNUPOqAu3SQ4BQNBQ-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-36a14031548so50600165ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712787084; x=1713391884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9ZaDdsvv6WC5wTEQulDSBBsBWUVx4JFTYwinWsVjD0=;
 b=LPSYQLemVzGYaRkO3Nn0atzieGxf+ZR3X8q4c860XrmHeeaZS2VDgGNV/wgyopHRQH
 yPPJ/uYcqn6qZC4//dKUK6/5zhbJmSHIbT2OaXzC0H67/BbZ+M8tHllFziNtIVILWMqy
 Uak4+XKEWW809m5nLdpHGorBCaRKFpla7m0DLX66onnyCtAXxHcNz2PRp3dtdOCCXP9Y
 dXc7Gno05goQ+q3wDKHzEij595rIXbkL3OFBidYtefF7ySf2rRMxonVcMOfH7cILUSth
 khUoDosDq+s7iqzaBA4DwFU9q5REznhgjjpHP03v1YW7am1Ne5r7RaOMLzmP8moGLOKd
 JSSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW291d/rRHcClaOo89bhd6x0vjIVD60vNTLm8hqgLVpegP2jU59txf+cEUVi10Z9BM7WPgMBluZXOo9NcaC0//1bZWNfbE8C+RjWofN2qUj
X-Gm-Message-State: AOJu0Yz4yiT02hYd3NOQH24cBWnXWpPV21ZMcI7ejdKEqR1m/taCfWm8
 v5lBfI75j0uyj+BJwhsUWHIV9saQPCyHwLdqVgGqluZvkENy28rSOHwfiBhzbNyhp5xB1KfkF3j
 OEyPE4QkZRtKgzP1/rrurdhPafeKfgCXq47gWKugySr0PbrpjljWTY59E+EMWQz5X7A==
X-Received: by 2002:a05:6e02:2184:b0:369:f74f:bbe8 with SMTP id
 j4-20020a056e02218400b00369f74fbbe8mr4414906ila.14.1712787083850; 
 Wed, 10 Apr 2024 15:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5CdIhx3hEVeM8v+W7ezlD4mg6TH6+8ByQq5pRvr8stk4BYb74HRPa8nDJXZLAMSTxH4SmhA==
X-Received: by 2002:a05:6e02:2184:b0:369:f74f:bbe8 with SMTP id
 j4-20020a056e02218400b00369f74fbbe8mr4414872ila.14.1712787083369; 
 Wed, 10 Apr 2024 15:11:23 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 t184-20020a632dc1000000b005f410b67e60sm37103pgt.22.2024.04.10.15.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 15:11:22 -0700 (PDT)
Date: Wed, 10 Apr 2024 17:11:19 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Drop msm_read/writel
Message-ID: <s5i4sgt7xbtjkfa6d7whjmuwdpe643uvgdefq7lhsu2wrchfin@eb6csf2mh4g6>
References: <20240410-topic-msm_rw-v1-1-e1fede9ffaba@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240410-topic-msm_rw-v1-1-e1fede9ffaba@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Wed, Apr 10, 2024 at 11:52:52PM +0200, Konrad Dybcio wrote:
> Totally useless.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

A few more words in the description mentioning this just wraps readl/writel
with no, but that's a minor nit and is easy to find when you finally see
the removal in the end of the diff.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> only compile-tested
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h       | 12 ++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 ++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h    |  4 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h    |  4 ++--
>  drivers/gpu/drm/msm/dsi/dsi_host.c          | 10 +++++-----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h       |  8 ++++----
>  drivers/gpu/drm/msm/hdmi/hdmi.h             | 10 +++++-----
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c    |  6 +++---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c    |  4 ++--
>  drivers/gpu/drm/msm/msm_drv.h               |  7 ++-----
>  drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++++------
>  13 files changed, 42 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..0e3dfd4c2bc8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -507,7 +507,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>  
>  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>  {
> -	msm_writel(value, ptr + (offset << 2));
> +	writel(value, ptr + (offset << 2));
>  }
>  
>  static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 592b296aab22..94b6c5cab6f4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -103,12 +103,12 @@ struct a6xx_gmu {
>  
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>  {
> -	return msm_readl(gmu->mmio + (offset << 2));
> +	return readl(gmu->mmio + (offset << 2));
>  }
>  
>  static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
>  {
> -	msm_writel(value, gmu->mmio + (offset << 2));
> +	writel(value, gmu->mmio + (offset << 2));
>  }
>  
>  static inline void
> @@ -131,8 +131,8 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
>  {
>  	u64 val;
>  
> -	val = (u64) msm_readl(gmu->mmio + (lo << 2));
> -	val |= ((u64) msm_readl(gmu->mmio + (hi << 2)) << 32);
> +	val = (u64) readl(gmu->mmio + (lo << 2));
> +	val |= ((u64) readl(gmu->mmio + (hi << 2)) << 32);
>  
>  	return val;
>  }
> @@ -143,12 +143,12 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
>  
>  static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
>  {
> -	return msm_readl(gmu->rscc + (offset << 2));
> +	return readl(gmu->rscc + (offset << 2));
>  }
>  
>  static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
>  {
> -	msm_writel(value, gmu->rscc + (offset << 2));
> +	writel(value, gmu->rscc + (offset << 2));
>  }
>  
>  #define gmu_poll_timeout_rscc(gmu, addr, val, cond, interval, timeout) \
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 34822b080759..8917032b7515 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -69,12 +69,12 @@ static inline void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u3
>  
>  static inline u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
>  {
> -	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
> +	return readl(a6xx_gpu->llc_mmio + (reg << 2));
>  }
>  
>  static inline void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
>  {
> -	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
> +	writel(value, a6xx_gpu->llc_mmio + (reg << 2));
>  }
>  
>  #define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index a847a0f7a73c..83d7ee01c944 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -192,10 +192,10 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
>  }
>  
>  #define cxdbg_write(ptr, offset, val) \
> -	msm_writel((val), (ptr) + ((offset) << 2))
> +	writel((val), (ptr) + ((offset) << 2))
>  
>  #define cxdbg_read(ptr, offset) \
> -	msm_readl((ptr) + ((offset) << 2))
> +	readl((ptr) + ((offset) << 2))
>  
>  /* read a value from the CX debug bus */
>  static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index 01179e764a29..94b1ba92785f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -44,12 +44,12 @@ struct mdp4_kms {
>  
>  static inline void mdp4_write(struct mdp4_kms *mdp4_kms, u32 reg, u32 data)
>  {
> -	msm_writel(data, mdp4_kms->mmio + reg);
> +	writel(data, mdp4_kms->mmio + reg);
>  }
>  
>  static inline u32 mdp4_read(struct mdp4_kms *mdp4_kms, u32 reg)
>  {
> -	return msm_readl(mdp4_kms->mmio + reg);
> +	return readl(mdp4_kms->mmio + reg);
>  }
>  
>  static inline uint32_t pipe2flush(enum mdp4_pipe pipe)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> index fac9f05aa639..36b6842dfc9c 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> @@ -171,13 +171,13 @@ struct mdp5_encoder {
>  static inline void mdp5_write(struct mdp5_kms *mdp5_kms, u32 reg, u32 data)
>  {
>  	WARN_ON(mdp5_kms->enable_count <= 0);
> -	msm_writel(data, mdp5_kms->mmio + reg);
> +	writel(data, mdp5_kms->mmio + reg);
>  }
>  
>  static inline u32 mdp5_read(struct mdp5_kms *mdp5_kms, u32 reg)
>  {
>  	WARN_ON(mdp5_kms->enable_count <= 0);
> -	return msm_readl(mdp5_kms->mmio + reg);
> +	return readl(mdp5_kms->mmio + reg);
>  }
>  
>  static inline const char *stage2name(enum mdp_mixer_stage_id stage)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9d86a6aca6f2..77bd5ff330d7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -55,7 +55,7 @@ static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>  	 * scratch register which we never touch)
>  	 */
>  
> -	ver = msm_readl(base + REG_DSI_VERSION);
> +	ver = readl(base + REG_DSI_VERSION);
>  	if (ver) {
>  		/* older dsi host, there is no register shift */
>  		ver = FIELD(ver, DSI_VERSION_MAJOR);
> @@ -73,12 +73,12 @@ static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>  		 * registers are shifted down, read DSI_VERSION again with
>  		 * the shifted offset
>  		 */
> -		ver = msm_readl(base + DSI_6G_REG_SHIFT + REG_DSI_VERSION);
> +		ver = readl(base + DSI_6G_REG_SHIFT + REG_DSI_VERSION);
>  		ver = FIELD(ver, DSI_VERSION_MAJOR);
>  		if (ver == MSM_DSI_VER_MAJOR_6G) {
>  			/* 6G version */
>  			*major = ver;
> -			*minor = msm_readl(base + REG_DSI_6G_HW_VERSION);
> +			*minor = readl(base + REG_DSI_6G_HW_VERSION);
>  			return 0;
>  		} else {
>  			return -EINVAL;
> @@ -186,11 +186,11 @@ struct msm_dsi_host {
>  
>  static inline u32 dsi_read(struct msm_dsi_host *msm_host, u32 reg)
>  {
> -	return msm_readl(msm_host->ctrl_base + reg);
> +	return readl(msm_host->ctrl_base + reg);
>  }
>  static inline void dsi_write(struct msm_dsi_host *msm_host, u32 reg, u32 data)
>  {
> -	msm_writel(data, msm_host->ctrl_base + reg);
> +	writel(data, msm_host->ctrl_base + reg);
>  }
>  
>  static const struct msm_dsi_cfg_handler *dsi_get_config(
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index e4275d3ad581..5a5dc3faa971 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -12,10 +12,10 @@
>  
>  #include "dsi.h"
>  
> -#define dsi_phy_read(offset) msm_readl((offset))
> -#define dsi_phy_write(offset, data) msm_writel((data), (offset))
> -#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
> -#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
> +#define dsi_phy_read(offset) readl((offset))
> +#define dsi_phy_write(offset, data) writel((data), (offset))
> +#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
> +#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
>  
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index ec5786440391..4586baf36415 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -115,17 +115,17 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on);
>  
>  static inline void hdmi_write(struct hdmi *hdmi, u32 reg, u32 data)
>  {
> -	msm_writel(data, hdmi->mmio + reg);
> +	writel(data, hdmi->mmio + reg);
>  }
>  
>  static inline u32 hdmi_read(struct hdmi *hdmi, u32 reg)
>  {
> -	return msm_readl(hdmi->mmio + reg);
> +	return readl(hdmi->mmio + reg);
>  }
>  
>  static inline u32 hdmi_qfprom_read(struct hdmi *hdmi, u32 reg)
>  {
> -	return msm_readl(hdmi->qfprom_mmio + reg);
> +	return readl(hdmi->qfprom_mmio + reg);
>  }
>  
>  /*
> @@ -166,12 +166,12 @@ struct hdmi_phy {
>  
>  static inline void hdmi_phy_write(struct hdmi_phy *phy, u32 reg, u32 data)
>  {
> -	msm_writel(data, phy->mmio + reg);
> +	writel(data, phy->mmio + reg);
>  }
>  
>  static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
>  {
> -	return msm_readl(phy->mmio + reg);
> +	return readl(phy->mmio + reg);
>  }
>  
>  int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> index 4dd055416620..8c8d80b59573 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> @@ -86,18 +86,18 @@ static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8996 *pll)
>  static inline void hdmi_pll_write(struct hdmi_pll_8996 *pll, int offset,
>  				  u32 data)
>  {
> -	msm_writel(data, pll->mmio_qserdes_com + offset);
> +	writel(data, pll->mmio_qserdes_com + offset);
>  }
>  
>  static inline u32 hdmi_pll_read(struct hdmi_pll_8996 *pll, int offset)
>  {
> -	return msm_readl(pll->mmio_qserdes_com + offset);
> +	return readl(pll->mmio_qserdes_com + offset);
>  }
>  
>  static inline void hdmi_tx_chan_write(struct hdmi_pll_8996 *pll, int channel,
>  				      int offset, int data)
>  {
> -	 msm_writel(data, pll->mmio_qserdes_tx[channel] + offset);
> +	 writel(data, pll->mmio_qserdes_tx[channel] + offset);
>  }
>  
>  static inline u32 pll_get_cpctrl(u64 frac_start, unsigned long ref_clk,
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index cb35a297afbd..83c8781fcc3f 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -236,12 +236,12 @@ static const struct pll_rate freqtbl[] = {
>  
>  static inline void pll_write(struct hdmi_pll_8960 *pll, u32 reg, u32 data)
>  {
> -	msm_writel(data, pll->mmio + reg);
> +	writel(data, pll->mmio + reg);
>  }
>  
>  static inline u32 pll_read(struct hdmi_pll_8960 *pll, u32 reg)
>  {
> -	return msm_readl(pll->mmio + reg);
> +	return readl(pll->mmio + reg);
>  }
>  
>  static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8960 *pll)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 65f213660452..0659459c0b15 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -488,15 +488,12 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
>  
>  struct icc_path *msm_icc_get(struct device *dev, const char *name);
>  
> -#define msm_writel(data, addr) writel((data), (addr))
> -#define msm_readl(addr) readl((addr))
> -
>  static inline void msm_rmw(void __iomem *addr, u32 mask, u32 or)
>  {
> -	u32 val = msm_readl(addr);
> +	u32 val = readl(addr);
>  
>  	val &= ~mask;
> -	msm_writel(val | or, addr);
> +	writel(val | or, addr);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 2bfcb222e353..a0c1bd6d1d5b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -555,12 +555,12 @@ struct msm_gpu_state {
>  
>  static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
>  {
> -	msm_writel(data, gpu->mmio + (reg << 2));
> +	writel(data, gpu->mmio + (reg << 2));
>  }
>  
>  static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
>  {
> -	return msm_readl(gpu->mmio + (reg << 2));
> +	return readl(gpu->mmio + (reg << 2));
>  }
>  
>  static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
> @@ -586,8 +586,8 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
>  	 * when the lo is read, so make sure to read the lo first to trigger
>  	 * that
>  	 */
> -	val = (u64) msm_readl(gpu->mmio + (reg << 2));
> -	val |= ((u64) msm_readl(gpu->mmio + ((reg + 1) << 2)) << 32);
> +	val = (u64) readl(gpu->mmio + (reg << 2));
> +	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
>  
>  	return val;
>  }
> @@ -595,8 +595,8 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
>  static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
>  {
>  	/* Why not a writeq here? Read the screed above */
> -	msm_writel(lower_32_bits(val), gpu->mmio + (reg << 2));
> -	msm_writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
> +	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
> +	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
>  }
>  
>  int msm_gpu_pm_suspend(struct msm_gpu *gpu);
> 
> ---
> base-commit: 6ebf211bb11dfc004a2ff73a9de5386fa309c430
> change-id: 20240410-topic-msm_rw-cdc1d85b2ece
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 

