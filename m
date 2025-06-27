Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C2AEB24A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C1810E991;
	Fri, 27 Jun 2025 09:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QyzHvsT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171D710E991
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751015568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYCV/mmnu9quiFORIT64HDfZgAbi4d31P/K4WpqK4Ew=;
 b=QyzHvsT6ZONHJVWxVrRFSfJQ8aHFaQw/UZhxboZ9nOkA23osrcDHs/XKQEIlzp3Sautrqm
 iNbNby+6o9S0wmycLDqmzZ3laq0RKEv3lheYT4wm/q+RCfjTVkQHD35PrikyHmgRAbQDF8
 7hZ/tyXCuJYbHVgYXZCFdZXhnI9RF5U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-fSKGvoSSNoy0ojs9EQUX8g-1; Fri, 27 Jun 2025 05:12:46 -0400
X-MC-Unique: fSKGvoSSNoy0ojs9EQUX8g-1
X-Mimecast-MFC-AGG-ID: fSKGvoSSNoy0ojs9EQUX8g_1751015565
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-453804ee4dfso9643615e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751015565; x=1751620365;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wYCV/mmnu9quiFORIT64HDfZgAbi4d31P/K4WpqK4Ew=;
 b=RXsPW5FKoo9LEtz/1wsKvStDCUzpBOKfSBGuXzdE/xsa9hy3+95W05BAvVoHQggjGb
 zVuh0bB6DFAlm4NICP7vmgxV15keC/98MVlfVNcBGCzwTOzKv8w9wR0w05yygaBK4uRB
 n1zCkM9pL8LgeySA/+9w2sjYTwYQaMNVizZmIIO9nqGu+Or4N/zo65BuvoaRvyv3Fl4O
 ZWZhQ35ayJhqWX7Aw4/3mGP7Bst/4Jt1Is/IVG+qU6P0vj/Mr2Su1AKkwQ3FnlzTdlOe
 fXWgxcGKISrDN4wdbgF7HHmHx4+3edM7PxxtDHZsYeC5+oTS3pKRoWturT8Ink7rso+y
 z59Q==
X-Gm-Message-State: AOJu0Yxg265npdRq9B2pIwQliXshUStqBpe5XsqJpuroRJaOj10Ugcz0
 mR6HbghqjKHDv0FW2VYJG2rLFWWZWB16ITMKMeEytyoAYEfCmZ95j6BDomTpLssQXVEyuGCsSjU
 ye06eVEqQCzUG236ca7awEKN7CPQ9YvvLN4FuX4yXD8CY0ocKvz/d2eoBZXba5N0QRrzQaA==
X-Gm-Gg: ASbGncuuOMc65Nje6xqOUEVB4YzF5kmrkUsd6Srmj/xJ/BX9sFn9UEv3J4pn3WqQIul
 bFhcrtKC1HfCl6MkWuFsChE1OtIb1zOFN7kXO9IxchEzrIYRxZd88O3kHaAyyTWHKlw/OfiqngM
 6/QO7LndaLpMkn7MWNZeefbDj8BMHPyQJ+BAciiUKHeEAIp+q4ED8SE24/Y5XrdiukohCuX2yuW
 fNOq1XcCu4QCHBmuhXqiWyLgfX6WUNrBuDNxNxZMdr44uCNaU+MJalbF5A2KqwwOGfeKcZLObR6
 W39vQ7L+vX+n0kw31sdZiV53V7W28dnI4PrghZUzosYyT/xEXBbQ51LYBUvmH2NunF9mnqve2Ee
 UJJnw
X-Received: by 2002:a05:600c:8b8b:b0:453:b1c:442a with SMTP id
 5b1f17b1804b1-4538ee70f31mr24187985e9.27.1751015565255; 
 Fri, 27 Jun 2025 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrPuxSZs8zruo6edxrSyEN0yDly0bJfK6/O6yP8vrNS1ZzI1Ta9cGuoIvNVmYoF464I92XwQ==
X-Received: by 2002:a05:600c:8b8b:b0:453:b1c:442a with SMTP id
 5b1f17b1804b1-4538ee70f31mr24187655e9.27.1751015564743; 
 Fri, 27 Jun 2025 02:12:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e78e8sm2203570f8f.19.2025.06.27.02.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:12:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 4/5] drm/panel: panel-simple: Add function to look
 panel data up
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-4-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-4-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:12:43 +0200
Message-ID: <8734blczuc.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L0lqOcxs4s4uHXZE9wurY0ZXhIAyrGIbMN8h_rp2NyU_1751015565
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

Maxime Ripard <mripard@kernel.org> writes:

> Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
> place of devm_kzalloc()") moved the call to drm_panel_init into the
> devm_drm_panel_alloc(), which needs a connector type to initialize
> properly.
>
> In the panel-dpi compatible case, the passed panel_desc structure is an
> empty one used as a discriminant, and the connector type it contains
> isn't actually initialized.
>
> It is initialized through a call to panel_dpi_probe() later in the
> function, which used to be before the call to drm_panel_init() that got
> merged into devm_drm_panel_alloc().
>
> So, we do need a proper panel_desc pointer before the call to
> devm_drm_panel_alloc() now. All cases associate their panel_desc with
> the panel compatible and use of_device_get_match_data, except for the
> panel-dpi compatible.
>
> In that case, we're expected to call panel_dpi_probe, which will
> allocate and initialize the panel_desc for us.
>
> Let's create such a helper function that would be called first in the
> driver and will lookup the desc by compatible, or allocate one if
> relevant.
>
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

