Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C266AC9EA96
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C1B10E5CB;
	Wed,  3 Dec 2025 10:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J3SlxfLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FE710E5CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:13:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C15BF6019B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FE9C4AF0B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764756814;
 bh=Cze7ErqqkpLz+XZgBbYQeWtEMFdLresxu3cFBZSDmwI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J3SlxfLjIXh7j++wbN3LncYbvLl6gZsy/73oKRu0K4omyZDnH99kc/y72vXNcMec8
 a2LWZRFf29nrTz4wRAXVJme9R6jQQfS4XxbXaafn+HGga8139pa6T2bRmqj08E8UEG
 zVj0IMja6R1B7t8gvoskW4PRaeUOzvVgiwM9sUMozhYi/Hge/z/DRvVJqHDHLBNqrl
 EKe3AYszafBC4jxYpvBWcjkPOGoCytXYrMo64GNvUMvIsfThVjKbgtWIhiI3PKBHgE
 NPHV5NvTk2MBzgNNd/3Ll1Pf5lY5/hu5gwVq+/VkjV/wBOeNQ59cz8YOFaY/QKdNdn
 rb7UWk74j8YSQ==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-594285c6509so7657585e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 02:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWzhJTCC8sr4BneTO325pna4J3mvhrzkfQtDT/LHaUSJNbwxm0zZzMq1Va96RWZvkMvQ0s/74z1wI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDD7mtpifrML/xeuUk5Svv1ntntPxr5365zu3fE81rEST0ghgq
 1xZy+uOiY/nZNM0OvG8mqK0JfbnT6BGOD8SsKfOkrzR8/Nwk+iI/6H9AWxiQW7KxSWUwzAEpLsE
 mZaOp0qwmi6oRP+zNgU9+QgeQx6O58HM=
X-Google-Smtp-Source: AGHT+IEjQdkj/1Cic2lgrgFI19Se8QQ3Qy9UY9j5vrT08a555bfB2V1g7tUBZQ/05JQna5TxbQlzBvcPBTY6A+9cW6k=
X-Received: by 2002:a05:6512:3d9e:b0:595:90f9:b9d2 with SMTP id
 2adb3069b0e04-597d3f017f7mr851029e87.3.1764756812858; Wed, 03 Dec 2025
 02:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
 <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
 <5ecc23ed-929f-4e60-a7a1-d4bd759e9af2@suse.de>
In-Reply-To: <5ecc23ed-929f-4e60-a7a1-d4bd759e9af2@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Dec 2025 11:13:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEVq65rBQraKn8kcCiA6wU7tPfCCbf2Bma4F3p0As3ToQ@mail.gmail.com>
X-Gm-Features: AWmQ_blXylcyxLDhJlO_QB6L4rIs-0IgKCx6-qBnsdZeLqjAGgiMfCwJCVsEYwk
Message-ID: <CAMj1kXEVq65rBQraKn8kcCiA6wU7tPfCCbf2Bma4F3p0As3ToQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on
 Valve Steam Deck
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Dec 2025 at 11:05, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 03.12.25 um 10:07 schrieb Tvrtko Ursulin:
> > Valve Steam Deck has a 800x1280 portrait screen installed in a landscape
> > orientation. The firmware offers a software rotated 1280x800 mode which
> > GRUB can be made to switch to when displaying a boot menu. If this mode
> > was selected frame buffer drivers will see this fake mode and fbcon
> > rendering will be corrupted.
> >
> > Lets therefore add a selective quirk inside the current "swap with and
> > height" handling, which will detect this exact mode and fix it up back to
> > the native one.
> >
> > This will allow the DRM based frame buffer drivers to detect the correct
> > mode and, apply the existing panel orientation quirk, and render the
> > console in landscape mode with no corruption.
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: linux-efi@vger.kernel.org
> > ---
> >   drivers/firmware/efi/sysfb_efi.c | 56 +++++++++++++++++++++++++++++---
> >   1 file changed, 51 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> > index eacf9a50eab2..566492e67798 100644
> > --- a/drivers/firmware/efi/sysfb_efi.c
> > +++ b/drivers/firmware/efi/sysfb_efi.c
> > @@ -231,16 +231,42 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
> >       {},
> >   };
> >
> > +struct efifb_mode_fixup {
> > +     unsigned int width;
> > +     unsigned int height;
> > +     unsigned int linelength;
> > +};
> > +
> >   static int __init efifb_swap_width_height(const struct dmi_system_id *id)
>
> It's something different now. Can this please become a separate list
> with a separate callback?
>

Why? That means we have to introduce another dmi_check_system() call,
and manually implement the logic to ensure that it is not called
redundantly, i.e., after the first one already found a match.
