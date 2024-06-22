Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97A913370
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 13:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9510E03B;
	Sat, 22 Jun 2024 11:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jgf16PIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51410E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 11:44:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so833946e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719056689; x=1719661489; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ax1qSIZw8a9/jFifgEYbxj7FR9Vvqi+T0eMK+uliwIg=;
 b=Jgf16PIzPlOpPVqqwmdFqAqXAlXXUQ/v4VolyN8jbNUr1cFzn//hUDq3ZBuhsW7TGM
 NelrO2KB9JXqL8OWdi66P5+bHqyA36QCO30dVfCu1wWeQpocVXcFwBq5GSQ2bkuBMBPp
 YI98kVHFTX+IbBIKv9VlvL8rkWTRNGdic6e1SpzufAmfE9wczbBuTwGaiF6MaDIuYEfe
 F8UUeqwNyxbZ8O80gkEcAGu30P1Sc68FX+HE0rYvPovxCyGjy8SfsKJuAfGThm4AFJMz
 wHIaljdn3liZKOGJPzclEJ/daCNvo6hDkRYw74iIxguGTQByASM4Ib4lOUwbVQcT8kao
 j+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719056689; x=1719661489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ax1qSIZw8a9/jFifgEYbxj7FR9Vvqi+T0eMK+uliwIg=;
 b=IOjnv/UfE6rzW1xNAFNXktMyWU9Q3qAYA3rsnXZGQSv4nIQJt89qoT/I/+HGmT9Qww
 Dxqz83DYrFH2VTU3iu5os0FRLLv40TaBC5mJ3Kox7m9Wkx9+ZlManupm5VO8c/S20BlR
 UZXB72vvD2+MtouwK3lywdLPin+Ne3b/vp2r2Z8IQJFKj+yIbFPOqifroU2WHGRvnGrc
 PC9R7lce+mARO8vf/EilRBztG35gsIS7B0UKiGO60UqNntoGhpqaNIFHpqScVuod1BRp
 zOWVLJRepzTN3i6Pc1q8xGNCfXeLATTn2nz2C/DwvK04FV5VQiRnqQ7/DWRn5htMgBlH
 PatQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUalJL6dmkPy04w2pc3E3+1WLTUoRRXN5ZKlPDBhHB6ej4GP2j4tGIw25b18rl3I9NbtROxxNEkprpocMItereJvLiYqUS08df5+DOri/iP
X-Gm-Message-State: AOJu0YwdxOGDlrfdM0NSlD5yRqvDGv15CaQ+Et5wOEMmKyMEVFENdcPq
 ox50NQzsF1kGNirYWjtU5iYdtNryLsF4xPNoxgAJY2eCmHT8+diKlyqOWXzrCKM=
X-Google-Smtp-Source: AGHT+IEuZ2USoydSTh3MwiJDZ0wxf9ZiV0ueTgAhwf/h2tPzISGQ48W190i27F9kY7dhP1o1sgjyVw==
X-Received: by 2002:a05:6512:3496:b0:52c:d96d:6c7a with SMTP id
 2adb3069b0e04-52cd96d6d3bmr1871338e87.60.1719056689522; 
 Sat, 22 Jun 2024 04:44:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63cd698sm469653e87.118.2024.06.22.04.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 04:44:49 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:44:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
 swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: Add SM7150 support
Message-ID: <oks3xgn3ks2fobtdys5b3ssw74fwn433q32glhebq37snz2df6@oc2h6pi34tlg>
References: <20240614215855.82093-1-danila@jiaxyga.com>
 <20240614215855.82093-3-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614215855.82093-3-danila@jiaxyga.com>
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

On Sat, Jun 15, 2024 at 12:58:53AM GMT, Danila Tikhonov wrote:
> Add definitions for the display hardware used on the Qualcomm SM7150
> platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 335 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 338 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
