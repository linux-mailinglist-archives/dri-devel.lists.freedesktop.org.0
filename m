Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E0ABDD78
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468D710E4DF;
	Tue, 20 May 2025 14:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xw8XW/D7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A5410E506
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747752131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BUukwfEnSXPmCGvCdBvi67igzNFP2XiJNFPtM3ycw68=;
 b=Xw8XW/D7Yya6mvzUNA6EZfQMTinAlwdDPNvCvrtPb4yLZkfn4yDNzdUFv7A9okjXpHBko8
 mUHwirOrX8/n2GGMIb1cTAy5Dhm3m3mOtwsgMPY1yiNqnIeAJAc108EQ/wVPyTv6sAgG01
 T1qFJJsHqCJxuxljX+27FyXOcp6+hiE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-GekqgyheNIeoxOq9aDYDrA-1; Tue, 20 May 2025 10:42:09 -0400
X-MC-Unique: GekqgyheNIeoxOq9aDYDrA-1
X-Mimecast-MFC-AGG-ID: GekqgyheNIeoxOq9aDYDrA_1747752129
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so43098845e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747752128; x=1748356928;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUukwfEnSXPmCGvCdBvi67igzNFP2XiJNFPtM3ycw68=;
 b=byZ6lTU6vCkoV9pgGZ1QZeSSKlfbT+eixjHB9R+z1Pok6sCPVnVp64ZDUEr8ESZLNz
 iqMk6SOLYctZwOshrEUXm5YygxwF5byqalZCPzAEzVgaJAhyVEIfsu4lyEVDR9QQ7Hd4
 wz+jbn3cl6lLR8sINgTzpPx757FhrSQlgec8ZI8JfoUuzmyhmr3oUbiJwBoRqqm35yXt
 Oqi6gwXAfRD7irEcwLdL7W0pbOUim+XVZJQPSEMLAtTK95EGpiIOVhGzJf7RaEeFVEzB
 4EENdH9e8jO2lCjV2P3XN4f0s0Zl1jd4VSrD3PxyUV98bWEcrW7JS8CcprT56Flcbo27
 Uwxg==
X-Gm-Message-State: AOJu0Yy1J0ybdzOB9MiYZekLXarcwPkewoRLEt+60cbALiS+5dTOmJ83
 e433FImrCkZMEXI0gni+9H6XZA1lDAq250uV7FkmePKUkm7W65SwAIyRy6GxEOZHHz5Po43H5gC
 bzdeOfAaFvlqSFJBltmQrJs5UTicGaS9eQq7+NwpJtkrMfEqMi06MdjP5ZFATeWpNUam9EA==
X-Gm-Gg: ASbGncth8wFZHYRe2XMJoZaBxtjlrNME8/kc1tgBTkwdZMQjvU2O4LqRPv8sxbJv8JO
 1GdCr8D0lcK1bCYoNcnSVRphnX4JgY+ZR1ohdyWgsQPda3byXNNJyw1tIbCq71H8ec3kjGBq2t0
 Mg3c48wYWPnnB+oiN37ApsMW+lD43Gpbk2jPubr0/6+YziAuL50q3sbEHyyT6LIvJ+qBMHHosq2
 GJzPESpVgNhrc0TyK+aKXrGAvxTqX+IIt3gMGYTMuwLr3J7INbNH5pT5/DfEUwr7aZC8v90ozwy
 GtaUZGLmu/aETxn2ltC3BPN+t26PDaQl47Ka/BsDjNiPl5ItitGm1qE7lJkmK7MeNl5Y8Q==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-442feffb6damr179864185e9.15.1747752128639; 
 Tue, 20 May 2025 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNEuQwcOFxv9bPRsE9EPoajonwSbszaR/pW3Z0ORoLRovxfk8Z15ual0SZVnipzIpeRyHUvA==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-442feffb6damr179863805e9.15.1747752128231; 
 Tue, 20 May 2025 07:42:08 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8874bsm16831518f8f.67.2025.05.20.07.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 07:42:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility
 layer
In-Reply-To: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
References: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
Date: Tue, 20 May 2025 16:42:06 +0200
Message-ID: <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LFVXlSQAojgQUv8tMXFUIbLr_y7sSymj-qNhm_37ERc_1747752129
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

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
> the old symbols were kept, aiming to provide a seamless migration path
> when running "make olddefconfig" or "make oldconfig".
>
> However, the old compatibility symbols are not visible.  Hence unless
> they are selected by another symbol (which they are not), they can never
> be enabled, and no backwards compatibility is provided.
>
> Drop the broken mechanism and the old symbols.
>
> Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

