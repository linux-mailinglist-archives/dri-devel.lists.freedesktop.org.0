Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BB968A36
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5260A10E336;
	Mon,  2 Sep 2024 14:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YoMrToQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157EB10E336;
 Mon,  2 Sep 2024 14:43:47 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so494623366b.0; 
 Mon, 02 Sep 2024 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725288225; x=1725893025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFRFdizmhc2CJwy4/CKQA005aAYjoT9/YpO+LeBpeuY=;
 b=YoMrToQM2O9BsASmmW1RhoYyH1dalzRRMWaY3J4itcS8nUFYDGOcikXc34kWox7Xq3
 ZOL3kyY197lze7c/ztQ1GM2QismKbTM+Xv36bDy3BalI2aNAZl6n1EoE0uuG/4405fye
 AJLrFhLnfkmyfIB3fGragHQCVRoXuQ5A/dR/O3JlvczvONtqoMrw/X7hhc0uysmxdBuC
 pzg3po4/XcGYDDIl3qQxODa4PX/gsioqNtVpHGPy6GPgUBmFIkMm5qjASatjng7x9SJi
 NS6/lgEaHQN1PfqVOnvyPbmTlrMgOOOx7DrxZnSTshRJOkO9YEmCeAOWrGyMdVp4/TJ1
 KUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725288225; x=1725893025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFRFdizmhc2CJwy4/CKQA005aAYjoT9/YpO+LeBpeuY=;
 b=CGdS4CvCBUjfav6NJK5oTh5emd6eYiU3GCEB095F5a0j3j7sPvFf9HO2cmcZhsN0vQ
 eUSvjtAntkgGfsZKRJAEe3BPOIwDwB9KGjkDTCfC40QnGCNUBh+eaF8PrsftHFeHuLGo
 sM0aT0HnUJrnpPnLAOK9RGv07FpzySkCdsdqZN77nZGcS5sfEJC1kDOjgmIQ4VaJj3eR
 32KcOOyjbtpNDGackA9to7LbovfR9w4NnJnFNsem5mWpwtMfcWk4du4WN4U1FiqoRoVV
 B7mP4MJKlCMSMxns575wZZ6L/rMaklUikcYVgn8LvNYnA5hci3z1vxDUSRaZlch/ysRk
 fBBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi2lQpKS1+WhyLxRMEAyMzyYtsd3GOWq9iH2kM7qts6mztNQZt+q/Bld1m4t8K3Q+9oKAzKIBR9Hwh@lists.freedesktop.org,
 AJvYcCWmwF+nNwxk58X/cVEzocJCpa7/JU9j3iXDlcmbe4lZpuSDc7Mr5RINNssDDGRUBc/lvZs8o1wd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcENaX+/XpDQNgCMoV3FUZVGu5sa9WbaUqXzIJYbLMcEBXU5cX
 I/l3Y/fcAsVFy2F6RZULdD7xSMASG/B0YGt1qFsUTeFVyUxoaNrX
X-Google-Smtp-Source: AGHT+IFVrmcQ2LyLLYhiHo5LRdWuFIggl65+Wa6I1kVeqYevDcItonWteNGDfQxRBC1yUAzXhRpMfg==
X-Received: by 2002:a17:906:f5a8:b0:a7a:9226:6511 with SMTP id
 a640c23a62f3a-a8a1d3268cemr29177566b.31.1725288224997; 
 Mon, 02 Sep 2024 07:43:44 -0700 (PDT)
Received: from localhost.localdomain ([31.19.114.250])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891968e9sm563655266b.120.2024.09.02.07.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 07:43:44 -0700 (PDT)
From: raoul.van.rueschen@gmail.com
To: tjakobi@math.uni-bielefeld.de
Cc: Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, sunpeng.li@amd.com, raoul.van.rueschen@gmail.com
Subject: Re: [PATCH 1/2] drm/amd/display: Avoid race between dcn10_set_drr()
 and dc_state_destruct()
Date: Mon,  2 Sep 2024 16:43:36 +0200
Message-ID: <20240902144337.18223-1-raoul.van.rueschen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
References: <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> dc_state_destruct() nulls the resource context of the DC state. The
> pipe
> context passed to dcn10_set_drr() is a member of this resource
> context.
>
> If dc_state_destruct() is called parallel to the IRQ processing
> (which
> calls dcn10_set_drr() at some point), we can end up using already
> nulled
> function callback fields of struct stream_resource.
>
> The logic in dcn10_set_drr() already tries to avoid this, by checking
> tg
> against NULL. But if the nulling happens exactly after the NULL check
> and
> before the next access, then we get a race.
>
> Avoid this by copying tg first to a local variable, and then use this
> variable for all the operations. This should work, as long as nobody
> frees the resource pool where the timing generators live.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while
> keeping DML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++------
> --
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 3306684e805a..da8f2cb3c5db 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx
> **pipe_ctx,
>  	 * as well.
>  	 */
>  	for (i = 0; i < num_pipes; i++) {
> -		if ((pipe_ctx[i]->stream_res.tg != NULL) &&
> pipe_ctx[i]->stream_res.tg->funcs) {
> -			if (pipe_ctx[i]->stream_res.tg->funcs-
> >set_drr)
> -				pipe_ctx[i]->stream_res.tg->funcs-
> >set_drr(
> -					pipe_ctx[i]->stream_res.tg,
> &params);
> +		/* dc_state_destruct() might null the stream
> resources, so fetch tg
> +		 * here first to avoid a race condition. The
> lifetime of the pointee
> +		 * itself (the timing_generator object) is not a
> problem here.
> +		 */
> +		struct timing_generator *tg = pipe_ctx[i]-
> >stream_res.tg;
> +
> +		if ((tg != NULL) && tg->funcs) {
> +			if (tg->funcs->set_drr)
> +				tg->funcs->set_drr(tg, &params);
>  			if (adjust.v_total_max != 0 &&
> adjust.v_total_min != 0)
> -				if (pipe_ctx[i]->stream_res.tg-
> >funcs->set_static_screen_control)
> -					pipe_ctx[i]->stream_res.tg-
> >funcs->set_static_screen_control(
> -						pipe_ctx[i]-
> >stream_res.tg,
> -						event_triggers,
> num_frames);
> +				if (tg->funcs-
> >set_static_screen_control)
> +					tg->funcs-
> >set_static_screen_control(
> +						tg, event_triggers,
> num_frames);
>  		}
>  	}
>  }

This fixes full system freezes when taking screenshots at low framerates with VRR enabled on an RX 7900 XTX.

Tested-by: Raoul van Rüschen <raoul.van.rueschen@gmail.com>
