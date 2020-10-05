Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66012836F2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 15:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761B089CBC;
	Mon,  5 Oct 2020 13:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70689C03
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:52:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so9665212wrn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BU4boLaeL27WfaueZ0RdQJHqbd/z9v+OnOYM/rLZ3Ow=;
 b=DUZjBumV8JuqrnnyjcXwlYtvbycyKoyCydnmMpPQH9elgQIqVsFSVENOhXLSZQz0SY
 2A1FxJuN/0Ixrdr3crtRgtSn7frljAGHGD8X+yx3hBOuw6YvXP1/UPBIobGscFEJry/7
 uHb1Zqr3YsAjZ8yb6SNKV4aZt58w1WVzlhWqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BU4boLaeL27WfaueZ0RdQJHqbd/z9v+OnOYM/rLZ3Ow=;
 b=cBD1mZ10Zc6NuCFi8iW0Vzb5xbD+oqNwwp2PUwtvuCzCeQJzW126+Ml2diPt5wTqw4
 zVF8r9AfkY5lH9N2qEVYPbsAqbyBgsRzcuEjFl9+0V485FaYAb0cCYdZYX5tb0EQfXKa
 nipMVEsQ9BWWv02xvISCI0rqIZqiQtF9Xx/sNUxIh7wVL0V1gOhEIts9bxSPaaZFW2M3
 Lpezt9vUEjXWdjSacntDNg4SLUVddHKvAKLdxgyZQkUT/HArweL2LiP4zMFihsLqe8yu
 ZCoO6PM5p1ba+5zleLXlSvRCy8w8Ze8CdIwDLfeT/vwtwdP18tkQTK5HrIuSc8eemSO8
 wVaQ==
X-Gm-Message-State: AOAM533V0VhFFqtbebnmb9OiCDuw/J540z6NhxWW/nxdjNy684q71qaT
 07WR7oZjIJLK0pKjR32BblrXEA==
X-Google-Smtp-Source: ABdhPJyUiqJQc9GEz3Iplb2FeLUKTW9rPq9dka/vnODNYjGEudIjUqb9RTp59xqSVAaBl2WFBOqzvw==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr17676331wrp.161.1601905950163; 
 Mon, 05 Oct 2020 06:52:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a127sm6430302wmh.13.2020.10.05.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:52:29 -0700 (PDT)
Date: Mon, 5 Oct 2020 15:52:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: trix@redhat.com
Subject: Re: [PATCH] drm/gma500: fix double free of gma_connector
Message-ID: <20201005135227.GQ438822@phenom.ffwll.local>
Mail-Followup-To: trix@redhat.com, patrik.r.jakobsson@gmail.com,
 airlied@linux.ie, natechancellor@gmail.com, ndesaulniers@google.com,
 alan@linux.intel.com, airlied@redhat.com, yakui.zhao@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20201003193928.18869-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201003193928.18869-1-trix@redhat.com>
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
Cc: airlied@linux.ie, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 yakui.zhao@intel.com, clang-built-linux@googlegroups.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, natechancellor@gmail.com,
 alan@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 03, 2020 at 12:39:28PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this problem:
> 
> cdv_intel_dp.c:2101:2: warning: Attempt to free released memory
>         kfree(gma_connector);
>         ^~~~~~~~~~~~~~~~~~~~
> 
> In cdv_intel_dp_init() when the call to cdv_intel_edp_panel_vdd_off()
> fails, the handler calls cdv_intel_dp_destroy(connector) which does
> the first free of gma_connector. So adjust the goto label and skip
> the second free.
> 
> Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for your patch, queued in drm-misc-next for 5.11.
-Daniel

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 720a767118c9..deb4fd13591d 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -2083,7 +2083,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>  			DRM_INFO("failed to retrieve link info, disabling eDP\n");
>  			drm_encoder_cleanup(encoder);
>  			cdv_intel_dp_destroy(connector);
> -			goto err_priv;
> +			goto err_connector;
>  		} else {
>          		DRM_DEBUG_KMS("DPCD: Rev=%x LN_Rate=%x LN_CNT=%x LN_DOWNSP=%x\n",
>  				intel_dp->dpcd[0], intel_dp->dpcd[1], 
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
