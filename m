Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7080475A04F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 23:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CADF10E514;
	Wed, 19 Jul 2023 21:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCBB10E514
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689800655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UtvnYzoD0hTrn0V/d7YsuJa3bzzNU2UnBUdhkM6arg=;
 b=Uz/awoxPhL1t3OFoT5zTHu93cHmhaWe/mU49W9+AzgN+bc6iX2bmGimnq36I1XQvDBfwcU
 FBA/4tn2CvebxZ0+Mt1YsFmXi2qwCWA7VW3hE2k4JooGIw2q0b+ab22N8PfOL5UxbFMyAq
 FrEEYdD4vV7RJ9ZOXPWMxi5nIAg54+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Wa7-Cra2MeOy6buD3NZpUw-1; Wed, 19 Jul 2023 17:04:13 -0400
X-MC-Unique: Wa7-Cra2MeOy6buD3NZpUw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3faabd8fd33so479325e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 14:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689800653; x=1690405453;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5UtvnYzoD0hTrn0V/d7YsuJa3bzzNU2UnBUdhkM6arg=;
 b=RUPuhT9aM/24/9vplQ923kipEwyvf+Zpx/kJLv+eEhQQKypQVtk4VK4SiZcrLrBYdR
 1octNGWrScQM9viW0VoV4v2bSITuvy151KTotmxp2MBvtDCh1CeKGd9126gzwroiSoLW
 CylmyJBU2gyUG+1XnfM5UdGHP3di5luOZd5wAph6Z9J/CvySMaEULo/Sg35jBAzbChI/
 xhHDASDjx1Ma7QVZnZ09sRxg7ocAyOKlkG2IcBOfMPS2HqEXJtL0ej8yAQJ5ghyE9Ffn
 7WL/tjTP+HfVypfItUJiuDvMuxixC1SFD2hAap3fUYZDF4yqKys6nCoplCqZkSl/3BAP
 WVLA==
X-Gm-Message-State: ABy/qLavXSvG4fT3ebO2m+9xgIN7ZBDrChu6xkYUXnkpBl5gOy+ppTmW
 tevTJe1ePFPWvSMvibG8AaQuQ9tr+rSoDO5Sn91VU6UN/zymJqFHXx0zm2vqtzlNbI+BegFVz/1
 B1bgPFp3wvSXoXvJVggTh+Rnqc6/C
X-Received: by 2002:a7b:c417:0:b0:3fc:a49:4c05 with SMTP id
 k23-20020a7bc417000000b003fc0a494c05mr2605694wmi.40.1689800652863; 
 Wed, 19 Jul 2023 14:04:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGFMEBZUtWgLIXmLJGFgFBrBgcH+QPCPcyjvXHCOqZ4qj3Y2EJEdDf0aE7BHfrJp9fobuCGmw==
X-Received: by 2002:a7b:c417:0:b0:3fc:a49:4c05 with SMTP id
 k23-20020a7bc417000000b003fc0a494c05mr2605683wmi.40.1689800652592; 
 Wed, 19 Jul 2023 14:04:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q22-20020a7bce96000000b003fbca05faa9sm2462505wmj.24.2023.07.19.14.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 14:04:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, emma@anholt.net,
 eric@anholt.net, tom.cooksey@arm.com
Subject: Re: [PATCH] drm/pl111: Fix missing unwind goto in pl111_amba_probe()
In-Reply-To: <20230329171824.1159104-1-harshit.m.mogalapalli@oracle.com>
References: <20230329171824.1159104-1-harshit.m.mogalapalli@oracle.com>
Date: Wed, 19 Jul 2023 23:04:11 +0200
Message-ID: <87y1jbipf8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, error27@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> writes:

> Smatch reports:
> 	drivers/gpu/drm/pl111/pl111_drv.c:300
> 	pl111_amba_probe() warn: missing unwind goto?
>
> When devm_request_irq() returns non-zero value, we need to drop the
> reference for drm device and also release reserved memory which is
> done in "dev_put" label. So instead of directly returning, goto dev_put
> to fix this bug.
>
> Fixes: bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis, Only Compile tested.
> ---
>  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The patch looks correct to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

