Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51EB00156
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447CE10E37C;
	Thu, 10 Jul 2025 12:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PACHBUQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13F310E37C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752149622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4lgpdxo1FVLUcK9VrQ20Ig1tFoA8+jWoGG13oO7pPY=;
 b=PACHBUQpnKsL2PoHLzqkiLcVsvXBaK75U2OBaBIw/g1d6pP+G10lJpoX1jD2Y2A/9Gh5FW
 b2W0Pcvf+5e9CphojYl4bf1XTfH2pmPq7us4G8+9xX86imm6YHKi/Ewoqmjc4wXw7ifa14
 kpLpapeVItuUEIJF9S5OIHu/XcSLKAs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Z4pNQXwXOgGugWLKGww_qQ-1; Thu, 10 Jul 2025 08:13:40 -0400
X-MC-Unique: Z4pNQXwXOgGugWLKGww_qQ-1
X-Mimecast-MFC-AGG-ID: Z4pNQXwXOgGugWLKGww_qQ_1752149620
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so5094665e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 05:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752149620; x=1752754420;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V4lgpdxo1FVLUcK9VrQ20Ig1tFoA8+jWoGG13oO7pPY=;
 b=jxYCZ4ddfN+n6xCLHPCwjJ2HOGvxaygL/RjW0WjJgGywMDNW1TnZSKqbHkqPdeV2Zl
 Y7rL0tKO2UpegGjtPkrR3AwnF0hIbXoXxQOAWTOmwyiZOHBfK7f8od25ScRIHg5t1nzp
 DGd53tefguAfbtp6wGSpBzt4Jewl3CI6lqjTsIqKKNbloIl5pxt0Y3Xly/PyGWapaQX9
 FTQhdQmSY9fNFdsbIaHCPG+yYQ+D6LjDk9mv7MVss9OtyMEi0qHSy7s5Ucep+v5dgsx+
 UWS5rGKxyc4QWb6oLwH+95NsSpHriNisdjiFS76XaSkR6zE67QHe1BWAMHOwwzFbgKJ4
 tA4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Z8xZAKGYSD+qbdvLn84+Ce3bCNfrC6l7Q4B1P8fRSKygYheNPzP2Qz5ZClFHIMYkdT92GXFhTJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/QeauOkR0f06f4Pop2RQAADCS5wxLYMv7zAq0oxmcDrH5yHx0
 ImQv7n2ptCgYulF4E59eH12aPTWrR6nWILosf1imMEO6sU1axcLsqQ5zIsfKgMVV4RJghhDrAhH
 yhovyCl3faqPwNKXh4xZFB+utVpl4shDJx/pNFuMFq5GQ3OOk5cXl6qwTqW4GJ9FZ9SWjHw==
X-Gm-Gg: ASbGncuIRJurlCYB50ls8Z8jGIyF9j/W36VuE7Na9/UvEb6TFhTKyGM0P17QJKEGZao
 1M3v7+Gl5EQFb9LiLTUvsEc8/byhNODPIWJZ9uBOET1MgYYg66j1bws4vzppGOtNKxaxrsSanVT
 vmLtZiJsS2mSd8D4b+W1kLY5KPKt+Iyg+8y74x+nqC5wNzUUVxuiG4ExIrK6mL1gpQ3FNcC/p3x
 4laM8crdEl1HQC488GakiVOzIC2quUJ7tdc3uyr5NaAEYYJ6QrwxzF//SCqeqmICpcSDWGG6327
 HiTY/DJknAvHFuifsZUNobNqFw1jsolXOd6Uz+DcflKvY2T7AiBYX2wPWRSMIXlSkEynKa54HoK
 uVL0u
X-Received: by 2002:a05:600c:8717:b0:442:dc6f:7a21 with SMTP id
 5b1f17b1804b1-454db7e87c2mr38423835e9.3.1752149619716; 
 Thu, 10 Jul 2025 05:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp+CE4OHvWqIhCgoGjMUd0oVm2/xeAAOIhuzXqN72Z/OQpis058DRemX4zgz1jKZQSrDiQmg==
X-Received: by 2002:a05:600c:8717:b0:442:dc6f:7a21 with SMTP id
 5b1f17b1804b1-454db7e87c2mr38423525e9.3.1752149619307; 
 Thu, 10 Jul 2025 05:13:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd439051sm18518215e9.8.2025.07.10.05.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 05:13:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/3] drm/tests: edid: Update CTA-861 HDMI Vendor
 Specific Data Block
In-Reply-To: <20250625-drm-update-edid-v1-2-2d963743ab9e@kernel.org>
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
 <20250625-drm-update-edid-v1-2-2d963743ab9e@kernel.org>
Date: Thu, 10 Jul 2025 14:13:37 +0200
Message-ID: <87bjpsfdla.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QfNT_TOsIL4F-Lmc_jOARxItrpnhFyxusZ0krKzJy6U_1752149620
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

> For some reason, the HDMI VSDBs in our kunit EDIDs had a length longer
> than expected.
>
> While this was harmless, we should get rid of it to make it somewhat
> predictable.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

