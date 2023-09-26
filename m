Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F37AE6E0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AA510E359;
	Tue, 26 Sep 2023 07:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAAA10E359
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:32:29 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-59f6041395dso60391397b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 00:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695713548; x=1696318348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laJcIFxy0JToS9GpnmSBInlVg5g0YUWZWpaVsSmKGfk=;
 b=wciNtPDR0R41YwHcLEHQQA0h1WgWIl/cywdHsXDZYTUcwrOQhQWqoSHeUv6XUpMZDC
 uYITdPfRb+gEr/iMR0y8IcHeMO7Myf6hbvzVB/4uNIqnmxqu8x9V/9L5jfYDyE26Rkgh
 pXB77y91NpOK8W6zS9JshkiQHugjmi1vEvwfF36LfUD1+xtWGkMbeY3LRbbfz4Upwnt8
 LngRPTrgh2L9Hm+iKQQI5auPJ4nfd1nr6zvTxngLt6Djc8s0YTujL47kYuxkwXMd0n0M
 Fav18pIS9GyjrbTrF1zIiC1u+JL9hdJRH9mMDizfXpvlmI0qQ2l0ECTVzUnVllH9bf0t
 aHWw==
X-Gm-Message-State: AOJu0Yzdl6VwiXPtz4WQHHoV6pXPjqEx0mOi/XtaFyk2kUX3lNFt8J+U
 WkdeoN1r2U2qYSh7a9aRbq4Q/FnsATnxuA==
X-Google-Smtp-Source: AGHT+IESuwFPUTrKPYDkJLSQsUQZQJ/2L17QMvv+aA/ytg2Tqof3LPLsVrK8ekFG7E6fmdTPF4bxew==
X-Received: by 2002:a81:4ed1:0:b0:59c:a68:d36b with SMTP id
 c200-20020a814ed1000000b0059c0a68d36bmr9368753ywb.20.1695713548300; 
 Tue, 26 Sep 2023 00:32:28 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 a7-20020a81bb47000000b0057a44e20fb8sm2818105ywl.73.2023.09.26.00.32.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 00:32:27 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59f6e6b206fso48999567b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 00:32:26 -0700 (PDT)
X-Received: by 2002:a81:4ed1:0:b0:59c:a68:d36b with SMTP id
 c200-20020a814ed1000000b0059c0a68d36bmr9368709ywb.20.1695713546672; Tue, 26
 Sep 2023 00:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
In-Reply-To: <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2023 09:32:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
Message-ID: <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, j@jannau.net,
 Linux PM list <linux-pm@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC genpd

On Mon, Sep 18, 2023 at 10:24=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
> > From: Janne Grunau <j@jannau.net>
> >
> > Multiple power domains need to be handled explicitly in each driver. Th=
e
> > driver core can not handle it automatically since it is not aware of
> > power sequencing requirements the hardware might have. This is not a
> > problem for simpledrm since everything is expected to be powered on by
> > the bootloader. simpledrm has just ensure it remains powered on during
> > its lifetime.
> > This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> > systems. The HDMI output initialized by the bootloader requires keeping
> > the display controller and a DP phy power domain on.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>

Thanks for your patch, which is now commit 61df9ca231075e70
("drm/simpledrm: Add support for multiple "power-domains"") in
drm-misc/for-linux-next.

> As a simpledrm patch:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Do you want to wait for another review from  someone with
> power-management expertise?

Yeah, why not? Let's CC them, so they become aware...

