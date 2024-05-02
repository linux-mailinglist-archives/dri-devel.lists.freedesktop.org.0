Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281A8B9C3F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2FE10FA64;
	Thu,  2 May 2024 14:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oQIXEmzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5029E10FA64
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:28:20 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6ea2436de79so4155479a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714660098; x=1715264898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYJ66txjYnvZgvCB5h7LBuLGmwmjeh/xVp4SvQlr1p0=;
 b=oQIXEmzjlUBfMm5N309Wj54D3kaO5vFGGniC0BAh/TofrXkwoo0i0AucjrU0a8Wdp8
 PLE6r39c1p/BkdsB+9qd/UCX5CkPiEWBAbOIgDxhSK1DoudXG0Eex3zD1IKCOHKAIzg/
 nv5HA23NcsPCOM6gpyPiNeVot/WOPiWzqj85M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714660098; x=1715264898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYJ66txjYnvZgvCB5h7LBuLGmwmjeh/xVp4SvQlr1p0=;
 b=B5xQ9E9e6IRn12HihPELoqE9vyL7HAcACyBAwzJZfPnmJSUCOAcWcwD036fv8np5Pq
 ASRkqQywjq4OCTzggrN7mvyID+AgTlHo4Q6qqIIHpopNZhS9ESjmbfgxtpwRs9IDfGZq
 nMgNEkBx1DjN3VUfQ+cpnqGuDu0fvU2JEKl2AYg4vgMQRuWm4A2DHBKS7Gbpd5hExTh+
 ivADqrwfaFXoO+DjV/p3UQUDLHVSxTspgiWJp2ruv6o3HWmR6aHYOG2UrQ4e6zweRbv1
 YrpE5V0I/g09hahguS7RmpxzBMxjFLhbSUrku3nm33oY8pBgghTCbXh1wMEU6fqIy0nJ
 uuWA==
X-Gm-Message-State: AOJu0YypaSRfOv3Ohu5YaSiPyZTOkh68Kc82/idqu6s7D03Kwvtc8wCa
 97+yF41gmsVQEz0Z66uHctibvN4YOUhnfKioXrj7Cxm4TgUQToo+ZX8w+qGyOjZ0UXuQWywS/Yw
 =
X-Google-Smtp-Source: AGHT+IHVOmJ9L5Oq5SPs+EWDE4uAE9vkAZt5lofK4G726KHfwtnJLF1Ck1yWxIuyb+W9ju60a0r5xA==
X-Received: by 2002:a05:6870:ac0a:b0:22e:c925:a4b0 with SMTP id
 kw10-20020a056870ac0a00b0022ec925a4b0mr6350113oab.42.1714660097715; 
 Thu, 02 May 2024 07:28:17 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 c23-20020ae9e217000000b0078d5fdc929fsm401630qkc.104.2024.05.02.07.28.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 07:28:16 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43989e6ca42so464421cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 07:28:16 -0700 (PDT)
X-Received: by 2002:ac8:59c9:0:b0:43b:af4:d3a with SMTP id
 d75a77b69052e-43caf9ca7d8mr2729291cf.19.1714660095878; 
 Thu, 02 May 2024 07:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <a8a73fc4-7699-4c47-8970-cd68be0fe1d9@linaro.org>
