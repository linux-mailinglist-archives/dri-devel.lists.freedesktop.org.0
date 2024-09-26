Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FC986D47
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5912E10EAA8;
	Thu, 26 Sep 2024 07:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hkWuhtOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4FD10EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:12:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso915814e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727334761; x=1727939561; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8s1pVCKNQ5LijTwwwKbqt+TsjnjxLMGQpEOKi95VGHE=;
 b=hkWuhtOBEkO9G09/3UU5OK33NJ3IL9giMp5kGW5FpJygdCEBrC2djGKZ0SvHKl9O/3
 S85SzFG5Hi/C7aYiXGCE9dbIbcsq/jrLiasTQvk+dr6JeSxy6TN1t9x6HD/QX4Mgu8ic
 Ly7Ooa58AUVhcKddsWTTzf7n0VrSlu3jdIsgA5jqdz1E7fU+rwUVRXIxSO83PUsZ/f0C
 izscbde1GlWIq1yhZMni+bDV4iad7kQX7S5ovF4+A1eGh2zGjaers+3Hafq8xW6Il5pr
 pCzGLtXU33v/h8GskX9xlZ36RQXij1yrq81gzO/yFbnxmdl0Lg/sCk2L1xXmNg6SLtHD
 R3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727334761; x=1727939561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8s1pVCKNQ5LijTwwwKbqt+TsjnjxLMGQpEOKi95VGHE=;
 b=ijMRYZQS9z9LrukRb8MdFKNmCHZ1cGBE9l3kZ1E2C1ChZ/e4pxfUbCE+urdv65d5Ur
 1qFg7BE1OcPD8fWcvhFRQaFGwtlsKYH8bGmlaSc2+ICZH3Ik3oAcelva47tHZs5I2ukq
 iWWc4Wn8bt7gmFa0HBc30LEzLyRBOclEGZIjw3ZiJQOvDGWz55WxAxUGJ0OiCu/B+U2W
 XStlv1YCVWZPNotJAYxsmQdVu6uSOGHE3Ppsrg4qKOU9/Aw0O9EtQ8iR2X7gX0ntHopq
 47VxlSXO8ZbKLWz0ClNx8vA+vrye+D712jyXxd8xvVLg4XoSNN9Rx5XhE3WmyIDEb+7v
 3OkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5pJyi1OVNTulQ1U5lZqwI55HfZYNwt426xJsWUJMffzVZ7mVw98Q7fU2qfnNERUvfN4IfxIDLf3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwehYxgc6gzExPN4KGXljGahbjN5aAbHooaXo6fhm5jemfdm3ly
 ympRRaSZ2VijsPYy3u8KEIw0olouijuRK33nydEdp0QHFBv1a8NozH5Ddc7Ww7s=
X-Google-Smtp-Source: AGHT+IEvLEJJDB6OVRh8ic+vi9uidxlX2tWayQauVJPNPmxbj5VEoP9OS3HkVp0PnEHowSwNvC2pog==
X-Received: by 2002:a05:6512:3b0e:b0:536:7b56:6ba0 with SMTP id
 2adb3069b0e04-538775666a3mr4753353e87.57.1727334760529; 
 Thu, 26 Sep 2024 00:12:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0b8dsm720824e87.61.2024.09.26.00.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:12:39 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <w53qtqnbibnw2kekn56afrf75udl3hbrk6kfavv7imqac6eqvo@lpgdvxncpfep>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
 <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
 <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
 <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
 <b3830573-1f39-4729-be58-c2659a37d689@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3830573-1f39-4729-be58-c2659a37d689@quicinc.com>
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

