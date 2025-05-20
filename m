Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C27ABDBD1
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851CC10E4BB;
	Tue, 20 May 2025 14:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="duUtg9kT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DEB10E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747750593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=61iPeRzvAixq/R6SwHKeq0ei0vc55YLY4T4B2HYFAlE=;
 b=duUtg9kT+GZ/BbU8euQIK48OKF3qIBXJBMJ7TP9d/uMhw7pW9/GwX/gvt3MyRBC082ytcx
 8mavr2CfZaYgnUBEm+RrLA4J4yaX71u9TyfeaUQCM6GHR4g4JvupDEKsEkzvOuCuPyEGYJ
 QRpVJ8iEQD0AFNsJ0d/jj9ZBV37SRIg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-H55gPYQeOz-NMuFvoF-Ldg-1; Tue, 20 May 2025 10:16:30 -0400
X-MC-Unique: H55gPYQeOz-NMuFvoF-Ldg-1
X-Mimecast-MFC-AGG-ID: H55gPYQeOz-NMuFvoF-Ldg_1747750590
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a362939f61so2051652f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747750589; x=1748355389;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61iPeRzvAixq/R6SwHKeq0ei0vc55YLY4T4B2HYFAlE=;
 b=CY+zStmSvWZYcEZdRJxeGWUd0ZQFLSDMHMFD+TQwmF0HhkOGLWWYovEDEMwk6G0V/e
 gIrM4+JLqogecht1zTCjg0+6Fl7X2fozVODhIFEj9X66o1/X93hoK44dw3PJxlcqoEEM
 21xt4QzWY5eNkzFJXIxqcJaDWb18MPcnvF7Ygt2HyoUNu88TjEOyw3SQafWa3riJ1o/F
 6CblUjIL0BNg5jXiyxxVViXoJNuJjYmXia7FwUkJG/sb9dG6Vgx1zaysl2sFKHAP0ydL
 VZNPqTjvbgndonoy9h38bLG4UsAJxaX1KFrbS7XCNR8ygm7izJSMZKtcjKYnirysRsCT
 2wTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtUrglqETl2q+V6Ek1YQsAbOFNy9KG9mT6LE8ISaIWTMICO11Nv2zt2NLgsbaprfg8dsOj5jTxR+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxopy2u5M0H3E/djB2+Jv+OIuVoTCT/m0sKWu9ymS5jss43IqK3
 3nfl9+o4MIG9sWG0rXD5/KyH8J8a2eVUGoela9aCw1+lAtJlMlfJmxtLKdTZaxKLMJWTjbYUhX+
 aajbGFtt/KlIpwIzcFHYR3wqvNcTX3y0rxebifBUHdxOIG9UDRYpLjXwMfcurImF/u6/u6A==
X-Gm-Gg: ASbGncuH24Ua3YMCU3y9UhDSITLnnPH3UK9zFSXjF8QU2gVlJGrWdG4Ulsek8gaFPhU
 s2JL5e6LGxGzYLwyPeNV/vOwhoFyTLGqoYHN/UijJETZE77qz2JlszWdGsjDIePD0jVjlbEi3T5
 Oj9vSRX1NOHobYIYJ1zn65TxFmJFHVBElLDSOdq439oHNK6IZdxqPzIZfkp49nLEmkaoaD1C36Y
 oYetjlCPdSBg37KsQcErrI+5EANpnZ/OYvbn9YN51eOhxDgvhoWuHnPm9CQ3lxVe1JKcGPzvmip
 /cqetgRp+PZi5hWeWV1cDU80c5LWfn9jbrVm9JWaGaQF4cgxpAjoG/V/nMv+ZgGZpHIBsQ==
X-Received: by 2002:a05:6000:430d:b0:3a1:fed3:7108 with SMTP id
 ffacd0b85a97d-3a3600da40fmr14525826f8f.40.1747750589610; 
 Tue, 20 May 2025 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrGDGNPueP8M5oY1rssyDAAoA7kWAMi94I273UUlkBQWltVoKwRePTOwwFy/ypnlP9yt8vbw==
X-Received: by 2002:a05:6000:430d:b0:3a1:fed3:7108 with SMTP id
 ffacd0b85a97d-3a3600da40fmr14525794f8f.40.1747750589210; 
 Tue, 20 May 2025 07:16:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca6254bsm16931304f8f.52.2025.05.20.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 07:16:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
In-Reply-To: <990c04a5-6477-42c0-986d-9b63a30ac90b@suse.de>
References: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
 <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
 <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
 <990c04a5-6477-42c0-986d-9b63a30ac90b@suse.de>
Date: Tue, 20 May 2025 16:16:27 +0200
Message-ID: <87plg3nz9g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o-xYCabVtMLd6HCgi6mI-MyIHQ0JdG3TduRIEUAB3-M_1747750590
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

> Hi
>
> Am 20.05.25 um 15:09 schrieb Geert Uytterhoeven:
>> Hi Thomas,
>>
>> On Tue, 20 May 2025 at 15:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Am 20.05.25 um 14:40 schrieb Geert Uytterhoeven:
>>>> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
>>>> the old symbols were kept, aiming to provide a seamless migration path
>>>> when running "make olddefconfig" or "make oldconfig".
>>>>
>>>> However, the old compatibility symbols are not visible.  Hence unless
>>>> they are selected by another symbol (which they are not), they can never
>>>> be enabled, and no backwards compatibility is provided.
>>>>
>>>> Fix this by making them visible, and inverting the selection logic.
>>>> Add comments to make it clear why there are two symbols with the same
>>>> description.
>>> These symbols were only meant for variants of 'make oldconfig' to pick
>>> up th enew symbols. They where never for being selected manually.
>> But that pick-up does not work, unfortunately...
>> (I know, I had one of them enabled in one of my configs ;-)
>
> I see.
>
>>
>> The alternative is to just drop the old symbols, and ignore current users.
>> Which is not that uncommon...
>
> If there's no easy fix for the current setup, I'd prefer removing the 
> old symbols.
>

I agree. When this was discussed, I argued that we should just remove the
old symbols and let kernel packagers to deal with it. As Geert said, it's
not uncommon for Kconfig symbols names to change over time...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

