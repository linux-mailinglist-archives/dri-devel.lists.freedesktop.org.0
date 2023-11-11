Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45C7E89F3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EA110E25D;
	Sat, 11 Nov 2023 08:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9D10E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699692983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LGOFt1JfhjtGiblhN9a/032gAq4BmiVgO1JSpbn3+6k=;
 b=Y8mhCSnA1xNuy34NhOtwvA4mKFt7SEsCLLUBVPIrbXYzWnk5TwyJWU8u3w693HQRgPrnFi
 1SHPb6wUNOBIoh73kFDcd8Gqnu7qVcYqMHuWiH61HOPMCE61msUWNX6B3IWmn3rFqufb8l
 BercI6upHJaI/wHvpUMGODRVxjJaRpU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-zRHGgKU3Msuuxx5rkbeU1w-1; Sat, 11 Nov 2023 03:56:21 -0500
X-MC-Unique: zRHGgKU3Msuuxx5rkbeU1w-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5090b916b7fso3138664e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699692979; x=1700297779;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGOFt1JfhjtGiblhN9a/032gAq4BmiVgO1JSpbn3+6k=;
 b=or7twKrRa0gy2cIUcoeurLeDjBKbG6Oc7RpLybV3uqJZRGTU9ttFa5cdQ81a6VHHYn
 uJqLrXYlNAx3XMnhT3f/ci7s838naHN7aeABBjByvYSfSrf/T8E4SjZGe+4uTOGwxTOe
 mgL3oOSOdMEY+d9b25F6nfQxIy2w9Omwwq1DX9AgyLEN4arKdhRg/Y1mIG80eLsOBSGx
 59kf6jIE5QZ0qMjLpKKGd+knWyjHxjGXU/nmy+RHZQy+DIrC5/njs+uhQkKi3N5VDgf2
 spg9+JBihYjTKM0KGZ52sIdry4Sr8fId9oid88Fs5DLtr0f6qlg6C1HDCvbY1mdzCRC6
 azbA==
X-Gm-Message-State: AOJu0YxFDTi5BkE0hV3URoMHfMS94Pwam1eVNHy4msZKIKW7d5kwAJ7U
 hRrbYHIgaQ5Ebqx4liZ13654bBtxyzsKiy6Si5eDp4512R5lptfs0j0rt42R5ODPetzgaTRvhJp
 g4v0HO/hINN+Bl0mpNKSVbVkIkvkxJlQfpvln
X-Received: by 2002:a05:6512:31c8:b0:4fe:279b:8a02 with SMTP id
 j8-20020a05651231c800b004fe279b8a02mr989237lfe.67.1699692979437; 
 Sat, 11 Nov 2023 00:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY8ccmlkBOq88EILichraXBPrI6zT6ibD+9BQmjfcutwvaXL5OwNK5iSVllYnSOs7nSiUQxA==
X-Received: by 2002:a05:6512:31c8:b0:4fe:279b:8a02 with SMTP id
 j8-20020a05651231c800b004fe279b8a02mr989233lfe.67.1699692979064; 
 Sat, 11 Nov 2023 00:56:19 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e14-20020adfe7ce000000b0032d2489a399sm1054153wrn.49.2023.11.11.00.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 00:56:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
In-Reply-To: <20231111083327.18607-2-ltuikov89@gmail.com>
References: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
 <20231111083327.18607-2-ltuikov89@gmail.com>
Date: Sat, 11 Nov 2023 09:56:18 +0100
Message-ID: <87fs1cacst.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luben Tuikov <ltuikov89@gmail.com> writes:

Hello Luben,

> From Jani:
> The drm_print.[ch] facilities use very few pr_*() calls directly. The
> users of pr_*() calls do not necessarily include <drm/drm_print.h> at
> all, and really don't have to.
>
> Even the ones that do include it, usually have <linux/...> includes
> first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
> <linux/printk.h>.
>
> And, of course, <linux/printk.h> defines pr_fmt() itself if not already
> defined.
>
> No, it's encouraged not to use pr_*() at all, and prefer drm device
> based logging, or device based logging.
>

Thanks for including the rationale from Jani for the revert.

> This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.
>
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/878r75wzm9.fsf@intel.com
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

