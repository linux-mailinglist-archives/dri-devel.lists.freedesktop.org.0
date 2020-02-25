Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20516F926
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A526E241;
	Wed, 26 Feb 2020 08:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ACA6E227
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:33:51 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g6so207642plp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 11:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=qjq1rYwYZyqa6T9kkCXqj08Gw/H8i3ujajvWEUPawsQ=;
 b=cDqMkNUQ3xXixDRuNzXC11g87RUP7M21eCuL3NDnulLtrqaf0UvLy72WC6qx6PIPKI
 c0Ttar9R/Duu8SU6Q4PEw9ThOWPyP9C35hO0TGX+m1ypebrg9t8d/tktBjrhsD+cz7U7
 0JcYj4pYk1d3S+NsCgSgbxXkwBpkZ8Zoa0bn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=qjq1rYwYZyqa6T9kkCXqj08Gw/H8i3ujajvWEUPawsQ=;
 b=BRSYiFq8iF35McpNKPUEJawuwerER+w5cz5aPMOJlDzz2CfbB9uAnada+ZKqH5phd+
 M+kFOgSB3cFGsG/r3TObcLSKWW9xYrsr76criKXIJK0h96zTMpeUJ9nS5nTG5QO1gO87
 SgURB00t+81LqWoFf+mkBcVOJVc+aOiHfxom3gEIAENAmh6wjKMJZdkNK7yiiTXt3U/P
 0NHV5E2ya9M/v3UG+2F5gdJQGDVLRj+wiLhSlT0SE7wcnZxX3M5f6khibxmPJd9eShFk
 1ePKfGQ35vwpwkR+DkDBW8D5JZOodCGjKC/J70TV3zWn/P5z/qvIbIF3v/e/CmB5IZQw
 AJ8w==
X-Gm-Message-State: APjAAAWU96aGPbgoydj2cdJu/Q9G1J9a7I/d13MMpgCgz5bqOjKox7qR
 VKW4Fo8J2K/RHRAs8/kROrLjuA==
X-Google-Smtp-Source: APXvYqxDKHrP7qTiMvkalQZ2YXorUCJY2C2zjXz3x09A/XTU8PzAM54XPoxry11GFtz5Eb8PKERJtw==
X-Received: by 2002:a17:902:b110:: with SMTP id
 q16mr46290plr.289.1582659231027; 
 Tue, 25 Feb 2020 11:33:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id z4sm17320690pfn.42.2020.02.25.11.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 11:33:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
 <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid>
Subject: Re: [PATCH 2/4] drm/msm/dpu: Refactor rm iterator
From: Stephen Boyd <swboyd@chromium.org>
To: Drew Davenport <ddavenport@chromium.org>, dri-devel@lists.freedesktop.org
Date: Tue, 25 Feb 2020 11:33:49 -0800
Message-ID: <158265922943.177367.14293328114795800228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Drew Davenport (2020-02-19 09:42:25)
> Make iterator implementation private, and add function to
> query resources assigned to an encoder.
> 
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f8ac3bf60fd60..6cadeff456f09 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -957,11 +957,11 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>         struct drm_connector *conn = NULL, *conn_iter;
>         struct drm_crtc *drm_crtc;
>         struct dpu_crtc_state *cstate;
> -       struct dpu_rm_hw_iter hw_iter;
>         struct msm_display_topology topology;
> -       struct dpu_hw_ctl *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
> -       struct dpu_hw_mixer *hw_lm[MAX_CHANNELS_PER_ENC] = { NULL };
> -       int num_lm = 0, num_ctl = 0;
> +       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> +       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +       int num_lm, num_ctl, num_pp;

All these should be unsigned too?

>         int i, j, ret;
>  
>         if (!drm_enc) {
> @@ -1005,42 +1005,31 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>                 return;
>         }
>  
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_PINGPONG);
> -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               dpu_enc->hw_pp[i] = NULL;
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               dpu_enc->hw_pp[i] = (struct dpu_hw_pingpong *) hw_iter.hw;
> -       }
> -
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_CTL);
> -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               hw_ctl[i] = (struct dpu_hw_ctl *)hw_iter.hw;

Why cast? Isn't it void pointer?

