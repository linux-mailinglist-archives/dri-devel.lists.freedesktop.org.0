Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6487840434
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4031128B8;
	Mon, 29 Jan 2024 11:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362DB1128AC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706529157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=km+vTMTcwLTjSNtEd7zlwVkpw9kPugDzUR1x5Mu9N30=;
 b=QW4ieqtEKwr+TTcOe497kZW9Fu0eOKIk/7Il/EHo2UG8M163oNA/9YViuRkyU1U3JxPPOC
 aRGzwULWlj42Ti3ET4VXONh6ws9lFM4PfMHg3a1sf8e3AVdcvagEDno+CPnIdYac6ckto4
 vcJTFt0afhgbj9pdKwD6xaRwpT8Ts90=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-LU4bYExqN6KLOEeJ7Rmwrg-1; Mon, 29 Jan 2024 06:52:36 -0500
X-MC-Unique: LU4bYExqN6KLOEeJ7Rmwrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40ef6b8d0f6so5123405e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706529155; x=1707133955;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=km+vTMTcwLTjSNtEd7zlwVkpw9kPugDzUR1x5Mu9N30=;
 b=ZWXqOIQMc9aaOsGTbeQRRAZFAdakgG65iZhNKPKblV/RKaBSUIfgP+I11Cuw/RUBxJ
 URDJBV4OVeUuBJU3O4oF5OmMfPAYMyHwjnkw70sHa25WIwXdVz16qyUN8LUbit8Q9lgP
 jm5Y7jHJN0zlgaFa3jUhVQpZv3KbsFOtdBIMUINXvSQvD2Vei+GQ3FgbmmelxOFswoO5
 c830F/2dWrEma2/k14nnwV9+VZ4GEEIxjR54FKmmzveeb9wZfMhNuIZ3dyRm3Fi256jg
 3mRYjOZIBmRAy4I4Wiy2ZgwtDVBsW/7lmqlG1nP8wbhkCijJ+56IeegXp1GPBTxUhVTS
 Xg3w==
X-Gm-Message-State: AOJu0Yx/0qgqqFogZ9PmQRaUeCgx4DauBo0pOgMzs3tlFNz/xBP8FkSU
 ZSovcjztFBqIUiv5523HEDv4nquVt/hSRIW7C+SC38WKKLxwCRE8X3JKt3nsaX0t7IHnp4Owne2
 q+Nk6xwJXaMn1EpW8pIoC3yaFfYArLGmWN2EaPQyHnNR1YZjaMLpTQlLBcLSxXIIQfA==
X-Received: by 2002:a05:600c:3c9a:b0:40e:ccf8:7539 with SMTP id
 bg26-20020a05600c3c9a00b0040eccf87539mr4692027wmb.34.1706529155008; 
 Mon, 29 Jan 2024 03:52:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1tHCYmH4B+lu5im6PSKDlmApxTrUu46qQeJ24E7WbK/DRwXxTWziwLYE+4Th1tNcBlcBHvA==
X-Received: by 2002:a05:600c:3c9a:b0:40e:ccf8:7539 with SMTP id
 bg26-20020a05600c3c9a00b0040eccf87539mr4692017wmb.34.1706529154742; 
 Mon, 29 Jan 2024 03:52:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b0040e89ade83fsm1940222wmq.1.2024.01.29.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:52:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 7/8] firmware/sysfb: Update screen_info for relocated
 EFI framebuffers
In-Reply-To: <20240117125527.23324-8-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-8-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:52:33 +0100
Message-ID: <87fryguzjy.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> On ARM PCI systems, the PCI hierarchy might be reconfigured during
> boot and the firmware framebuffer might move as a result of that.
> The values in screen_info will then be invalid.
>
> Work around this problem by tracking the framebuffer's initial
> location before it get relocated; then fix the screen_info state
> between reloaction and creating the firmware framebuffer's device.
>
> This functionality has been lifted from efifb. See the commit message
> of commit 55d728a40d36 ("efi/fb: Avoid reconfiguration of BAR that
> covers the framebuffer") for more information.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  #if defined(CONFIG_PCI)

Shouldn't this be && !defined(CONFIG_X86) ? Or maybe &&
defined(CONFIG_ARM64), although I don't know if the same
also applies to other EFI platforms (e.g: CONFIG_RISCV).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

