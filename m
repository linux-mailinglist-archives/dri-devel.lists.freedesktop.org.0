Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9BC97EAFA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889210E3E6;
	Mon, 23 Sep 2024 11:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kvK9aB0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887D10E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 11:47:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso22947e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727092065; x=1727696865; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0djd4G/7ZZ9d24oyrx0WPtUTMtYC0XKPiOilllFoMEI=;
 b=kvK9aB0ddR6G9uaJPnsdXWihciydmlrsqFURaIMt1FKvoeXsAFRIcf2MGlmCXPkgTT
 ropk75fOXbF6tesjT9JOguCC06+dN4xecR3No+tQ/yPkUlmSaZOnikaKbO6Y39gVAYqU
 fmPaTRL8NG57/MQbzlXuJswY7v+JADloy7Hcf9msjm8RiK/A+DFBz9ZgzlGpK6ohc0mx
 vS9bk5zVXaesFchJxMOyy9WPpftv+OnOBqJejdsk/kxweZya/dV3Q6l8qfuD5PP22nVJ
 6ZKkfBU8cZLebontXhpPgK3gW06GZrajNjvsDx0k3WT/p8/OPigNb87CcjEKtg3GKhCU
 uVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727092065; x=1727696865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0djd4G/7ZZ9d24oyrx0WPtUTMtYC0XKPiOilllFoMEI=;
 b=h2pJ8UYzKjDn8mLJAQIoEE5xgAejrOEWxvhF+Jyu02dEDbrttjOql+XZazpeNu4gwC
 xve+wgUdG13sVGZBRQ6d/BC+NckHbvvSL4dG5d8lAAJzt/cL4U0LgDe2GSjfGU+BLCDZ
 9UxybqVLB8MeDsLm9NH51CW6Qh/Y8+4UaNpA6X9b5oQaDLst/Cb1Q1yHtevD7SRwoz7W
 YJ2OoHGtKoL7u1Ly7jUl6XCVxGVkvpZ4XOY1USZXvcxbRiUjvhDeUhp0K8XNHSiwYhMb
 u6JEja5P3sliGNVYnqlH93Ks3aSfiuDYyMn9lA9okymoAcxvRkbJ7V32KwpD/wW+5OqS
 iJsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7MTPjUAHe/zPyiwh+uCMWm7LyggX9RgguAU747E4qObo632gfgdtdxZaCEtOeka3mI9f/x7+kiR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeKxE5ArYFIevnEWBnx2jJQbU+p9sm2Iw7WFfN7eHmSxxnoPoq
 Gc+2U5ryna6mT0U/DEJzOCgzLmc7H/DN2RN1C3jttME4b2/szgWW7eB2FTb/K/A=
X-Google-Smtp-Source: AGHT+IGOWlf1E3MK25Ig9GpguOQfG2ei5zN70UwUJJU5oIGPcT/EQOZr978PoKbxaP0b1IeYvBKH9w==
X-Received: by 2002:a05:6512:10d0:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-536ad164335mr5499187e87.16.1727092065029; 
 Mon, 23 Sep 2024 04:47:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704678asm3244982e87.5.2024.09.23.04.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 04:47:44 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:47:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Message-ID: <vdzxghgr3uhj36mjqnphagf2mftpsnqg3mubjo7gfiexcrdb55@6i2s7s4a4qr4>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-6-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-6-quic_mukhopad@quicinc.com>
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

On Mon, Sep 23, 2024 at 05:01:50PM GMT, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss, having different base offsets than the previous
> SoCs. The support for all 4 DPTX have been added here, and
> validation of MDSS0 DPTX0 and DPTX1 have been conducted.

I'd prefer if there was a word 'only' in the last phrase, but I can live
without it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: Fixed review comments from Konrad and Bjorn
> 	-Added all the necessary DPTX controllers for this platform.
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
With best wishes
Dmitry
