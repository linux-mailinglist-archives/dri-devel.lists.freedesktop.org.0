Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338C7259A5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244D610E48B;
	Wed,  7 Jun 2023 09:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31FE10E492
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686129026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
 b=L8+S44GvM1a9NFo8jy0qKEPfd32atnmzlXWwEixK38r3RihdJt2uIKLgo6ODQKUMEpUGuG
 0YWUL5x4FCMZ0gsu+wjs3mEDP0HPfimCQ8NKwouuRzskRbG9ttmvK5oA1I5b9lJVnQWao/
 7dLWYrTSKvxFZ4M/y3mar+oYM5xrq+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-hI-uk6hSOCCL_UlugaIygA-1; Wed, 07 Jun 2023 05:10:25 -0400
X-MC-Unique: hI-uk6hSOCCL_UlugaIygA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f613f5d290so120089595e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686129025; x=1688721025;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
 b=OWszYG9ub13mEGFK6vrgjxE4ywvzQHIX2IxNfn7bDAfC7f4Od1uE5PewRtEjehl61E
 y1d3FO5JNmF96uW344JtIEADgH4sdJtuoDlh8tz3U6j94Z8rxw8hxz7YHfE9+y2ORZWR
 cgps7WobnaVB22HCA8jzdCKE2JO3GMXesdug8bmNEWZwChRguKzM6qK2hTOauof71YKx
 efOx4u4ftKolIn8owJuTg4lMoct3f9jdU20abGzYKqH6fyvJhswSQbePCacRWUEafMJf
 EBFlcRY46+mAU27QG3AOYUVTLRPGUvRX4B+P9lIPqOzfbQxjEAqFDa5OZFmTvNjJUYGK
 ocag==
X-Gm-Message-State: AC+VfDzhFMiNBpsN3ohEQZMsLlGQFT+mWbLNIQA5gobKLvyVjw4bpWB1
 TGgC+KyJRCGY5YfyvMXH3x41T7a1+iNyumvdEVsst/cC3dW3OeszsqQE4jIUmFZS0s2MFh1YYJ+
 M3tt4+DqibQ3uGd0deVhAywXwl9ES
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id
 hn21-20020a05600ca39500b003f7340117acmr4587425wmb.5.1686129024878; 
 Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ePD432YmabNuUR+sxJiR/Lq4y75rOFMJQocJYAFtsL3UId8CM+YY12IKNvHU0PgR+SDGlYA==
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id
 hn21-20020a05600ca39500b003f7340117acmr4587416wmb.5.1686129024708; 
 Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b003f7f249e7dfsm983105wml.4.2023.06.07.02.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:10:23 +0200
Message-ID: <87wn0feiyo.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

