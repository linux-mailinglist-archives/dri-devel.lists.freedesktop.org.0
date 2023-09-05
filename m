Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58F7930C6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF910E51A;
	Tue,  5 Sep 2023 21:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84F10E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 21:11:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a21b6d105cso434393866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693948269; x=1694553069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ef2qFmNn3xvEcf4Oez9oM77hxc0tHJu7wEpJkm7cD0k=;
 b=QqtOSAX9P4DDshvcu+t7g6AiINnNlL0vJmcvHTKzk2nwCXwpAeX5ERhtrO25ulcPpc
 4g1NQQkvzxrE8ItOM7VUc6H+k73/dsoELRpjnEPla/pH2toF3alX88pKiiuakaLdawhw
 Zt9vBZAQC0kE0SPPO3wRmV3v3UGQNfk/vdSZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693948269; x=1694553069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ef2qFmNn3xvEcf4Oez9oM77hxc0tHJu7wEpJkm7cD0k=;
 b=JBz2A0tnYpJea5Y+VDrrqpz0GM5/NfCQm1rVOLQ5FW8u9KUwJQUtj/fsrZf/5wRzei
 dlfFa7Pg2ZpDsDlzY4g36zb7nt1e0ZuSQ+VJew4czH3QeRoOdAwhqr2dzuT00eCMML9M
 BG5klUcrgEXijElNty4MAkl7pjupavo2R/bb4g6lnbCv8xq6szlFktLS2NMM4ydBvWn/
 LCJXqNO4I6KPdgJpqcWa1qXiPPkrKJrcY00ZO1vWsBapiwxaUvDJGuHLD3WMomYMg6Uv
 cXRK+XlldfTb9PYTWAqNT0QNpf8lbD5ut2BFjTfqyhM/sHudNJ5pWRxQnpoRLooHbtk9
 mrBA==
X-Gm-Message-State: AOJu0YyXNVuE2ts0gBZ75knyQgeQDPw1yLf7lMGtZbuklZ1or8ecTV9h
 O2s55iqvywZ2qKYAelvz4f6DuhrBkI9s19RoFmQpoHtn
X-Google-Smtp-Source: AGHT+IFogAZRUqM83wY22oQmCttDoxjxz03jJTtCfDfpLawBExzW81oFH3EvZh9sL8pK3un8Y3c/1w==
X-Received: by 2002:a17:906:cd1:b0:99d:eabc:2ed with SMTP id
 l17-20020a1709060cd100b0099deabc02edmr655101ejh.32.1693948269153; 
 Tue, 05 Sep 2023 14:11:09 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 j8-20020a170906830800b009a19701e7b5sm8094475ejx.96.2023.09.05.14.11.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 14:11:08 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso9615e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 14:11:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3502:b0:3f7:3e85:36a with SMTP id
 h2-20020a05600c350200b003f73e85036amr11498wmq.7.1693948267775; Tue, 05 Sep
 2023 14:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
 <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
In-Reply-To: <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 14:10:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WufC0WrnEZVEi5vQudpGnxiphJpJ6SwsEitm8zEnzJiA@mail.gmail.com>
Message-ID: <CAD=FV=WufC0WrnEZVEi5vQudpGnxiphJpJ6SwsEitm8zEnzJiA@mail.gmail.com>
Subject: Re: [RFT PATCH 15/15] drm/renesas/shmobile: Call
 drm_helper_force_disable_all() at shutdown/remove time
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: paul@crapouillou.net, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 4, 2023 at 12:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Douglas,
>
> On Sat, Sep 2, 2023 at 1:42=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown(), or in this case the
> > non-atomic equivalent drm_helper_force_disable_all(), at system
> > shutdown time and at driver remove time. This is important because
> > drm_helper_force_disable_all() will cause panels to get disabled
> > cleanly which may be important for their power sequencing. Future
> > changes will remove any custom powering off in individual panel
> > drivers so the DRM drivers need to start getting this right.
> >
> > The fact that we should call drm_atomic_helper_shutdown(), or in this
> > case the non-atomic equivalent drm_helper_force_disable_all(), in the
> > case of OS shutdown/restart comes straight out of the kernel doc
> > "driver instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > @@ -179,12 +180,20 @@ static int shmob_drm_remove(struct platform_devic=
e *pdev)
> >
> >         drm_dev_unregister(ddev);
> >         drm_kms_helper_poll_fini(ddev);
> > +       drm_helper_force_disable_all(ddev);
>
> After "[PATCH v3 36/41] drm: renesas: shmobile: Atomic conversion part
> 1"[1], this function will already call drm_atomic_helper_shutdown()...
>
> >         free_irq(sdev->irq, ddev);
> >         drm_dev_put(ddev);
> >
> >         return 0;
> >  }
> >
> > +static void shmob_drm_shutdown(struct platform_device *pdev)
> > +{
> > +       struct shmob_drm_device *sdev =3D platform_get_drvdata(pdev);
> > +
> > +       drm_helper_force_disable_all(sdev->ddev);
>
> ... and this should be replaced by a call to drm_atomic_helper_shutdown()=
.
>
> [1] https://lore.kernel.org/dri-devel/fd7a6702490bd431f314d6591551bb39e77=
e3304.1692178020.git.geert+renesas@glider.be

Ah, thanks! I will put this patch on hold and check back in a few
weeks to see how things are looking. If you wanted to fold it into
your series I certainly wouldn't object to it, but if not that's fine
too. ;-)

-Doug
