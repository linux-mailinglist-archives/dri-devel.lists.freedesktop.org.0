Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329357FC3F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677ED10E189;
	Tue, 28 Nov 2023 19:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F910E189
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701198202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7fxhtCiZKd6JnIB//hIKwp+z4CDot8wjhjF2B4UWc4=;
 b=A2JTrMdrHaQfRLhqV1g+bSfa6ipYdPJN0TBjs2ViCP2FRDEW8Aexhux33z81b6MegSM2F6
 1Bnn07Ygh2F2pnzwd4op7jzlJWo2a3Ng5XSXkH6sQ7SdA1D931dusBll7dHnILTrXP2RL1
 D0AFREIp8JKES+m7ELmDcM7l8zUaM2k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-9ZG4iJ8bPzC9ve-ERafrww-1; Tue, 28 Nov 2023 14:03:21 -0500
X-MC-Unique: 9ZG4iJ8bPzC9ve-ERafrww-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-332f3c6614bso2584862f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701198200; x=1701803000;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7fxhtCiZKd6JnIB//hIKwp+z4CDot8wjhjF2B4UWc4=;
 b=XHdzV8n4RJg1ZRlvo/X1fUNKAPa0LGgicsDO15f6FEkH53qst/oXHFVZgjmEmdEoeX
 tr0YVJV9XVCryMCbkLbv8HpuYiXG86IBQlVF4q7Y9+dYVwOdkUMEDcrS9bZMACGH06Pa
 bTxS7O/5S52MyLNEfuGo3E1pqQJfTlGm0GMY3KuXO93eFU5SRQi6r+A5J1GYrPnwHRak
 4PKl8RW+eeHkaHuiV62Ybbzl1+AtFGMA3bbUsyv22ecgb363FrFprrMNRZ9MENikrOi6
 wXGtl4YKLULT28k2CcM56fXyhH79xpwbAmGEF7kdjMhkG2zVr1rOmI7iLPC6ku8kEvMB
 Efdw==
X-Gm-Message-State: AOJu0YyQML+3V8FRVDJ7dXNb8o7hY5SFAYp6ii6mCjoWhJmvI1al/CWR
 WJ+WjCWos6L7wHoYt5gEDodRqAMjqacJvX2i71bGDreKmv9qXg67A27rMpEq9i18ikLgbAqvOR9
 h+J77KHpH5zLnhFapIA/Bf1MiCVfU
X-Received: by 2002:a05:6000:2a6:b0:332:f501:8b44 with SMTP id
 l6-20020a05600002a600b00332f5018b44mr9536207wry.0.1701198200326; 
 Tue, 28 Nov 2023 11:03:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJqPO3wUdCQkqTIxQaKE7gUDOBcDnVqGZttWHciV3/WIgYoBUxR7C7Qe/kNwOdFtf3erAVwg==
X-Received: by 2002:a05:6000:2a6:b0:332:f501:8b44 with SMTP id
 l6-20020a05600002a600b00332f5018b44mr9536191wry.0.1701198200032; 
 Tue, 28 Nov 2023 11:03:20 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b00332e6a0e9f4sm14388974wro.75.2023.11.28.11.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 11:03:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Frank Binns
 <frank.binns@imgtec.com>, Donald Robson <donald.robson@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
In-Reply-To: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
Date: Tue, 28 Nov 2023 20:03:19 +0100
Message-ID: <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> The Imagination Technologies PowerVR Series 6 GPU is currently only
> supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependency on
> ARCH_K3, to prevent asking the user about this driver when configuring a
> kernel without Texas Instruments K3 Multicore SoC support.
>
> Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Indeed. Although I wonder what is the supposed policy since for example
the DRM_PANFROST symbol only depends on ARM || ARM64 and others such as
DRM_ETNAVIV don't even have an SoC or architecture dependency.

In any case, I agree with you that restricting to only K3 makes sense.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

