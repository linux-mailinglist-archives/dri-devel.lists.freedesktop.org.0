Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8494F6C5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 20:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A15810E279;
	Mon, 12 Aug 2024 18:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XLRX+wDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC15F10E279
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 18:36:25 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a1d6f47112so283473885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723487784; x=1724092584;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=XVEY3EOQ7EfM3BETXw06qP0pD8+sQ+yqKMA+bsLb1lY=;
 b=XLRX+wDcLjZRpQr1vRgkwaZ4MrdybSfNYJdgxex3d9bO8mnWYGQV0mSj6Sx7fW+54+
 6arPgrCMTl4e7SEnF+lKqSxU/CgqM/a4/gf59dY8VZYzYJQq65yTZkLOgZ/MFpTqmKaO
 jcRZgcFMHVRiEYzMh/qgHSj/OZv+4IL7fz/l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723487784; x=1724092584;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVEY3EOQ7EfM3BETXw06qP0pD8+sQ+yqKMA+bsLb1lY=;
 b=RLmuTL9e82qzo7T9Pksq7T5OmqdzWqzrQVZOvmmpjPd2HhsUYrVtHbw670q2ZiOWH4
 UsoMCg2zPu1RowUOIqC+X7jT0hRRsq4z2AfN2Is7eGOFzPyybemmdUgWCzmL6AvUNGjS
 gY9i1e65QCxiKgNwzGVajejpaymfoXTuFXw1b5z/PPJUbRFBjjiCqW+P8pXPew+vB6NX
 Zz7hHxz8RQ5PkJdvFaV9b0a5ZjVOfgL7rbjKgpyDxaw3B/Kp8YD9pAZosTXn8AnnhXFx
 LuU6ZIkxGK3mM24dyvNk+6CC44QtDlT/XMoPH3zaw/zpXWWcFxbGZSjUO+tTE0ROCjS7
 5qrQ==
X-Gm-Message-State: AOJu0YzjzeaQ7ZuoYt+voLys3yxtkviB3U6yoDG0tvZB7zVPC4oIyL84
 ROq5AVPkT0cjWLayEbIs9VqZ2e5DNjT+DzpBsiB2LZTExbL8c4DRzZWEGHWwMGW6kBd4tpaqsRS
 EUIti6kZ42Q14J2GM+CRlBicpu2snkUBFIhWxQGe7aPsXHdM=
X-Google-Smtp-Source: AGHT+IHmoofWaFYJnBjW3Mad9MwbSlnA+Lmn21+JRVXHiDX9eb3lBTF/fIYOBI/SdgNYe7IAkY5SEsY8XTjEOJNFGZk=
X-Received: by 2002:a05:620a:4010:b0:7a1:d73f:53d2 with SMTP id
 af79cd13be357-7a4e151bd49mr129101485a.20.1723487784514; Mon, 12 Aug 2024
 11:36:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 11:36:23 -0700
MIME-Version: 1.0
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 11:36:23 -0700
Message-ID: <CAE-0n523aJOogAidORYJNGUG4aW9Eq0wzoD3U72i8CFF=BqsaA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Abhinav Kumar (2024-08-08 16:52:27)
> sc7180 programs the ubwc settings as 0x1e as that would mean a
> highest bank bit of 14 which matches what the GPU sets as well.
>
> However, the highest_bank_bit field of the msm_mdss_data which is
> being used to program the SSPP's fetch configuration is programmed
> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>
> Fix the highest bank bit field used for the SSPP to match the mdss
> and gpu settings.
>
> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org> # Trogdor.Lazor
