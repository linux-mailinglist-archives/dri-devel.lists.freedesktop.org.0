Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B874B197
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3464210E0C2;
	Fri,  7 Jul 2023 13:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D337C10E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688735824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9JvrGxpvmS801EGByUJbO9yImJLqiJJEkFic7ujcF2c=;
 b=cyJd1AFqz0ohhuThlC4anvdAQ1DmqYmgXCiRlpcmBOOi3irK/LGDk/sJU2/zsE50Ci/p0B
 LyAebkTbZKpdmTHZ8tjyFAAo0AcAt/0iPTbVuUMRo7ScIp1gfGtemzgC8L/rOZSDvmAe25
 C/6OnEBlTpvGCUqr+DXP30Mzwk2CmUQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-jstmZhX5MOaMRtpTU-BWYg-1; Fri, 07 Jul 2023 09:17:03 -0400
X-MC-Unique: jstmZhX5MOaMRtpTU-BWYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so11205165e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 06:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688735822; x=1691327822;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9JvrGxpvmS801EGByUJbO9yImJLqiJJEkFic7ujcF2c=;
 b=LXPJrqnAv/MwXhjc25JQsOi0ASNdpnvxKyKv3s9dh+vIHcAiBAKFBNVQfHGR8BlQ7W
 7I3ywcz5SUA4EhvJD22tqtNulOIZShiKI6Uy3nvz7IhEZ1EoxSGYaQ3hEF9zgUlbVL4K
 t2AHXIblkdhS5phwU6aOThZaPtDKrQigVO70xqytum3ApiU/h+AfL/Pblyp4RKBVqVSn
 ROhNoYXZO/QNZxZ5dIFxeXk3SW7LqKHcVwH6C9wxC7vVA9MoALQc/p2jvVX5epu2IKv8
 rvIF1l4o1y7e7LjrnEK9Ugv/Ij2DBlbmBMaJ5ypWzr53G2opAY1JkS/b8UbUBhaepsN1
 oz/g==
X-Gm-Message-State: ABy/qLYSJAR+0MP++ZSng4eSBqAuL+TpFlKdjwo6RA+gns0mWElCG4Gq
 HIRjM35I3DSgbnGTfQ8i9d8ToKej/DWWpB05UDqJAYz3Rki37S+k2As/oDcpO0fEqiK/RRT5nrl
 j2bgBxlfswrfY3sbGODZ3FaL/ll44
X-Received: by 2002:a7b:c408:0:b0:3fb:d1db:545a with SMTP id
 k8-20020a7bc408000000b003fbd1db545amr3779649wmi.15.1688735822573; 
 Fri, 07 Jul 2023 06:17:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWyEpITRdc6V/WDH+p8W9PEEzo9YNPXNRcelMOGQxrDOPXrD+EG7aq4IUiQzrsbuo+XZhh+g==
X-Received: by 2002:a7b:c408:0:b0:3fb:d1db:545a with SMTP id
 k8-20020a7bc408000000b003fbd1db545amr3779635wmi.15.1688735822235; 
 Fri, 07 Jul 2023 06:17:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003fbaade072dsm2474749wmj.23.2023.07.07.06.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:17:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
In-Reply-To: <20230707095415.1449376-1-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:17:01 +0200
Message-ID: <87mt07yi7m.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-csky@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
>
>  - arm lists footbridge, integrator and netwinder, but netwinder is actually
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.
>
>  - mips has a few platforms (jazz, sibyte, and sni) that initialize
>    screen_info, on everything else the console is selected but cannot
>    actually work.
>
>  - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>    in the opt-out table and declare a screen_info to allow building
>    vga_con, but this cannot work because the console is never selected.
>
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Both our explanation and changes look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

