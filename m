Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746880F8D2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 22:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5210E64D;
	Tue, 12 Dec 2023 21:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F032010E685
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702414895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVAsjbMqpYyZ3IkWoFHSbEJwyLTdmo/iH1LCGeQmZh8=;
 b=CCftcmEj0VQihXSwT3vNmN9Fe4kIAVZUUkBLgO2c+RoAmwlM36T0jCh14twu4FumAaDfbO
 1j+3lkgXXfMh57u6navAN7zAUVD+VPfQ6qwOaydeTHi+w7/SWeZt0YNSIVIJj7VHzmoijO
 cfdEqq2E47o5sP7VE0Z+bVD8nYdlb04=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ojuRPel6Pwi_3fiWU-8jSA-1; Tue, 12 Dec 2023 16:01:31 -0500
X-MC-Unique: ojuRPel6Pwi_3fiWU-8jSA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-67a3773e271so76762316d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702414890; x=1703019690;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVAsjbMqpYyZ3IkWoFHSbEJwyLTdmo/iH1LCGeQmZh8=;
 b=c+Y/1xQKOAoCzJsX94Uy7TJu6ROx9j/xXurm/IdtKwcLLnSfUQHCO7Bbz4Um+n8Q+L
 WMoFY0vcJrVRHWKDjdthu1T6xhZp8yTaR3XoOiwyamGAXs7Tvp1ZzwOeee9iBfQ0mOYo
 KsDnkvyBXapdYevjxAKRKSoKmu4aFWi20t5Ku7RnyN7csN0qyrok8hzGb2lS1FrEuCXs
 1qe7u0F1SipQyFabj3JCezPtxPGIPkFWT896RA7R7SylKPWv/CXiZeIwnmaoJOXU/7o5
 aJ2lgwbWd0z6MH5FZuOb1puk5o+owg0lRf9Lf0qJUEunFh//PIaDnWx5Ctb/wKFoQXIG
 gpkA==
X-Gm-Message-State: AOJu0YxCzKxQW3lmAYsLpaThzesdP4w6q/fBFP0PbNnwOmtpMTFOipoJ
 /feFE0rQxUz6zo37FJo5o/RgxzGMq3GN4RIM9uMIWM7ARJI79sLMe4dFQhsYr6CM8cihGRs/qI5
 h1R1tEDZ4juXuk94wpKfkOwtQB/b4
X-Received: by 2002:a05:6214:e8d:b0:67e:aa5b:8e9f with SMTP id
 hf13-20020a0562140e8d00b0067eaa5b8e9fmr8845942qvb.62.1702414890658; 
 Tue, 12 Dec 2023 13:01:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVewhRs7Hdh5QT+34KH2wML5O8m9XHLGWFWDGFa8wOrPNpZCusPikbcT6klf4Qm0z2wwfb/g==
X-Received: by 2002:a05:6214:e8d:b0:67e:aa5b:8e9f with SMTP id
 hf13-20020a0562140e8d00b0067eaa5b8e9fmr8845928qvb.62.1702414890410; 
 Tue, 12 Dec 2023 13:01:30 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a056214008600b0067ea8085b71sm4471934qvr.5.2023.12.12.13.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 13:01:29 -0800 (PST)
Date: Tue, 12 Dec 2023 15:01:27 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH] fbdev/simplefb: change loglevel when the power domains
 cannot be parsed
Message-ID: <lv3bauwrmy2bkycijpmgmym6x2kxo57twl62ttpgsbwecmxoge@quhe7siu6zdp>
References: <20231212195754.232303-1-bmasney@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231212195754.232303-1-bmasney@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, treding@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 02:57:54PM -0500, Brian Masney wrote:
> When the power domains cannot be parsed, the message is incorrectly
> logged as an info message. Let's change this to an error since an error
> is returned.
> 
> Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/video/fbdev/simplefb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 6f58ee276ad1..028a56525047 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -470,7 +470,7 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
>  		if (err == -ENOENT)
>  			return 0;
>  
> -		dev_info(dev, "failed to parse power-domains: %d\n", err);
> +		dev_err(dev, "failed to parse power-domains: %d\n", err);
>  		return err;
>  	}
>  
> -- 
> 2.43.0
> 

