Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBB87EE84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 18:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4F310FCF4;
	Mon, 18 Mar 2024 17:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XRaom1ps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2C10FCF4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710781922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vRhrKj0eRcdwyPwJxDdsdwXT1UnIfJmB27QpA0tWJU=;
 b=XRaom1psS3Tczzb2ECtJ/o9InBsa+xOPRYJ4ily5G+bP396v26Cf4UWyPIvwnmCgUdqDGw
 qEYwa9bmLN99RDY5I6z71nVXjhsSYuFpOC7SvWW0wGOSgAtN9aUftcx1k9IenD/LR/nzaX
 3bZl6m6WRNgyCx0z4KrBA2JY3firiOs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-juHC1lbDM2WpHeGhKN_jrA-1; Mon, 18 Mar 2024 13:11:59 -0400
X-MC-Unique: juHC1lbDM2WpHeGhKN_jrA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33e7ef510aaso2903414f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710781918; x=1711386718;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3vRhrKj0eRcdwyPwJxDdsdwXT1UnIfJmB27QpA0tWJU=;
 b=Jec59qmm+N0A4ll4h93cbnUX74NvLUXdnNLApFvXz8mieekRhpqSdUObn/TmAKNKb7
 Vc65jxAn3pC1D1qB+j8ijsbhy4lb6q1cuStG7danSZl5ciI774rLHWtZ5h3sMqBKBZp/
 2FXpL0rc87Es/uwqihgkEY4NLKMLUYuSkWKaWFGirDnqSltSLlnaRqN6acE8ZvSKqiiy
 KUjcwZNtgdrlm7/H07Wlu6z3rmTBbGfRrlgNFU2icRt1ujAsCsR6B3PyyV7x+Pqk/Jxp
 mE0TOpBplrI7dwilCkhFgUH9qmvwZb+gR54NY/lVuZx97F+ulT9Y28buPh0wS71e47Lo
 XLsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXasyYxFM3nETB/mu89GcN3DWiv5jo/78Mb1WcQQKUNhZ8AKqW4LpqzJUSU3OBaT7fsY+Bon+ztWogdE5HgLTvsbMC08YjZnS9CYMMq8/Ep
X-Gm-Message-State: AOJu0YxKkxS521w0OjEOpg5KlByjFqoLGJ6BBBkliz8QeNYinjFDqpb0
 YTRdwC3euJ5xTZqrmHdPHrNTes4BkiqNAEZnI+XSELAEPYv67NNXjxJVGzxj5O8kGeOnBpOOZx/
 o2ccBiVTc7feL4lnYGt8tp+iISCEtmhqY8e+CT8DLBqwwaA98bUFVgzrhBZlVdzey0g==
X-Received: by 2002:a5d:65ca:0:b0:33e:7873:e235 with SMTP id
 e10-20020a5d65ca000000b0033e7873e235mr6095771wrw.43.1710781918436; 
 Mon, 18 Mar 2024 10:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqEfk0sICBaJNhEW1F/tUVU2GCwld0u8wBxQ3mmJGAa7E6HV9dWIbdUf1By66F59dzlYyHog==
X-Received: by 2002:a5d:65ca:0:b0:33e:7873:e235 with SMTP id
 e10-20020a5d65ca000000b0033e7873e235mr6095758wrw.43.1710781918016; 
 Mon, 18 Mar 2024 10:11:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v3-20020adfe4c3000000b0033e052be14fsm10228243wrm.98.2024.03.18.10.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 10:11:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/43] fbdev/deferred-io: Provide get_page hook in
 struct fb_deferred_io
In-Reply-To: <20240312154834.26178-8-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-8-tzimmermann@suse.de>
Date: Mon, 18 Mar 2024 18:11:57 +0100
Message-ID: <87il1jform.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add a callback for drivers to provide framebuffer pages to fbdev's
> deferred-I/O helpers. Implementations need to acquire a reference on
> the page before returning it. Returning NULL generates a SIGBUS
> signal.
>
> This will be useful for DRM's fbdev emulation with GEM-shemem buffer

GEM-shmem

> objects.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

