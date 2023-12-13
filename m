Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B88810DB0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 10:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476C010E269;
	Wed, 13 Dec 2023 09:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD44A10E269
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702461032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1d5lTjfGL0cpfRX3W23YaewhbKiq0LrOed7Lf2Vov2M=;
 b=HFG8zVWCPe5olDvXvmCMovHD7E1uoxlocR4dvfEHcCitj1SwTFT5/l46eINpBIlNPuxm7k
 bOIdU0+u/kN5gmernMLuX9bus+5cf6sgF2JFT6Gcs+mk4x7vCrKvaQ8X5f2FhzdnLDwM3L
 fgFpPRNxyblQmN6Suugmlsh5uDJmXFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-otWBqP3rOQit5bcMhPdLeA-1; Wed, 13 Dec 2023 04:50:31 -0500
X-MC-Unique: otWBqP3rOQit5bcMhPdLeA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40c35d1d776so37296535e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702461030; x=1703065830;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1d5lTjfGL0cpfRX3W23YaewhbKiq0LrOed7Lf2Vov2M=;
 b=nIn+9caQp6kR50B3LyxY2GRtE4KwolH6srmvunip7WyvkMcQF8baTtljCzfn07L5JN
 UsnBOaUlq6MIYjYw5jDsyg4nHJqadKVvoc3ypqTK8hnsdH4TDRnqhBj5ifR5U01jE7Cn
 tT0YFwW5rCpJ7NS7NFYBAnsMxdGNS1Yujae27zvJpRouR+oJ51akdxshOD9Bea/D8KcM
 iTcgFv9r9bCWPzi9ClsRjAhHGePoanTBrIOuutZIcyrUa554zoKyrmjbRpVA6GcfY/+u
 TM/nb0J7iUIRsB/uH3VSaNkDGMHcOHIwBfOmSXsK8U489ALO751G75Po8XHKmaGKRjfI
 jhwA==
X-Gm-Message-State: AOJu0Yyom6TE7NxyspuZ8H1OCP1tCiYvvJ2Kupx4e6FAVfpMIHQQJ4GG
 SBWVo0wKondpN77anRf/PDKbk1/fAQ/OI9Sh2yIE/lxkkJm6+rEkQD5vAZ69EWg0No9utAIeyCe
 271dUXrL5SwGdEUMGETLBjg3Dy6z6
X-Received: by 2002:a7b:c395:0:b0:40c:3244:fec4 with SMTP id
 s21-20020a7bc395000000b0040c3244fec4mr3483363wmj.218.1702461030250; 
 Wed, 13 Dec 2023 01:50:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgqSGM5YlkgEE4x2dZgTCXId+uIFj/eI1/Jsb2o77bKsWa4g8US0w4RLcc8W0HwMqp/ADJ5g==
X-Received: by 2002:a7b:c395:0:b0:40c:3244:fec4 with SMTP id
 s21-20020a7bc395000000b0040c3244fec4mr3483358wmj.218.1702461029873; 
 Wed, 13 Dec 2023 01:50:29 -0800 (PST)
Received: from localhost ([84.78.248.162]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b003334041c3edsm12872969wrx.41.2023.12.13.01.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 01:50:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brian Masney <bmasney@redhat.com>, hdegoede@redhat.com, deller@gmx.de
Subject: Re: [PATCH] fbdev/simplefb: change loglevel when the power domains
 cannot be parsed
In-Reply-To: <20231212195754.232303-1-bmasney@redhat.com>
References: <20231212195754.232303-1-bmasney@redhat.com>
Date: Wed, 13 Dec 2023 10:50:28 +0100
Message-ID: <875y12o2hn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, treding@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Brian Masney <bmasney@redhat.com> writes:

Hello Brian,

> When the power domains cannot be parsed, the message is incorrectly
> logged as an info message. Let's change this to an error since an error
> is returned.
>
> Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
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

Makes sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

