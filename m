Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1145279AA09
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5E210E327;
	Mon, 11 Sep 2023 16:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B32510E327
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 16:11:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9ad749473baso62385166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694448662; x=1695053462;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QeZPdiVCIBARaAlW5frnuN99j3rzp4a9OMhyKJX2M8=;
 b=ItBvIkXKPK3Om2oALGwegXJEa6A8PzsLYL9QHK2z7cPU67JmtdU5Kn0sdXnhHXxIBF
 mRvcGVefKcy+zMJ5MBgp4X09dgSAKBE3H/F58XBDuCRfC/mbjcmL3nDmx5tFV23bp2G3
 LfSFEhSYSoTmSFyV4dHH0NHiOhxpQf9mTsTaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694448662; x=1695053462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QeZPdiVCIBARaAlW5frnuN99j3rzp4a9OMhyKJX2M8=;
 b=Dn5ASAOASunkm9FAfin/i9ppcPg4uWDzIgRkCqH0DZD2BMKG5U52vrM+bBNuEx7/HY
 nnWMhXx/tQWEVFMtrMPSxEpeCCG8UygB1UODX5BHrZ2mCtGQXa5sPXwcSzN6X8iOe+2b
 zkUKvw7Fl+isoTi+aiDGQDIVUoKeoLxJSCTNP3h65hEvws0MYNY+uLKXPG0yqodIjmNL
 6OfiLzxQtieUUgc+FmsTkPOve6tYSQwChU9Tf/Znv3p+QYFpwtZZPtp7NnSaAhFQYdoy
 KJ1aidifK527VzrxUReIe9QMXzr+77T1i/fcGQWgcK3x1GmlgxtmvBhx3/kdHEmYKdyF
 J0FQ==
X-Gm-Message-State: AOJu0YyDPprw7zpt/Ffb7jOOD8Y3mDpANIYUx+Bdo5Dcrfcy17YdzTcj
 dgbVqB0xYwp0nkRWbhFuxHblM7GRc3/CXSmgXKkb0Q==
X-Google-Smtp-Source: AGHT+IHxrtZbph3YyLznRTTOjTSkpxAK8pUDvaPrHy3Lgp8tO9TNpzQa+FnlY0YBv9Lkgnnj0i0mpQ==
X-Received: by 2002:a17:906:3111:b0:9a5:d16b:6631 with SMTP id
 17-20020a170906311100b009a5d16b6631mr9000165ejx.70.1694448661995; 
 Mon, 11 Sep 2023 09:11:01 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 x18-20020a170906805200b0099cadcf13cesm5543267ejw.66.2023.09.11.09.11.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 09:11:00 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-52f1f1f5125so18156a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:11:00 -0700 (PDT)
X-Received: by 2002:a50:9faa:0:b0:525:573c:6444 with SMTP id
 c39-20020a509faa000000b00525573c6444mr340372edf.1.1694448660156; Mon, 11 Sep
 2023 09:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
 <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
In-Reply-To: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Sep 2023 09:10:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
Message-ID: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Fei Shao <fshao@chromium.org>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 8, 2023 at 4:51=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote:
>
> Hi,
>
> On Sat, Sep 2, 2023 at 7:42=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> ...<snip>
> > @@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
> >  static struct platform_driver mtk_drm_platform_driver =3D {
> >         .probe  =3D mtk_drm_probe,
> >         .remove =3D mtk_drm_remove,
>
> I think this patch, and perhaps some others in this series, will have
> a trivial conflict to Uwe's work about the remove callback conversion
> e.g. [1], so you might want to rebase the series onto the latest
> linux-next.
>
> On the other hand, I tested this patch on MT8195 and MT8188
> Chromebooks and I don't see issues during boot / reboot, so
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.g=
it/commit/?h=3Dmediatek-drm-next&id=3Db3af12a0b46888340e024ba8b231605bcf2d0=
ab3

That makes sense. I had based this series on drm-misc-next which
didn't have those, but now that a new -rc1 is out it then
drm-misc-next should rebase shortly. I'll make sure that the next
version includes Uwe's changes as much as possible.

That being said, I also wouldn't object if the maintainer of this DRM
driver wanted to resolve conflicts themselves and land the patch
without me needing to resend. The conflict is trivial, there are no
dependencies and no reason to land the series all at once, so landing
this patch early would mean less spam for the maintainer since they
would no longer get CCed on future versions. :-P Just sayin...

-Doug
