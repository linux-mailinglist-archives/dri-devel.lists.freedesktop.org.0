Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01CA7636E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C40E10E3B0;
	Mon, 31 Mar 2025 09:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UXy+ipPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1CF10E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743414252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Re6QIAlnvIzvPC2AMafGkuWRkGecrZcKmMzcIXOHXK4=;
 b=UXy+ipPMyadCDKiPc2DYg2gPHHfI97hmgfSYdyr5Oq/EeuPVXndZ/yRd7IIGCLOK/4I1//
 bjio3JiTKLpXGmf8GDRl13oGodYP/aDD6fAL4MWquBTUQF65ApuB1iatO3JrD68fUo8ETO
 mnQMz9zmAwtVIKG7e7EugkrbH9hnR0g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-9h8ZykviOA6FZbpmoFnBUw-1; Mon, 31 Mar 2025 05:44:11 -0400
X-MC-Unique: 9h8ZykviOA6FZbpmoFnBUw-1
X-Mimecast-MFC-AGG-ID: 9h8ZykviOA6FZbpmoFnBUw_1743414250
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d01024089so38947475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743414250; x=1744019050;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Re6QIAlnvIzvPC2AMafGkuWRkGecrZcKmMzcIXOHXK4=;
 b=tcFbzVJM4s7gwzPUVClfA8cwlspQoQA1Xie0WPRMmXUboxdb2w0kYAWWPUijw4KHGm
 DGNXWvehGF9P37fnait39MONHuowTRq2u8YwhnOdntd9UUC8XWLwcexoGNfpraSAcnto
 gf+avtECEllp5BNhZzVJcXIuPZpaMNI3Qzm6aqDchh62U/sGokNg4rLy9bLAvvoqO2Rw
 zB/Oyie/RG0YbJTlE65ITBu0zl/rXxWBYc00E0dI50ZKdEB6B+tTq3xI8LtPZO6ed8cG
 yP61fm7TG6mH+lqHPQ8MZcPv6NgyGwiMVzZJAS1BUexSCUR87ZeOTkWNywtnRwAcOn+N
 01sg==
X-Gm-Message-State: AOJu0YwUIHklMSPZnFv5b9gblPatFYYD0FRDH+7v6NbfZPaUwyh3FRCx
 yipRV+/Wv0x0+HQPtd26vA10XOO6SK5sYuiOMonTjRYkzk+cmu46uXn7o0GGRD7H3uYTb+5XwJx
 6c9YrGiOKtkDDF6dsUnCkEhbss0Ke/coaZ3rA9e41kbMTaHXp17ZK2aulkOM1HLqR/Q==
X-Gm-Gg: ASbGncshbyZ035tlWn6x/ZwyPRuVsQaJjcv2h9pky+kN+yNIWumS4Wnz7JCfnS5hQfJ
 YKjeJBvxM4RTyhXhVxCVLlZmOrOHhhb4bq7Rg8xqYBZVxT8+SvaTF1DMvNouT6+75EbfamUOLlC
 I0m+k2KTTkjTOO4gWiH3cEfy4thUkAtSrmLUi2YFs+QoXiOLajRkBTSuWPYFcZ2UK4UcQzA9wTP
 Pw39gefjOsA2o1l4yUqlNpGJS7MNEAXl5cacgXdYfefWGwfPjHSZqksKL8iOBIS7vaPR0W32gf6
 ZguwvralPQQoIF+G0I0+fji6S06pk/QUzDH4Umajj8ExBQ==
X-Received: by 2002:a05:600c:1c9e:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-43db61e0723mr65079455e9.6.1743414250119; 
 Mon, 31 Mar 2025 02:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmQA1QEFNLZHa8namus+IoIHgJleSB/ZFYS+VyEb1Wdu8mhDen2zqyKkI2ckuarBWsCCyz2A==
X-Received: by 2002:a05:600c:1c9e:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-43db61e0723mr65079225e9.6.1743414249626; 
 Mon, 31 Mar 2025 02:44:09 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658b47sm10977654f8f.13.2025.03.31.02.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:44:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/18] drm/sysfb: vesadrm: Add EDID support
In-Reply-To: <20250319083021.6472-18-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-18-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:44:07 +0200
Message-ID: <87tt79fsbc.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iL2vN1rp8IpZ2jR1QhXj9vF5ARb0cdKx8LKDLaJMq0E_1743414250
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
> There's only one VESA display, so EDID data always belongs to this
> output.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

