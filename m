Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D1908A07
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 12:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1810ED09;
	Fri, 14 Jun 2024 10:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U00HGzTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D231D10ED0F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:34:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c85a7f834so2629295e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718361276; x=1718966076; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+SCjC8XvS9+kPL9hXwY+0n971Ep94mX3iMJ+fsGN0OU=;
 b=U00HGzTL+MLS93fJnft2/0MVvdzrjlHKjuEIGKNaxhNirfnTHFEuNePLl61KugSMFG
 1L02LXblfp1Kp+Gz69uJMWlq76TXvM98tuj+yh6OaMKOnKP5UcvRdSqprmRRBtGAo9Zz
 Y7Dq4zvKGMrAkyyRlJ5bTgnyat0tu1cNee2+g7VGnZ9G2ScrYjjWOdeiF8TJIcYXhyg+
 eGdbleaSltBV48thxhbi8sk4CawI5A18BSU58fxuD21B0adtPJKSs33is+ZjPBPGMSq5
 1DmUTdQGbfAGu1JcXRuX4QRQekhKwfO0TiXqSyZoBo2a0mfwLQ49S+AGor1hiupdG4Iu
 DE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718361276; x=1718966076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SCjC8XvS9+kPL9hXwY+0n971Ep94mX3iMJ+fsGN0OU=;
 b=Ee10npZ9JAgMf0GCpeyGctIRqfIOe1Otv17SXkTsUp9TjFWS09BUlDMfj4WFDJp25X
 03KYv80HK9nlMHhnbOYu4GGBMQBaKyZpXVdY/OndMcyUi669a4ZkN1v2c77GjXiT/Yuq
 mJ5aceCkZm9x241g0UBNgZwr5BzJcy1Q+pIfHcUVTBM28CP9FCgiahFjzlKKYxjh2fDx
 0Nx3u1WWl3cO8CbzqshyZDr9foeIVgYxsoxv+QGQFIGfMmaYuXeS6N8mJocAn01osG/V
 OIa23q3ym4OboChVNWvuXkQHKdJWpzDyslhtldxTUFD4TUMzD0EwivbuqjwLJQhMwEgb
 NWfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH08qS3wRY/gV+9KHNqFaRN6lQxZELuP51gf8pZ5fyXJvJUTtVOhC9Mksn8CKJR9hzerWs/rGk0/92VHptx+znVDeaOnJcbxzC2y0MopmV
X-Gm-Message-State: AOJu0YyDzdHPpo6wWQ2Pv/526ScCcsFe+yXnQ7FxfImaDicopNXdf7n+
 ypO558PbJk798S+ZsQX3FnQsEa57FY8DALNW5QtdAX7K4tw/+TtsQBL/JFTlGak=
X-Google-Smtp-Source: AGHT+IG7vK4xnfjr6ZMqA2Kxd9IDfZOyD8VGXKKkcIqf585oiI/ox16W9zrKDD1Ba0SGjvsjDJfYAw==
X-Received: by 2002:ac2:5929:0:b0:52c:9ae0:beee with SMTP id
 2adb3069b0e04-52ca6e90a58mr1504981e87.49.1718361275860; 
 Fri, 14 Jun 2024 03:34:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282f1c1sm472183e87.98.2024.06.14.03.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 03:34:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:34:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Message-ID: <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
 <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
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

On Thu, Jun 13, 2024 at 04:19:07PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > step, so that any issues with the FB layout can be reported as early as
> > possible.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> 
> Did anything change between v2 to v3 that R-b was dropped?

No, it was my failure to run b4 trailers, please excuse me.

> 
> Here it is again,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
