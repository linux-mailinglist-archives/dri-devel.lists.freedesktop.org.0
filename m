Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D37A2697
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0610E673;
	Fri, 15 Sep 2023 18:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E72B10E673
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:52:04 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6c0b3cea424so1410665a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694803923; x=1695408723;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X0WyqAJ5yJOqId14DuOsChOBKAGV647ZGJyOmq2Fqjk=;
 b=m1OykLth540StjOaNRQo6aNgNVPmelO8kC8CetXP9cIKyS7XuNv9nPx7T7d7uXZDh5
 ySPEeJ1Lp1FgioAQFHgSVI9D7IAKDEWrx0PbYvhghi6Ji1/VE0u/CH6Q3Pry5dYRRxaM
 +Ml/trWR3FGtpscowTxKB/mko1KmaMYR3Gh1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694803923; x=1695408723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0WyqAJ5yJOqId14DuOsChOBKAGV647ZGJyOmq2Fqjk=;
 b=H1KmBcPO3hdrk+LsG7etYDFSffSWNz5saK+3iLTDBuQYB8uQBrYhyC/GPiCx+jwv+X
 NIWrxEtzXFb7Ga/TMwVMYVULliV0RYKECOxlTyuoNr5vgeNFbCAl1sL4gkdOVfELgybT
 uqnsJp4nANbACeuOcTUiYmLSAfHUG2KJmYUB6FbK8KzS3a1mOIxdNsqCQUTAxS7cJa7g
 ZClcdOUL6Tsk2CM2b+aOFie3ica5FqDxhjwtQWz6HrlCyZ21/WcF1rTHDYUXrhyHM0So
 fN0Ta7DUEKzKRr/9zbcX69XjZq02HLSaP+G2upSU3W6CP/PjHD+PSzBK4Tg/N4+I+N3B
 KT0Q==
X-Gm-Message-State: AOJu0Ywz1KhW3ROzI6xz+we+AxoLyuG2T4o8lxzhFRYFItOVxvZ7iGNO
 eBcNjpmiVtfZjTG5SJ8/oZ+sfg==
X-Google-Smtp-Source: AGHT+IFLeulKYJVZbtaYCC78ng58EYSEdkdd1lDUFANMECpbOAZc+gCpxueIstOyFv/ysLfUav4NJw==
X-Received: by 2002:a05:6358:71a:b0:134:28d6:be7 with SMTP id
 e26-20020a056358071a00b0013428d60be7mr3696470rwj.9.1694803923555; 
 Fri, 15 Sep 2023 11:52:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 q13-20020a656a8d000000b00564b313d526sm2716841pgu.54.2023.09.15.11.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 11:52:02 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:52:02 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/gud: Use size_add() in call to struct_size()
Message-ID: <202309151150.74DBDCA039@keescook>
References: <ZQSlyHKPdw/zsy4c@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQSlyHKPdw/zsy4c@work>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 linux-hardening@vger.kernel.org, Peter Stuge <peter@stuge.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 12:43:20PM -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound, the
> protection that `struct_size()` adds against potential integer overflows
> is defeated. Fix this by hardening call to `struct_size()` with `size_add()`.
> 
> Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index d2f199ea3c11..a02f75be81f0 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -503,7 +503,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>  		return -ENOENT;
>  
>  	len = struct_size(req, properties,
> -			  GUD_PROPERTIES_MAX_NUM + GUD_CONNECTOR_PROPERTIES_MAX_NUM);
> +			  size_add(GUD_PROPERTIES_MAX_NUM, GUD_CONNECTOR_PROPERTIES_MAX_NUM));

There are both constant expressions, so there's not too much value in
wrapping them with size_add(), but for maintaining a common coding style
for dealing with allocation sizes, I can be convinced of the change. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


>  	req = kzalloc(len, GFP_KERNEL);
>  	if (!req)
>  		return -ENOMEM;
> -- 
> 2.34.1
> 

-- 
Kees Cook
