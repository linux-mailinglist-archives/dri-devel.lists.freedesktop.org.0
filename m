Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDE47A759
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6A111A27F;
	Mon, 20 Dec 2021 09:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096C11A281
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:40:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t26so18794785wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/teqifaKzeH8UYPm59TO0I2d45cw2lmw9JO9bR+H4mI=;
 b=j0h5yYgDQFQ/HC62jpTXP67hKBOSxtAaOVYd+RSO5POuYh3SavcH6aGSY/YklWwLRb
 QJQGkrwmK7hJc1Lz1LYgyNbDo7+oIgWIXIYXCpDs3KfhH2MZo2o69xPhc1R0XLnEJNWa
 6hm4YnuyZgebSnaQCcyOcwAdbKHxoNTXCNgg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/teqifaKzeH8UYPm59TO0I2d45cw2lmw9JO9bR+H4mI=;
 b=WfJroJaXoq8XxizOcj5IKfPlDqNd+xVOD3YVsb+bEEXvOqVby86aSO2Ml4/d5l/hNp
 g7f5UmNBQlzUG/DSGYLtYlj0t9PJ2oKeTv3k2BlA4vWDXgkcAzDpWLNcA//v46qxFEcl
 0kZbr/M/v2wJ3nPwGvM+0C4n9CEmqR6SrgTD5vmaU0y8f5azO7jy1GruRLJMfXWnonTF
 IQJswpXIWKAAMIZh49Er1Jq8qnCfwJjmMjbXla9IMSCjoEt0UjBaquV83kalpcyd5eol
 BvZuc9h7+MZHjTO2Ok3/mX2NsR6uu4F9DuSgJu1ozT+KlG7WPVS7Qcu4WetMIFSMmeiR
 Yecw==
X-Gm-Message-State: AOAM5326MuipHk00k4pyld2D3RFYKYv/OwVMDodsKKZo1lAJlKek1JPP
 1F53W+j8BTnYWPPyLetJGqPQtEmx4DG8lw==
X-Google-Smtp-Source: ABdhPJyht4jB7Rh3dmx83lp86mmNZjHLE5oziFtv62A9+tIk6B/blbQ58E3W3KNjJAQMVssvjE2gkg==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr11798285wrz.666.1639993249547; 
 Mon, 20 Dec 2021 01:40:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b16sm7352006wmq.41.2021.12.20.01.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:40:48 -0800 (PST)
Date: Mon, 20 Dec 2021 10:40:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm: mali-dp: potential dereference of null pointer
Message-ID: <YcBPn6ZTLbobErXj@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <brian.starkey@arm.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, liviu.dudau@arm.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nd@arm.com
References: <20211214100837.46912-1-jiasheng@iscas.ac.cn>
 <20211214110202.unexcdiya3qhsvzc@000377403353>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214110202.unexcdiya3qhsvzc@000377403353>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 11:02:02AM +0000, Brian Starkey wrote:
> Hi,
> 
> On Tue, Dec 14, 2021 at 06:08:37PM +0800, Jiasheng Jiang wrote:
> > The return value of kzalloc() needs to be checked.
> > To avoid use of null pointer '&state->base' in case of the
> > failure of alloc.
> > 
> > Fixes: 99665d072183 ("drm: mali-dp: add malidp_crtc_state struct")
> > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > ---
> 
> You can add my r-b to this one too. Thanks!

Are you (or someone else from arm) also pushing these? Otherwise they'll
get lost.
-Daniel

> 
> >  drivers/gpu/drm/arm/malidp_crtc.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
> > index 494075ddbef6..b5928b52e279 100644
> > --- a/drivers/gpu/drm/arm/malidp_crtc.c
> > +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> > @@ -487,7 +487,10 @@ static void malidp_crtc_reset(struct drm_crtc *crtc)
> >  	if (crtc->state)
> >  		malidp_crtc_destroy_state(crtc, crtc->state);
> >  
> > -	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> > +	else
> > +		__drm_atomic_helper_crtc_reset(crtc, NULL);
> >  }
> >  
> >  static int malidp_crtc_enable_vblank(struct drm_crtc *crtc)
> > -- 
> > 2.25.1
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
