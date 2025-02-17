Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EABDA38CB8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11AC10E5C9;
	Mon, 17 Feb 2025 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOtqvTlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB4510E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:50:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5461b5281bcso1645322e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821834; x=1740426634; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
 b=hOtqvTlgOuB5eEzGnfGyrBo+XjrOHkKDX5UVAWDoH9WkjwhxnNwskhLQZBLwuiUzJc
 KkeGEtBp5TP12XFES3WkOpzOUPs+r1eL10mTq0iBdBie/+SXEtWBnJNmUm7uUMZ+tMV8
 xIcPW5v0xUNda4wfVvWwz8Tx7g3qnuaewYzXQBwyLOaqjX0xd6bStkM3jzkJRY9K0Zt+
 N0pJDhU7i67hXMu0jk6NsVc21zIk3H3HHawJpwDFCAPS/6zr+6Nb5rjXZ/3mPJMwKb6p
 uRgpqI1WjVNDDkF5QAHKgBwslnkAy1mPrKBDhvBzDgw4izOjJAdwy/3sEy9A1ssZ1hkk
 6eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821834; x=1740426634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
 b=E2ghokX5ygqR8JruwvfxN5rwqdnGyOs2HZfuFa3jKH/e5kQupj6Q5ensZFkqbwB8nv
 JwvWXoj+XtS14COCKts6nH1tu2t81V9U2S4CBu3B9L+YjcgZmDyvmlGlcAkT9POvzNJq
 Rqw4UFBAIiB6szFep+a5JE/7h3MzFIWMmPVTrsAWgXhh5MG5n9KzJG1rm9VOl87Q4Z/O
 8BxwPXJlxoX9BrEDwnhaNp92rmQbiosGK04eno/mattbKsJtUFfR0ok0MYEuAmQfI9cB
 zMajVsNUNQLVti9YR9QVqwTMkOi0Vuw4nMeRH4U49oHkODAPH9FkneTVgmj11zb2GSzR
 jyPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxH7CJc43Ykq6YvL+KomiaX3TzMreBLFLiwV5PNDMFTTvTGTCmB9dWYuHURvEexzhFY5ujFEJK2yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbgpPLIjmbv+f/U5lg1XHoTs806Iu1zZayqKtLk1R3SmLdtMDM
 IRLoRYh2+LdfwUudYy3B4ICq3clUuQkXXSyY+9fYHFmJBzBt6gveMjYgOWXxWDc=
X-Gm-Gg: ASbGnct92fw3W/0xuoCwuX61xfCh7UcwfyMDWFSWWH99211jH+I0XmpmZCnHxyT8zoi
 oLIOV2jth0WM8PUz/w/x7JTtzMkPCqO3Y2LZsijazUkeSRc+YA8XF4HNMjjpsr6J+ZYZImykokJ
 fWhpVtSR6IHqBdYadVod+rGx3Vc94Jezf9WPCncePWemFrZqMB9JRab7NsYanblKNg4WaJAx6jG
 UxxxpvxMkSY/Rs2rx2g8uEqmEG73O5oy//d2+9ndQsyeSNN6UXcvQ3ws6ca+cKWCuKE5Q5ocwZr
 zILpWjJwDyKCGqgkXRBjZNvO3YIJTaFQnzB07p6l452c8vEnMOYllTIu7YYGcayg4Z1lDgY=
X-Google-Smtp-Source: AGHT+IFEnXuT2usVcSoMTmal4BeyQztiA9BaCKYabRMQm3dIpVeX4YHZzzAuOaY3bq5cOJl0zMdGsg==
X-Received: by 2002:a05:6512:1194:b0:545:ff1:bcd4 with SMTP id
 2adb3069b0e04-5452fe2e442mr3602142e87.3.1739821833664; 
 Mon, 17 Feb 2025 11:50:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54522858229sm1504623e87.4.2025.02.17.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:50:32 -0800 (PST)
Date: Mon, 17 Feb 2025 21:50:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/15] drm/msm/dpu: check every pipe per capability
Message-ID: <sd3u2l4epms4ttytoc2bqrzsqfxnphqkutwkxremjon22ven72@3rohlpaxhryr>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:50PM +0800, Jun Nie wrote:
> The capability stored in sblk and pipe_hw_caps is checked only for
> SSPP of the first pipe in the pair with current implementation. That
> of the 2nd pipe, r_pipe, is not checked and may violate hardware
> capability. Move requirement check to dpu_plane_atomic_check_pipe()
> for the check of every pipe.
> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
