Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE497669B1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3810E6D4;
	Fri, 28 Jul 2023 10:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4206C10E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9uBh6FMvfeDKYc8dvTUQUg/D36NNqMboTJZgEA5t70=;
 b=NhdTBWxS5zR1hpSMFz0ovjNKayFZuMdr9Ia+UJXS92OtxtnMCdsxoWcggPNmIPsvytudVs
 WCG+b/ggyLRvIW44zHMMoNAiZnbiTKmumvZF8CbEo7ibPVKNVFy+9sJr5jVsSs8hXMRTyv
 bJL0UN4PkKDt+6wUBDTtp7/9hpWsJp0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-WdqgvEV-OOiMZyx0OY8-aA-1; Fri, 28 Jul 2023 06:03:10 -0400
X-MC-Unique: WdqgvEV-OOiMZyx0OY8-aA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fb40ec952bso10992755e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 03:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538588; x=1691143388;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p9uBh6FMvfeDKYc8dvTUQUg/D36NNqMboTJZgEA5t70=;
 b=ejYnLQUMWn8njuuylCYinS/47x8mXmHxkcVnPS4u7f6+5d15UfUDD9R7edRxrcSeIC
 x7LjpDkOT49N/ptJbOW+5mbL62BmTLHrhx/JA7CADtnsE06IG8DsNmu1sM9dKAah3KWa
 h8kzYUwI6iHnH05DbMJ+UX3yT8nu2l84O2hfnB5TyOJxK8hLQw5FCh8ayR/EaLejqZtx
 NaOrBKVW8m/XCMjLqZW3vtmFFvjSIxCjCyVXsXoANQ6UcuIuZj5szxUen+M0BFJk8CzO
 aB7FTumz9hUe09WiaApId/AaP/vEB5hBeftiVSMzhZJncKK1r4C9CvEv3MxSat8Qq4+k
 vUdA==
X-Gm-Message-State: ABy/qLYpj6X5SMDXbegygxRezJYrRSffFoY0c9IXPbF5JnQuMLVSY7Ue
 4UEyn+Ia+p9KIELa1mPICRlkFI8m2JWNh9WAmVvKiObx0sE8eUJcU20NCuGo8YQkiorI7tkx7IF
 XvBO/vUzOYh6gHFTNx5vql4mW5xs8iWnkEdJM
X-Received: by 2002:a05:600c:20f:b0:3fe:785:ac0b with SMTP id
 15-20020a05600c020f00b003fe0785ac0bmr1222140wmi.5.1690538588605; 
 Fri, 28 Jul 2023 03:03:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHtdYABsrhIonVjfx9OTENY+L0T6vf82VlJ9iuT/7Og+9ZVj9h0aqYiRuknX63TfNx/AP5fxg==
X-Received: by 2002:a05:600c:20f:b0:3fe:785:ac0b with SMTP id
 15-20020a05600c020f00b003fe0785ac0bmr1222130wmi.5.1690538588357; 
 Fri, 28 Jul 2023 03:03:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c20d100b003fba6709c68sm3763721wmm.47.2023.07.28.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 03:03:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller
 <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] video: logo: LOGO should depend on FB_CORE i.s.o. FB
In-Reply-To: <e4142b7cc9aad9975de1bc6b1c7d86ccee487e4c.1690535997.git.geert+renesas@glider.be>
References: <e4142b7cc9aad9975de1bc6b1c7d86ccee487e4c.1690535997.git.geert+renesas@glider.be>
Date: Fri, 28 Jul 2023 12:03:07 +0200
Message-ID: <87tttoxsis.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> If CONFIG_FB_CORE=y and CONFIG_FB=n, the frame buffer bootup logos can
> no longer be enabled.  Fix this by making CONFIG_LOGO depend on
> CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for the
> logo code to depend on the presence of real frame buffer device drivers.
>
> Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

