Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E274B1FE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FC210E590;
	Fri,  7 Jul 2023 13:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED85010E59D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688737371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+owWNOWvEK7SZ1O/p9+BsoqrhRbp6l42ZVJTUZNbK4=;
 b=Xenq6UJn1NOjOXjCES7jHFGT/GcGEaFHCGMStAD82DrXhd5y8Z70KEr7NfwqiMKYLf/7x8
 9jJVGvY3DGYHdkQGwDHfE2yXPoevEDJYff4qbWOjz7zONPmCGISKMyWQCT37lkCXA6Qbis
 YJ9qm6LAUgdjYpt7dhG4b/I44RiCuPw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-vWNp35T-M0SyFXxDq3i5ng-1; Fri, 07 Jul 2023 09:42:49 -0400
X-MC-Unique: vWNp35T-M0SyFXxDq3i5ng-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3faabd8fd33so11445895e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 06:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688737368; x=1691329368;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+owWNOWvEK7SZ1O/p9+BsoqrhRbp6l42ZVJTUZNbK4=;
 b=WYxDkzGlgAj8XwW9C8QnRmvhxQtDE+AA8imBg0Cjvj3533QnXK30zpJzhiIP0w8Gvd
 TUi7kkMdCYR1Byct+yvBf9a+sUaHCX3pVS0E3Cv6tr5iWXtLyL3tawjARTRIsz5xGvig
 P+/6lWk2x3nzNUZxSBs1lq3jQNF4eXKlR42dhC8vkp4uIuVSpkkNiFyUXOBh4/YVbQt0
 6bfIqf+LE2tjczIFM6hG6HNPCGtQ8oU8oL7PgZl1mWrILJUlZS8fUNUl5bAaPsvi30Hl
 FCh4MV7fq/Gl61AZn5/Idtz8oJWDDjkNfUlOQldw+JikTNoQHFCPdECM+Nm/woG4b9mg
 4YSg==
X-Gm-Message-State: ABy/qLZEUDmqbQJBdXdyPAz3RnYpopLfV7ZBigiASOxf4656jZKn/cXH
 0XN3wooXsob9K3ZUSb2JWZ9+nwcLrfFUV1baRyumQO3aNoMx3SxXIxt7UTGXB/OaFvFh8nDXO5s
 QIDv3Q9B1Z/LqCI9blRNvnhVarI/lFETQj+tj
X-Received: by 2002:a7b:cd85:0:b0:3fb:5dad:1392 with SMTP id
 y5-20020a7bcd85000000b003fb5dad1392mr3824011wmj.17.1688737367976; 
 Fri, 07 Jul 2023 06:42:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEZxhfEH8UwFPHB4pXOYFja3GHddFsOU/EgTb58z7K38wBQ2x+vg0IaPSVH4aXqur2PYGn+xA==
X-Received: by 2002:a7b:cd85:0:b0:3fb:5dad:1392 with SMTP id
 y5-20020a7bcd85000000b003fb5dad1392mr3823993wmj.17.1688737367817; 
 Fri, 07 Jul 2023 06:42:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc30c000000b003fba92fad35sm2498874wmj.26.2023.07.07.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:42:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] vgacon, arch/*: remove unused screen_info definitions
In-Reply-To: <20230707095415.1449376-4-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-4-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:42:46 +0200
Message-ID: <87edljyh0p.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Brian Cain <bcain@quicinc.com>, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA
> console driver in an allmodconfig build.
>
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Nice cleanup!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

