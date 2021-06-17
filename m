Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411F3ABAC6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEBD6E972;
	Thu, 17 Jun 2021 17:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16D96E972
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:43:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r9so7692520wrz.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lwAc1yJsU7uwawBw0jrP48508Sb+GisUBuf8mUw0CSQ=;
 b=GHO/YGfyYyqABj7MtIl2Wu+QGpEAaK9gSOyMEBLNUmZuKIoPtNcNpaudIKwcLpYNwq
 v9yErUT7CVuhhu7WS69FNtnv6SfOcLPFdEPbOuwWHMX3IkFPjoPqlR+nw3M+e8XdPImB
 fyvTLKdD9PlteoBOzvL3i7bIoZXW972HX8tfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lwAc1yJsU7uwawBw0jrP48508Sb+GisUBuf8mUw0CSQ=;
 b=OYJQSbS3NZpYvcREh18wsD8PIx8UwE4gE0SIgYYN8WiB2mtMXP8qdWDXu0jSIZIj5o
 aNxmR47pAwPlIbqyCUJo9i+Oe7JNGBMKsDGMloIeic2CjWIa8hBNMYvveADWjdVS4pcP
 o9taKBbi0moTTfuuzvUtnXg/ob1qyVttvN4xWAHMaSbHY2hx5wRrvDlLKTAR7nfum8eP
 gZaS0awF4VTHGTvF6Kc64XQTgq/3MedGLtvVf6SORHm6nX0cTq/EtteL0wd+vEUHWR25
 sjWGnU5y5z7hvbvcZf/CRnv+FUyiwkJGcj01eyO7DJX9745hAchSfICoWYEvlgXp7nWF
 OZlg==
X-Gm-Message-State: AOAM532i53QGXAeZedZ+L0UbzQid5+znJSV8PwUJj7JCGUY1VBxWdAh5
 vEwSKQX6W00MFDt8C4ziZaI64g==
X-Google-Smtp-Source: ABdhPJy8rMAYADtfeD34I2hGI8dldj1XQ3SPJhezGzk35Mij40UgqvDBe673mzz+rNw00QZ0B4G+Cg==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr7390981wrw.389.1623951823445; 
 Thu, 17 Jun 2021 10:43:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z18sm3195872wmf.18.2021.06.17.10.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:42 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:43:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yu Jiahua <yujiahua1@huawei.com>
Subject: Re: [PATCH -next] apply: use DEFINE_SPINLOCK() instead of
 spin_lock_init().
Message-ID: <YMuJzDxblPNkpFjH@phenom.ffwll.local>
Mail-Followup-To: Yu Jiahua <yujiahua1@huawei.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210616031713.24959-1-yujiahua1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616031713.24959-1-yujiahua1@huawei.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 07:17:13PM -0800, Yu Jiahua wrote:
> From: Jiahua Yu <yujiahua1@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Signed-off-by: Jiahua Yu <yujiahua1@huawei.com>

Stuffed into drm-misc-next. The subject looked a bit strange, so I fixed
that up.
-Daniel

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/apply.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/apply.c b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
> index c71021091828..acca991c7540 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/apply.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
> @@ -108,7 +108,7 @@ static struct {
>  } dss_data;
>  
>  /* protects dss_data */
> -static spinlock_t data_lock;
> +static DEFINE_SPINLOCK(data_lock);
>  /* lock for blocking functions */
>  static DEFINE_MUTEX(apply_lock);
>  static DECLARE_COMPLETION(extra_updated_completion);
> @@ -131,8 +131,6 @@ static void apply_init_priv(void)
>  	struct mgr_priv_data *mp;
>  	int i;
>  
> -	spin_lock_init(&data_lock);
> -
>  	for (i = 0; i < num_ovls; ++i) {
>  		struct ovl_priv_data *op;
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
