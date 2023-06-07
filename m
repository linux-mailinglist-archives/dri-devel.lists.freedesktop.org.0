Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D90725998
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B998F10E484;
	Wed,  7 Jun 2023 09:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA0510E484
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
 b=arIXfBEYN6IM8CQbHpUfWR8D6iaDFiQbOWVyTTSvfj8nnZOr7p2sIRIYIH4Jy8Ufwyokgu
 /g2v84TNtexuhPSIDFT7mXHg16BNzNE/vRZUNtx+5tYcspqA9jk+mloVnj3Nc2We9deP81
 2j+vPm5/natzbSqgMPcKR/OpzUbnPNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-l69nDDnUO3OQ3XhF2AXVbQ-1; Wed, 07 Jun 2023 05:09:24 -0400
X-MC-Unique: l69nDDnUO3OQ3XhF2AXVbQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f5ec8aac77so43018465e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128963; x=1688720963;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
 b=e++sYUcLwKMcwStXy4H+TH4YUmncGEEJxR8pzBMyjFDDhoqRBeAIfuxf+5h02ydNla
 gZYNNv9zvS5kjSLT2XqJwQqZlDYZas7G1pTLrotv42G1MlVsnKht8KZJWKOxYXRDSMIr
 UmFwm1Xc3pbQ3bfVunPiuYdi9WCqGqTDoLtCZbKCkWkRbBBlSf37mfhnGc4prz2MscBK
 T2/gBWCydyx7lZ7zpkkb8nFUdPrMjZhbIWGFY+r6KguEDOBR4vtdTTpj+lobiqSqF2zk
 V7/vFyYEfJ2l2vHQkgsSKGIRs2o5jXb8pPlO3IzYymWah0WcDKJtnBy6D92XYweXlsOh
 aq0Q==
X-Gm-Message-State: AC+VfDzIqd18ZygF9iCnZgAEQlqPNdbCQXJ5GeWkKfr71PSxqDC0fK8v
 X6VsBMRdBWrxQdknHSyqQHBtD4jpNhZl5WBz7700QLIcHfiJexBt1/I+09ztkr5oKKy4giiFtSX
 mfAP9m1v5B4FZSn3YDFjh32FwUq/B
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id
 k5-20020a05600c0b4500b003f4d18fb2fbmr4423500wmr.8.1686128962967; 
 Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KIDwr6/boDKEelyImr80QUEOg3IdkbWZ6AUo87k2W9nGNMdMne7IQ3JZzUQzQ4CBO1bqmKA==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id
 k5-20020a05600c0b4500b003f4d18fb2fbmr4423483wmr.8.1686128962700; 
 Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k26-20020a7bc41a000000b003f60e143d38sm1426996wmi.11.2023.06.07.02.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 16/30] fbdev/pxa168fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-17-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-17-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:09:21 +0200
Message-ID: <873533fxku.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not assign the hardware device to struct fb_info.dev. The
> field references the fbdev software device, which is unrelated.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

