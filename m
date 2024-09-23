Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BC97EAE9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CF410E0E1;
	Mon, 23 Sep 2024 11:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YY33hoYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB210E242
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 11:45:03 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53653682246so4375564e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727091901; x=1727696701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jhnBmWAe9NUrsichqtPogCcJph5ClsF7zPozObEyXA4=;
 b=YY33hoYIIWle4Lp9+eKWSaMLMPS/frTD74dSOhwoQdEzgJUTMWFWM3LxVRHinJBeqv
 hZUqgMw9DICjmObuR6kYQudtST522VavkCkVCCmDXhVNadkMZYlgBC+yVp8Oe+7Yy9iE
 B85HOUosITXHPrAxLGqrph5F3ps7F4x+6CKBXN51Nr8QXPk6B+N7RatkX6xBROX7SXFz
 UVdgsJyd7c7RI8DXrtmqRsTniAcpYuNG938iZnAluHKkfF17fvlVu7degZhBBeKk8bKV
 f5jsRQlpULpBA5Ld/zcZK94lmjANtUVwW2w6MoxY8Fc/jfmUyrUfbVq6+y4bNZkVR9A6
 RkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727091901; x=1727696701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhnBmWAe9NUrsichqtPogCcJph5ClsF7zPozObEyXA4=;
 b=bDcdcKLb+Q5bo3njhAQlOXxZ6hQ8y96gMhbp9bQzLOgIvyzg80WxDmrOuWAqiBWudc
 MORzAkymUyjVZ8H3PRHlwlkkUlnB0zAg07BXTCZQMcP7Le+tJ3hMXHfMn9a2/QzgznqT
 Lhu8Xkm2EWHDVtKT08bT4z5jq+Y/mFEKpRkyNde+XoYVgCwRdvOEqfRjSnBaEGkU7AFY
 9bMRNSVNO+tjKtwNz02/i/gz9OzeaOyDRsJF0I6Fz3mNi5ow3yls/4ITyHEbcGjDQVqN
 dHp5l499wT5MP8o9LZY3DxRKiG81jW8RXAwkWZ5LkCdKnO23gq/eAAwv9jHsxQLdiB/+
 RNzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg4iJ7SHZ6/RlQLry0BJmLDw0dgCdF5CBZeHnlBVS9PrcKzu9Ba8lLvOkWWngQvIsx/vz266rmZXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbUAAsWIUh8Rf7Rug508rPtvILdjVxigX+RwDVtjVxng+nysKC
 y3ndKvojN73ut+WXHPvOsBrPniCUHB5BefNU78raw5YUAc3mBroz9KNZt0bvKac=
X-Google-Smtp-Source: AGHT+IHa4aqsZXTbC37KCXn5fe4mfHLWoWf0Nyyz2mtzA1/7uiKYj0/E1PRavXBv3jLrfICSOaxmpg==
X-Received: by 2002:a05:6512:a8e:b0:536:52c4:e45c with SMTP id
 2adb3069b0e04-536ac2f54b4mr4462943e87.31.1727091901086; 
 Mon, 23 Sep 2024 04:45:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a875bsm3259740e87.224.2024.09.23.04.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 04:44:59 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:44:57 +0300
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
Subject: Re: [PATCH v3 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
Message-ID: <qughwerqucheykdwxhip32n7epijn3625jxn2ls7t7nptu4tkw@ls2u7uzaoegj>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-3-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-3-quic_mukhopad@quicinc.com>
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

On Mon, Sep 23, 2024 at 05:01:47PM GMT, Soutrik Mukhopadhyay wrote:
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Bjorn and Dmitry
> 	- Made aux_cfg array as const.
> 
> v3: Fixed review comments from Dmitry
> 	- Used a for loop to write the dp_phy_aux_cfg registers.
> 	- Pre-defined the aux_cfg size to prevent any magic numbers.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 41 ++++++++++++-----------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
