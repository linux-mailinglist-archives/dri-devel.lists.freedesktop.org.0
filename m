Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB096F087
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBA410E9ED;
	Fri,  6 Sep 2024 09:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o5D21mpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA81110E9EC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:56:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso105382e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725616604; x=1726221404; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
 b=o5D21mpEHhuMAbKsx8/ioVLdd95+CczhN3pYTfP+HwDUlKbWPmp42cGvlbVAtxeh+D
 gW8OxcynQz9xaxXq49Fnm8Z/DKAgRWzT6BaYGRCr0xjRgP4aS8EEdtwhxr83PSHXoylI
 2J+AYob0lFGShrhg6ydoiICQuckRkYX4a+/IPevhKjvJN04ugMwRrq+uUNGxHJnrBswf
 AIKJHnKMfwTEuPJ8uJD0Pbh8/mtuYjBKY/BZncftCcsEViSe5OuHATTjzYRfs6HcOcRp
 GN0Oj2WOW0qO+wV2QIcSfN4+Y4kWI4m3X21eb3onrgfkfoRlh3+Fxqt561wyF9SY06By
 zBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616604; x=1726221404;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
 b=p43gYq+8qKiVTecfUx37jCr0FA8uAYX/nbfg1YLWeXN1ER+/pHR6rEbMfFx/YBi07m
 gctXQRr+HtcmjIGRFMZAxvBKQTPZUsJK67SIhItX/nMygD0/AenKy5Ri3gssfo67j8jx
 y7dbxOTnS2TJIM0kX0eh/A6RoEvTsgZrT58sxB4Ic6PilFyuSUfLh0bHhkEmgI+3ge6J
 s6w9+yHML0h5qTrG3nwQrFe030E34aDpUoN3WsIJj2pmnOhjW29yD6cafDEeBZpm7suA
 L1SQwRpr1D7nu8sp9BJWLDRWhrZpM/TBQlZGqWmnHSU9nb+AmQwmxKPeLnyputQhDcS2
 0hNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+9+e7PFnqSo8vu9tprql+bRubzCVvj2fGB6GCeEI26TjQJIl7qfKaEVA7QkefnkpDOVtVBo2KtAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya7azIAphMGomOdRGvsX8cq2BERBPIO2Xczi5UTanFC4tYy9hi
 EuIzQECOL0S781Ac7GAtM2bVvZ/oG/sZMKQ+CCy183ba9K7Wht9GGaWjE33MvrE=
X-Google-Smtp-Source: AGHT+IEs+f3/lMz05DgMGhdz1I0Dt2XeUWPF2srVsMsxiPAav4qFxYVkM40Qk/zvavp7We66+tgSQg==
X-Received: by 2002:a05:6512:3b8c:b0:52d:6663:5cbe with SMTP id
 2adb3069b0e04-536587a67cdmr1158176e87.12.1725616603764; 
 Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53657a4e071sm177209e87.13.2024.09.06.02.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
 robdclark@gmail.com, 
 sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
 marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
 jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <lzpvz4snaamzieuurwztw4s74glg7dhu6mpqpcw2apck3dbuap@76sqzcu7hmye>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-4-ruanjinjie@huawei.com>
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

On Fri, Sep 06, 2024 at 04:23:23PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the crtc")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
