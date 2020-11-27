Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8962C6833
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050196EE08;
	Fri, 27 Nov 2020 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70B96EE08
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:50:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i2so5851645wrs.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=kQWV49pujlmRaIQ5jgnQgNVdngMEKYgj0984wCyTobw=;
 b=htkftUcTu38rYgg+t8JxPCkONLao2x/5X3GVYqr8Ls8WHxCTkqn3L+nxYYamIEd/w5
 D5YC8lCIyH6kzgTSL516AMymq5ltgH5rw8IMSmo7zMDxbrRl73yHxs/DZnGiKkp+QPOH
 SxyUO9XTxbntJUPMw6ygrDhOonxhvnaqLXnh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=kQWV49pujlmRaIQ5jgnQgNVdngMEKYgj0984wCyTobw=;
 b=ouI7nt33GfhdVs//hP1sm2gBYcrmY27+RhPt0tOp9S2M9RmIOBhbu1IwHezI39FT6G
 Ld6qTM5nsv65q4hOPIhOsfWQi6OoL3oVvFSLmC+DZKROWxXLM+7UIN7S6d3s4sq8/IcD
 JCdJ0cnZW+0Zc/JEU05D+kYkuVEt5tgGd2REUN1GQmaLED577IFtlj+09Isc+WVMOTuL
 jxiGKZ0vNZoFZRiZKo+i5YKc8XUmiNe0tFyiDlikizegkNvx6UBZaXNFul5jO8A+yes0
 232PCoSr16YNADuM54bIwrZjyF8OX5tLF8NdBLoX/PHDasPxRZIBuqwMHnoBVrOqAY4+
 IEQg==
X-Gm-Message-State: AOAM531drOw5FAL9YAuG+ek6H/RZPekA6amlucMPvXwKueB0akmYQ2BK
 qq/zX5gh1sYIay+kn14io1s9tw==
X-Google-Smtp-Source: ABdhPJxfv14p/J2HUql3b5ucaZxqOHa7FV0VkwiEL/oC16P/Ik/Z8q1X1fpPwwAqz029oAzqwGl7rw==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr11127354wre.101.1606488655177; 
 Fri, 27 Nov 2020 06:50:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w10sm14968203wra.34.2020.11.27.06.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:50:54 -0800 (PST)
Date: Fri, 27 Nov 2020 15:50:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Subject: Re: [PATCH] drm: imx: Move fbdev setup to before output polling
Message-ID: <20201127145052.GB401619@phenom.ffwll.local>
Mail-Followup-To: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20201117155229.9837-1-mark.jonas@de.bosch.com>
 <e089d4d5-3bd8-c2cd-3011-ed87ae4284e8@suse.de>
 <CAKMK7uEpEt4w4kVJLOd2Yw1MnsrCn-NMgT4TjcxROpZBa_xvYg@mail.gmail.com>
 <68af913c-9f4e-73b5-a2cb-8692902a2847@suse.de>
 <38c2d92ac5f04a228e55af43a12a4bd7@de.bosch.com>
 <CAKMK7uFofJ2f4ozx=QMkfYHLAy0euOf6S0wou5qYC--QiEe5Qw@mail.gmail.com>
 <98c874b923bd4e60bf2e727a29729dfc@de.bosch.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98c874b923bd4e60bf2e727a29729dfc@de.bosch.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: "RUAN Tingquan \(BT-FIR/ENG1-Zhu\)" <Tingquan.Ruan@cn.bosch.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 26, 2020 at 09:44:02AM +0000, Jonas Mark (BT-FIR/ENG1-Grb) wrot=
e:
> Hi Daniel,
> =

