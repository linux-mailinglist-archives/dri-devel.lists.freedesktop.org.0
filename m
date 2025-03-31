Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518DDA76343
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283510E3B1;
	Mon, 31 Mar 2025 09:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UJ/nUTKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0B910E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743413836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHoU3sHKGWuqkOMMwvzdCpEuXn9GAYMiqU0h55ieVK8=;
 b=UJ/nUTKvz983l21Q5p8KLMB6r8gSEoXoHM8M8f845GStdt7E7nUrNVYDLjHADTvDiGJFU6
 kZa1R2xmHuIRmouK7MrvfTIEUlKRmt/N8PCrbaGvkTrQbYJkQRYVTXHEh7+UER71IOUb27
 30zQZplKzXg5qZurH5JqewDytdLrLgw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-SAk94jYjMnS7J79TV_CM4g-1; Mon, 31 Mar 2025 05:37:15 -0400
X-MC-Unique: SAk94jYjMnS7J79TV_CM4g-1
X-Mimecast-MFC-AGG-ID: SAk94jYjMnS7J79TV_CM4g_1743413834
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cec217977so23968515e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743413834; x=1744018634;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CHoU3sHKGWuqkOMMwvzdCpEuXn9GAYMiqU0h55ieVK8=;
 b=YVatddJNUoefAUU30qNQVvgNYZgIPsEzKXuchvyQBQ9Kw03+r6voerLJphvRrx9mLu
 Bjiw8RqH7jg4E8P6obD0ixDtBZ2pA/01whk3bcIn2LBuIMWbgrvASxlGAG2xMw6WosRx
 mvJVeHTTrc9aVuj7ArhCaPSwWisNdJaBBDALVQ5BmsNLCb4OpLtjCK5861YycHi0hhQR
 1wQp3LFsnCVQrnC5uATW3WtKV/WaYFOltE1FXtEoasBzZNY7CQisUBndlyZmtk8cTfui
 ZcbOn/rSpXbVzDuIRitV+r5X3NXuN5gOXGAfKARR5+YceA1y12/jD8qtMvC+EOFw1lgX
 kLlg==
X-Gm-Message-State: AOJu0YxWCbN/JmLzFnVeMchVuqcUg2aoD0dJPaM+mpjqjaqZWqD9cfYg
 Ws5KSGgPL8I3OMpjos/MuG35IGFnYYpPL6GtuJGiv99/DkiEVl1TZuGS8tHtAwmnOrpXOW4gPtD
 GOAj5spYw+VOYH7QXKJ5hE0I8BnPyFfOkME62ud4BWN2r683HxM3zYS0lpvnRP7Z5hg==
X-Gm-Gg: ASbGncsZQpa+8l4k+BY1QDvwNpjT87VyNDTp/rqPTONnV1BexJuvb6WHuYT3mv7pmWQ
 /WmolJHXlvVk9ie9rttiO7KhGaUkMbo/07WRvPZc0QyyXHJJK+Xqd7mr/k7gl5bB4JKXFH1s4z3
 rjvjNo7ymN3ZpUlpQmUFx/rP6B8wBcrnpowcwJbxx62L6GV2emQm0hgKmbgazS/uYcZD0Hl0kxM
 z78qv4d1xZZf9DjD8S/7OkihIf6IDqnLTHBfgw5ubITK4dg1aHe4WFK/YIf5D8+hoS9MoKklFKI
 PmA6tXVbK12GfZ/+rYrTNq8Bd5Omsh4paPIa4h1fbcUDSg==
X-Received: by 2002:a05:600c:3b86:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-43dfa5d93a3mr47558215e9.32.1743413834042; 
 Mon, 31 Mar 2025 02:37:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI6CHqrTwRDf5mf4tuxPrn3m+khRW21fO+70UQMoFRIZaTqxmqIptXppEUky0mgr+d+CewEQ==
X-Received: by 2002:a05:600c:3b86:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-43dfa5d93a3mr47558065e9.32.1743413833731; 
 Mon, 31 Mar 2025 02:37:13 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d9172733csm66504395e9.3.2025.03.31.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:37:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 15/18] drm/sysfb: efidrm: Add EDID support
In-Reply-To: <20250319083021.6472-16-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-16-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:37:11 +0200
Message-ID: <87zfh1fsmw.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wiN6SvZgw8JqjHXmFaaOlMg948IVdnQgaSiZ7bAXPQs_1743413834
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

> Enable the connector's EDID property if edid_info contains valid
> data. Exports the EDID via sysfs for user-space compositors.
>
> EDID information is not always available. Depending on the system
> and kernel configuration, it is either provided by the boot loader
> or read by the kernel during early boot stages.
>
> As of now, there's only one EFI display, so that EDID data always
> belongs to this output. This might change if there's ever more than
> one EFI display in the system.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

