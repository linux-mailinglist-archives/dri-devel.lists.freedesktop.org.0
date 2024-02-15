Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E8855C44
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F58910E2B8;
	Thu, 15 Feb 2024 08:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dDgBfl0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4583110E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:20:16 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc74e33fe1bso513743276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 00:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707985215; x=1708590015; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Do6lkICkviYxGolQ4jKofjndpLLNdGDEYdxEGQGE5Qw=;
 b=dDgBfl0Aw+oxosmw9plfTEhkFeCopKmKBWnaSsayEg8Fe6km2+0m0ioCsPGEhk3G2V
 TpFVe3WV+dI5elgvPkv6ypeHjLRvnFCzSMObRXir5CDbQy4utAfL9Jl7pzCCZzIJWOE8
 tsaXCUrur17Lw7uGX/NjdIdfbs8tjcSDse5rMXEqA4SP9xcMZ+sBZuSUV05XJW6TfeL3
 br3nb3z/KixDbCyNxzWkiZ1F0fOgzEl29R1k9o1fU5NlgCiZpCc0hAo/GZ4DcvOinEKg
 VIkdNezZZoV50LvActld77/ulGO0h6hHL1BVtwEzPi5NPC60Mxwcwce/rSZwz2UGuptj
 eKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707985215; x=1708590015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Do6lkICkviYxGolQ4jKofjndpLLNdGDEYdxEGQGE5Qw=;
 b=MFdZO2LqZ4gA31BiizgSE38OE2Va2qnQ8VYY9y9iaofzGLsEC0RpFJ+zEDxnN0X/Wq
 EeWvD0N9V7jxrinhRD48kxr/OFGCylaqG4W8aXUcAx0NBFuwEyvkUACRLD4eKFCGUaf7
 s78GUlduEL+hWt02LhRmBBa30RJLCJZ/DGvkrNAFJ/JyHLamoFpvrk985NqWZ0IY6l5z
 dmPleM24r41NLA3YqkADxUxAi1pEeSOhmh/sQBYtoOEbvx4SBa26tCyY0VCGb64ZRriq
 b69PN2vB7fk0vGeO8MT6pz2TfbCWasrBOXRMWb+YsJt0uwMWYXriJ0ldnGQLbX6jLtMm
 eIvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW5hd8BDZrEZkjWVktNu8meD4H8UaBNj6FS0FJt2Kd0ChNFDtYo7Mlv0evCIlW8W+ZXkqGkHkAnJgH51XYgPaQG1DnfIlm1Snz0gJ4wN0U
X-Gm-Message-State: AOJu0YxAw19i3TLkE++/sZVebPQrNpelhNT0Qo29bQHLGrFJuZwoqTLJ
 4gI11iV+xysSaLhhl/U7Ia3rzYEOpy03yrFVqoyiaPa5boWemmtQ2lmTh2uQCuXw24MO1v3306/
 N9umIFUa8vX8BMsHONymDi8iSFB4QUmev1kPtCQ==
X-Google-Smtp-Source: AGHT+IFR0BaawAwJFtSrOqTIsOaDiPK3hJcwFuKA/JF3s/kl+o1cA1+0zvrdu4dUcz7SxN9wKGH+LLMJUUmzevFC5+c=
X-Received: by 2002:a25:848d:0:b0:dc6:be64:cfd1 with SMTP id
 v13-20020a25848d000000b00dc6be64cfd1mr899082ybk.36.1707985215265; Thu, 15 Feb
 2024 00:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
 <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:20:05 +0200
Message-ID: <CAA8EJpobjxa4-Yu_mZxUPiFEcmA0OyxtM4umR1OvBg_WB4pj5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm: mdss: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Wed, 14 Feb 2024 at 23:24, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add support for MDSS on X1E80100.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
