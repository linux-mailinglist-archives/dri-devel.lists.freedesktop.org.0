Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B096BE5B6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD8810EEB0;
	Fri, 17 Mar 2023 09:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D111E10EEB0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:35:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75AFFB82557
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CF8C4339E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679045746;
 bh=Omg+SkEpbIcXnNJopGMFeOZdmErKoHj8IKn0VgieQFg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EoNN4dyVUga9iD0RDEZ2TnJC77q3IYSOv9J03dgc//D2E0pke0MgdMd0b5JOXYSb7
 QXIpcd9BAzGUSGqPXFYf4KYS2TlDwtlzUrDm881XQYv4/1TibjIb6kOBoIL5gxiSCZ
 a8x3SVPTG7DJW2/0vnqrn+O7kSlsibg3Z027SqfW8AlD0DP3mPZifXc8MvrYBoHo9A
 jJQsCMFltz0gkyA84f/Em73kDWZTH3P+3rs69F+wXyOYXMu/eFiH/f/neQtGz/caiz
 R3LQMy9+9dLMVtw9nERBi/ayO1eLHjH3dVXqpDBt+BnawoRAXvk/tngVnouAAZNtgb
 dz4c48jb7sg0Q==
Received: by mail-lf1-f43.google.com with SMTP id b10so4516653lfb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 02:35:46 -0700 (PDT)
X-Gm-Message-State: AO0yUKWom35oNOfSdpk3Cdf5JaLXKh5jNonFm4TQeTyoboZ9nkP5Aq19
 xnJcAXh4LuroB4SyxZnTzK5jqL0yx4NiTlf4zes=
X-Google-Smtp-Source: AK7set/pat6sxR9X2sBlMoniCNge7UuBIOTqvSvXr++BHQqWi654KI/9QQeHHQaB7UBlvAUKcwIEqSHGvKi7PdvT80M=
X-Received: by 2002:ac2:44a1:0:b0:4d9:861e:26cc with SMTP id
 c1-20020ac244a1000000b004d9861e26ccmr4116658lfm.4.1679045743996; Fri, 17 Mar
 2023 02:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230314123103.522115-1-hdegoede@redhat.com>
 <87fsa7l2e7.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87fsa7l2e7.fsf@minerva.mail-host-address-is-not-set>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Mar 2023 10:35:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHUQ9pvxdE4d1=ewME2MPn=Qh0zoiZpn6RARHLR12hEww@mail.gmail.com>
Message-ID: <CAMj1kXHUQ9pvxdE4d1=ewME2MPn=Qh0zoiZpn6RARHLR12hEww@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi: sysfb_efi: Fix DMI quirks not working for
 simpledrm
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org,
 linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023 at 17:32, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hans de Goede <hdegoede@redhat.com> writes:
>
> Hello Hans,
>
> > Commit 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup
> > for all arches") moved the sysfb_apply_efi_quirks() call in sysfb_init()
> > from before the [sysfb_]parse_mode() call to after it.
> > But sysfb_apply_efi_quirks() modifies the global screen_info struct which
> > [sysfb_]parse_mode() parses, so doing it later is too late.
> >
> > This has broken all DMI based quirks for correcting wrong firmware efifb
> > settings when simpledrm is used.
> >
>
> Indeed... sorry for missing this.
>
> > To fix this move the sysfb_apply_efi_quirks() call back to its old place
> > and split the new setup of the efifb_fwnode (which requires
> > the platform_device) into its own function and call that at
> > the place of the moved sysfb_apply_efi_quirks(pd) calls.
> >
> > Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> > Cc: stable@vger.kernel.org
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Thanks - I've queued these up now
