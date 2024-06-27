Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342491A3BA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFA110E1B3;
	Thu, 27 Jun 2024 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iU1wtzVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8002810E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:28:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e714b2c06so469583e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719484117; x=1720088917; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CSObqPp2o1ZiYQ9QL2aHPTL2pT8TeTrCT9cgEet+VS0=;
 b=iU1wtzVofaZmL12WbyKgjlC1shL1HynDTTjKztYl9PHO0Ga2CgVHEzpGUsO801iqOM
 94bqGaty09H6GGuQhJTvQlAJVi0Uw70SOUwKbkkEGv3g66f6RAYvSzUdGEGv3L3FeWxZ
 Gm8gy3eKNfVFdY6yNDYDxSPx6JxFpGpvzOTV91PG2K3xsx7bB/H9iBZqJKl1AEcqvn8v
 Hi4xhl2Hqct377EsDOzTtdNb3SzenNwUx8uH/nCfNipHAIkjlMxcQ4mYJUhO+mMLgs1i
 AOz25sRmDpMW90nuO/GHpbg/VHsJ3y1Jk4BuP/52v+EPt4yJdloL3DbBG+Q0dL6UnsxS
 nXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719484117; x=1720088917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSObqPp2o1ZiYQ9QL2aHPTL2pT8TeTrCT9cgEet+VS0=;
 b=pC34Rm65UJIteumJYg+inz6fJPVkf8wwVtgZNqckMFQOvs0h2gjfQjPlaVwx50EXl7
 vuU6OFb1CcuNEYa915I8U9cbYuUXx2nuWLdqJ4QAj9ChnCbmFY3ULTqN+P/pZAa9BaBA
 3rvENpDXmjsxd2Qe+eiuSSxAOVZx0AB0gr9gcC9geRuvp3eZCT3ELtXljKGClaIlq390
 fBPw6UMoHjYKt05JhuTcLbvp+IaotP3M6NPdGQoo4ZBReejtSZz5eYZ5ui+zg/IdbPew
 sHxdwuY/+G3QVRnMA9d0qvxmtsWBrRtDcRrszv3nqoFbJ+8sq0oLa2/Fj6dacvDDwUen
 xNJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgrVFVZjvvj/V+Ut/ztriSWoG7Vqi5NdgLkb/eYWq3QtEdZk3qh41bHr+6bG2yvFjnl32Qr7B8BQlj81KgkF07IByQZh/QwQ78boLYWEh6
X-Gm-Message-State: AOJu0YxjSSKpstDWwZxCER5odGrg6bijwAnLOZZzHbff+IdaKhdvF2hn
 VZj8DwYtryZGO8VSzmOK99Ue/U7gerbYy9qMGQeA/Wu8RY2I3qPBuHrzCc/wExA=
X-Google-Smtp-Source: AGHT+IFKQsbMqpoVnTPZEnzGX8hY6FDAKEvfJirsH2ST3SdWpnd2QjBxD18elzS2fRWAkQeb/uWTSQ==
X-Received: by 2002:a05:6512:158b:b0:52c:dbdd:92e with SMTP id
 2adb3069b0e04-52e703a40cbmr471883e87.26.1719484115347; 
 Thu, 27 Jun 2024 03:28:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e71305ebbsm154630e87.126.2024.06.27.03.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 03:28:34 -0700 (PDT)
Date: Thu, 27 Jun 2024 13:28:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <jxfdfponl5eo42imhsut7rckqafolnqooifpn77fgsn26elkwi@rsvxfjzvkjxp>
References: <20240627084628.1590453-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627084628.1590453-1-quic_ekangupt@quicinc.com>
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

On Thu, Jun 27, 2024 at 02:16:27PM GMT, Ekansh Gupta wrote:
> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> to be added for PD notifications and other missing features. Adding
> and maintaining new files from within fastrpc directory would be easy.
> 
> Example of feature that is being planned to be introduced in a new C
> file:
> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Updated Kconfig.
> 
>  MAINTAINERS                          |  2 +-
>  drivers/misc/Kconfig                 | 13 +------------
>  drivers/misc/Makefile                |  2 +-
>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>  drivers/misc/fastrpc/Makefile        |  2 ++
>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>  6 files changed, 21 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/Kconfig
>  create mode 100644 drivers/misc/fastrpc/Makefile
>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

> diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
> new file mode 100644
> index 000000000000..7179a44eda84
> --- /dev/null
> +++ b/drivers/misc/fastrpc/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Qualcomm FastRPC devices
> +#
> +
> +config QCOM_FASTRPC
> +	tristate "Qualcomm FastRPC"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on RPMSG
> +	select DMA_SHARED_BUFFER
> +	select QCOM_SCM
> +	help
> +	  Provides a communication mechanism that facilitate high-speed
> +	  Remote Procedure Call (RPC) mechanisms between the host CPU and
> +	  offload processors Qualcomm Digital Signal Processors (DSPs).
> +	  Say M if you want to enable this module.
> \ No newline at end of file

Nit: ^^

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