> -               num_ctl++;
> -       }
> +       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> +               DPU_HW_BLK_PINGPONG, hw_pp, ARRAY_SIZE(hw_pp));
> +       num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> +               DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> +       num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> +               DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>  
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_LM);
> -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               hw_lm[i] = (struct dpu_hw_mixer *)hw_iter.hw;

Why cast?

> -               num_lm++;
> -       }
> +       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +               dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> +                                               : NULL;

This line is pretty hard to read. Maybe use an if/else?

>  
>         cstate = to_dpu_crtc_state(drm_crtc->state);
>  
>         for (i = 0; i < num_lm; i++) {
>                 int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>  
> -               cstate->mixers[i].hw_lm = hw_lm[i];
> -               cstate->mixers[i].lm_ctl = hw_ctl[ctl_idx];
> +               cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> +               cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>         }
>  
>         cstate->num_mixers = num_lm;
>  
>         for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +               int num_blk;

unsigned int?

> +               struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
>                 struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  
>                 if (!dpu_enc->hw_pp[i]) {
> @@ -1056,17 +1045,15 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>                 }
>  
>                 phys->hw_pp = dpu_enc->hw_pp[i];
> -               phys->hw_ctl = hw_ctl[i];
> +               phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>  
> -               dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
> -                                   DPU_HW_BLK_INTF);
> -               for (j = 0; j < MAX_CHANNELS_PER_ENC; j++) {
> +               num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
> +                       drm_enc->base.id, DPU_HW_BLK_INTF, hw_blk,
> +                       ARRAY_SIZE(hw_blk));
> +               for (j = 0; j < num_blk; j++) {
>                         struct dpu_hw_intf *hw_intf;
>  
> -                       if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                               break;
> -
> -                       hw_intf = (struct dpu_hw_intf *)hw_iter.hw;
> +                       hw_intf = to_dpu_hw_intf(hw_blk[i]);
>                         if (hw_intf->idx == phys->intf_idx)
>                                 phys->hw_intf = hw_intf;
>                 }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dea1dba441fe7..779df26dc81ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -83,7 +97,7 @@ static bool _dpu_rm_get_hw_locked(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
>         return false;
>  }
>  
> -bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
> +static bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
>  {
>         bool ret;
>  
> @@ -635,3 +649,16 @@ int dpu_rm_reserve(
>  
>         return ret;
>  }
> +
> +int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,

Return unsigned int?

> +       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)

unsigned int blks_size?

> +{
> +       struct dpu_rm_hw_iter hw_iter;
> +       int num_blks = 0;

unsigned int?

> +
> +       dpu_rm_init_hw_iter(&hw_iter, enc_id, type);
> +       while (num_blks < blks_size && dpu_rm_get_hw(rm, &hw_iter))
> +               blks[num_blks++] = hw_iter.blk->hw;
> +
> +       return num_blks;

It's not possible for it to be negative number right?

> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 9c580a0170946..982b91e272275 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -24,26 +24,6 @@ struct dpu_rm {
>         struct mutex rm_lock;
>  };
>  
> -/**
> - *  struct dpu_rm_hw_blk - resource manager internal structure
> - *     forward declaration for single iterator definition without void pointer
> - */
> -struct dpu_rm_hw_blk;
> -
> -/**
> - * struct dpu_rm_hw_iter - iterator for use with dpu_rm
> - * @hw: dpu_hw object requested, or NULL on failure
> - * @blk: dpu_rm internal block representation. Clients ignore. Used as iterator.
> - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder

Why is Encoder and Any capitalized?

> - * @type: Hardware Block Type client wishes to search for.
> - */
> -struct dpu_rm_hw_iter {
> -       void *hw;
> -       struct dpu_rm_hw_blk *blk;
> -       uint32_t enc_id;
> -       enum dpu_hw_blk_type type;
> -};
> -
>  /**
>   * dpu_rm_init - Read hardware catalog and create reservation tracking objects
>   *     for all HW blocks.
> @@ -93,28 +73,9 @@ int dpu_rm_reserve(struct dpu_rm *rm,
>  void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc);
>  
>  /**
> - * dpu_rm_init_hw_iter - setup given iterator for new iteration over hw list
> - *     using dpu_rm_get_hw
> - * @iter: iter object to initialize
> - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
> - * @type: Hardware Block Type client wishes to search for.

Ah I guess it's copied from here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
