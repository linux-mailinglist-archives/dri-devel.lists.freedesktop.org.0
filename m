Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95907B01B80
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B9410EA3B;
	Fri, 11 Jul 2025 12:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GwvvLSdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821AC10EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752235686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LxBwKtKzZA1zVZeqxIiJszXoyzxhRuRBKZexWiuAeAo=;
 b=GwvvLSdlAzYKwSkIUm8WoiE7luGXhzcPnpTd883X5C+4PNbP47DWKfezw0qpbBfqC13hGP
 2s2J5xNiWYceHAvrvY+b6X/gZx12Twatei2Oy0DGormDhHbA68BF5H39fCuAmcsMLZf6rw
 4DBhu+Wi6zjZNlm8EOkRflnnyvHOcEA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ZuRScdJRN7WS98Z0c_Rc7w-1; Fri, 11 Jul 2025 08:08:05 -0400
X-MC-Unique: ZuRScdJRN7WS98Z0c_Rc7w-1
X-Mimecast-MFC-AGG-ID: ZuRScdJRN7WS98Z0c_Rc7w_1752235684
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-454e25b2b83so7534795e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235684; x=1752840484;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxBwKtKzZA1zVZeqxIiJszXoyzxhRuRBKZexWiuAeAo=;
 b=dLTb3AQtsJaall7UCixK8KIkiPQ3uUw0hbc3seM2oxARz7yD1coeXUni+9ssNsdDxq
 NyYsnYbENsMjEMOFAmJp87Tu8yUSS2XDdFOskZQDvCBMxDskUpYnBoj4rYBQH6JntcCi
 X6CjuxDOyHljFcIc8NIavwHY1d47zPJrG3dpIkCdOg7YkRm+CunjQW3Yr7Y+hgqm5X5o
 UrfX8L839qw4anBpJZ7fs4/MnTpEMeMOp2BaIQtaNYopVVGVZr52fSPUATcM16LDOEri
 k32RcSBx+DVgPtBGRw9AVdM5HBrXaUzDnswhRRrJTyTRkiA/RGXWRHbKgHa8jxtqzN5T
 xd0A==
X-Gm-Message-State: AOJu0YxPGvZZeWVQTS6ZxZcJCHuUgJ0ad7m2cUTC3zHgyVqyS0hHKSkM
 QiDTk5RVV1lhSuF8C3pS0RG/kzGkP9uw7+3HUjW/bHOqtebJOoM6qnfLSnHGRcft526+hgyNegP
 u4ZO6BorrRtjAq1MMghuzBXIQITOa2EqalCkfmFq93tK+nyje/h5z0MWaCnL/TIRVpDae3l004E
 mTmg==
X-Gm-Gg: ASbGnctNw1xvJQQTRNaFu4LYaYvZLoOJ2EzMHfKTxMlVsP6zh0aO6Lf90E9n1apzaaH
 33Ua1+ubJHJjDEYCkjlzSK3m55B9t46Bdin9eJ3s/K+5y6NSW3T5cLtZ9ua7pEg/53g63hydtjX
 xVh6rv4eQ29VAWuNetj9taiV1ID72efol/AQU8xhOVH0/KHvKPLhQt6bcFdE8TZFJaXMprfj3eJ
 5WwUCvse3PkqDA0ScnPM5iq9zfn0IsTgfn7h+F93mpaKuGeeZU8MCnooqdYRVQFQN2iOgfLEa46
 cG5syxO+jRoRsYhxwMlG92qymC6IMnDKokALBd6nv+1kTuxFD3QHVPEfTJaYyTka4VhIf7eBUNF
 paVCDoT3XJxaqKlTj9G6r7Q==
X-Received: by 2002:a5d:64ec:0:b0:3b4:6577:eed5 with SMTP id
 ffacd0b85a97d-3b5f2db1739mr2218303f8f.12.1752235683851; 
 Fri, 11 Jul 2025 05:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97U/XONoOCId1sSYHUDpJbn8iTn25sBbZ08A1J+e2u5zcf9zXTWIICgl+EH8uX37Cm8s9Kw==
X-Received: by 2002:a5d:64ec:0:b0:3b4:6577:eed5 with SMTP id
 ffacd0b85a97d-3b5f2db1739mr2218244f8f.12.1752235683210; 
 Fri, 11 Jul 2025 05:08:03 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d88dsm4357598f8f.65.2025.07.11.05.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:08:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm/sysfb: Find screen_info format with helpers
In-Reply-To: <20250617143649.143967-4-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-4-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:08:01 +0200
Message-ID: <87v7nzdj6m.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J2CEKUqsx2G2KkHFFO8nfGKusyUT45NvxxeSEdEqYQc_1752235684
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

> Convert drm_sysfb_get_format_si() to lookup the screen_info color
> format as struct pixel_format with screen_info_pixel_format(). Then
> search the list of given formats for the screen_info format with
> pixel_format_equal().
>
> Replaces custom code with helpers. The pixel-compare helper
> pixel_format_equal() also handles indexed color formats. Prepares
> for sysfb drivers to support color palettes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 21 ++++++++-----------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

