Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F0CEDA8A
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 06:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FABC10E01F;
	Fri,  2 Jan 2026 05:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NwDFmrWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23C10E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 05:21:42 +0000 (UTC)
Message-ID: <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767331291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=almuXI3SViusCUeHM6QvVMkIRXAb18JyRush9mjGRLY=;
 b=NwDFmrWa46mhH5e1xAQiK4ZhYU7J1Vu4vsMhpMlzZp+9NCKAfzNWmqFtHISypBi01UacBf
 De9IGVwsHvAnTxSXwvqh31GneA1XrCH95qjz0sVA5EmIrA6D+UYuCnLU9l3FtZf+qmarWh
 VL8axxhyJIJzJdTyH2TEyXCyomP/wJk=
Date: Thu, 1 Jan 2026 21:21:26 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>
References: <20260102041829.2748009-1-airlied@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <20260102041829.2748009-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 1/1/26 8:18 PM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> The changes to always loads fwsec sb causes problems on newer GPUs
> which don't use this path.
> 
> Add hooks and pass through the device specific layers.
> 
> Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")

Closes: https://lore.kernel.org/nouveau/59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev/
Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Thanks,
Matt

> Cc: <stable@vger.kernel.org> # v6.16+
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
>  7 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 35d1fcef520bf..b3e994386334d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -29,6 +29,9 @@ ad102_gsp = {
>  	.sig_section = ".fwsignature_ad10x",
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
> +	
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
>  
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> index 5037602466604..8d4f40a443ce4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> @@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
>  }
>  
>  int
> -nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
>  {
> -	return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> -				   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> -}
> -
> -void
> -nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> -{
> -	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> +       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> +                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
>  }
>  
>  int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> index d201e8697226b..27a13aeccd3cb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -47,6 +47,9 @@ ga100_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index 917f7e2f6c466..a59fb74ef6315 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -158,6 +158,9 @@ ga102_gsp_r535 = {
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +	
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 86bdd203bc107..9dd66a2e38017 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
>  
>  int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
>  
> -int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
>  int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
> -void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> +int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
>  
>  struct nvkm_gsp_fwif {
>  	int version;
> @@ -52,6 +51,11 @@ struct nvkm_gsp_func {
>  			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
>  	} booter;
>  
> +	struct {
> +		int (*ctor)(struct nvkm_gsp *);
> +		void (*dtor)(struct nvkm_gsp *);
> +	} fwsec_sb;
> +
>  	void (*dtor)(struct nvkm_gsp *);
>  	int (*oneinit)(struct nvkm_gsp *);
>  	int (*init)(struct nvkm_gsp *);
> @@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
>  extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
>  int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
>  			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
> +int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> +void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
>  int tu102_gsp_oneinit(struct nvkm_gsp *);
>  int tu102_gsp_init(struct nvkm_gsp *);
>  int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
> @@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
>  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
>  		  struct nvkm_gsp **);
>  
> +static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +{
> +	if (gsp->func->fwsec_sb.ctor)
> +		return gsp->func->fwsec_sb.ctor(gsp);
> +	return 0;
> +}
> +
> +static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> +{
> +	if (gsp->func->fwsec_sb.dtor)
> +		gsp->func->fwsec_sb.dtor(gsp);
> +}
> +
>  extern const struct nvkm_gsp_func gv100_gsp;
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index 81e56da0474a1..04b642a1f7305 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -30,6 +30,18 @@
>  #include <nvfw/fw.h>
>  #include <nvfw/hs.h>
>  
> +int
> +tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +{
> +	return nvkm_gsp_fwsec_sb_init(gsp);
> +}
> +
> +void
> +tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> +{
> +	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> +}
> +
>  static int
>  tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
>  {
> @@ -370,6 +382,9 @@ tu102_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> index 97eb046c25d07..58cf258424218 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> @@ -30,6 +30,9 @@ tu116_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,

