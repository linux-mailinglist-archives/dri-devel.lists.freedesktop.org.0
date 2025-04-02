Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB9A79049
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9D10E16A;
	Wed,  2 Apr 2025 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="chnN6Ra/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496BB10E1B8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743601935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOgJPmykAObI2jQBeah+5x6J5ky48bfmV5G/uZspF+c=;
 b=chnN6Ra/eFho3KmkS21PLt78OV0Dp6EQ4fM79yQhOddFsDwwbuoYdToCFI+67UhgSzWXNs
 TEQT1+8tw/BItPUYdj2mHMRnZz5TVEL0J0xeMI7vCZPChKQGmYrhjjyNA713+7gCS34vvc
 Opcp0ikTFesbAhDphGDfUuMetcwhXBs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-sJw699VcOHWjnjdVoor_jA-1; Wed, 02 Apr 2025 09:52:14 -0400
X-MC-Unique: sJw699VcOHWjnjdVoor_jA-1
X-Mimecast-MFC-AGG-ID: sJw699VcOHWjnjdVoor_jA_1743601933
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-736d64c5e16so115290b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 06:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743601933; x=1744206733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOgJPmykAObI2jQBeah+5x6J5ky48bfmV5G/uZspF+c=;
 b=hE7Bhjlb6p+Ik454T3b4a2uwpZ1SiMaxm3vsv9Ma/YzOnN9f0wD8xMfb1lw5wjN9go
 ljmCuEfKlZr2O5BM1oVmS9+xAHEAPV/11Up/tDCRtg9GqerDHNsRqr1chL6bKnb+dfkc
 jbyDSKHnmr28+k0XYIX3BOnQPRsnsdZ7spC5CV/GNwjDudQTahPhVQkJzU4TJIhjkbay
 XGnQoDLS7ueANgcFxh3TDNTVpulWUQDTcLYY8BKq5aZgTevxueCxxH5LHNqLdO77E7a6
 RY12GauU9EBAJuY6JS1VHqsBqFBNGVIgErjeL/A2u6bFR6Aq2Hzj2J/MCbKf1tY4ITqO
 Ig6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnfIFyRjnJZkvGEh4f3ZKrNuOVVle6+1G3/dWwxZLamYyXVZBtNbRgTRqwaK4G6JAPPijKm16uJx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvnTW+D4B3DrTYqczSkTzk47C7SC/kQ2GtWxqH2ebimBG+56nY
 KTUAXLFIEU4eHtXgFNkfHUS5C9mw5IaV7XKzsqCpkmMp2COQUleezXQbLflYd1V3FflILAKZs6n
 Sk0V6CPyiJji0V0tlRcPlT2A9gdX7GAkBYF+C8nU6aq2rrk1y2bwMjLQt9s+n6dyngswt6RQ4o7
 DEg+R3LBptrrdju7wzJGYtmt1HIk8oT2jJTefEbYeF
X-Gm-Gg: ASbGncuSkgRQbi6BE7LfwhMMK12M2c5h8EhWI9qLxllvRK+6Lw+adnzYW6t5J1KTj2O
 +g9+PEgk5ErvF+obRGLqLElLE2L7rHxLkOE5PwZ8NBZnEqj7gB/8tBCu2G/wjB9DLDylSQIfWVV
 HEUZP/Dltku1eTY95R5z9k+0hQska3
X-Received: by 2002:a05:6a00:4606:b0:736:64b7:f104 with SMTP id
 d2e1a72fcca58-7398034d311mr21220202b3a.5.1743601933112; 
 Wed, 02 Apr 2025 06:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0zGL/a3PY98j5a5/Uh1iZIbTLXGDprDz04ve4TfMxa8U5wSK0yN9qe8umGPmAsIHrQ6w5aWwqZRLDXm7JuF0=
X-Received: by 2002:a05:6a00:4606:b0:736:64b7:f104 with SMTP id
 d2e1a72fcca58-7398034d311mr21220172b3a.5.1743601932776; Wed, 02 Apr 2025
 06:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250402084351.1545536-1-ryasuoka@redhat.com>
 <dae5089d-e214-4518-b927-5c4149babad8@suse.de>
In-Reply-To: <dae5089d-e214-4518-b927-5c4149babad8@suse.de>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Wed, 2 Apr 2025 22:52:01 +0900
X-Gm-Features: AQ5f1Jpw7m9T_UxVBqa763yKKRkEwQNaxAeOXPrh1fO22sf04fLAjs0UuR6sE_k
Message-ID: <CAHpthZp5L-iyE=sggm-fjooVsgLcMPpBSyNkfCC5Dj0B=Vy2JQ@mail.gmail.com>
Subject: Re: [PATCH RFC drm-next 0/1] Add support for drm_panic
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, drawat.floss@gmail.com, jfalempe@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hyperv@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wGbNAwmr9ijZGQQAQ6uhLBhTDFJ-Hl7KmVR8trVfxTA_1743601933
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Apr 2, 2025 at 6:45=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 02.04.25 um 10:43 schrieb Ryosuke Yasuoka:
> > This patch adds drm_panic support for hyperv-drm driver. This function
> > works but it's still needed to brush up. Let me hear your opinions.
> >
> > Once kernel panic occurs we expect to see a panic screen. However, to
> > see the screen, I need to close/re-open the graphic console client
> > window. As the panic screen shows correctly in the small preview
> > window in Hyper-V manager and debugfs API for drm_panic works correctly=
,
> > I think kernel needs to send signal to Hyper-V host that the console
> > client refreshes, but I have no idea what kind of signal is needed.
> >
> > This patch is tested on Hyper-V 2022.
> >
> > Ryosuke Yasuoka (1):
> >    drm/hyperv: Add support for drm_panic
> >
> >   drivers/gpu/drm/drm_simple_kms_helper.c     | 26 +++++++++++++
> >   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 42 ++++++++++++++++++++=
+
> >   include/drm/drm_simple_kms_helper.h         | 22 +++++++++++
>
> No changes to simple_kms_helper please. This is obsolete and should go
> away. Just put everything into hyperv_drm.

OK. Maybe it will work without any modification in simple_kms_helper if we =
can
call the pipe->funcs from draw_panic_plane() like drm_plane_helper_funcs.

Currently, the hyperv_drm is implemented with a simple display pipeline.
The pipeline control functions are in pipe->funcs and they will call via
drm_simple_kms_palne_helper_funcs. And these helper functions will
be called by drm_panic_plane().

Thank you for your comment.
Ryosuke

> Best regards
> Thomas
>
> >   3 files changed, 90 insertions(+)
> >
> >
> > base-commit: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

