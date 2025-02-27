Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8008A48586
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0858710E388;
	Thu, 27 Feb 2025 16:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XeOp55lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132710E388;
 Thu, 27 Feb 2025 16:46:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-22355618fd9so17100585ad.3; 
 Thu, 27 Feb 2025 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740674782; x=1741279582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRXDCZOpNFx7mEL7sD+vJQzvlE2qaUafze4CTsh+P/M=;
 b=XeOp55lzeaqwnswLlGZWIsHWdGw2bCqepq7nOL1RDERyMoHWaAn8CVx2TNKYN6CoZ5
 gqSmDiPwhc6EXuybV9EBG6xbLWXKI3voXwnzDNd+fH7rInW6ybl2daTn5bhC0fMfifTG
 AE42qp5+7ARjEYe0QjeAY3CTvxcGbg3p58ZkmkDUEUxNV92WL5yDtjYl5OzCe5Ym2xWN
 dMrvSUjOwqpqlm8fnkOjGGfaZdV0T8AMgSnhICUlpUYsb9ocA3Ix8Hla9BbLX/DW0Ysy
 22rwqLIvyqEF3nd6aENzsjUPupqxeHxDUuuUGgpaZi/4nTgRo8beFSNf60HWbRJP9NT7
 L0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674782; x=1741279582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRXDCZOpNFx7mEL7sD+vJQzvlE2qaUafze4CTsh+P/M=;
 b=PCNiGLTGmZfgbZjUPHYO7TU5VAafJZA3c04PeZFflHbJuh7LLWPqVeLKu4Ztl86XyZ
 F2XeENI2XJBVFAIUqH4S9MWKMYytHoinDG0jHGLnwaP/eyQdblNzsTOFuJdQkWsMDxU4
 1PXvVV6OC4sBmr5Y30JI6YM0QO+bsmArgxXd/EJpGLYJF8+Pk0MuHQMHKoMryPVT9Imz
 0q1+3TaQ8lJk8nQNWwfrAFrLon91kBbOzMIFDm+yGlzkbVuCYbbnqBuxqalZX8nBLW/E
 nnwwIqS5xC+kpk98YH9vS7tRKCazfG1jEuKl+mXYGvvPi+p7TQKdXaB4a3XBvczYh+Tr
 LXKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcZ3tZQsARW2IzKYuGtONIwzBZpJ15tSjtr1vJz8FGHWvuuMoLPInF+F60VSn77fmGYUvvQUxojWw6@lists.freedesktop.org,
 AJvYcCVdNhQhQBAWg2mAzcrP91HKRvLT9LlmTMuCPZl2e4nNAaYMNvpvsVXBT9QK+30vnFe7Jj0B2xDBKH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV1i2sEhMiqb5gn3XD6gIP2Ro8ecnNvPoNQ4NcsJ5mS4rLTker
 9kkLxJHjgaPyW0O4RAfwx7geTh56QlBGgaed6+YWR1wPkT7Sw/fW
X-Gm-Gg: ASbGncus24oGaGBIXbw7uVS82415j88/hJgrOeWj1dTFK5OYa1iDRWzKho9y+02dZ4o
 fk3Rj5Nnjn6TVD+HJ8lFO3A14MZipqMFo20R5u2Wz+oc0evXql2diWPWN6hFRseoK3ebPpUMSVM
 BXQP4Xu68CrK5+BA/sMV/We4DPldCZ6gi6nTTP42zl5HK1STStoUcpdtYIYcxXUou5bIeO32rId
 ha0+qZidStDtnEbxDGoFk4W1HqzwBKlRQq1ZlpZHSlIQpDif++COV4RMGBaQFG+sXmo0ZKR9pel
 z6GRfou0BmOv2oqXLsar+Kf5X4DHLNf0jIJBoa0a4GwvArI1aHxi
X-Google-Smtp-Source: AGHT+IGSorrpazKalpJZWfzSOXdCZYUFDo74/mLdsFxqv0//LTvqdmRqtXwe49OfXxH70F6yYFLubQ==
X-Received: by 2002:a17:902:e946:b0:223:5945:ffd5 with SMTP id
 d9443c01a7336-22359460062mr37537585ad.32.1740674781845; 
 Thu, 27 Feb 2025 08:46:21 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223504dc7e1sm17097255ad.176.2025.02.27.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:46:21 -0800 (PST)
