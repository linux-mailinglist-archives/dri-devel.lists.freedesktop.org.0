Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F110474B1FD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10B410E597;
	Fri,  7 Jul 2023 13:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E6D10E596
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688737313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lszDzBh1sFuGKtdYdBJwoIUw40PY44r7U0tPTyFHI1Y=;
 b=C/uyhEkVC0bU0K+UW/LzuhSwAQkh8RUXH/vtze2/wMvwdbIS6mpPJv3Xu3DQcfmXbrKWlr
 xwKyboxorQGfX2QYyxKvBVUnogYoc3GxjMECSJzQGQgG+LY3k8WPWFxbjOX/xe4Mee/cK4
 IV43bpa3bZmt7xDYjDJ1e+egK+hvwrg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-0metR71yNFSO1_Mn7i7olQ-1; Fri, 07 Jul 2023 09:41:52 -0400
X-MC-Unique: 0metR71yNFSO1_Mn7i7olQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3113da8b778so999012f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688737311; x=1691329311;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lszDzBh1sFuGKtdYdBJwoIUw40PY44r7U0tPTyFHI1Y=;
 b=JvkhuASftiyJqzp6axWW4I/8+DUazOML3pX6kQiwldvIsNRaPuonV8GR75YlgDheU7
 3XjcfstIDJB3ILTspdA12Z/1Scohv3U09WGnH8Cq/KXbsLM5CV3dLCHCDt+BOyFtT0A8
 a5CkP/MjPLFkQBFXS0r10Sjqeh5jePVNCdz9SzKl8hS/5RS6ue1FYZAzhhnM+xibIWoY
 HLldHtGFqUahhGXKq/7K0XClRTFgrDPVkyogEnOjxqtiYNqFVIWduERwWl7oUUzEpnRY
 5N0dRSbX6MMCCriizDUo01r1hpDgiSLQlXYF/iRpUnf6iy4PcmlYReMojVmXEw2REzMT
 mzPg==
X-Gm-Message-State: ABy/qLYMymbnN2nKuLLJdQGk+sQTQqTIrvYRVqVoVIuzyN+iiWhsXUr4
 3PXHd2qHA89K6I/ag77v0FctZmu2aEvl9k+gqnr8DNlSZ7P5CR/XL4P9zn4cv77nXZLq5LcSHjJ
 h/HevD8ze2FW9dv7o6RBFuAlSP8/N
X-Received: by 2002:a5d:4d4d:0:b0:313:ed1d:39d5 with SMTP id
 a13-20020a5d4d4d000000b00313ed1d39d5mr3821989wru.35.1688737311028; 
 Fri, 07 Jul 2023 06:41:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHSL73NnelkECzSlrHFzZyBm2hgT0OM42vU9A9OivdXpoF5fr4x25M2kgCTNebgI6XNosfvXQ==
X-Received: by 2002:a5d:4d4d:0:b0:313:ed1d:39d5 with SMTP id
 a13-20020a5d4d4d000000b00313ed1d39d5mr3821963wru.35.1688737310726; 
 Fri, 07 Jul 2023 06:41:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g23-20020a7bc4d7000000b003fc02a410d0sm181059wmk.48.2023.07.07.06.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:41:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] dummycon: limit Arm console size hack to footbridge
In-Reply-To: <20230707095415.1449376-3-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-3-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:41:49 +0200
Message-ID: <87h6qfyh2a.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The dummycon default console size used to be determined by architecture,
> but now this is a Kconfig setting on everything except ARM. Tracing this
> back in the historic git trees, this was used to match the size of VGA
> console or VGA framebuffer on early machines, but nowadays that code is
> no longer used, except probably on the old footbridge/netwinder since
> that is the only one that supports vgacon.
>
> On machines with a framebuffer, booting with DT so far results in always
> using the hardcoded 80x30 size in dummycon, while on ATAGS the setting
> can come from a bootloader specific override. Both seem to be worse
> choices than the Kconfig setting, since the actual text size for fbcon
> also depends on the selected font.
>
> Make this work the same way as everywhere else and use the normal
> Kconfig setting, except for the footbridge with vgacon, which keeps
> using the traditional code. If vgacon is disabled, footbridge can
> also ignore the setting. This means the screen_info only has to be
> provided when either vgacon or EFI are enabled now.
>
> To limit the amount of surprises on Arm, change the Kconfig default
> to the previously used 80x30 setting instead of the usual 80x25.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

