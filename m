Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0B96312F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20110E5C4;
	Wed, 28 Aug 2024 19:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KKtnrfhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC71410E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:48:05 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5343e75c642so6778582e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724874484; x=1725479284; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OBzjJnYvoExoTdxa+EXBkaygJuIm6Aj3yINJ1UWhUis=;
 b=KKtnrfhgWBVRVgeOudAP6aLa97RNUq1BjbmuCduR/nLy8doL3wtXDEdgrwHrTp5o2Z
 Bzf+Lo5uewXYOzeQ+W+vuhPCewTerNeaTcBVGWJe3KseHhloLtciQkn0alzY56aIoQ0D
 vxfjnFeM836dzvH2io5VGgcF1tTAKbtH3rCp/AemlE0V3SRtZwjE6wLdzgCyh5Nvoot7
 knBa8K7Fa8iK2J/N3Bd5q81X45GxJjOW1Vp/SasG8K3qd8bNrZxjokHhFx/p7ZaIC5sS
 Mfl/3uoW73jimXcftdph4HYUeI5s0sIoCDG0WMKeq+Rjhbsa+C+00SWPtcvr4e0WBrh1
 UAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724874484; x=1725479284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBzjJnYvoExoTdxa+EXBkaygJuIm6Aj3yINJ1UWhUis=;
 b=Te+N0uHlaE0eqTNxOWToiYe30rx2PG8o2BiV/TrrUSZaFBBcvyGnrNfwFurnJl8LuE
 0y0NXdj7QcVKeWuZ0HJm7knZCKdkSHC2YJ87uN+r0fgiGBchLQqm3Ierawhr8UYc6ozY
 l9cPXIGNdQUoa3kBwkgd0TvKUBgUKiKU8tHfZeX1dHdF+UbxUkC9+a4rcNsad8var9Yv
 qo7doUG3PzBWJBLI1+pMeG0LCTLBzdGfX2GjTT7pisxJe6VZA3t73nk57142n0iZNVNl
 wbctO0vrMXAEIM79lpLxpWuapfgyW3pgLDkKPcAz2NSL73FDO42/csidxeflw55EgI8f
 iKbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHNRykrS4JefP3M0RUAUHTSYxjDAV1cFRTWXuXl8QNJvWjF/dtRGam1IMqhtAy4U/xak7wQUQ1y34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmeXHnbIKCXJFXZ9HTeRWm1kgbDzE6lFYwHjuaXzwp9pfxLJvN
 z23aw2j2zhEpTN3BWu/OexzIlCuAN93uSVVK6nA0WfjP0fMg9cWeZ1G3BTETDac=
X-Google-Smtp-Source: AGHT+IGtsciDwfFdHJJ8eiekoA8VHrlLbxk8Ypd5NxkIvHj/hMIKGkalEGw+8iFeInHnJaOtTCCSOw==
X-Received: by 2002:a05:6512:ba1:b0:533:4722:ebbe with SMTP id
 2adb3069b0e04-5353e579649mr216247e87.26.1724874483178; 
 Wed, 28 Aug 2024 12:48:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea89134sm2260469e87.270.2024.08.28.12.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 12:48:02 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:48:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
Subject: Re: [PATCH v4 3/6] remoteproc: qcom_q6v5_pas: Add support for
 SA8775p ADSP, CDSP and GPDSP
Message-ID: <m732ashkt5rkadh3mlm44t6coomsvbz2f53br4twt35rzlafcy@sbc7ztnsojig>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
 <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>
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

On Mon, Aug 05, 2024 at 07:08:04PM GMT, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
