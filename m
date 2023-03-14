Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA7A6B9B90
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0E410E180;
	Tue, 14 Mar 2023 16:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406BA10E180
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ENuFieBhxiHtLNw0jCbF63V+Z/gQ5SLpJHpUyZoTfIU=;
 b=Xdojz2MAojHH0owFC2nMyCSvX5sBSQKp46fdfnwgWWN4mgk/i0ax8NNRVdPD6XdkYaBHK4
 DQvOwQnWUcgBDFHiTWSDaiJ+19nt6ezRp5JbEycGhGkQfXC1uRSACwlKBxGO5J5Xm+0Q10
 mVs0BAtBrqLfoThwTao+FwMVSvpeGUw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-Uy7hFXSoNq-ag-uX_Sz0PA-1; Tue, 14 Mar 2023 12:32:35 -0400
X-MC-Unique: Uy7hFXSoNq-ag-uX_Sz0PA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so5713054wmb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678811554;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ENuFieBhxiHtLNw0jCbF63V+Z/gQ5SLpJHpUyZoTfIU=;
 b=VZxY8hZScQy5PPLomjfW0NDSCA9BJuQ255vhNBQO4EI0/dqnpzmSoIyK6gJCA/rOtT
 mJ1WHB1t7tUHepg0OXW5+7vRylQuoU85+3r8ESjAUFKWTTiPgeNqn0Jdrzo5ip8FialA
 6EHkkj0nCWmQa9W0kqBnQnFXQAQqGZFeyxkxFX26UasXlki5yPEdvTw+FVQY6kZ86cYG
 tHPrTY0GfdYdx2kJSXr1ifyzSs04Vy84ndZcw6mzoOkdr/PAm0TPrJ49fnDJaSSq6+dC
 gJe7SnoWTnXoi3xsFGJXYiyilieX4gz7RkXef4IPYIwUtsucweJdLI2mfFPxLXK1FXLO
 XT0g==
X-Gm-Message-State: AO0yUKV11TIKDsI1BkhEPkbAhu/fM3GnuU4W/YGUNhkU+bvVk7IM7wBK
 NHLCmmC+io1b83vuJvvP49/LDhM2ZbUcjqKTx9qCbTArc2qpLjkvnpHWtlk8lbFZcmSnq7YLqGr
 kzSoiFV4sbjtr3Cjs+ohvlHnKs4UR
X-Received: by 2002:a05:600c:3b99:b0:3ed:234d:b0c0 with SMTP id
 n25-20020a05600c3b9900b003ed234db0c0mr7627209wms.13.1678811553861; 
 Tue, 14 Mar 2023 09:32:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set83ZCHUGW/upSbL2NTJtL0Ht3VQsjtWJkbu2JlZJDbSTbrLj6MLNQ2M53zNysaSVXtrIug+Bw==
X-Received: by 2002:a05:600c:3b99:b0:3ed:234d:b0c0 with SMTP id
 n25-20020a05600c3b9900b003ed234db0c0mr7627193wms.13.1678811553599; 
 Tue, 14 Mar 2023 09:32:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l17-20020a7bc351000000b003e21f959453sm3258953wmj.32.2023.03.14.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:32:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 1/2] efi: sysfb_efi: Fix DMI quirks not working for
 simpledrm
In-Reply-To: <20230314123103.522115-1-hdegoede@redhat.com>
References: <20230314123103.522115-1-hdegoede@redhat.com>
Date: Tue, 14 Mar 2023 17:32:32 +0100
Message-ID: <87fsa7l2e7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org,
 linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hans de Goede <hdegoede@redhat.com> writes:

Hello Hans,

> Commit 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup
> for all arches") moved the sysfb_apply_efi_quirks() call in sysfb_init()
> from before the [sysfb_]parse_mode() call to after it.
> But sysfb_apply_efi_quirks() modifies the global screen_info struct which
> [sysfb_]parse_mode() parses, so doing it later is too late.
>
> This has broken all DMI based quirks for correcting wrong firmware efifb
> settings when simpledrm is used.
>

Indeed... sorry for missing this.

> To fix this move the sysfb_apply_efi_quirks() call back to its old place
> and split the new setup of the efifb_fwnode (which requires
> the platform_device) into its own function and call that at
> the place of the moved sysfb_apply_efi_quirks(pd) calls.
>
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> Cc: stable@vger.kernel.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

