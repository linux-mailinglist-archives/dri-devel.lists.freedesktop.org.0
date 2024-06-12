Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC1905AD9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431B010E6AD;
	Wed, 12 Jun 2024 18:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a5djFLjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C301410E6AD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 18:28:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so245453e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718216922; x=1718821722; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X4A3nskQbinN2oXidgSFRXNzq96u2qf2Pg7QGZ6rhiQ=;
 b=a5djFLjW6kFh2fGIkoWkEVkJSmRB0S5UqEQVXpTSOxBWkuFt6J1N0qoKYgtkajPu8x
 nS+nqX4U96qrQ0F2y1JClqnsfqN0ukPmWb4jlGWODPnaqnpDF6ebKdBUx3j/GcQ9KQOd
 Z1vkT2j6EG91/5rxZN6k9/hcLcjWZ5ffRq3Kt3olQLcyUd9JAAahKNMjTLqA82BH1jaA
 AT0gO557g1dts86goaJgto75GvoWHiSqlkN8Xmev6SordaaMEjfyRA1tw254TmtJE79t
 9qvGlAS86JR0GDKAd5HORrI1VAhQ8aGk97Ku+vt2OauFyyVZ8BV0XBhFAljylbNGVSvg
 8i8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718216922; x=1718821722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4A3nskQbinN2oXidgSFRXNzq96u2qf2Pg7QGZ6rhiQ=;
 b=bSS7Hzcm6p+/WApsf88/xDTqhhsLewJT3taR6kzM1igXnCPJS3txy5EyBsuxwA2951
 7xH6QHXCtymDGEiKhdX88KRZXk5U3hLQjpqoFosMwehMNzaz4Zl683884C8AKoF56YgJ
 9uC+IBBeaQCIVWRiGP1ZZe1RBg4QXvbPkYg9065NO5a9KeNeOreX36Z8Tz1hbXMhd9jP
 7/jfw235KXpj0hyxsT/AtaqKNN/mOV1/MD6BmigmlMZjLABROVJg5ZTAlByXAtRuvDmz
 bfquOcQ+POIsoAtGcNI77KAeX4//dZwxrkDIzqWRMdW4SU2IYjpF3UwAFrF9+5RX3w5g
 nWhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa0vrGWJOjLwyWOmlcZKFGZr/DKLdei6zao7EPqv9kSczJnOZ6cN9yhXSzxds9aHw7yQw1yBY1o1wRoNNVTstjPeNobIVYHClhY9Q8kYBW
X-Gm-Message-State: AOJu0YwuH9+PfoD2t0F8+JRS+PEJU6YMjtMEJDbpwLXeSzJAu+hwOMPD
 PzYECK6B8tkjS/dvbjBSHIemSVXyWBiXC3AwMBe/aLICCekvBrX/RDu61AiqjUw=
X-Google-Smtp-Source: AGHT+IHqxWBY5W5/D7iMvIiOM+bNYgI78Otk50SorVbJ2aH6damt3orZjW3DPhMTysOg1CnepRZEIg==
X-Received: by 2002:ac2:504f:0:b0:52c:84d1:180e with SMTP id
 2adb3069b0e04-52c9a406773mr1338021e87.67.1718216921351; 
 Wed, 12 Jun 2024 11:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8d61d17csm1380065e87.45.2024.06.12.11.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 11:28:41 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:28:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
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

On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
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

Please consider whether it makes sense to move to drivers/accel instead
(and possibly writing a better Kconfig entry, specifying that the driver
is to be used to offload execution to the DSP).

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6c90161c7bf..e9c79e9063f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18501,7 +18501,7 @@ M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> -F:	drivers/misc/fastrpc.c
> +F:	drivers/misc/fastrpc/
>  F:	include/uapi/misc/fastrpc.h
>  
>  QUALCOMM HEXAGON ARCHITECTURE
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index faf983680040..630e8ccd8669 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -276,18 +276,6 @@ config QCOM_COINCELL
>  	  to maintain PMIC register and RTC state in the absence of
>  	  external power.
>  
> -config QCOM_FASTRPC
> -	tristate "Qualcomm FastRPC"
> -	depends on ARCH_QCOM || COMPILE_TEST
> -	depends on RPMSG
> -	select DMA_SHARED_BUFFER
> -	select QCOM_SCM
> -	help
> -	  Provides a communication mechanism that allows for clients to
> -	  make remote method invocations across processor boundary to
> -	  applications DSP processor. Say M if you want to enable this
> -	  module.
> -
>  config SGI_GRU
>  	tristate "SGI GRU driver"
>  	depends on X86_UV && SMP
> @@ -602,4 +590,5 @@ source "drivers/misc/cardreader/Kconfig"
>  source "drivers/misc/uacce/Kconfig"
>  source "drivers/misc/pvpanic/Kconfig"
>  source "drivers/misc/mchp_pci1xxxx/Kconfig"
> +source "drivers/misc/fastrpc/Kconfig"
>  endmenu
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 153a3f4837e8..f83d73844ea5 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -16,7 +16,6 @@ obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
>  obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
>  obj-$(CONFIG_PHANTOM)		+= phantom.o
>  obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
> -obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>  obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
>  obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
>  obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
> @@ -69,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
>  obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
>  obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
>  obj-$(CONFIG_NSM)		+= nsm.o
> +obj-y				+= fastrpc/
> diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
> new file mode 100644
> index 000000000000..3243dc56b2a0
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
> +	  Provides a communication mechanism that allows for clients to
> +	  make remote method invocations across processor boundary to
> +	  applications DSP processor. Say M if you want to enable this
> +	  module.
> \ No newline at end of file
> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> new file mode 100644
> index 000000000000..77fd2b763b6b
> --- /dev/null
> +++ b/drivers/misc/fastrpc/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc/fastrpc.c
> similarity index 100%
> rename from drivers/misc/fastrpc.c
> rename to drivers/misc/fastrpc/fastrpc.c
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