> > > Thank you very much for your feedback. We appreciate it.
> > >
> > > > >>> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c
> > > > >>> b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > >>> index 9bf5ad6d18a2..2665040e11c7 100644
> > > > >>> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> > > > >>> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > >>> @@ -240,14 +240,18 @@ static int imx_drm_bind(struct device *de=
v)
> > > > >>>                legacyfb_depth =3D 16;
> > > > >>>        }
> > > > >>>
> > > > >>> +     /*
> > > > >>> +      * The generic fbdev has to be setup before enabling outp=
ut polling.
> > > > >>> +      * Otherwise the fbdev client is not ready to handle dela=
yed events.
> > > > >>> +      */
> > > > >>> +     drm_fbdev_generic_setup(drm, legacyfb_depth);
> > > > >>> +
> > > > >>>        drm_kms_helper_poll_init(drm);
> > > > >>>
> > > > >>>        ret =3D drm_dev_register(drm, 0);
> > > > >>>        if (ret)
> > > > >>>                goto err_poll_fini;
> > > > >>>
> > > > >>> -     drm_fbdev_generic_setup(drm, legacyfb_depth);
> > > > >>> -
> > > > >>
> > > > >> This does not work well. fbdev is supposed to be another regular
> > > > >> DRM client. It has to be enabled after registering the DRM devic=
e.
> > > > >>
> > > > >> I'd rather improve fbdev or the driver to handle this gracefully.
> > > > >
> > > > > Yeah I'm not understanding the point here. Once fbcon is running,
> > > > > you have a screen. Any fbdev userspace client  also should do a
> > > > > modeset first. And if they dont and it's expected uapi for fbdev
> > > > > chardev that the display boots up enabled, then we need to fix
> > > > > that in the fbdev helpers, not through clever reordering in
> > > > > drivers so that a side-effect causes a modeset.
> > > > >
> > > > > Note that this is a bit tricky since fbdev shouldn't take over the
> > > > > screen by default, so we'd need to delay this until first open of
> > > > > /dev/fb0. And we should probably also delay the hotplug handling
> > > > > until the first open. fbcon also fake-opens the fbdev file, so
> > > > > it's the same code path.
> > > >
> > > > As far as I understand the commit message, the problem is that the
> > > > display blanks out after registering the driver. And fbdev somewhat
> > > > mitigates this by doing an early modeset. Users with fbdev disabled
> > > > (most of them in embedded, I guess) would still run into the issue
> > > > until userspace makes a modeset.
> > > >
> > > > Mark, if that's the case, an option might be to pick up the device
> > > > settings instead of calling drm_mode_config_reset(). The driver
> > > > would then continue to display whatever is on the screen.
> > >
> > > We are started using fbdev in our embedded application with Linux
> > > 3.10, later updated to 4.14 and are now in the process of updating to
> > > 5.4. So far the uapi appeared to us as if we could rely on an already
> > > enabled fbdev. That is, none of our applications does a modeset.
> > >
> > > When switching to 5.4 we noticed that the fbdev uapi changed. That is,
> > > the LCD is switched off until it is explicitly enabled. It could be
> > > enabled by writing to /sys/class/graphics/fb0/blank.
> > >
> > > You are right, we are not using fbcon. fbcon will still enable the LCD
> > > but in our embedded domain we have it disabled because we must not sh=
ow a
> > console.
> > >
> > > Do we understand your proposal correctly to replace the call to
> > > drm_mode_config_reset() in imx_drm_bind() [imx-drm-core.c] with
> > > picking up the device settings instead?
> > >
> > > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fe=
lix
> > > ir.bootlin.com%2Flinux%2Fv5.10-
> > rc4%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fim
> > > x%2Fimx-drm-
> > core.c%23L231&amp;data=3D04%7C01%7CMark.Jonas%40de.bosch.com
> > >
> > %7C9bbf5ede27ed40be9aaa08d88bac0c53%7C0ae51e1907c84e4bbb6d648ee
> > 58410f4
> > >
> > %7C0%7C0%7C637412918338819509%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAw
> > >
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd
> > ata=3D68
> > >
> > 1kOSAs2XsI1l4sOJ7j5UAGkAMciR78ma%2FgbD5jR98%3D&amp;reserved=3D0
> > >
> > > We are a little clueless right now: How do we pick up the device sett=
ings?
> > =

> > Nope, not what I had in mind.
> > =

> > Instead intercept the fb_ops->open call and in there if it's a userspac=
e open
> > (user parameter of the callback tells you that) and kms is not in use, =
then try to
> > light up the display for the fbdev userspace to use. drm fbdev helpers =
already
> > have that callback as drm_fbdev_fb_open(). I think you could try and ju=
st call
> > drm_fbdev_client_hotplug directly, that should do the trick. Or maybe c=
alling
> > drm_fb_helper_dpms is the better option, not sure. fbmem.c seems to not=
 store
> > any blanking state at all, so this is probably all ill-defined.
> > =

> > Important part is to do this only for the user fb_open case, since fbco=
n will do its
> > own thing too.
> > =

> > Plus I guess we need to document that this is the uapi we're having for=
 fbdev
> > clients, so ideally this should be cc'ed widely so we can get some acks=
 from
> > former fbdev maintainers.
> > =

> > Also ideally we'd have an igt for this uapi to make sure it never break=
s again.
> > Something like:
> > 1. open the kms driver for this, make sure display is completely off.
> > 2. close kms file
> > 3. open fbdev file
> > 4. check (through opening kms side again) that the display has been ena=
bled.
> > =

> > See
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdri=
.freede
> > sktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-uapi.html%23validating-changes-
> > with-
> > igt&amp;data=3D04%7C01%7CMark.Jonas%40de.bosch.com%7C9bbf5ede27ed4
> > 0be9aaa08d88bac0c53%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0
> > %7C637412918338819509%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> > p;sdata=3DtgdaOJP2wK7eXFmOQlVdUa%2B7CRwZxOx99BCCMNE8iD0%3D&a
> > mp;reserved=3D0
> > for some details on our validation testing, there's already a very basi=
c fbdev
> > testcase there.
> =

> We had a look into the topic and came to the conclusion that we cannot do=
 it
> right now. We are lacking experience in the field and need to keep drivin=
g our
> application development.
> =

> Thus, with a heavy heart, we will instead implement a workaround which wi=
ll
> enable the LCD at boot time from user space. What works good for us is wr=
iting
> to /sys/class/graphics/fb0/blank.

I think this makes sense, the uapi for fbdev isn't so firmly established
anyway. And it definitely doesn't hurt (at least on drm-kms drivers, where
we no-op out changes that change nothing).

Just in general, if you hit something like this, we're definitely
interested in making fbdev a more well-defined uapi that can be relied
upon a bit more across drivers. 20+ years after it landed, but hey if it
keeps userspace happy, it imo makes sense.
-Daniel

> =

> Greetings,
> Mark
> =

> Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> Bosch Sicherheitssysteme=A0GmbH | Postfach 11 11 | 85626 Grasbrunn | GERM=
ANY | www.boschsecurity.com
> =

> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Christian Fischer; Gesch=E4ftsf=FChrung: Tanja=
 R=FCckert, Andreas Bartz, Thomas Quante
> =

> 100 Years Bosch Building Technologies 1920-2020

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
