Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBB63C1FF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C8710E08E;
	Tue, 29 Nov 2022 14:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A510E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:10:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB04861758
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFA3C43470
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669731046;
 bh=yjeoowMISp8ZXjbYeM1VeAqgNGGG8tdL1ZXS1nEMcIw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iUi9i5TA9EKgTUtDjQ4qnNjuh0KfmmX7CBS/ILiXLr3Uj6m8toeXp8J2liUoFZimf
 5t/aOsxAbZj6/LT3/ZEe8iEqYqYP8AO/kNuhHuwic3OXKq57Yu6iT7GV9c64WDiAYj
 2NSEu3NJKzjIbqbHFMnnAy5ftsV8HVRF4UaR7f6nUDYCQWMCIUa/i91Jp/60AoFesu
 e7u5dKjmM1J0fXkWEvou9+FUTsrPdwM02Npfolv7Yzu40XyZpVw1qkSVlTBFgfAbci
 TNkrfPosnDrbQClrlmd4b+X4rsypZfEte7uFIf3ajoAYMPybFvIhORYMfg0LMYgCAw
 aA9N0j/1F73/Q==
Received: by mail-ed1-f52.google.com with SMTP id r26so17832364edc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 06:10:46 -0800 (PST)
X-Gm-Message-State: ANoB5plkqt5W5CSBIa4DFSyaM5uRH5omiRr5BoBS5eT3u/7jJYER0gES
 gKW1fAvvLxWvxatqMQHhw+On7hf9aNJ+pP7jJNc=
X-Google-Smtp-Source: AA0mqf7QjiamBW+KE/Z8uZbmanCe+55uA1tljNSDFV7FahyhBBzvSmbUSlYsCKjPBBIvFRP+/cSfYR+FVUYixBHntFc=
X-Received: by 2002:a05:6402:2b91:b0:457:23cb:20ab with SMTP id
 fj17-20020a0564022b9100b0045723cb20abmr37470283edb.254.1669731044805; Tue, 29
 Nov 2022 06:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20220704011704.1418055-1-chenhuacai@loongson.cn>
In-Reply-To: <20220704011704.1418055-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Nov 2022 22:10:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5mwVc5b_dHvkqyCWsTa8eTj6pWF8oC=-4hQNoKwg3A9w@mail.gmail.com>
Message-ID: <CAAhV-H5mwVc5b_dHvkqyCWsTa8eTj6pWF8oC=-4hQNoKwg3A9w@mail.gmail.com>
Subject: Re: [PATCH V3] drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync
To: Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping?

On Tue, Jul 5, 2022 at 12:22 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Consider a configuration like this:
> 1, efifb (or simpledrm) is built-in;
> 2, a native display driver (such as radeon) is also built-in.
>
> As Javier said, this is not a common configuration (the native display
> driver is usually built as a module), but it can happen and cause some
> trouble.
>
> In this case, since efifb, radeon and sysfb are all in device_initcall()
> level, the order in practise is like this:
>
> efifb registered at first, but no "efi-framebuffer" device yet. radeon
> registered later, and /dev/fb0 created. sysfb_init() comes at last, it
> registers "efi-framebuffer" and then causes an error message "efifb: a
> framebuffer is already registered". Make sysfb_init() to be subsys_
> initcall_sync() can avoid this. And Javier Martinez Canillas is trying
> to make a more general solution in commit 873eb3b11860 ("fbdev: Disable
> sysfb device registration when removing conflicting FBs").
>
> However, this patch still makes sense because it can make the screen
> display as early as possible (We cannot move to subsys_initcall, since
> sysfb_init() should be executed after PCI enumeration).
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit message.
> V3: Update commit message again.
>
>  drivers/firmware/sysfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 2bfbb05f7d89..aecf91517e54 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -80,4 +80,4 @@ static __init int sysfb_init(void)
>  }
>
>  /* must execute after PCI subsystem for EFI quirks */
> -device_initcall(sysfb_init);
> +subsys_initcall_sync(sysfb_init);
> --
> 2.27.0
>
