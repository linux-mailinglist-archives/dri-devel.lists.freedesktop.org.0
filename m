Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DFA319F6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 00:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9F10E769;
	Tue, 11 Feb 2025 23:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LO38sqNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27F10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 23:52:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54505a75445so4005400e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739317966; x=1739922766; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=060BUK70oyF2hRYa4NzdOQ1LYVTMQlOAYDrgLB06a/4=;
 b=LO38sqNpEphjZirtWQHGeFSfm7dtP+prB+qjjWeVqNTu0FyU/9LCMLprVJk9/gGLuC
 SMpUuOalWoc2XeHGReIRjU9vD16dZ5MBiXQG7v3Ng4VwH3DpKbUH++/6NZhJQxOYTBxW
 /KRA4sAkiPTklYBnJM98JCwLn24K99uJ5eUFXDsvIXMFLnVK8fr6UvgxRhLbOMiofclL
 OTqmcsr/9Pn5Q7mrrDgK4zJMuqaPMFW2g6cnzN/ClkS98c1Ndlhm+NFxt/QO/Jad0Q5W
 BM82kkamWgDTEHyFI1czcIHclcN+AJyzNdGmYkvnPdy76rMYnzSkeFVQTHvRobKMGWzb
 0jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739317966; x=1739922766;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=060BUK70oyF2hRYa4NzdOQ1LYVTMQlOAYDrgLB06a/4=;
 b=LLvsCMl6iWYCugDYqbZkWrq6Jaqa1FhEEHMVQGjkEPZr24vjLFy41YKD9FWPKE280j
 +RDI3PGVX4vcrduwC34Y1aqW5wtRjgw9VHrQtwIOPXKT+KDweL7i9IUuigE72GM7o4vU
 +Hh245+NPApS6LbqOWmgqe6TbNSewnzOQl90T8Q/SQj432vqXecgaPS738/asRmt/h/F
 lQ1X933Y0am4yM+2EIF4wVraCobHkb45avwudjNtLlmpIkTeUsH6gcEQcBVTvwsIZ2G+
 6uhcWa1GLV98CYDxMOCQmsXAYmPsvvbQzpgvj2ny7hbGVCmBxtBsYtRg0oCXRk4WJN+I
 eFBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDReINhqo0gPLDE25eyg9IZ19saaNiOOHu2TXsQrY3Wx4BGrLbLSoNhM0VBnBMxGUiDEoztHQfDS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8I6CvYZz4nF2+76xvtRXqFeMrBf2MVwS1yp05uceoouAwxSsJ
 UnWQP/cHuLVmT6R+up74VxETFfyjW8B1G/37rHe8VOmW+74sdZ3nFhWk5P61Euw=
X-Gm-Gg: ASbGnctEJ0y3f71qCoDPgiYZkN0cnqOJzR35u0eTtVd1Mj6jd0RMA06+0PkOgNgemvt
 4bdZY9tSM9gMt6WYPxAn/SunD+Haud3kVweFQR31NITHE9v9rSmH+ZIUKTJHPkTHML88IijZTal
 /2BJsjouqRVDcXJ7JIjlZfEIhvrRm7cyfU2P6MGJswPOROLg6y3Q46LM+PGm6Mhfmb9TVraVc1n
 lx9ZHxlLn/1dX4PtOuOk4xRuJg4r5KDk1bANClo0ETrU2k2SXGVrTdmTnnrXg/2x8mJgCQQX5BT
 L6n+vAtexXhSqVE+9KEpU5T0N+/YCQTBwrzsAR1BAMGGDZGqRG7Rsu4usIgoVlJ7TEIbawQ=
X-Google-Smtp-Source: AGHT+IFQaBMd7owVglZPD32Tkbi94LwNMechqHnLhs8nTLL8DE0vygNazH/5ko+5m5MkF950qtvRDg==
X-Received: by 2002:a05:6512:10cb:b0:544:ee5:87aa with SMTP id
 2adb3069b0e04-545180ea29cmr228634e87.4.1739317966198; 
 Tue, 11 Feb 2025 15:52:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450ed1411dsm612626e87.97.2025.02.11.15.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 15:52:44 -0800 (PST)
