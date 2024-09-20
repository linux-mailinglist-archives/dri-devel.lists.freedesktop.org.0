Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280297D822
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 18:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063810E844;
	Fri, 20 Sep 2024 16:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ro//OBBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284B310E844
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 16:16:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so25164161fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726848990; x=1727453790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ojs9bHvGaP56hqKEftt/MxT/xOMPbuiutorXXfIZh6g=;
 b=Ro//OBBnGLg9ZUIjvE/7qVVmkKb8FbT3ExVWSuIrkdavm+4sxFE7e4u6D5HGuxm9xP
 mFss20xSQ7ZEpWvCdqeIOvDNWo9916cEM5KPcv/z0QO7wDiV4WA2Tqk9wwoCoL5BSeYQ
 laSoYRp4uH0m60hWX0B4FVuv3MqaFbL7seW0IKR15asgbVUCCc4cLkKed5fhyAXk0xbi
 4+Zoh6UZDtgKGF+kH4w8Rb35emneowsbL09UC1GmNCHcnm0xQaBDykrZGBFYeNAQ5+ok
 ZspURyozWo1Nzbfv4qCUdSIZ3GlVjNJ5opUnCJfGn9RvkD+/qjV+DS/Eb2S325/GmUPW
 aEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726848990; x=1727453790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojs9bHvGaP56hqKEftt/MxT/xOMPbuiutorXXfIZh6g=;
 b=OGMo8wC+bta5e0x+mihURvjK6xv2wu/oSKLQumSFGjxI6Rfv0afn5FQfv6bv7AL6Zj
 6q5OSEaPKO4rTDUGr08hAFVYLePPMIUHuByRcOtRBqQP+ga0gbvSDKEvTx+w3i1zwFaX
 lsN2iQD0EYAL2h0taPYkE/Goj/v/9FeyHsYgS0Tl7zeM407oaz1X1m+lEXkQ0iFqU755
 sqWcuAinOKUFa0xD8O+1u7WpPFgLC0EJJYYHl+vmCD/7fXzA6cg4g+hD2Gg63P7kB6yf
 o0e83ebJxxhqY0fWFnH75AJ0haQJOqiTVLx4QcvA/3xqlH4nkPkIxasyYRFKtIp5eiqB
 N42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UJOP3hCUUJI5qxdoPSlGGLihxW/jzEVHLgIEnQ0qIwGbgU18WkF5YcArfKayOww49RD9jqxzCJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKgY2Kdd3vZ3XWaWF6wM8ExnKqbpIF8Y4G8KYPLsebPKiMbNsW
 KxztKWc6DV/uNCbyXNR82gjN6+9fhnJj5pqA7xr7me28MeXooEoFbviZlpv8x3g=
X-Google-Smtp-Source: AGHT+IFjuJHBz3zyYZgiHeBiTX9aOszMyNS+dBaoStFCzARqh43splESYieVEXve8IE/eEpFlXFarA==
X-Received: by 2002:a05:651c:4ca:b0:2f7:58bc:f49d with SMTP id
 38308e7fff4ca-2f7cb238066mr19201831fa.0.1726848990184; 
 Fri, 20 Sep 2024 09:16:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1ca7sm19564801fa.24.2024.09.20.09.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 09:16:26 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:16:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: stefan@agner.ch, alison.wang@nxp.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fsl-dcu: Remove redundant dev_err()
Message-ID: <2es6xy5o4j7kciop75lturl6n6k5yykcibgkv5r6tjf7ap3ek3@ia7a4dozi2kl>
References: <20240918074841.2221210-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918074841.2221210-1-nichen@iscas.ac.cn>
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

On Wed, Sep 18, 2024 at 03:48:41PM GMT, Chen Ni wrote:
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message in case of a
> failure.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
