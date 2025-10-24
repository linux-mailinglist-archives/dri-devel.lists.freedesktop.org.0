Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F683C05722
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CC910EA0C;
	Fri, 24 Oct 2025 09:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hkvePpkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5C10EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761299803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFdXG8UsUCKKwuBuj5kudW0rIy6xekadEYj183tppO8=;
 b=hkvePpkVEYDm2bP6pHm8cG7Z5Y+XW8EK8VUZMm5LVEtTIsWkDbAQaO0X6J/AJzUmki6Kok
 u6gID2+cvM09E8yakBc696vaaZruWTOs49ucTeLGtLjL29t0NhTl2dQrfy+t0byJx+gPiH
 nOgI/0yjveKbbhe0B9iDrTrkZo9JkaE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-wnPP2kCHNdGh5jtyz-ghlg-1; Fri, 24 Oct 2025 05:56:41 -0400
X-MC-Unique: wnPP2kCHNdGh5jtyz-ghlg-1
X-Mimecast-MFC-AGG-ID: wnPP2kCHNdGh5jtyz-ghlg_1761299800
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-471201dc0e9so11657445e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299800; x=1761904600;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KFdXG8UsUCKKwuBuj5kudW0rIy6xekadEYj183tppO8=;
 b=i/bkrUR1gxCisoQbA4d8W0oHj8sfRYFEQagNUs7nd03PxFf84cj+5FUicKs17ADN2q
 f0NJ8qeRiVCXsTRlgXELB4bWaimdM7hpJnTDqYum0F3si0t2mUwWE3t8Luwh2ZevBC2C
 0zikbf9i0Z4JcbgyL4ASaunNPIh77kEQVURg+A9eUrdWgIupO1l72+9dCQdDYNy+nhVH
 gCB1MrZX5Eba6QM/zkbYGicxmuPLUTL73FnrCRLF/KK5l0EU04H6aLj7KK72qtDNhPTr
 x/gJZH5lyQWNrQoPN98F6+bIH4nDqr3zP19KL1g9snUmHlp6N9fvXQZ3AXoJ+nfyJqsT
 ja+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFY8gbftuD2oS2O3qOfUMO0vX2TDQ6X3v8+cLbWHd4M8jI/2N7YQPoKm8zxw7Ne3PTE8eXI+AFcTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP3IU03xnOlzepXRRrUTR0c++x0deel0iXAfV2FwG18rnBw/X0
 fxkgJNh9hqVc+SMTCC8knaJs33x+4Q+MT531LaakvBsfhmi1rdXWQDhlDQRGv/iaRpPw/MoFbPR
 0mBmDV1B8X2SQHQ/tkHY8ewZVOktRwaPc/K6Bpjr8HBug2qbHNDR3cjRwhBIMCxSrWYUw0Q==
X-Gm-Gg: ASbGncsUc/KLcBTCNuy/j5cC0aVbBY51kANL6lswnTjRz6T7tAmKwMzeTylhq87UkLD
 JheOlJh2gxaFWWHDQI0T4D+bDe6e8HGJ8MEec9NmJftKE4sBq6NuImll7Cv9tJYFJ8mr1dO5tjn
 dE5X0+5ZcZerXZBSbDTQ22cJ/k21wKToNdK80RqPiW73TWUsfewuka/Nyb3hwfEvMext4ApxN3N
 76lKSTw8n3c9jvl2I9/RHzKaMGNQpEIc7S9drRMX7SvEj1mAIxfML8zNlkkbOtO5iV2wqLHdQ8m
 skyoH2EA3PyOfFR5Q8QtnFwVK6vdY2xq+PbNWIJpGCGyK9PSDqLVvlEXhwFznhdSYbIuajuNDw9
 g1u8Qcz+8jL+/eL0pNMrXFSeOhLGZSUT11HCLvZiCJDKXFpQqOim9rDAUvQ==
X-Received: by 2002:a05:600d:4382:b0:475:d891:ec8c with SMTP id
 5b1f17b1804b1-475d891ed03mr3176285e9.3.1761299800031; 
 Fri, 24 Oct 2025 02:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYFxEJ+9vf53evEcAEZdGSa/MAWvLHBF+QBptEwj6rOjmFDqkrATeIFVyZrNhoUbZizrVxrQ==
X-Received: by 2002:a05:600d:4382:b0:475:d891:ec8c with SMTP id
 5b1f17b1804b1-475d891ed03mr3176075e9.3.1761299799657; 
 Fri, 24 Oct 2025 02:56:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cad4c81dsm83937215e9.0.2025.10.24.02.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:56:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org, jonathan@marek.ca
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] efi/libstub: gop: Add support for reading EDID
In-Reply-To: <20251015160816.525825-5-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <20251015160816.525825-5-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:56:38 +0200
Message-ID: <87qzus8vxl.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Nuy24ztTGp-WXDsvLEgnlso9eyrWPG6hHSH5uiDb6Y_1761299800
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

> Add support for EFI_EDID_DISCOVERED_PROTOCOL and EFI_EDID_ACTIVE_PROTOCOL
> as defined in UEFI 2.8, sec 12.9. Define GUIDs and data structures in the
> rsp header files.
>
> In the GOP setup function, read the EDID of the primary GOP device. First
> try EFI_EDID_ACTIVE_PROTOCOL, which supports user-specified EDID data. Or
> else try EFI_EDID_DISCOVERED_PROTOCOL, which returns the display device's
> native EDID. If no EDID could be retrieved, clear the storage.
>
> Rename efi_setup_gop() to efi_setup_graphics() to reflect the changes
> Let callers pass an optional instance of struct edid_data, if they are
> interested.
>
> While screen_info and edid_info come from the same device handle, they
> should be considered indendent data. The former refers to the graphics

independent

> mode, the latter refers to the display device. GOP devices might not
> provide both.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static void setup_edid_info(struct edid_info *edid, u32 gop_size_of_edid, u8 *gop_edid)
> +{
> +	if (!gop_edid || gop_size_of_edid < 128)

Can you define a constant for 128 instead of having a magic number ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

