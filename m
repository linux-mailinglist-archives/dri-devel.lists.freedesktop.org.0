Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5E53BE2D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 20:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761621135CA;
	Thu,  2 Jun 2022 18:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DE11135C5;
 Thu,  2 Jun 2022 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654195638; x=1685731638;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MdaA4AryqUI3Iy8JJ9+Zb7xUERFtLDGiLGlIKh4JyeU=;
 b=zG9PIT6OXMwasD9ibpxJsmeOSu3yS45dDpBSK+Rh1Kl0VIFPgTLYB58T
 3MsMzAQNiGqcEHqB+qilnie88FYs9har3nEgIMIN/ypy/WsU6sLVqMHMt
 xTkVrxZPNrtFaqjj/a0Zz7hUlGo4PTBQO4F3Y+DGQoWxuzBCdXTn8ZVX8 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 11:47:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 11:47:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 11:47:17 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 11:47:14 -0700
Message-ID: <25addbe9-1b80-2aab-f6ad-3e092158c4ee@quicinc.com>
Date: Thu, 2 Jun 2022 11:47:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/7] drm/msm/dpu: remove hwversion field from data
 structures
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> The driver should not depend on hw revision for detecting features.
> Instead it should use features from the hw catalog. Drop the hwversion
> field from struct dpu_mdss_cfg and struct dpu_hw_blk_reg_map.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since the previous two patches remove all the current users of 
hwversion, this one should be fine.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c        | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h       | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 1 -
>   15 files changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index cff6fe3a85ac..367279371e8d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -2002,7 +2002,6 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
>   	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
>   		if (cfg_handler[i].hw_rev == hw_rev) {
>   			cfg_handler[i].cfg_init(dpu_cfg);
> -			dpu_cfg->hwversion = hw_rev;
>   			return dpu_cfg;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index f70de97f492a..4225f58d8f97 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -826,8 +826,6 @@ struct dpu_perf_cfg {
>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>    */
>   struct dpu_mdss_cfg {
> -	u32 hwversion;
> -
>   	const struct dpu_caps *caps;
>   
>   	u32 mdp_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index c33e7ef611a6..7d416bf4ae91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -61,7 +61,6 @@ static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
>   			b->base_off = addr;
>   			b->blk_off = m->ctl[i].base;
>   			b->length = m->ctl[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_CTL;
>   			return &m->ctl[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 4ad8991fc7d9..6f20d6b6dddd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -169,7 +169,6 @@ static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
>   			b->base_off = addr;
>   			b->blk_off = m->dsc[i].base;
>   			b->length = m->dsc[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_DSC;
>   			return &m->dsc[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 355894a3b48c..3e63bf4fa64e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -83,7 +83,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
>   			b->base_off = addr;
>   			b->blk_off = m->dspp[i].base;
>   			b->length = m->dspp[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_DSPP;
>   			return &m->dspp[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 61284e6c313d..01bb2d84c3a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -403,7 +403,6 @@ static void __intr_offset(struct dpu_mdss_cfg *m,
>   {
>   	hw->base_off = addr;
>   	hw->blk_off = m->mdp[0].base;
> -	hw->hwversion = m->hwversion;
>   }
>   
>   struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3f4d2c6e1b45..b2ca8d19fdd7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -80,7 +80,6 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>   			b->base_off = addr;
>   			b->blk_off = m->intf[i].base;
>   			b->length = m->intf[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_INTF;
>   			return &m->intf[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 25d2eba28e71..b41993269d09 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -46,7 +46,6 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
>   			b->base_off = addr;
>   			b->blk_off = m->mixer[i].base;
>   			b->length = m->mixer[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_LM;
>   			return &m->mixer[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index c06d595d5df0..b053d68d38da 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -26,7 +26,6 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
>   			b->base_off = addr;
>   			b->blk_off = m->merge_3d[i].base;
>   			b->length = m->merge_3d[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_PINGPONG;
>   			return &m->merge_3d[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 47c6ab6caf95..6538e195cfe9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -54,7 +54,6 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
>   			b->base_off = addr;
>   			b->blk_off = m->pingpong[i].base;
>   			b->length = m->pingpong[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_PINGPONG;
>   			return &m->pingpong[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 0a0864dff783..ab7f1a4cc578 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -772,7 +772,6 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>   				b->base_off = addr;
>   				b->blk_off = catalog->sspp[i].base;
>   				b->length = catalog->sspp[i].len;
> -				b->hwversion = catalog->hwversion;
>   				b->log_mask = DPU_DBG_MASK_SSPP;
>   				return &catalog->sspp[i];
>   			}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index ab3ef162b666..12d3b0067275 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -288,7 +288,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
>   			b->base_off = addr;
>   			b->blk_off = m->mdp[i].base;
>   			b->length = m->mdp[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_TOP;
>   			return &m->mdp[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index e4a65eb4f769..550b2e2b3e34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -21,14 +21,12 @@
>    * @blk_off:      pipe offset relative to mdss offset
>    * @length        length of register block offset
>    * @xin_id        xin id
> - * @hwversion     mdss hw version number
>    */
>   struct dpu_hw_blk_reg_map {
>   	void __iomem *base_off;
>   	u32 blk_off;
>   	u32 length;
>   	u32 xin_id;
> -	u32 hwversion;
>   	u32 log_mask;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index 046854c3fbed..789ecc531b43 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -223,7 +223,6 @@ static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
>   			b->base_off = addr;
>   			b->blk_off = m->vbif[i].base;
>   			b->length = m->vbif[i].len;
> -			b->hwversion = m->hwversion;
>   			b->log_mask = DPU_DBG_MASK_VBIF;
>   			return &m->vbif[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index bcccce292937..084439fdd3a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -63,7 +63,6 @@ static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
>   			b->base_off = addr;
>   			b->blk_off = m->wb[i].base;
>   			b->length = m->wb[i].len;
> -			b->hwversion = m->hwversion;
>   			return &m->wb[i];
>   		}
>   	}