Date: Wed, 12 Feb 2025 01:52:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <vlni5ophwkwfbvh6zj6aqqdhyt3wwjjkv77d6fublj22zidv2d@hr4qlot72vqi>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
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

On Tue, Feb 11, 2025 at 09:06:19PM +0300, Danila Tikhonov wrote:
> On 2/9/25 01:09, Marijn Suijten wrote:
> > On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> > > From: Eugene Lepshy <fekz115@gmail.com>
> > > 
> > > DRM DSC helper has parameters for various bpc values ​​other than 8:
> > Weird zero-width \u200b spaces here between "values" and "other", please delete
> > those.
> Thanks, I will fix it in the next version.
> > > (8/10/12/14/16).
> > > 
> > > Remove this guard.
> > > 
> > > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > Should this patch elaborate that those "DRM DSC helper" don't have any
> > additional guarding for the values you mention either, i.e. passing 9 or 11 or
> > > 16 don't seem to be checked anywhere else either?
> There are no other bpc checks, you are right. But to be honest I don't
> really see any sense in this. Anyway, if you still want us to leave the
> current guard and just extend it with new values ​​(for example via
> switch case) - let me know.

Yes, please. Add a caselist and also a note that only 8, 10 and 12 are
valid for DSC 1.1 block. Then whoever stomps upon other bpc value will
have to extend the check, verifying DSC version.

> > And your title might have space to spell out "Bits Per Component" entirely.
> I'll fix that too.
> > > ---
> > >   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> > >   1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 007311c21fda..d182af7bbb81 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> > >   		return -EINVAL;
> > >   	}
> > > -	if (dsc->bits_per_component != 8) {
> > > -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> > > -		return -EOPNOTSUPP;
> > > -	}
> > > -
> > >   	dsc->simple_422 = 0;
> > >   	dsc->convert_rgb = 1;
> > >   	dsc->vbr_enable = 0;
> > This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> > dpu_hw_dsc_config(), which has:
> > 
> > 	data |= (dsc->line_buf_depth << 3);
> > 	data |= (dsc->simple_422 << 2);
> > 	data |= (dsc->convert_rgb << 1);
> > 	data |= dsc->bits_per_component;
> > 
> > The original value of `8` would overlap with the lowest bit of line_buf_depth
> > (4th bit in `data`).  Now, the 2nd bit which will take the value from
> > convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> > your new bpc value of 10.
> > 
> > Can you double-check that this code in DPU1 is actually valid?  I assume you
> > have tested this panel at least and it is working (worthy mention in the cover
> > letter?), this just seems like yet another mistake in the original bindings
> > (though the register always had a matching value with downstream on 8 BPC panels
> > for me).
> 
> Of course I have tested the panel and it works, I just thought it would
> be obvious. We also have tested sm7150-xiaomi-courbet, sm8450-xiaomi-cupid
> and sm8475-nothing-pong, which already have bpp = bpc = 10 panels and
> with some hack it also work without any changes to the DRM.

This is now being fixed by a separate patch.

> 
> > > @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> > >   	drm_dsc_set_const_params(dsc);
> > >   	drm_dsc_set_rc_buf_thresh(dsc);
> > > -	/* handle only bpp = bpc = 8, pre-SCR panels */
> > > +	/* handle only pre-SCR panels */
> > >   	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> > Good catch - this comment sounds like it's documenting a limitation of
> > this helper function, but the function does not have such limitations...
> > rc_parameters_pre_scr has values for all these combinations.
> Maybe we should remove this comment entirely?

No, the pre-SCR comment is fine.

> 
> Regards,
> Danila
> > - Marijn
> > 
> > >   	if (ret) {
> > >   		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> > > -- 
> > > 2.48.1
> > > 

-- 
With best wishes
Dmitry