> Do we need a similar patch for ofdrm?
>
> Best regards
> Thomas
>
> > ---
> > Changes in v2:
> > - removed broken drm_err() log statement only ment for debugging
> > - removed commented cast
> > - use correct format spcifier for 'int' in log statement
> > - add 'continue;' after failure to get device for power_domain
> > - use drm_warn() in non fatal error cases
> > - removed duplicate PTR_ERR conversion
> > - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-pow=
er-domains-v1-1-f8718aefc685@jannau.net
> > ---
> >   drivers/gpu/drm/tiny/simpledrm.c | 105 ++++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 105 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index ff86ba1ae1b8..9c597461d1e2 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/of_address.h>
> >   #include <linux/platform_data/simplefb.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >   #include <linux/regulator/consumer.h>
> >
> >   #include <drm/drm_aperture.h>
> > @@ -227,6 +228,12 @@ struct simpledrm_device {
> >       unsigned int regulator_count;
> >       struct regulator **regulators;
> >   #endif
> > +     /* power-domains */
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +     int pwr_dom_count;
> > +     struct device **pwr_dom_devs;
> > +     struct device_link **pwr_dom_links;
> > +#endif
> >
> >       /* simplefb settings */
> >       struct drm_display_mode mode;
> > @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(struc=
t simpledrm_device *sdev)
> >   }
> >   #endif
> >
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +/*
> > + * Generic power domain handling code.
> > + *
> > + * Here we handle the power-domains properties of our "simple-framebuf=
fer"
> > + * dt node. This is only necessary if there is more than one power-dom=
ain.
> > + * A single power-domains is handled automatically by the driver core.=
 Multiple
> > + * power-domains have to be handled by drivers since the driver core c=
an't know
> > + * the correct power sequencing. Power sequencing is not an issue for =
simpledrm
> > + * since the bootloader has put the power domains already in the corre=
ct state.
> > + * simpledrm has only to ensure they remain active for its lifetime.
> > + *
> > + * When the driver unloads, we detach from the power-domains.
> > + *
> > + * We only complain about errors here, no action is taken as the most =
likely
> > + * error can only happen due to a mismatch between the bootloader whic=
h set
> > + * up the "simple-framebuffer" dt node, and the PM domain providers in=
 the
> > + * device tree. Chances are that there are no adverse effects, and if =
there are,
> > + * a clean teardown of the fb probe will not help us much either. So j=
ust
> > + * complain and carry on, and hope that the user actually gets a worki=
ng fb at
> > + * the end of things.
> > + */
> > +static void simpledrm_device_detach_genpd(void *res)
> > +{
> > +     int i;
> > +     struct simpledrm_device *sdev =3D res;
> > +
> > +     if (sdev->pwr_dom_count <=3D 1)
> > +             return;
> > +
> > +     for (i =3D sdev->pwr_dom_count - 1; i >=3D 0; i--) {
> > +             if (!sdev->pwr_dom_links[i])
> > +                     device_link_del(sdev->pwr_dom_links[i]);
> > +             if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> > +                     dev_pm_domain_detach(sdev->pwr_dom_devs[i], true)=
;
> > +     }
> > +}
> > +
> > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev=
)
> > +{
> > +     struct device *dev =3D sdev->dev.dev;
> > +     int i;
> > +
> > +     sdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node, =
"power-domains",
> > +                                                      "#power-domain-c=
ells");
> > +     /*
> > +      * Single power-domain devices are handled by driver core nothing=
 to do
> > +      * here. The same for device nodes without "power-domains" proper=
ty.
> > +      */
> > +     if (sdev->pwr_dom_count <=3D 1)
> > +             return 0;
> > +
> > +     sdev->pwr_dom_devs =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > +                                            sizeof(*sdev->pwr_dom_devs=
),
> > +                                            GFP_KERNEL);
> > +     if (!sdev->pwr_dom_devs)
> > +             return -ENOMEM;
> > +
> > +     sdev->pwr_dom_links =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > +                                             sizeof(*sdev->pwr_dom_lin=
ks),
> > +                                             GFP_KERNEL);
> > +     if (!sdev->pwr_dom_links)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < sdev->pwr_dom_count; i++) {
> > +             sdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(dev,=
 i);
> > +             if (IS_ERR(sdev->pwr_dom_devs[i])) {
> > +                     int ret =3D PTR_ERR(sdev->pwr_dom_devs[i]);
> > +                     if (ret =3D=3D -EPROBE_DEFER) {
> > +                             simpledrm_device_detach_genpd(sdev);
> > +                             return ret;
> > +                     }
> > +                     drm_warn(&sdev->dev,
> > +                              "pm_domain_attach_by_id(%u) failed: %d\n=
", i, ret);
> > +                     continue;
> > +             }
> > +
> > +             sdev->pwr_dom_links[i] =3D device_link_add(dev,
> > +                                                      sdev->pwr_dom_de=
vs[i],
> > +                                                      DL_FLAG_STATELES=
S |
> > +                                                      DL_FLAG_PM_RUNTI=
ME |
> > +                                                      DL_FLAG_RPM_ACTI=
VE);
> > +             if (!sdev->pwr_dom_links[i])
> > +                     drm_warn(&sdev->dev, "failed to link power-domain=
 %d\n", i);
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, simpledrm_device_detach_genp=
d, sdev);
> > +}
> > +#else
> > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev=
)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> >   /*
> >    * Modesetting
> >    */
> > @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_cr=
eate(struct drm_driver *drv,
> >       if (ret)
> >               return ERR_PTR(ret);
> >       ret =3D simpledrm_device_init_regulators(sdev);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +     ret =3D simpledrm_device_attach_genpd(sdev);
> >       if (ret)
> >               return ERR_PTR(ret);
> >
> >
> > ---
> > base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> > change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
