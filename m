Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E478932EA1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 18:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C9A10E815;
	Tue, 16 Jul 2024 16:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WV0A0ELF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22A610E7F2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 16:49:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ea79e6979so6576845e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721148563; x=1721753363; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=65UHivhWbqamlbWLtwDGoTnNBO4Z+XQXbLxohA6X8UI=;
 b=WV0A0ELFn0GwcUNHQAnd82W8gGMF0nW4PzTf04KXZEMYCfaUqXNyj+7Ha4a5qXFWHS
 ehFRCpOEfxvHLY5ZZlz336JQyrlUtx8O8Q0lEkbblNpcYOjDCQWE3OLW9CaBhxbAHK/l
 dlGc7PY7UDSrYd+HnHM3TliWAvFnC2HhMHohRIUysoLE3qV66pd7+42GW4iQY3L8xgq+
 gqxj9YZor9kPpkiJs4IFaD6N5QHFM4Lubjr+aCuXwdQ5l/3p3TLwnrgCp2r+77K/8rEl
 USMzY5c2XpMYrJqWkoXFjeh6FFEyGiNGejzUccHZiDY3i9Dfpnutur1BmXahaAZgz5RM
 7Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721148563; x=1721753363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65UHivhWbqamlbWLtwDGoTnNBO4Z+XQXbLxohA6X8UI=;
 b=IWOLXzpcQ8RWmWA7LaL0jG9kffsDjuZoBmyE3WW90PB79T8u+abl/MeAK7zIBZrBoM
 Wg4Qk9N5O/wOFHWegf2YEuO/G4TJRZc4kbgONBacylwngcrEuMlvw0h4Kg5hwQduN+W5
 9eLM0T05GxBGahKXgS4ieFEHgbzrXjg0Jn+5J5f0PvIiXyKvDcBYBAKHvh5NxUJ55QxI
 NPObx1j/aHGNVjVDufkbD04fRIkm74VSiHtvmnC1OGoUXC1rKXTDuS6qPKudeYLmj/3U
 Vp5dNx0rGWgXMxd/dTi+tDBNKa0x8hKNly2TZc0jP2r3ZPsg4RwMQzOoX35NzGVg49S1
 VvZA==
X-Gm-Message-State: AOJu0YzKeE6Oomwa3afitKRd1Y3l1FW3PMkVXVgp1kxuv04agrsyMv7j
 U2dw2nYviuUwMC2PEb4bZkJWQlH1lMJHhLIYiLCaz2neU+XlQDmj8fIIzNKrabE=
X-Google-Smtp-Source: AGHT+IFISfVY1DZpBjx4Wp3ciQ7fxNNvKnRXnv4p72o9tKeFET0doI963w/f62exGm7NboBWy2kYvQ==
X-Received: by 2002:a05:6512:12ce:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-52edf02b9a6mr2138832e87.48.1721148562872; 
 Tue, 16 Jul 2024 09:49:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f3b9bsm1179441e87.107.2024.07.16.09.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 09:49:21 -0700 (PDT)
Date: Tue, 16 Jul 2024 19:49:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Fix error return if missing firmware-name
Message-ID: <ewrp4snurz4vvo5f5hdipzrndeij35j4h77bybkti2yiexk2gl@utuf7u5g3f4k>
References: <20240716160631.386713-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716160631.386713-1-robdclark@gmail.com>
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

On Tue, Jul 16, 2024 at 09:06:30AM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> -ENODEV is used to signify that there is no zap shader for the platform,
> and the CPU can directly take the GPU out of secure mode.  We want to
> use this return code when there is no zap-shader node.  But not when
> there is, but without a firmware-name property.  This case we want to
> treat as-if the needed fw is not found.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
