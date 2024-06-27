Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA691A4C1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257D410E240;
	Thu, 27 Jun 2024 11:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WQBLkjPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D459A10E240
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:13:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so5137929e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719486834; x=1720091634; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tdkhxg4V+EaWFRe9R6fxXILIl8Q+Rdop2i8/UoriEyI=;
 b=WQBLkjPXzmxX/gx5cao+fFQE29sM9NUdDDiXhjJf/5HDmdSac49qTlr59YXZ+INy8b
 7sGWM8kh5LlxIBMs8Q+rqSRAPtIvEWgGHBoPpPxqU2axJPUL4QZzxEtvK0uy3znoj050
 A8b5qLTPiYRdQ7nb+2npSicyJlYGntj0vKUJT49HRthabX0Jv0VpzNuVYtO6ppo626qA
 bdldU5wykz1J/p9nxF+SRBDyyut+T5LuF6zTxGrNnS7NtEDnIA3tiXR3u/6vVnxRyXis
 eZXiIgk+v3yqJrxgOzWNwpIsOgamA8AaGZ1cL2ZxuwyNy9PJkwxBMW/JpTTJXbJAeoEY
 mJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719486834; x=1720091634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdkhxg4V+EaWFRe9R6fxXILIl8Q+Rdop2i8/UoriEyI=;
 b=u7YiYDQJY2auvUwOp8w0bAEJGQd7EnbgohzWF3K0OEe98SP8GLkvO1arTK8B/Qw8j7
 mOm3IKgnuoSULMSCMy71w9aPTtboEQi8/IZmbWS9gBTIdyP1HKBqzoZfGKfPMFUyM6xL
 rwd3wZgb/tcjALqx0xEr1wHFCHQU/GfFJp9yEJTnqvKDMXd4lRe9n5Q7k9j1tl/q0vtp
 kfjYAn8LZfnyzQasLKUfeG3vyK9WDft9ElQ/lmjkL7891VKxAeBQSfXMBs+6ZdsuKphD
 AL8zveatNUHwggpYyigOaoTMOI73V7lQO1vhsQaG1p6BY5G2bDZAgsRzZw9OJ/9MbGEN
 RfLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1V0KSPFxSnKCD0Sy74KR0Ex2HjtALL7IzElHucf9szsoVmqOWTgPsjCsYNAlIaidDJRDz32jSR5pMCKm40us0DpvE4z9ut8cT58LjdAVy
X-Gm-Message-State: AOJu0YyHOnlu6uSBejZgXrVcfQtfZwSMDYuI6/MfZs2SAH+ZtX8vsnFt
 eXuWgwG7VdOyYEEzzlPxulrhXQkihWXSfIn9PiDxUEVWCtUZwYEbfPPvO7dHzR8=
X-Google-Smtp-Source: AGHT+IEdwvrlXULMeBgYsXv7E9ICpsRXSh9tY/qkO+ZPVpF3yvrZOGiOZUlYLCfb7JwzlTJu+GuYfw==
X-Received: by 2002:a19:e046:0:b0:52c:e171:ba2 with SMTP id
 2adb3069b0e04-52ce1835617mr7505956e87.17.1719486833817; 
 Thu, 27 Jun 2024 04:13:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e71305d15sm163090e87.162.2024.06.27.04.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 04:13:53 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:13:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
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

On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is passed
> by user space and is checked against a max size. For unsigned PD
> offloading, more than 2MB size could be passed by user which would
> result in PD initialization failure. Remove the user PD initmem size
> check and allow buffer allocation for user passed size. Any additional
> memory sent to DSP during PD init is used as the PD heap.

Would it allow malicious userspace to allocate big enough buffers and
reduce the amount of memory available to the system? To other DSP
programs?

> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> 
>  drivers/misc/fastrpc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..9d064deeac89 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	if (init.filelen > INIT_FILELEN_MAX) {
> -		err = -EINVAL;
> -		goto err;
> -	}
> -
>  	inbuf.pgid = fl->tgid;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
