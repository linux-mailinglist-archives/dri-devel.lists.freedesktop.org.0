Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C305B930630
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 17:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3801610E096;
	Sat, 13 Jul 2024 15:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SKkgBeby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A53410E096
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 15:38:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52ea2f58448so4076341e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720885105; x=1721489905; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rrw656yPZ58/He6Z0SljV1MTH9DNc6XhfX4EqtbUZcw=;
 b=SKkgBebyJ5JSwyyRlTRFa/3H7ddeppXKIB5n4bWP9NgM6sJiEgV6HFcd3XbVCkfbWg
 b4Sg1Pn8ktbZWMu2zXTOphJ7T1STOh5njRFu/4UqXhJ124xcog/LoKrEDnzW64B8Ipon
 BDRzU32m5ktJiSFn7LZsWeBc2Bn5BkX79c5+5z82gz2aARUAtH6/siXqhOQO868jSlu4
 /vkGyhu9SUn68qQnQZROggMVWrQG6Ag7Vt8hHbIla/Okdc6x0Qxdn1GeuBoNnV3APfdM
 HB+f32ey6E3Q5mktVK7UYSvISgeCo2ZahyLh17wzbIZwnxuiIwuMlDIkN/IYWmkiRB7e
 xWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720885105; x=1721489905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrw656yPZ58/He6Z0SljV1MTH9DNc6XhfX4EqtbUZcw=;
 b=kPzPfQQcWHNAouWpyaMVrRH8gDF9Zc9RotCp4L9KP0kK+qvS0IWz7VWsUBJUExcTwR
 amoWclBZtCmuuA98vMWDmq/ifTotopoc+2paLAjADQE3KCfonAIWxHroU8WBiroyN59I
 2QrxN8/rR6u6WUm8Hc8foDNwZEoD5kwD0XOUw0GtSMmbuY2fvzQ8dOH8/5VSVV1ABlrD
 Ng/xDtC3GJ1gscRhZJTNJjvaAXPYTBJTI9kIMzOijGUKxhBHjtpqivaFYHE1DwzXAARy
 q6Ys1wmuM0Zrx5uxY1nkRPpLYB0L6xE0H5eVCuPvoSX8f5gSWmYORZyN1Zbjkrd3cj5U
 JR5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoj3T9ngPWYevgR0tl/lx1K/+HhkC4vgn3fgHSt01OJ3HoJ2RsAhj4W5ihI6L2sV6EwTnM06TCFCOsSVBe2YB3N6Hwwjl/uegM8mHyBF35
X-Gm-Message-State: AOJu0YyJ3Y0lrajr1TN4D0tFg1VVbgWty16ZJDDn3++XmGDHNGsMNh+d
 YTWSAlU4Dn8FDpnzk8NFmaZScaevWu4EeiM3q9kCKPwJxoLsvTAan6GRfYjUgBA=
X-Google-Smtp-Source: AGHT+IHd1JycgmrKTAmXhfqJQqu17IdmqopYEnNGA4fjNnAG4okwte5I2bl+t6SJIVoBWEeIA7EZqQ==
X-Received: by 2002:a05:6512:3e19:b0:52e:93d1:57a6 with SMTP id
 2adb3069b0e04-52eb998e483mr10940314e87.6.1720885105051; 
 Sat, 13 Jul 2024 08:38:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed252d538sm224218e87.141.2024.07.13.08.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 08:38:24 -0700 (PDT)
Date: Sat, 13 Jul 2024 18:38:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't play tricks with debug macros
Message-ID: <cvizlwetyzmwxwtesd54kgghb4ttnj3kgdnca2ujq6orzntymw@tei6xtsoh3og>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
 <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
 <46487222-6818-b0bf-e5cc-2310d62b5fe6@quicinc.com>
 <CAA8EJpq7Lp-3V_AsLxO9ZOt8ZW1ZZ=FjhXV6R9jvH=sQ8XQE9w@mail.gmail.com>
 <fb285034-ed4c-4f20-ab80-cf91d36fc67c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb285034-ed4c-4f20-ab80-cf91d36fc67c@quicinc.com>
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

On Thu, Jul 11, 2024 at 11:03:15AM GMT, Abhinav Kumar wrote:
> 
> 
> On 7/10/2024 12:40 AM, Dmitry Baryshkov wrote:
> > On Tue, 9 Jul 2024 at 22:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 7/9/2024 6:48 AM, Dmitry Baryshkov wrote:
> > > > DPU debugging macros need to be converted to a proper drm_debug_*
> > > > macros, however this is a going an intrusive patch, not suitable for a
> > > > fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> > > > to make sure that DPU debugging messages always end up in the drm debug
> > > > messages and are controlled via the usual drm.debug mask.
> > > > 
> > > 
> > > These macros have been deprecated, is this waht you meant by the
> > > conversion to proper drm_debug_*?
> > 
> > Yes. Drop the driver-specific wrappers where they don't make sense.
> > Use sensible format strings in the cases where it actually does (like
> > VIDENC or _PLANE)
> > 
> 
> Ack but we need to not just drop the wrappers but drop the usage of these
> macros as well because it is documented that they are deprecated.
> 
> So I assume you want to get this in and do that as a follow up change?

Yes, somewhere in the long list of cleanups. I have a similar item
against DP driver, which uses correct macros, 

> > > /* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> > > #define DRM_DEBUG_DRIVER(fmt, ...)                                      \
> > >           __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> > > 
> > > I think all that this macro was doing was to have appropriate DRM_UT_*
> > > macros enabled before calling the corresponding DRM_DEBUG_* macros. But
> > > I think what was incorrect here is for DPU_DEBUG, we could have used
> > > DRM_UT_CORE instead of DRM_UT_KMS.
> > 
> > It pretty much tries to overplay the existing drm debugging mechanism
> > by either sending the messages to the DRM channel or just using
> > pr_debug. With DYNAMIC_DEBUG being disabled pr_debug is just an empty
> > macro, so all the messages can end up in /dev/null. We should not be
> > trying to be too smart, using standard DRM_DEBUG_DRIVER should be
> > enough. This way all driver-related messages are controlled by
> > drm.debug including or excluding the 0x02 bit.
> > 
> > 
> > > 
> > > And DRM_DEBUG_DRIVER should have been used instead of DRM_ERROR.
> > > 
> > > Was this causing the issue of the prints not getting enabled?
> > 
> > I pretty much think so.
> > 
> 
> Alright, I am okay with the approach, just one minor suggestion, to keep the
> behavior intact, previously the code wanted DPU_DEBUG to be controlled by
> DRM_UT_KMS and DPU_DEBUG_DRIVER controlled by DRM_UT_DRIVER.
> 
> Keeping that intact, we need to use DRM_DEBUG_KMS for DPU_DEBUG?

I might make that more explicit: I don't think that it is a good idea
for a generic DPU_DEBUG macro to be tied to DRM_UT_KMS. We are reporting
a debug message from driver, so by default it should go to the
DRM_UT_DRIVER channel. While refactoring things we might end up with
messages going to ATOMIC or KMS, but DRIVER should be the default.

-- 
With best wishes
Dmitry