On Wed, Sep 25, 2024 at 02:49:48PM GMT, Abhinav Kumar wrote:
> On 9/25/2024 2:11 PM, Dmitry Baryshkov wrote:
> > On Wed, 25 Sept 2024 at 22:39, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > 
> > > > > All resource allocation is centered around the LMs. Then other blocks
> > > > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > > > powers up the CRTC rather than the encoder.
> > > > > 
> > > > > Moreover if at some point the driver supports encoder cloning,
> > > > > allocating resources from the encoder will be incorrect, as all clones
> > > > > will have different encoder IDs, while LMs are to be shared by these
> > > > > encoders.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> > > > >    3 files changed, 183 insertions(+), 123 deletions(-)
> > > > > 
> > > > > @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
> > > > >       }
> > > > >    }
> > > > > 
> > > > > -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> > > > > +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> > > > > +                             struct msm_display_topology *topology,
> > > > > +                             struct drm_atomic_state *state,
> > > > > +                             const struct drm_display_mode *adj_mode)
> > > > >    {
> > > > >       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > -    int i, intf_count = 0, num_dsc = 0;
> > > > > +    struct drm_connector *connector;
> > > > > +    struct drm_connector_state *conn_state;
> > > > > +    struct msm_display_info *disp_info;
> > > > > +    struct drm_framebuffer *fb;
> > > > > +    struct msm_drm_private *priv;
> > > > > +    int i;
> > > > > 
> > > > >       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > > > >               if (dpu_enc->phys_encs[i])
> > > > > -                    intf_count++;
> > > > > +                    topology->num_intf++;
> > > > > 
> > > > > -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> > > > > +    /* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > > > >       if (dpu_enc->dsc)
> > > > > -            num_dsc = 2;
> > > > > +            topology->num_dsc += 2;
> > > > > 
> > > > > -    return (num_dsc > 0) && (num_dsc > intf_count);
> > > > > -}
> > > > > +    connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> > > > > +    if (!connector)
> > > > > +            return;
> > > > > +    conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > > +    if (!conn_state)
> > > > > +            return;
> > > > > 
> > > > > -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> > > > > -{
> > > > > -    struct msm_drm_private *priv = drm_enc->dev->dev_private;
> > > > > -    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > -    int index = dpu_enc->disp_info.h_tile_instance[0];
> > > > > +    disp_info = &dpu_enc->disp_info;
> > > > > 
> > > > > -    if (dpu_enc->disp_info.intf_type == INTF_DSI)
> > > > > -            return msm_dsi_get_dsc_config(priv->dsi[index]);
> > > > > +    priv = drm_enc->dev->dev_private;
> > > > > 
> > > > > -    return NULL;
> > > > > +    /*
> > > > > +     * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> > > > > +     * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> > > > > +     * earlier.
> > > > > +     */
> > > > > +    if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> > > > > +            fb = conn_state->writeback_job->fb;
> > > > > +
> > > > > +            if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> > > > > +                    topology->needs_cdm = true;
> > > > > +    } else if (disp_info->intf_type == INTF_DP) {
> > > > > +            if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> > > > > +                    topology->needs_cdm = true;
> > > > > +    }
> > > > 
> > > > Just to note, the needs_cdm is not enough once you introduce CWB
> > > > support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
> > > > don't have), but this doesn't get reflected in the topology.
> > > 
> > > Hi Dmitry,
> > > 
> > > Ack. I can add something to make atomic_check fail if the input FB is
> > > YUV format and CWB is enabled.
> > 
> > I'd prefer for this to be more natural rather than just checking for
> > the DP && DP_YUV420 && WB && WB_FMT_YUV. In the worst case, count CDM
> > requests and then in RM check them against the catalog. But I had a
> > more logical (although more intrusive) implementation on my mind:
> > 
> > struct msm_display_topology {
> >      struct {
> >        u32 num_intf;
> >        u32 num_wb;
> >        u32 num_dsc;
> >        bool needs_cdm;
> >      } outputs[MAX_OUTPUTS];
> >      u32 num_lm;
> > };
> > 
> > WDYT?
> > 
> 
> the struct msm_display_topology was originally designed as a per-encoder
> struct (dpu_encoder_get_topology() indicates the same). Making this an array
> of outputs was not needed as there is expected to be one struct
> msm_display_topology for each virt encoder's requested topology and the
> blocks inside of it other than LM, are "encoder" hw blocks.
> 
> needs_cdm was made a boolean instead of a num_cdm_count like other hardware
> blocks because till the most recent chipset, we have only one CDM block.
> Whenever we do have more CDM blocks why will introducing num_cdm to the
> topology struct not solve your problem rather than making it an array of
> outputs?
> 
> Because then, RM will know that the request exceeds the max blocks.
> 
> I think what you are trying to do now is make struct msm_display_topology's
> encoder parts per-encoder and rest like num_lm per "RM session".
> 
> The thought is not wrong but at the same time seems a bit of an overkill
> because its mostly already like that. Apart from CDM for which I have no
> indication of another one getting added, rest of the blocks are already
> aligned towards a per-encoder model and not a "RM session" model.

But we should be leaning towards RM session.

> 
> Even if we end up doing it this way, most of the model is kind of unused
> really because each encoder will request its own topology anyway, there is
> just no aggregation for CDM which at this point is not needed as there is no
> HW we are aware of needing this.

With the resource allocation shifted to the CRTC individual encoders
do not request their own topology (as it is now a property of the full
output pipeline, not just an encoder). Yes, CDM aggregation into num_cdm
seems unnecessary as there is just one CDM block.

> I think the atomic_check validation is needed either way because if two
> encoders request cdm, we cannot do clone mode as there is only one cdm block
> today. Its just that we are not tracking num_cdm today due to reasons
> explained above but basically doing something like below seems right to me:
> 
> if (enc_is_in_clone_mode && needs_cdm)
> 	return -ENOTSUPPORTED;

This check is incorrect in my opinion. The hardware should be able to
support DP/YUV420 + WB/RGB and DP/RGB + WB/YUV combinations. Please
correct me if I'm wrong.

> When we add more cdm_blocks, we can drop this check and making needs_cdm a
> num_cdm will make it naturally fail.

-- 
With best wishes
Dmitry
