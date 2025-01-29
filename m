Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B7A21B1A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314B810E79A;
	Wed, 29 Jan 2025 10:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSjg3XiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19C10E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:41:57 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30762598511so65079231fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738147316; x=1738752116; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D4yelBueNkrGb3TAd7TxlWplKNsIgHY8WigrS6AsVI0=;
 b=BSjg3XiZE08ULSTEVVfxwAycHQaFDxc0ZHco+r4/zxIYjgKkH9nTEb1CxtaEmHBJ/g
 NaYJmaA2Qae8f/m6OXO8AS7vreuqgAZIT/dHWBn0u894BYZP//ddmmuxbsGBN6nx8ZaJ
 JRF4ZVPyXEndOadWPYCX0bCT+vUkPApmFzrNknxaQWF7b6xP12JAjRFAZicNBL3I9uix
 yeZJEJgGn0OHt+t0XQTG9LVx5HHgvc6f8hbXn3XnVRcmjB3k5LG78kQghBHuJhCrHZ9s
 psVwYkcvI0fTSrAwPOUMXLe1iJM7PV6c2UN8d5A7xwuXB8UlqcF4Bf/MEEtPhpVcOsVr
 ct6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738147316; x=1738752116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4yelBueNkrGb3TAd7TxlWplKNsIgHY8WigrS6AsVI0=;
 b=vZO76qJdSIjqr8MK0Kww6gIXCkEkmQ/ZD8Xe6rJGielGCEbSz69WJvC/uu2GiulkcZ
 56zwe1xj0uQlCMXtHum13/noi7vzp+zIPFMt0MM72SCU/m/dANdXRCXZb9y4JRU246Ao
 OGIQDpYsXLr7tU7MHsBPYfoBPmfcD5yqMay2J0sObN+jF0LBDkwgb9jN14VRoi0MaF7A
 WxUkuT+MKIKtZC+bCUVZ1mQTcUq6TqLOw/3tlI7Qjy1SuByq79s5Nugf/dRdNbDysRoj
 mLzsbyONubO4ybbECGvXEvqsp+xnzuDJ7bLvI5w3WrGo7KgXiqO1iZQgbt/9JnfHuuMx
 EAvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGjJYHfhcMk9tlNbIhJzZjwB+37pTDxlSBqlpsWW6mQwLlsTrZiYEY7liNtXk1K6vyrvYNCRospSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyXbMW8m4Ok8JzzO3nGzNETWcft4QBykI4hjkQ4uWx+svc2icO
 PjDETLGQR/w/zgxUT7Ie0pAvCB5nDh5QXKVa65taZ97OpslQG1aBx9TxW0GWSqw=
X-Gm-Gg: ASbGncuNNzu5hO3VB9UUthn+kkyRZuqGUqXfahpVmUHM8RULo+Tl8MFyUzKOTi68p/1
 LQ+e81pH64wp38ENSxPwL/DTMbSDT9OFYwj0xPrI3Ys4EEA0wU9EUoeAb7Zktnnpe6gIWPfm5r/
 eZqOV5+vcRWwznwYWC8W7KIxgddc2p9LiHRTUPHDUqe3eaH6xOoZTyx9srLPq8aruWZLhmJEy7F
 K5yYLdZz1FBg/wzmkSIkitt4cLy8+ji6wf6JzPkokldLGH7WU+DJ4W4RpoVJS1e48+h17Mvh+H6
 aKWh6BuOBpVohl9ktasJEON+gxP3i8D/GbVPRo4ViyYP3f3yRAx54M0Nini7VmbOxoMTeb8=
X-Google-Smtp-Source: AGHT+IHGx+YdDuqlOGKRzYFS2ie3+jfLXbg1cXVuLQ8xSlvEBjxbxFzoN4eb//hLYnPiApyVOZ9LYA==
X-Received: by 2002:a05:651c:1541:b0:2ff:e5fa:1ae7 with SMTP id
 38308e7fff4ca-307968f646dmr9551191fa.21.1738147315568; 
 Wed, 29 Jan 2025 02:41:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076baefd94sm21005141fa.63.2025.01.29.02.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:41:54 -0800 (PST)
Date: Wed, 29 Jan 2025 12:41:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 3/5] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <5gxdsaq2xlj3jijg3hpcnxbq4dpor2cq7q4r4dnkvwxny42tth@3nuxnn2rvb6v>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-4-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-4-quic_ekangupt@quicinc.com>
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

On Mon, Jan 27, 2025 at 10:12:37AM +0530, Ekansh Gupta wrote:
> InvokeV2 request is intended to support multiple enhanced invoke
> requests like CRC check, performance counter enablement and polling
> mode for RPC invocations. CRC check is getting enabled as part of
> this patch. CRC check for input and output argument helps in ensuring
> data consistency over a remote call. If user intends to enable CRC
> check, first local user CRC is calculated at user end and a CRC buffer
> is passed to DSP to capture remote CRC values. DSP is expected to
> write to the remote CRC buffer which is then compared at user level
> with the local CRC values.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 78 ++++++++++++++++++++++++++++++-------
>  include/uapi/misc/fastrpc.h |  7 ++++
>  2 files changed, 70 insertions(+), 15 deletions(-)
> 
> +
> +static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ctx_args *cargs;
> +	struct fastrpc_invoke_v2 inv2;
> +	int i, err;
> +
> +	if (copy_from_user(&inv2, argp, sizeof(inv2)))
> +		return -EFAULT;
> +
> +	/* Check if all reserved fields are zero */
> +	for (i = 0; i < 16; i++) {

Noticed this while reviewing next patch. No. Nak. Never. Who makes sure
that this magic 16 is the same as the actual size of an array? Please
always use ARRAY_SIZE in such cases.

> +		if (inv2.reserved[i] != 0)
> +			return -EINVAL;
>  	}
>  
> -	cargs->args = args;
> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
> -	kfree(args);
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
> +
> +	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
>  	kfree(cargs);
>  
>  	return err;

-- 
With best wishes
Dmitry
