Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA454385F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859C10E709;
	Wed,  8 Jun 2022 16:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BA110E709
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:06:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d14so19987504wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f70pptS+xBg2CCCgan9PBj/rQScjEyEBNBHzw4u7T+M=;
 b=G8dainAqSuOzPpJ0LR2ObVifZj+zgdtQvoc9b6KW4tzLjS/TuALChyR6jn/l+/AJ2k
 4qG4pWjFRjQTX68/VMC2PJcjFXvsDg/ad9qBAl7R2iXZI5p/DF8wj1h1Ymzkwv0PA7op
 oDXWQmZDciozgT5/sYW47/o6q3aWv45yJrA48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f70pptS+xBg2CCCgan9PBj/rQScjEyEBNBHzw4u7T+M=;
 b=fAgV5mgMzPwFw6OLl6DA2JGmjI5+LQcprDHJWeOPJ9J/opB2PdbyfMpyMtcMy95fLK
 bFj6RECxd6E6KCYmFM4TQTYMz/E2DzCOwzYDltvGguv3NvPwAoeopwfqDxjmbRg5yTDr
 S9gJu0hc8Kid31DO0Qe+as16E81uqKaKYBZ0kZtLtSHaGs4Q4wVQcQbIWtmdoSZWWi2l
 QeLi/KDCBcjwAJsTyiXysQHfHETSP5dOeO+2EvIPm4THc74YZdyhXOTGkBjTU8rOGTDH
 Tei1I01WZRBDwjVt3VastRATtFHQ7AeXbbIwYT6a0nZS4jwgK/H7oXh7q4/vcjXLQvW3
 5eAQ==
X-Gm-Message-State: AOAM531cS4nSzi3xFFrLOpqQ58JtlKeQ4/obimPEp+/2Uy8RcULZ+G+V
 TfgQqRFw2dfF/cFeo83iDm6HiQ==
X-Google-Smtp-Source: ABdhPJx0LLxtq0K5T1lDWAZYUIb+TL9w1aQT7edWeF2JevtQ3nbfvXxsk2DorEaIlat83geLiaoWPw==
X-Received: by 2002:adf:d222:0:b0:213:7fbe:5f58 with SMTP id
 k2-20020adfd222000000b002137fbe5f58mr31189264wrh.220.1654704367685; 
 Wed, 08 Jun 2022 09:06:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4483000000b0020fcc655e4asm21834684wrq.5.2022.06.08.09.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:06:06 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:06:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
Message-ID: <YqDI7XpDSS6hc2L1@phenom.ffwll.local>
References: <YpkYRMojilrtZIgM@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpkYRMojilrtZIgM@p100>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 10:06:28PM +0200, Helge Deller wrote:
> The user may use the fbcon=vc:<n1>-<n2> option to tell fbcon to take
> over the given range (n1...n2) of consoles. The value for n1 and n2
> needs to be a positive number and up to (MAX_NR_CONSOLES - 1).
> The given values were not fully checked against those boundaries yet.
> 
> To fix the issue, convert first_fb_vc and last_fb_vc to unsigned
> integers and check them against the upper boundary, and make sure that
> first_fb_vc is smaller than last_fb_vc.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 2fc1b80a26ad..c2f9e5711c39 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -115,8 +115,8 @@ static int logo_lines;
>     enums.  */
>  static int logo_shown = FBCON_LOGO_CANSHOW;
>  /* console mappings */
> -static int first_fb_vc;
> -static int last_fb_vc = MAX_NR_CONSOLES - 1;
> +static unsigned int first_fb_vc;
> +static unsigned int last_fb_vc = MAX_NR_CONSOLES - 1;
>  static int fbcon_is_default = 1;
>  static int primary_device = -1;
>  static int fbcon_has_console_bind;
> @@ -464,10 +464,12 @@ static int __init fb_console_setup(char *this_opt)
>  			options += 3;
>  			if (*options)
>  				first_fb_vc = simple_strtoul(options, &options, 10) - 1;
> -			if (first_fb_vc < 0)
> +			if (first_fb_vc >= MAX_NR_CONSOLES)
>  				first_fb_vc = 0;
>  			if (*options++ == '-')
>  				last_fb_vc = simple_strtoul(options, &options, 10) - 1;
> +			if (last_fb_vc < first_fb_vc || last_fb_vc >= MAX_NR_CONSOLES)
> +				last_fb_vc = MAX_NR_CONSOLES - 1;
>  			fbcon_is_default = 0;
>  			continue;
>  		}

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
