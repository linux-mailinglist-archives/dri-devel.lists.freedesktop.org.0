Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512F938B08
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2637210E3F5;
	Mon, 22 Jul 2024 08:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OFeAVt1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD2410E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:18:25 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ef2fbf1d14so5501321fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721636304; x=1722241104; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j2YYNydr91hY9SUP1qO73rcnIKppoYrhA5vIDVvsVpM=;
 b=OFeAVt1Z6Un56gKgTLWZBlc7R6W9KI3786ovKFtotKxhoaCRHUxkYDO69fZNRB5FZs
 VrRXxVayWGBQ1P8regRei4F8BKn+vQKMNPCBIo8eohFAFjpS3aGY+sei0no14aEoiSa4
 admkSKQ1pNTt3TFlmTW8mbAxIPK6foW3dOzUI/lh9c5VVt+17Zxa7KsLRWXPDFgEyiuM
 c3UK0VkEHjyOtG5pwHQfnbNtPn4hvJbZ0+HcLcmeWf93l3F/5dW29Epqcy3c/nd4fdBz
 XwC5zDLNWY+FaWX4O7xfavCk3zC2yZO4HrbNWNe9m0sL6RZCqdPM+II1qO+xIdlReJ1Z
 778w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721636304; x=1722241104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2YYNydr91hY9SUP1qO73rcnIKppoYrhA5vIDVvsVpM=;
 b=FKT83AM8iiWEp/9NN7dOhn1FZS25096UtYdl2SUIGzAJ7S6eIRkwNxf76rIQeoXnTm
 LNNkGDRsf9u7Y0oyO9Il0J3qtkDS9bJsxaYYGO5UpMdR+cfFWMM3zMlb4Oh6j5brtjki
 1KOnFPPxP3b5MFUe69f1fAzH1xdIkSf8mX94H3+rwZLuDWp8SQRsJcUUCfmfG63Im0Jr
 DsHbrjhWMe52kfZQ7fTgFCD779u8oOJcJe2TEbGnH0sRY50aoJ1/TapVZakJMTyN7Wch
 +4KhmaoAEb7Nj2wOjYqthzI3jx8DO2pm91cDeo+wS8qzZ93RRcthi+O1H9wvBK3BK0xy
 lvjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ZTHyeZs4KBbWYjbWCqBYuXQZRLIbWI1vwYoNhEMsMdxkuHNM7ugsSlC707cSCE2R+0i88ifjymB0BRBt2uC2KMudrL3aWOcu1cPvVr/7
X-Gm-Message-State: AOJu0YwyNSm0reqbuwR49rJSRWwXslrpSyQueoiB9lJS3uicbCkHpMrb
 Q8VLHaYz2TbDSPklfX/qtf7tt9fLUOMSh5DNjYw7dce0Xboaj+U1fA0htrzFagU=
X-Google-Smtp-Source: AGHT+IEbkru7fNizX7xMy50mhZzku9vEb3dv34HFkQDPLX7osSafc3vJ5cXUQ79K1sqUjMAbPMPwvA==
X-Received: by 2002:a2e:b8d4:0:b0:2ef:1efb:1b6b with SMTP id
 38308e7fff4ca-2ef1efb1e0dmr16408341fa.15.1721636303917; 
 Mon, 22 Jul 2024 01:18:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2aba1489sm5951191fa.78.2024.07.22.01.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:18:23 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <nggoobovb223pxknzai5luaq6wqrv7ovtawodds4bjiegbxlth@ro5cvoxed24w>
References: <20240720034611.2219308-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240720034611.2219308-1-quic_ekangupt@quicinc.com>
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

On Sat, Jul 20, 2024 at 09:16:11AM GMT, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD initmrequest, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Allocate and pass an effective pgid to DSP which would be allocated

effective pgid makes me think about the setegid() system call. Can we
just name them "client ID" (granted that session is already reserved)?
Or is it really session ID? Can we use the index of the session instead
and skip the whole IDR allocation?

> during device open and will have a lifetime till the device is closed.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Reformatted commit text.
>   - Moved from ida to idr.
>   - Changed dsp_pgid data type.
>   - Resolved memory leak.
> 
>  drivers/misc/fastrpc.c | 49 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..b4a5af2d2dfa 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -105,6 +105,10 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +#define MAX_DSP_PD	64	/* Maximum 64 PDs are allowed on DSP */

Why?

> +#define MIN_FRPC_PGID	1000

Is it some random number or some pre-defined constant? Can we use 0
instead?

> +#define MAX_FRPC_PGID	(MIN_FRPC_PGID + MAX_DSP_PD)
> +
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp"};
>  struct fastrpc_phy_page {


-- 
With best wishes
Dmitry
