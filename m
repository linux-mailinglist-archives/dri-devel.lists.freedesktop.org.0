Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36542F1AFB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69989CA0;
	Mon, 11 Jan 2021 16:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A6489C1E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:32:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id q75so459406wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=VZdH60EuGMKkmr8lqMIhejGhytbSg0G7wV4v2lwFyXE=;
 b=CQIFawl4ORfpLfps2O+BOFZM3ykPUmDF3knAkCHjFxKBD0mhvwgUiuHKmnFntGClZu
 J448Kza+c+w3cWxmCWzoDGk2G5+Jr2YVJIWUyUTxZZrYw1jTMnrpZ6JGUt9A1HCiaTJD
 Ne0KzPR19lI753im0Db7prHqXacIHjorp0ZvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=VZdH60EuGMKkmr8lqMIhejGhytbSg0G7wV4v2lwFyXE=;
 b=rNt381NVQAxvgJ66W9RZxMvSs2y2Jt8ighveXt3UzHsulMASzS6lC+Oq6Miq9HRFt5
 R5tkPM43M02txNsyffZ0FOhlCC07lDD6dJDQWfOBOXb0lG/XKKYXpg04+WWW/M0U4ysu
 Et64JUrDxGy5ttjO0lSNNXAvRU8kpAJPZnlxdxfyvlS+c4AyvRhi4lfDr7LDQIaq1ka+
 ZClSATlHYd/ofxwHqUBwq74ljttB88Qg7bRKNbiG7XNygtXym1F9RkBjD35V+joyAx7w
 QRKLThReDquNXimwLWMfXvKOQOtOw+6ult3ZE95WLvPXH4k6KZFayvtMHdh2ZOjVkXN+
 dszw==
X-Gm-Message-State: AOAM530WXMJnbL1WDI7PHJEbkGZy1cDmpkr/VwxfL5bq00xqntuckHA1
 m9roEafJPMUlFjepJCM0XDfMHyd75kqw7VdZ
X-Google-Smtp-Source: ABdhPJy7rD9+fUXp9/6HK4DWSzraPNDKHbAST+rG6g4n8v9vLsakVgoMpacyQKhRHZxQsXi9AblWGg==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr497147wml.50.1610382757113;
 Mon, 11 Jan 2021 08:32:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z3sm174381wrn.59.2021.01.11.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:32:36 -0800 (PST)
Date: Mon, 11 Jan 2021 17:32:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] amdgpu: Avoid sleeping during FPU critical sections
Message-ID: <X/x9ojzg8XcCG+ZT@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Jeremy Cline <jcline@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20210108215838.470637-1-jcline@redhat.com>
 <3c94f9d6-501d-271c-ca83-1cf4229cb3ab@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c94f9d6-501d-271c-ca83-1cf4229cb3ab@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 09:53:56AM +0100, Christian K=F6nig wrote:
> Am 08.01.21 um 22:58 schrieb Jeremy Cline:
> > dcn20_resource_construct() includes a number of kzalloc(GFP_KERNEL)
> > calls which can sleep, but kernel_fpu_begin() disables preemption and
> > sleeping in this context is invalid.
> > =

> > The only places the FPU appears to be required is in the
> > init_soc_bounding_box() function and when calculating the
> > {min,max}_fill_clk_mhz. Narrow the scope to just these two parts to
> > avoid sleeping while using the FPU.
> > =

> > Fixes: 7a8a3430be15 ("amdgpu: Wrap FPU dependent functions in dc20")
> > Cc: Timothy Pearson <tpearson@raptorengineering.com>
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> =

> Good catch, but I would rather replace the kzalloc(GFP_KERNEL) with a
> kzalloc(GFP_ATOMIC) for now.
> =

> We have tons of problems with this DC_FP_START()/DC_FP_END() annotations =
and
> are even in the process of moving them out of the file because the compil=
es
> tend to clutter FP registers even outside of the annotated ranges on some
> architectures.

Out of curiosity, what's the plan? Soft-fp implementation for DC so you
can keep the algorithms all unchanged, or redoing them as some fixed point
with careful review and retesting everything? Something else?
-Daniel

> =

> Regards,
> Christian.
> =

> > ---
> >   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/dr=
ivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > index e04ecf0fc0db..a4fa5bf016c1 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > @@ -3622,6 +3622,7 @@ static bool init_soc_bounding_box(struct dc *dc,
> >   	if (bb && ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev)) {
> >   		int i;
> > +		DC_FP_START();
> >   		dcn2_0_nv12_soc.sr_exit_time_us =3D
> >   				fixed16_to_double_to_cpu(bb->sr_exit_time_us);
> >   		dcn2_0_nv12_soc.sr_enter_plus_exit_time_us =3D
> > @@ -3721,6 +3722,7 @@ static bool init_soc_bounding_box(struct dc *dc,
> >   			dcn2_0_nv12_soc.clock_limits[i].dram_speed_mts =3D
> >   					fixed16_to_double_to_cpu(bb->clock_limits[i].dram_speed_mts);
> >   		}
> > +		DC_FP_END();
> >   	}
> >   	if (pool->base.pp_smu) {
> > @@ -3777,8 +3779,6 @@ static bool dcn20_resource_construct(
> >   	enum dml_project dml_project_version =3D
> >   			get_dml_project_version(ctx->asic_id.hw_internal_rev);
> > -	DC_FP_START();
> > -
> >   	ctx->dc_bios->regs =3D &bios_regs;
> >   	pool->base.funcs =3D &dcn20_res_pool_funcs;
> > @@ -3959,8 +3959,10 @@ static bool dcn20_resource_construct(
> >   				ranges.reader_wm_sets[i].wm_inst =3D i;
> >   				ranges.reader_wm_sets[i].min_drain_clk_mhz =3D PP_SMU_WM_SET_RANG=
E_CLK_UNCONSTRAINED_MIN;
> >   				ranges.reader_wm_sets[i].max_drain_clk_mhz =3D PP_SMU_WM_SET_RANG=
E_CLK_UNCONSTRAINED_MAX;
> > +				DC_FP_START();
> >   				ranges.reader_wm_sets[i].min_fill_clk_mhz =3D (i > 0) ? (loaded_b=
b->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
> >   				ranges.reader_wm_sets[i].max_fill_clk_mhz =3D loaded_bb->clock_li=
mits[i].dram_speed_mts / 16;
> > +				DC_FP_END();
> >   				ranges.num_reader_wm_sets =3D i + 1;
> >   			}
> > @@ -4125,12 +4127,10 @@ static bool dcn20_resource_construct(
> >   		pool->base.oem_device =3D NULL;
> >   	}
> > -	DC_FP_END();
> >   	return true;
> >   create_fail:
> > -	DC_FP_END();
> >   	dcn20_resource_destruct(pool);
> >   	return false;
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
