Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B653CAEE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435110EE86;
	Fri,  3 Jun 2022 13:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C510EF94
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:52:24 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n10so16085470ejk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gajDGmkvC2i3Ff4SviEDlcrNM6kzJNoz/iyt65+315Y=;
 b=eDSmHJzELH0S6QTvHboEKyR16A+cBjPfBvAYV78iQgUBNNHcaYPar8UZLVO/HJ0i09
 tW3fiKxZHCPvFZ86iaJyAw4k/YMoAX46+WSt0a3AOzX1T3a5SuX7q1wTGJSjYWuelllw
 eB80uxVO6jKFhXX+6HA5TbaapYdpRcmr+GPt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gajDGmkvC2i3Ff4SviEDlcrNM6kzJNoz/iyt65+315Y=;
 b=xmxbG29pLR3lCEs7RPLa04r80OZZlzECHLECK0AdYoDTThaX5NsY+chjI6dxbRDOdt
 ivV7ylkYVy709RRjsffmbaLUKtAZj93N7icspDVmfzpPExbk90pRhLa+DFoYVczhfM4l
 Tk/Nf1KrIcD/C1Jtrie7ua70f4r31fSvhH0JMbuDTYRj8/bh5I2696HN0qB36wMIlVou
 FrhSx1G4D/pcax0lo5jCr1DiJOZ0mlBWMdbdp63H8o9oGy2Wia6aSzeCicHYnLcCEJsY
 FdYEDXyg9yKF+dxMA6TXQA/3sDsavKsacjCenfwIMbuQSItkjBLapZzwOoIKkHrJ7gsr
 KQWw==
X-Gm-Message-State: AOAM530kqba2A4x5pnNbD4amTLVeWRaInxk/TNGxeTjoZLFSEIW4fHFg
 4T6qCwna/f1q+Pix0iFSZ93HqAcFhAahL29Brk0=
X-Google-Smtp-Source: ABdhPJw8CjwmgNpMX4uhUxRNIwoi164lvjtUF2HzRl2MQp4cCfoID+gw2wLEt9qlpEwLuNzhjBc5oA==
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr3507007eja.44.1654264342794; 
 Fri, 03 Jun 2022 06:52:22 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 x18-20020a170906805200b0070b7875aa6asm1566977ejw.166.2022.06.03.06.52.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:52:19 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso4365708wmr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 06:52:18 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr37492988wmf.118.1654264337977; Fri, 03
 Jun 2022 06:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
 <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Jun 2022 06:52:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbNe+9Cf-jWwFPAR0a1qqjdKaQdtiREKLB8sHYTh_4OQ@mail.gmail.com>
Message-ID: <CAD=FV=XbNe+9Cf-jWwFPAR0a1qqjdKaQdtiREKLB8sHYTh_4OQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 3, 2022 at 3:19 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > > * In general we have a "struct device" for bridges that makes a good
> > > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > >   device. That's not the right device to use for lifetime management.
> > > > > >
> > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > > > introduce them as DRM-managed, and not device managed.
> > > > >
> > > > > Otherwise, you'll end up in a weird state when a device has been removed
> > > > > but the DRM device is still around.
> > > >
> > > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > encoder device. I wasn't personally involved in discussions about it,
> > > > but I was under the impression that this was expected / normal. Thus
> > > > we can't make this DRM-managed.
> > >
> > > Since I didn't hear a reply,
> >
> > Gah, I replied but it looks like somehow it never reached the ML...
> >
> > Here was my original reply:
> >
> > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > * In general we have a "struct device" for bridges that makes a good
> > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > >   device. That's not the right device to use for lifetime management.
> > > > >
> > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > > introduce them as DRM-managed, and not device managed.
> > > >
> > > > Otherwise, you'll end up in a weird state when a device has been removed
> > > > but the DRM device is still around.
> > >=20
> > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > encoder device.
> >
> > bridge->dev seems right though?
> >
> > > I wasn't personally involved in discussions about it, but I was under
> > > the impression that this was expected / normal. Thus we can't make
> > > this DRM-managed.
> >
> > Still, I don't think devm is the right solution to this either.
> >
> > The underlying issue is two-fold:
> >
> >   - Encoders can have a pointer to a bridge through of_drm_find_bridge
> >     or similar. However, bridges are traditionally tied to their device
> >     lifetime (by calling drm_bridge_add in probe, and drm_bridge_remove
> >     in remove). Encoders will typically be tied to the DRM device
> >     however, and that one sticks around until the last application
> >     closes it. We can thus very easily end up with a dangling pointer,
> >     and a use-after-free.
> >
> >   - It's not the case yet, but it doesn't seem far fetch to expose
> >     properties of bridges to the userspace. In that case, the userspace
> >     would be likely to still hold references to objects that aren't
> >     there anymore when the bridge is gone.
> >
> > The first is obviously a larger concern, but if we can find a solution
> > that would accomodate the second it would be great.
> >
> > As far as I can see, we should fix in two steps:
> >
> >   - in drm_bridge_attach, we should add a device-managed call that will
> >     unregister the main DRM device. We don't allow to probe the main DRM
> >     device when the bridge isn't there yet in most case, so it makes
> >     sense to remove it once the bridge is no longer there as well.
>
> The problem is that I do not see a good way to unregister the main DRM
> device outside of it's driver code.
>
> >
> >   - When the DRM device is removed, have the core cleanup any bridge
> >     registered. That will remove the need to have drm_bridge_remove in
> >     the first place.
> >
> > > I'll assume that my response addressed your concerns. Assuming I get
> > > reviews for the other two patches in this series I'll plan to land
> > > this with Dmitry's review.
> >
> > I still don't think it's a good idea to merge it. It gives an illusion
> > of being safe, but it's really far from it.
>
> It is more of removing the boilerplate code spread over all the
> drivers rather than about particular safety.
>
> I'd propose to land devm_drm_bridge_add (and deprecate calling
> drm_bridge_remove from the bridge driver at some point) and work on
> the whole drm_device <-> drm_bridge problem in the meantime.

At this point it has been landed in drm-misc-next as per my response
to the cover letter. If need be we can revert it and rework the ps8640
driver to stop using it but it wouldn't change the lifetime of the
bridge. I'm not going to rework the bridge lifetime rules here. If
nothing else it seems like having the devm function at least would
make it obvious which drivers need to be fixed whenever the bridge
lifetime problem gets solved.

-Doug
