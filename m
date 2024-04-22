Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E88ACE1B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684D112AB5;
	Mon, 22 Apr 2024 13:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MQwMVye7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0799112AB8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:25:44 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso59910531fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713792342; x=1714397142; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/kyPaZIZyrkWqjj0WFiDLbAxvb7aRYR+HuKJ6/NuUGw=;
 b=MQwMVye7Cp17xC+gaKK02QTMOWR9TMq1PPubRwXCD/GQxzXoP749ykKDc0BlVTYS3x
 nETwUXDP2YsGYFmhiH6UxXv/g+kR77HplOtwd1YgIv13GwQnthwA4WPGyeIDmD2VLPu0
 QfgwGCiGj6ounq74vWEcKNqfecfghYBR5k/jo8sahK59/BxclmRVKB4AY/AKELJgdlyJ
 dG4j2TN4qmhTqmfqjD9DAyTO9iTsscrmXZ5EywE5Un9gcw6K4dtQnKu5ikbQJOrfOlCL
 0ZD4O+3xIth+Tb6mXuWZOgdzWmxh7RDrOrwIEV+lvoDwn6qQZXT/TzMW+/rUdMaqq+NF
 70kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713792342; x=1714397142;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kyPaZIZyrkWqjj0WFiDLbAxvb7aRYR+HuKJ6/NuUGw=;
 b=UGvalOdb5WSgPA7MnnXYt/HsyNZ9n73hmj4ntJdl88rpVOR0CIpH7J31CaxLaaeb+Q
 HjGbaZ+MDYZuGRrYiYlrIvsXJPcjma9u25x5wmqQ5VM0eSwxADAvu3z1hLOrweUV90Wf
 JTR5woAljSdCm6JSsCQDnIBvvFONPjrBipraxkPBtSe97pCzwUP/P+KVIJPNpcjBlnnH
 LbAPm9Np+tNSKMKW1EM2zlWy2aIJZ8SfsPe7TdKS9Ec5R32ohp4bT0APWk++fqDoVvRc
 NZ14wBc6hmMysoi/+gZJ4wr+9gnAQreQ/rVpyDRIqf4HSLL/khte/7Bx1oip3KH6oxVV
 kH+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxdnzEV16/CNj/yRvSFnPPgMQiob3iKbXEN6FsWWrCozPwOkM0gw+P802jX2wVNrOuENiYJgITWRbbD4RKCsKYPqhXXYDZBHUboL4mLz/E
X-Gm-Message-State: AOJu0Yx/8ONOEgE0RxTH7rgQ3o0GpGvpTfWAqyQlbs1oIYntI+Ero0Fv
 fTnu+8+rMbTrp8LapNGNOlrAYEhSdUr98Ic6OIKv6Nwck/brdlDZUiW04Afpy2M=
X-Google-Smtp-Source: AGHT+IHWET/ZymKfhlPZrQHfC2dJ8JbIntynRS8qE8Jm7h5ARJyaDMzXxiK//kI7R+cm7SauaT3FVQ==
X-Received: by 2002:a2e:9d43:0:b0:2d4:6f33:2e59 with SMTP id
 y3-20020a2e9d43000000b002d46f332e59mr5822818ljj.30.1713792342161; 
 Mon, 22 Apr 2024 06:25:42 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ef9-20020a05640228c900b00571bde3b0a4sm5246522edb.34.2024.04.22.06.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 06:25:41 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:25:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: A <ashokemailat@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
Subject: Re: [PATCH] staging:fbtft:fb_ili9320 Removed redundant Parentheses
Message-ID: <9baed766-a2d2-4b94-ae2b-d16ffbea3f67@moroto.mountain>
References: <452e4a2dcdc7020f75b84d787297a1d17a21ca81.camel.ref@yahoo.com>
 <452e4a2dcdc7020f75b84d787297a1d17a21ca81.camel@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452e4a2dcdc7020f75b84d787297a1d17a21ca81.camel@yahoo.com>
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

0) Fix your From address.

1) Look at how other people write subjects.
   git log --oneline drivers/staging/fbtft/fb_ili9320.c

On Fri, Apr 19, 2024 at 11:04:21AM -0700, A wrote:
> >From 51e98164e314a2d1d834d2a9baea21a9823650bb Mon Sep 17 00:00:00 2001
> From: Ashok Kumar <ashokemailat@yahoo.com>
> Date: Fri, 19 Apr 2024 10:32:48 -0700
> Subject: [PATCH] staging:fbtft:fb_ili9320 Removed redundant
>  Parentheses

2) This should not be part of the email.

> 
> Adhere to Linux kernel coding style.
> Reported by checkpatch
> 
> CHECK: Unnecessary parentheses around 'devcode != 0x0000'
> +       if ((devcode != 0x0000) && (devcode != 0x9320))
> 

3) Just leave this as-is.  Ignore checkpatch in this case.  Greg likes
   parens.

> Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c
> b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..409b54cc562e 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code:
> 0x%04X\n",

4) This patch is corrupt and will not apply.  Read the first two
paragraphs of Documentation/process/email-clients.rst.

regards,
dan carpenter


