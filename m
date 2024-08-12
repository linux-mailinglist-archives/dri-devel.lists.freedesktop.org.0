Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE86A94F6D0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 20:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C7010E27B;
	Mon, 12 Aug 2024 18:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K1Xd8Uff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7210E27B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 18:40:26 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7a1dcba8142so415877985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723488025; x=1724092825;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
 b=K1Xd8UffzzQM7vxBimUu/kOq4ZyV5TrMs5lub9IDT1YflakuFIy0XDYJH6P+zMbneH
 ESFYPFsfzhnSHGObdfIOTbf7PuyHZXC/bAzn3AqJxH0RXSqQjwNt9gj3GgBpvx6Bpb8n
 FrS13HmYA900AY/71RhVx219mlpqJi0sOTxWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723488025; x=1724092825;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
 b=qN6r2eo4bNJUoFTL3au+mWT6DIhCIVGHS+MxZHgM9JE0EPyLzfoltc5nSMBtLxkZ4A
 8n2TazSr20PRiBASArsnFpkzbSmgKEH9BR31rrrHXmkEqjUZ84S1EyJWKxc+fjMt52uL
 Ld+Do7N11PzHn8z4AfX+ByBnOefjVYz3rjrgEciwX6LtdcjfcSIGZH0rfom8IWddT5lb
 CA9gxg1X6s8WBsz303i+a4A5eK5nQhkpxUk1GLH+zaSq/slkiptgZyB8ebzEgTUb8XKC
 1hkZ+Y8zOWo0qvcfOOS6vsgobDIyqQ3TJRJEFYkOPSNpbWQlccPfnsuGQlKXdOkw0mHH
 A2qA==
X-Gm-Message-State: AOJu0Yzdh7mRO9qbE4VnGPu/+htUKuaQxqrreObUgVgAj8FnAEUlu9gw
 suKfz5BqSAAa6kjNUG0/BNpyiUK0g1n6g4nxaIA/D6m1yJjPyrP0VWAyRdY/TH+DK2Z8PgpvZ/c
 cBO+Gf6FJcfXiqbXkvsBfpZH2MEhMB6r1h0Qi
X-Google-Smtp-Source: AGHT+IHU7T7mETTa8o0eIAERX5Q/cpE4El91Q1zKhqhAZWti96HazCD976i3q3JmtZLa+HkARhuwHJyq8saSXRwQcCA=
X-Received: by 2002:a05:620a:40d2:b0:79c:1178:dc9d with SMTP id
 af79cd13be357-7a4e38410c4mr94180385a.24.1723488025574; Mon, 12 Aug 2024
 11:40:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 11:40:25 -0700
MIME-Version: 1.0
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 11:40:25 -0700
Message-ID: <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
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
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index d90b9471ba6f..faa88fd6eb4d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
>         .ubwc_enc_version = UBWC_2_0,
>         .ubwc_dec_version = UBWC_2_0,
>         .ubwc_static = 0x1e,
> -       .highest_bank_bit = 0x3,
> +       .highest_bank_bit = 0x1,

Usually when I see hex it's because there's a mask. This isn't a mask
though? Can it just be '1'?