Date: Thu, 27 Feb 2025 08:46:14 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, Stephen Boyd
 <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, Tanmay Shah
 <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Rob
 Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <20250227084614.527e428d@jamesmacinnes-VirtualBox>
In-Reply-To: <dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
 <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
 <dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Feb 2025 01:58:06 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 13, 2025 at 12:41:02AM +0100, Marijn Suijten wrote:
> > On 2025-02-12 15:03:46, James A. MacInnes wrote:  
> > > SDM845 DPU hardware is rev 4.0.0 per hardware documents.
> > > Original patch to enable wide_bus operation did not take into
> > > account the SDM845 and it got carried over by accident.
> > > 
> > > - Incorrect setting caused inoperable DisplayPort.
> > > - Corrected by separating SDM845 into its own descriptor.  
> > 
> > If anything I'd have appreciated to see our conversation in v1
> > pasted here verbatim which is of the right verbosity to explain
> > this.  I can't do much with a list of two items.
> > 
> > I don't have a clearer way of explaining what all I find confusing
> > about this description, so let me propose what I would have written
> > if this was my patch instead:
> > 
> > 	When widebus was enabled for DisplayPort in commit
> > c7c412202623 ("drm/msm/dp: enable widebus on all relevant
> > chipsets") it was clarified that it is only supported on DPU 5.0.0
> > onwards which includes SC7180 on DPU revision 6.2. However, this
> > patch missed that the description structure for SC7180 is also
> > reused for SDM845 (because of identical io_start address) which is
> > only DPU 4.0.0, leading to a wrongly enbled widebus feature and
> > corruption on that platform.
> > 
> > 	Create a separate msm_dp_desc_sdm845 structure for this SoC
> > compatible, with the wide_bus_supported flag turned off.
> > 
> > 	Note that no other DisplayPort compatibles currently exist
> > for SoCs older than DPU 4.0.0 besides SDM845.  
> 
> With more or less similar commit message:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> > 
> > Hope I'm not considered being too picky.  I first sketch **how**
> > the original patch created a problem, then explain how this patch
> > is intending to fix it, and finally describe that we went a step
> > further and ensured no other SoCs are suffering from a similar
> > problem.
> > 
> > - Marijn
> >
Not too picky at all. I will use your text. I apologize as I had changed
the cover instead of the patch. I will do my best to balance too many
words and not enough.

Would it be appropriate to split this patch and the other into separate
submissions?

Thank you again.

 - James

> > > 
> > > Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant
> > > chipsets") Signed-off-by: James A. MacInnes
> > > <james.a.macinnes@gmail.com> ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > > b/drivers/gpu/drm/msm/dp/dp_display.c index
> > > aff51bb973eb..e30cccd63910 100644 ---
> > > a/drivers/gpu/drm/msm/dp/dp_display.c +++
> > > b/drivers/gpu/drm/msm/dp/dp_display.c @@ -126,6 +126,11 @@ static
> > > const struct msm_dp_desc msm_dp_desc_sa8775p[] = { {}
> > >  };
> > >  
> > > +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> > > +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> > > +	{}
> > > +};
> > > +
> > >  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
> > >  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0,
> > > .wide_bus_supported = true }, {}
> > > @@ -178,7 +183,7 @@ static const struct of_device_id
> > > msm_dp_dt_match[] = { { .compatible = "qcom,sc8180x-edp", .data =
> > > &msm_dp_desc_sc8180x }, { .compatible = "qcom,sc8280xp-dp", .data
> > > = &msm_dp_desc_sc8280xp }, { .compatible = "qcom,sc8280xp-edp",
> > > .data = &msm_dp_desc_sc8280xp },
> > > -	{ .compatible = "qcom,sdm845-dp", .data =
> > > &msm_dp_desc_sc7180 },
> > > +	{ .compatible = "qcom,sdm845-dp", .data =
> > > &msm_dp_desc_sdm845 }, { .compatible = "qcom,sm8350-dp", .data =
> > > &msm_dp_desc_sc7180 }, { .compatible = "qcom,sm8650-dp", .data =
> > > &msm_dp_desc_sm8650 }, { .compatible = "qcom,x1e80100-dp", .data
> > > = &msm_dp_desc_x1e80100 },
> > > 
> > > -- 
> > > 2.43.0
> > >   
> 

