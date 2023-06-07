Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CF725907
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ECE10E476;
	Wed,  7 Jun 2023 09:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157D510E476
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
 b=aXSayM6ds2nRrTCS+Qcapo0hKe5xZcRkKIHsMW37HxsvqTFTnOaP5WEfUGSBIZzdIkPjlt
 9rLkbOfIAJzHzgOkZD4+AOEyUvO2djlHS2jt1vpj/oju5fNURqeU014t5/EPdXId48NiEj
 dTn5ytekCwdAMqymS9twHpBMLw9aU3Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-0ph3tVTyPFqFegSw5SmW0g-1; Wed, 07 Jun 2023 05:00:21 -0400
X-MC-Unique: 0ph3tVTyPFqFegSw5SmW0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30ae9958ff6so3227723f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128420; x=1688720420;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
 b=ObYw1O8reIW7YkcYVWskr5UoFhub6S0UrtG5Brr/slELeMCtviNXHnL7h+qG+yoAWf
 8kQsFXJrOPE52EoAxXU8ecjZ2Xr86KSf3M5cQ1BOZIvMsY+Bei6k9iqQND7OOA0yBglr
 wP1IiYck6uNFiJ6ynQDbPRjRDDRgl+GZNyY8wJylvA9WUNKXGXkwVXvNCQe2msHgV65y
 SN6voR1KC2LFwlzsJMiZy4VTM0XOSgQC7MyONc9aBJdWcY1TZgEUIQnEHtbnJASTyUe3
 jlJ+O11Ca8E9rvATL8i66sKiJ/Yax1kMPqJcoU7p8ojUesa2QVbbKSfoXE6cwli6o8mD
 /y7w==
X-Gm-Message-State: AC+VfDyHTbBA+QDC6lwqF4jmTk6RaZfuOT8eN+4I3mXVdGKs2zJcSuM/
 puX5ADMzNQ4vN1ZGMiNVpBTXiBIIcqeMs8spzi7AqvbI3QWAlJtw30zONrOvZh9AD8XDsgGgSYA
 0Bdv3nNAFep1GICwrheN/kW0K81FR
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id
 a3-20020a056000050300b002efba4fc821mr3492633wrf.36.1686128420034; 
 Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6K7G3bt0VUByq7FRT2lQ5ZRsRDVTyfbQ/GNM/0/foGN7SQ7frEuHnXH19X2JYBcLKX3c3pJQ==
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id
 a3-20020a056000050300b002efba4fc821mr3492608wrf.36.1686128419772; 
 Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d594c000000b0030ae16132besm14801751wri.12.2023.06.07.02.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:00:18 +0200
Message-ID: <87ilbzfxzx.fsf@minerva.mail-host-address-is-not-set>
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

> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
>
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

