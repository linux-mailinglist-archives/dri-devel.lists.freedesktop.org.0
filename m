Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86979068F9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270C10E9E8;
	Thu, 13 Jun 2024 09:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bo1pUslE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78E110E9E8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718271358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+f9IRQAtoYreDkliCxhCyloA90D4/y0bQohgPwtZn1U=;
 b=bo1pUslECB6C3d0KXENjMzHD/kCuIAb7joivXdsi5xG0AbktiyDPg2gOmondy9W2C/RcDb
 1IdV+WyRXzbWpvzVypWqvtMZ+6etwX9bNl4ql6XgsYoIazlJNHL7Cm2NXiCMEPHy0VEzZX
 HtOEB+v3hqaXd3/BkWRSLq09e5YrUmE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-rUzrA830OESraQPZLVH7gw-1; Thu, 13 Jun 2024 05:35:57 -0400
X-MC-Unique: rUzrA830OESraQPZLVH7gw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-35f18355552so422423f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271356; x=1718876156;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+f9IRQAtoYreDkliCxhCyloA90D4/y0bQohgPwtZn1U=;
 b=JceEAnoqXbKJ6nDGCZY2R/Uv9DyN8xhqY7JAbwkW0zYeFSgcbjbkGgugxu6pxOYgY/
 +s/lNE5h8txb41k4L0VDGsK8fQli4KAFt+rAK5Q1KCPIeQG9BIfXuXBmWZb1ltg88zPJ
 Am+XqYKWjgRG2Mpucp2scMRvsusKpuwAessB73i/QM5GSXitkWOgSvCH3L0sMQ/MhC8t
 nHmBh0fGMeODdZvwKpm5ux7Dn54btnTca/uDh5KowaLc2PlF5eZXti6bql9fnU3IMjEL
 ZZv84/FZZBCALu6ZBP+RdJDVfOZ6a/Qu6Jc9uoaqY2vNDgzCaOTbVZrbtB4EeiQfxr6I
 iitw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaK8aWt24CL/miu0YX8APmECFpsR/EhbYGqQnMggSPBx9Hj3WRysZtbhmRZtSm73bE5NTAdwun6FsEJiLRQQFkt50QZUj3aAXoGWRiCcEG
X-Gm-Message-State: AOJu0YxswCnmaep0YJZESJ5d5kdcn35JzPJ3fbWsUemJkeYxMwyb+ehn
 RJSON1NW50z9JarGDTJ/mx3UmB8QDYO/nKTXByadctsjqCGID1aeidt4t0e8yCIUE/ZtmuUhCj9
 LmYxJEbssKqcWjb0uGdJPkJw0f5vOdiAmAUua8yCWA2I/4O9MzJ63DSpYR9nD+24s0Q==
X-Received: by 2002:a5d:538d:0:b0:35f:488:6d3d with SMTP id
 ffacd0b85a97d-35fe89249f3mr2830855f8f.58.1718271355775; 
 Thu, 13 Jun 2024 02:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRnQzDeC6g5C2hUDcuOh2NdJWNisz5Zy3hTXEWOVLoVlyeXt4Lup8LxzxKnEmUNmLb1HoUyQ==
X-Received: by 2002:a5d:538d:0:b0:35f:488:6d3d with SMTP id
 ffacd0b85a97d-35fe89249f3mr2830840f8f.58.1718271355247; 
 Thu, 13 Jun 2024 02:35:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093615sm1159581f8f.6.2024.06.13.02.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 02:35:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
In-Reply-To: <20240613090240.7107-1-tzimmermann@suse.de>
References: <20240613090240.7107-1-tzimmermann@suse.de>
Date: Thu, 13 Jun 2024 11:35:53 +0200
Message-ID: <87zfrpqj5y.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Test the vesa_attributes field in struct screen_info for compatibility
> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
> capabilities field, It sets the framebuffer address size and is
> unrelated to VGA.
>
> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
> the mode's attributes field signals VGA compatibility. The mode is
> compatible with VGA hardware if the bit is clear. In that case, the
> driver can access VGA state of the VBE's underlying hardware. The
> vesafb driver uses this feature to program the color LUT in palette
> modes. Without, colors might be incorrect.
>
> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
> incorrect logo colors in x86_64"). It incorrectly stores the mode
> attributes in the screen_info's capabilities field and updates vesafb
> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
> the new x86 setup code") fixed the screen_info, but did not update vesafb.
> Color output still tends to work, because bit 1 in capabilities is
> usually 0.
>

How did you find this ?

> Besides fixing the bug in vesafb, this commit introduces a helper that
> reads the correct bit from screen_info.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup code")
> Cc: <stable@vger.kernel.org> # v2.6.23+
> ---

The patch looks correct to me after your explanation in the commit message
and looking at the mentioned commits.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

