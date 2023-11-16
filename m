Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D947EDFE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC010E2E8;
	Thu, 16 Nov 2023 11:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8480310E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700134218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rw/Y06vMJw+yRqzRy2b73TtPoc6ulI8+aEjabQdVw8=;
 b=Z1skfQN3cxaUE8P4EzhhHM5BPatLT/kV0NJWUNqK00TC+FmcANMF6ofutLdVN4poog7iDz
 8VHN+xpPR8icQ6T0yEyJDZL5vmH2xydVCiHS3ZCdnlN1PEfvHQP7xrYB4p1wwSr08eybFa
 5u0x1O+u0HQUUE+bKVNxfDWyVVD5ml8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-OnwvQE2pNBCTjTiCZrpmkw-1; Thu, 16 Nov 2023 06:30:17 -0500
X-MC-Unique: OnwvQE2pNBCTjTiCZrpmkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40845fe2d1cso4142505e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700134216; x=1700739016;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rw/Y06vMJw+yRqzRy2b73TtPoc6ulI8+aEjabQdVw8=;
 b=utS+9gnk2qhS2nul7WDNgkG77NkxZYHXK0jqqbKF2n4fIveb5R01dQbYLzEv3j6sVE
 8LdfKiNIkWn7ocGeGFmX1+jrZTB6CI7AGwW2MPLtQNlnweqtBxoL7VvFbadjhux1KMxV
 DJCCtQtl1fXCivR6vCScwFOs+Czp7JPgj2B2hhvE/u4PISnaUPliwmwE/lKDTIHJ2Bm2
 pSgGvYzis2NZmAZjYMZtd/sgrGJLBFNnTzup2Apt55ODv10tMVDRGmzmic21uO7DKOJE
 vhoxN/HaOTfOUDC9RLU/ETRPjyhfyIY77XRzX0KoLYTgqMhPMcg+TUifDauhpQs6vmg7
 5BMw==
X-Gm-Message-State: AOJu0YyCwbjQui11/ItM+Mt3Mg8jpFudUcfpxxPikoteh/4mBRUqeezt
 4vwJ0f5/cOccTxl25H1oMkEd55O96poZeauZlWNO95mhyiv8YJvGcFf6d79VbwlBJjcKkyXKQsK
 LEHCx3GFqCRWoMBl24WEl9aGBaDSF
X-Received: by 2002:a05:600c:4c12:b0:401:d803:6243 with SMTP id
 d18-20020a05600c4c1200b00401d8036243mr13123249wmp.32.1700134216710; 
 Thu, 16 Nov 2023 03:30:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNP8sm6GS9ICIgmN7ODvHC6GI3xgBmbOiDc1FWEffDy9qcOMp/L9eZ6d+g379RfR2Gz68HTg==
X-Received: by 2002:a05:600c:4c12:b0:401:d803:6243 with SMTP id
 d18-20020a05600c4c1200b00401d8036243mr13123233wmp.32.1700134216363; 
 Thu, 16 Nov 2023 03:30:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0040813e14b49sm3244058wmq.30.2023.11.16.03.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:30:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 22/32] fbdev/vt8500lcdfb: Initialize fb_ops with fbdev
 macros
In-Reply-To: <20231115102954.7102-23-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-23-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:30:15 +0100
Message-ID: <87sf562awo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in DMA-able virtual address space. Set the
> read/write, draw and mmap callbacks to the correct implementation
> and avoid implicit defaults. Also select the necessary helpers in
> Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

