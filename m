Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F640A7633D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B162A10E3AD;
	Mon, 31 Mar 2025 09:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OTs+n3aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688F10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743413735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwxjR5qskJ6d4ON7tyeTr4dsSc0P/cnEnzuFyav8Jok=;
 b=OTs+n3aCgg4JWGcpCsh7LlHLSargTYYY771qFbrDO75jfw5JPphKi+/Xs1R5FmOhMDAf+O
 1wZZxk3OPiK4CBobg0GAB67J9X8Kq3z2cKaghTCFMzTg3bKe3YiqHpzg4lbXstG7NAyNIH
 ufrPVvKw3ebImON6PlmuhG2jA84QS30=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-wRpbbSgAOTmIRZvwpa4KQQ-1; Mon, 31 Mar 2025 05:35:34 -0400
X-MC-Unique: wRpbbSgAOTmIRZvwpa4KQQ-1
X-Mimecast-MFC-AGG-ID: wRpbbSgAOTmIRZvwpa4KQQ_1743413733
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf446681cso25334885e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743413732; x=1744018532;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwxjR5qskJ6d4ON7tyeTr4dsSc0P/cnEnzuFyav8Jok=;
 b=EMdXDq3eRzYAApMHru4+l3s1CSHqj2QFsvDBaeLzfXk+tZE2sz6cUoLilkb4WoGDU3
 EvoCqNnzVJG84OwIJsVLs4/ckHzvO5gLe2s670IRygQAJiI/j3fw765m7Dbt8/V63H1p
 rSdVlaP1NJD9wN8pdElm+YfkFhrWd1yLbg1NztbOK8oSItDu5aNguiCBbmafBl8wS3oh
 zSCTBq7jnmwqjTuj3VOu7GSANa3VPmyW3YE8wrqZnwhjXYRJS3WSL+PImc3sZQL7UTkq
 BCYklByaOypiRU3AbOKa95UNkV2oYwsUWQ/olGhcXWxwkMNsPOglg7Ch23hEvSSNyXP2
 hiBw==
X-Gm-Message-State: AOJu0YzwHXqDPYGaPUy2RSUi9lTB1VJX3zHZsQelEW4CbtXHzVFRjkDB
 U/4yRQkbLvMbjOcdwy4ov9ifTQ6C8q5yoiX8eYzjR6cShRfaglj/Fq2xshMtQDNHMcZm46G9Vu9
 cnLtIFsLEQx80oPcjltmh1SWGVukCEZtNljfpzV/sTOt496y37Ji2wvhypIk2OK2ry/HhXuH9MQ
 ==
X-Gm-Gg: ASbGncuKL75/AlKFR8j6MkXcQUCPNafw/G9KnYKh8Lq8uPd5USp/2bX+90yhw1w993T
 mLGncfnmjAdWS2ngSjAsa9dCPBqECGPPimZxUiTRmSN5jyAlw87QczFOdjNZKw/zqMYH3xdfEEm
 NZuA+0JAHD7uKxKU3RXMiJ6jweqdXzKnnsXXj4QZbIwnIzAioIuCvpWzln2vuHQHeoEkrxMyE9v
 l28XjMzmyUtDjo6UvftD/JJX/pbl2LGkJQrmrcrYRstuWfft/DpjckVO7af12dFH74U2eGDG2B2
 YlfpZy7wKIwQ6lpdizKKFz4Tj/Kyb6Wm0tBvlC4pXRDJ/A==
X-Received: by 2002:a05:600c:1e1f:b0:43c:fc04:6d48 with SMTP id
 5b1f17b1804b1-43dabe18000mr93535625e9.0.1743413731830; 
 Mon, 31 Mar 2025 02:35:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFczXkz44EE60kagqeTYyqxb3SGNtVmqJ5jU0rfR2S29kiJCla7HObpWvTRsng+NcGa0UhSmw==
X-Received: by 2002:a05:600c:1e1f:b0:43c:fc04:6d48 with SMTP id
 5b1f17b1804b1-43dabe18000mr93535405e9.0.1743413731448; 
 Mon, 31 Mar 2025 02:35:31 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02f84sm115879125e9.25.2025.03.31.02.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:35:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/18] drm/sysfb: Add efidrm for EFI displays
In-Reply-To: <20250319083021.6472-15-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-15-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:35:28 +0200
Message-ID: <8734eth7a7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a7xkH2BWfDzESwI96fNq705XDXQs5kYJYkL_mo3YQyM_1743413733
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

> Add support for screen_info setups with VIDEO_TYPE_EFI. Provide the
> minimum functionality of reading modes, updating and clearing the display.
>
> There is existing support for these displays provided by simpledrm with
> CONFIG_SYSFB_SIMPLEFB=y. Using efidrm over simpledrm will allows for the
> mapping of video memory with correct caching. Simpledrm always assumes WC
> caching, while fully cached memory is possible with efidrm. Efidrm will
> also allow for the use of additional functionality provided by EFI, such
> as EDID information.
>
> In addition to efidrm, add struct pixel_format plus initializer macros.
> The type and macros describe pixel formats in a generic way on order to
> find the DRM format from the screen_info settings. Similar existing code
> in SIMPLEFB_FORMATS and fbdev is not really what is needed in efidrm,
> but SIMPLEFB_FORMATS can later be converted to struct pixel_format.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

