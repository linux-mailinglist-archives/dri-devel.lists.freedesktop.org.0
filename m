Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A507171FF86
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9765310E654;
	Fri,  2 Jun 2023 10:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4267410E654
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685702383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1oIs4hW1Px3lZ0xUVZ1XPcup+O4BGgrBN10BZiIxxqM=;
 b=jLvHtBInRKV++TT0+UFAL7w31NdS7YrCK70E446gPlzIpRr53s7SMHCe00tqP2MqisCrnj
 pdAP/dsEsSrTsfLGxQZXIuDrtsdvCMj+oaxVU51gMDbSfjDrGaGnWq+UiqzQyL4eeYU4wh
 ciHl/YutEWz2n6Ibl2axL7MEmHUKwrk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-kzVsRQDAPNWKjp-42oYR0Q-1; Fri, 02 Jun 2023 06:39:40 -0400
X-MC-Unique: kzVsRQDAPNWKjp-42oYR0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30a5d4e5731so990789f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 03:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685702379; x=1688294379;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oIs4hW1Px3lZ0xUVZ1XPcup+O4BGgrBN10BZiIxxqM=;
 b=VWR38ZHEcMbEWfI440P9AJe/rs8iq4CIAY90WbyUSgAin8ZDEZyQ8hso2txpxPqaGQ
 d/VdAnNE/4mTHamPURBu+qbEkY8owz62vfi3EglHkiFEuyy5Ie7TNthsXx95EvpyfNSR
 lsAjRmQBkKg5hiT6LbPgusI3ddIX1Zygn4V20iv+ZbVaHWrGEW7D9WQ5OWWbMXUEWZHL
 zMDygUV3kKmgDPqmzsTnHO2jczXxZE+j91pDDVmQHRPwZA/pwhUY6ZedvabU7ltYn9B9
 BOdDdbQTcmlmKEBNncLlNS/e2pC3zpt378479VC4L7A0hkk7QVKLWNFkL06ARZbxpzzF
 W/Sw==
X-Gm-Message-State: AC+VfDxEkhtGz3FcZSxsd+VLx4v0MXnW9ZFj02a6WDK9TFFUAZTf1GCO
 krWVHFRstKNZcxu+Z+yPH3xXNHnr/BmT+jQcabzsUc9lpcrFshoR/9Akmav/+2Fgtdv2ixWikhN
 OfoWZowqiZljGEx4gCsUGYzVGt8wb
X-Received: by 2002:adf:ee8e:0:b0:2f5:930:39b1 with SMTP id
 b14-20020adfee8e000000b002f5093039b1mr3860435wro.38.1685702379774; 
 Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7OG85c64U2efVzPCUJ8A/7RK2BtGqWNJ8vfjLaFCk/P0e6jYLf17E10oKTfMRE/GAF6iGnSw==
X-Received: by 2002:adf:ee8e:0:b0:2f5:930:39b1 with SMTP id
 b14-20020adfee8e000000b002f5093039b1mr3860417wro.38.1685702379415; 
 Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b0030903371ef9sm1310817wrv.22.2023.06.02.03.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Biju Das
 <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
In-Reply-To: <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
Date: Fri, 02 Jun 2023 12:39:37 +0200
Message-ID: <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

Thanks for your patch.

> The section about converting existing KMS drivers to atomic modesetting
> mentions the existence of a conversion guide, but does not reference it.
> While the guide is old and rusty, it still contains useful information,
> so add a link to it.  Also link to the LWN.net articles that give an
> overview about the atomic mode setting design.
>

This is a great idea and agree that would be very useful to have these.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/gpu/todo.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 68bdafa0284f55f6..51eb67f5268c5ec1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
>  really want an atomic modeset interface, so this is all about the bright
>  future.
>  
> -There is a conversion guide for atomic and all you need is a GPU for a
> +There is a conversion guide for atomic[1] and all you need is a GPU for a
>  non-converted driver (again virtual HW drivers for KVM are still all
> -suitable).

Are any of the virtual drivers not yet ported to atomic? This sentence
seems to be outdated and maybe you could remove it on a following patch?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

