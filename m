Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C6953653
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71D10E453;
	Thu, 15 Aug 2024 14:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q9/ZTAUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0B10E453
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:55:05 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a7aa4ca9d72so146931666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723733703; x=1724338503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kRsVMvhV1m4jnkyYapmQ2mhT4HUKsi82zyg3o1vJhj4=;
 b=Q9/ZTAUonSusVP8TloNeygZt2D5WFwhmEdBmRavuoJPOUFTOMIairZ5YeaGZ9uM+8h
 ohS28rJYqRLeqppGLZgRHsO1b++1uQ/FvOMY565V4iHXNkYweIthnvxf333HF9D/cTBw
 aG9Rp799cWGhEpneWtSQsXea6u4U62b7eX9f5RogmRJy+1T+IuwmkvAOv+gzpsUDLole
 qOy0fIVDmUd8J3fYAC0fUoDJskTo2QctlFr0m17i3cZ1NrF0AzkYhJrZSMTlAJMW2zA0
 2M0JA4MsMrEzlAi4e3KU2m+RxbeheH0U3RuQ+NkMeo9S2s2thTDBFu8KUH7qw6agx8ns
 ETMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723733703; x=1724338503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRsVMvhV1m4jnkyYapmQ2mhT4HUKsi82zyg3o1vJhj4=;
 b=SIUrS5yLYbTaUOiiEhyM1+UzcPslV54zkwIYS8RRtgQIaLUQxGbnuAMBMBneSRSswE
 mll0hsxMpF9WskDKiib7aS36o82urcJUMQwFkzLhLdhaNs/kH/YLrtWwHlCkrZjp5rzY
 zYKIiLz7/hCkkiltYLujtj+9euT9WCW3xNPGvTykFWNzDVpNNAmG4+DqrB4CWx+qhpEX
 m4N6gcDSXjYIGKejtB9tAIQrz7HFpJh6t6IBpvi1Sn8GX4SRwAXMJPJ5gOxG5a/puXUi
 KoZviNfoBeABiFVPfkC0oArXxR+0Clhs80GuBCMmQFgISXJlFk8l9RO3m10RAmNM6OiT
 QwHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUimZX0LAOlw2opNxNcT7KPNFX/pVsyrvgZEpOmqUBKIRAl0ijeU1egg18jBvy0RC2xBwyuuXy7i5efMNfzDuhXPp7Zf0LXcoNsc6BEpiPA
X-Gm-Message-State: AOJu0YzJ0V5lIkHxaVPPeCHfM4Q5Fe0FmObMI5481Lf8jOCccQwGbkga
 CTzRZ6A0V97r0SL7Ir2ncvbRNb6DsAJbTO+ArWgNViXVj+zAQa7IJqQmJcf4Gig=
X-Google-Smtp-Source: AGHT+IGOnLR0ehKGNshAowR/t71XZukLfFAAiAx7KkDRy7tTRlkvpQgdTikiClXZ8+TFuO8RPTOe0w==
X-Received: by 2002:a17:907:e6e4:b0:a7a:bae8:f29e with SMTP id
 a640c23a62f3a-a8366d43f97mr425022066b.29.1723733703106; 
 Thu, 15 Aug 2024 07:55:03 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a8383935663sm113133966b.121.2024.08.15.07.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 07:55:02 -0700 (PDT)
Message-ID: <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>
Date: Thu, 15 Aug 2024 15:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "misc: fastrpc: Restrict untrusted app to attach
 to privileged PD"
To: Griffin Kroah-Hartman <griffin@kroah.com>, amahesh@qti.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable <stable@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20240815094920.8242-1-griffin@kroah.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240815094920.8242-1-griffin@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 15/08/2024 10:49, Griffin Kroah-Hartman wrote:
> This reverts commit bab2f5e8fd5d2f759db26b78d9db57412888f187.
> 
> Joel reported that this commit breaks userspace and stops sensors in
> SDM845 from working. Also breaks other qcom SoC devices running postmarketOS.
> 
> Cc: stable <stable@kernel.org>
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Link: https://lore.kernel.org/r/9a9f5646-a554-4b65-8122-d212bb665c81@umsystem.edu
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---


Lets fix this properly by updating existing device tree entries and 
bindings to enforce misuse of "qcom,non-secure-domain" on all Qcom SoC's.

As this patch is only doing part of the job and breaking existing 
platforms,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini



--srini
>   drivers/misc/fastrpc.c      | 22 +++-------------------
>   include/uapi/misc/fastrpc.h |  3 ---
>   2 files changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..339d126414d4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2085,16 +2085,6 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>   	return err;
>   }
>   
> -static int is_attach_rejected(struct fastrpc_user *fl)
> -{
> -	/* Check if the device node is non-secure */
> -	if (!fl->is_secure_dev) {
> -		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
> -		return -EACCES;
> -	}
> -	return 0;
> -}
> -
>   static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>   				 unsigned long arg)
>   {
> @@ -2107,19 +2097,13 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>   		err = fastrpc_invoke(fl, argp);
>   		break;
>   	case FASTRPC_IOCTL_INIT_ATTACH:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_attach(fl, ROOT_PD);
> +		err = fastrpc_init_attach(fl, ROOT_PD);
>   		break;
>   	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_attach(fl, SENSORS_PD);
> +		err = fastrpc_init_attach(fl, SENSORS_PD);
>   		break;
>   	case FASTRPC_IOCTL_INIT_CREATE_STATIC:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_create_static_process(fl, argp);
> +		err = fastrpc_init_create_static_process(fl, argp);
>   		break;
>   	case FASTRPC_IOCTL_INIT_CREATE:
>   		err = fastrpc_init_create_process(fl, argp);
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index 91583690bddc..f33d914d8f46 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -8,14 +8,11 @@
>   #define FASTRPC_IOCTL_ALLOC_DMA_BUFF	_IOWR('R', 1, struct fastrpc_alloc_dma_buf)
>   #define FASTRPC_IOCTL_FREE_DMA_BUFF	_IOWR('R', 2, __u32)
>   #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
>   #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
>   #define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
>   #define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>   #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>   #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
