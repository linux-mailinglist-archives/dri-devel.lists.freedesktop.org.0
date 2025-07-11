Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B1B01CBF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E14F10EA46;
	Fri, 11 Jul 2025 13:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dMKtWXXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52510EA46
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752238989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2CLlgTkayiL7lH/rIp4Wr1E31kOJfS0hFCDPi1tctU0=;
 b=dMKtWXXK/okM9a1T2lV4seREfopONeB8hHFg4zSCsTnRunhgOYU3pcpazxN/UtRULth5Vv
 +Gl/VOysde7HeuCvN7h/gubz18myMuvo5SuwYsQjETLlPHGzmop40lfwMfI+ZI/GKgHLv9
 BNzhWt/r4sBmQQo+7m+norAQ4rnt3p8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-HlGQVpw9Nh2hmO91bHm9gA-1; Fri, 11 Jul 2025 09:03:08 -0400
X-MC-Unique: HlGQVpw9Nh2hmO91bHm9gA-1
X-Mimecast-MFC-AGG-ID: HlGQVpw9Nh2hmO91bHm9gA_1752238987
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so11683165e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 06:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752238987; x=1752843787;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2CLlgTkayiL7lH/rIp4Wr1E31kOJfS0hFCDPi1tctU0=;
 b=qSZ9u+rItDyo+atpx/s6AW/imNSI6VFJAjF9/CJiIE9V1aw3C7a3cIHwgIWeavxNgh
 U5RtUOeAYUD+8JowVkU37iiPny43s/eLYLWQ07leKtWy7DuKNAEkkHg+yCeOMNI54iYC
 1zBn73/rWMSIE33iFMtCh7spq8wXW1iqAqbHh0rIcYpQuFe/+yGQwDvtYYLXEoCpHRWj
 i/DVlhOlr+db5ldOYYOpjPM3VkOncerFzf0JdSjIxPHpZ6lZBfUdtP/V+mM7pKJsducf
 NcAb0JPGxYVEQKRSTyr5IKUFVEyP5E7QeqeaMthP4Ftk9VarvKzroo5xCBQ8NaoAkeIW
 IZ6g==
X-Gm-Message-State: AOJu0YwmFHJ5N6+MJvZTcraW/Mm23vZ+OighBn/7V14zrVXfvl+w+8xl
 vgvoDs3/jSgywQr35zQNpqIRMh23Hmy0VcIsZmhsMSAXKuHw32Vc7IhQixl0Pu/grmt8GGnAg2l
 zvwJpHoUe1KeFVktFPCFtRHTkkQVS3/RcOdbJWUPZOiZgxRXoZIO4XZriplVKdapssxFKFA==
X-Gm-Gg: ASbGncvbaQq7EvnnaZCkvj3IpcuqTAiRgrWgTVISgvIz7Rzd65ARAjlxLvSu9Jdg9Dm
 0sp/kRPaxBCfOQMOs1N2VSLe1RoxXUH3hv6Vc6/uO4a/WfwlxUDP+RLMK75xBhcifwMzbLEgBre
 V73HoN2lFfM1m1WO/wXGypxRbELSm5eJ6+bzGjA8JdLJgJ8YO7+YwppfRZ72emySQALLdgZsAga
 mwrM1zl1yGVx9mtCDGxplvXybEu83W0c0oEBtDilnYFyJ/JK9XP9d+RhIfloXQEUKZK125vPHqS
 wgDmKQvkUFADT50irBzfJFaVYZafzc0ZzLYJz5GxDcgvzYDr/SNQIh7RAL8jbayio5MP91wJLKW
 0VNNxWh6AmcahiouL/awosQ==
X-Received: by 2002:a05:600c:1e26:b0:43c:f3e4:d6f6 with SMTP id
 5b1f17b1804b1-454f42792eamr31261795e9.31.1752238985639; 
 Fri, 11 Jul 2025 06:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSszBazFgz+Dp0CmG4ZsPyLeInJTj++WdBMtrPc8tefD/uNZj+3ztug4v6dzTJAJ9scKP79Q==
X-Received: by 2002:a05:600c:1e26:b0:43c:f3e4:d6f6 with SMTP id
 5b1f17b1804b1-454f42792eamr31260565e9.31.1752238984800; 
 Fri, 11 Jul 2025 06:03:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd436ac4sm46880935e9.4.2025.07.11.06.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 06:03:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/sharp-memory: Do not access GEM-DMA vaddr directly
In-Reply-To: <20250627152327.8244-1-tzimmermann@suse.de>
References: <20250627152327.8244-1-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 15:03:03 +0200
Message-ID: <878qkuev7c.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4hNwqLo8Fq2WPoQb7PtMbp5pJA1wl4aUS64Z2jFdWws_1752238987
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

> Use DRM's shadow-plane helper to map and access the GEM object's buffer
> within kernel address space. Encasulates the vmap logic in the GEM-DMA
> helpers.
>
> The sharp-memory driver currently reads the vaddr field from the GME
> buffer object directly. This only works because GEM code 'automagically'
> sets vaddr.
>
> Shadow-plane helpers perform the same steps, but with correct abstraction
> behind drm_gem_vmap(). The shadow-plane state provides the buffer address
> in kernel address space and the format-conversion state.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