In-Reply-To: <a8a73fc4-7699-4c47-8970-cd68be0fe1d9@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 May 2024 07:27:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VciR5UEQpvizrUNYR7mhE2P4ESvM2T7v4mUT3UpdX3bg@mail.gmail.com>
Message-ID: <CAD=FV=VciR5UEQpvizrUNYR7mhE2P4ESvM2T7v4mUT3UpdX3bg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] drm/mipi-dsi: Reduce bloat and add funcs for
 cleaner init seqs
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Thu, May 2, 2024 at 12:48=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 01/05/2024 17:41, Douglas Anderson wrote:
> > The consensus of many DRM folks is that we want to move away from DSI
> > drivers defining tables of init commands. Instead, we want to move to
> > init functions that can use common DRM functions. The issue thus far
> > has been that using the macros mipi_dsi_generic_write_seq() and
> > mipi_dsi_dcs_write_seq() bloats the driver using them.
> >
> > While trying to solve bloat, we realized that the majority of the it
> > was easy to solve. This series solves the bloat for existing drivers
> > by moving the printout outside of the macro.
> >
> > During discussion of my v1 patch to fix the bloat [1], we also decided
> > that we really want to change the way that drivers deal with init
> > sequences to make it clearer. In addition to being cleaner, a side
> > effect of moving drivers to the new style reduces bloat _even more_.
> >
> > This series also contains a few minor fixes / cleanups that I found
> > along the way.
> >
> > This series converts four drivers over to the new
> > mipi_dsi_dcs_write_seq_multi() function. Not all conversions have been
> > tested, but hopefully they are straightforward enough. I'd appreciate
> > testing.
> >
> > NOTE: In v3 I tried to incorporate the feedback from v2. I also
> > converted the other two panels I could find that used table-based
> > initialization.
> >
> > [1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f133=
8987fa375738f45b9@changeid
> >
> > Changes in v3:
> > - ("mipi_dsi_*_write functions don't need to ratelimit...") moved earli=
er.
> > - Add a TODO item for cleaning up the deprecated macros/functions.
> > - Fix spacing of init function.
> > - Inline kerneldoc comments for struct mipi_dsi_multi_context.
> > - Rebased upon patch to remove ratelimit of prints.
> > - Remove an unneeded error print.
> > - Squash boe-tv101wum-nl6 lowercase patch into main patch
> > - Use %zd in print instead of casting errors to int.
> > - drm/panel: ili9882t: Don't use a table for initting panels
> > - drm/panel: innolux-p079zca: Don't use a table for initting panels
> >
> > Changes in v2:
> > - Add some comments to the macros about printing and returning.
> > - Change the way err value is handled in prep for next patch.
> > - Modify commit message now that this is part of a series.
> > - Rebased upon patches to avoid theoretical int overflow.
> > - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq(=
)
> > - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_=
seq()
> > - drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
> > - drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prin=
ts
> > - drm/panel: boe-tv101wum-nl6: Convert hex to lowercase
> > - drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
> > - drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
> >
> > Douglas Anderson (9):
> >    drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq=
()
> >    drm/mipi-dsi: Fix theoretical int overflow in
> >      mipi_dsi_generic_write_seq()
> >    drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
> >      prints
> >    drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
> >    drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
> >    drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi(=
)
> >    drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
> >    drm/panel: ili9882t: Don't use a table for initting panels
> >    drm/panel: innolux-p079zca: Don't use a table for initting panels
>
> Thanks Doug!
>
> I think we all agree on the core changes, now I think we can wait a few w=
eeks
> and try to get some test feedbacks on the indirectly and directly affecte=
d
> panels, drm-misc-next won't be merged into linux-next until v6.10-rc1 any=
way
> so we have some time to test on our boards.

Great!

Just to be clear, are you suggesting that we leave these patches on
the lists for a few weeks before landing in drm-misc-next, or are you
suggesting that it's safe to land them in drm-misc-next because it
won't make it to linuxnext for a while anyway? I assume the former
(AKA leave it on the lists for a while) but just want to be clear. ;-)

There's nothing terribly urgent about these patches except that they
are blocking Cong Yang's patch series [0] and lvzhaoxiong's patch
series [1]. I think it would be fine for them to send out their patch
series with mine marked as a dependency so we can finish reviewing
their series and then when mine lands theirs will be good to go too.

Maybe we can aim for 2 weeks of stewing on the list if there are no
issues during that time? I know landing in drm-misc during this time
won't help get into mainline faster, but with ChromeOS's "upstream
first" policy it saves us a bunch of headache if we can land things in
our tree from a maintainer tree with stable git hashes (like
drm-misc-next) instead of landing from a mailing list. Certainly that
doesn't mean we want to rush patches in before they're ready, but I
just want to say that there is still some benefit in getting the
patches landed sooner rather than later. :-)

[0] https://lore.kernel.org/r/20240424023010.2099949-1-yangcong5@huaqin.cor=
p-partner.google.com
[1] https://lore.kernel.org/r/20240418081548.12160-3-lvzhaoxiong@huaqin.cor=
p-partner.google.com
