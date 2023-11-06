Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D96E7E299B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E0F10E352;
	Mon,  6 Nov 2023 16:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766510E352
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 16:21:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-543923af573so8025638a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 08:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699287664; x=1699892464;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJv2xHGqT26SHPZhKKhHJF6XJv7tbJEJlMwgJnhS9Io=;
 b=O3KcE3CgXc9bL9rNtRen+NuzUN9b9ah5h4PwZaj5ubVeVmaV18X1tKzsH/TLm0zKGg
 zmFD32hzOb00o+1li6wP1A54GsqbddoTzAQQV60lxNfu8QlkOShSaKFIu1qZStc8106L
 f60Ywg06SSWYRTtlNXr6g6xrdW0lNt0/jPB2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699287664; x=1699892464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJv2xHGqT26SHPZhKKhHJF6XJv7tbJEJlMwgJnhS9Io=;
 b=MFvUGFF6oWkeWEX7GHcJ0gbYHNUYISsxK/ygjrl0Nl4VBZF9wa2D+zi7lUvt8KqopJ
 4qdWU+hee6OHab8hofXRukr6Z9T973pQUaRWEtrPEkohbGNpbR3E7wdHZnZZjYjckkZN
 Uw82KDBcWy2YgJfcMUHepNLA8szleh1yWG5pYIBaDo3vMvimMDm6kaW8K28og8rD5XO9
 lyw3TNDEAhAgLFCYAW1uT5uZjp/bOODBXk+qBmtQ9uukp3Y6joPbxnE7vC/aiQkyLD4e
 OZtwSSwzjDOFyBZnX1WbkUGm04vkMkdrm76Ir/AnzTGRpmw2IluKH7ZQV/SDHJKHWMm+
 ObFQ==
X-Gm-Message-State: AOJu0YzvqZQvZhuUNvjTyeVuYMEgIeEj7Ew0ynpwVe5K8OKk8fmgvDfN
 1IrWvwQEe/YpCC4UigLvOmfq3vPdNo9aFo9wy53AAw==
X-Google-Smtp-Source: AGHT+IH6gyWwFBS6rGXUUXPF1LuWwMaUbMbrIUwTRon4l8Z/B6Y+Vi0PoVhPIUEOH+RV4CdugCaTQA==
X-Received: by 2002:a17:907:320c:b0:9ae:522e:8f78 with SMTP id
 xg12-20020a170907320c00b009ae522e8f78mr12296146ejb.74.1699287663824; 
 Mon, 06 Nov 2023 08:21:03 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 k15-20020a170906054f00b009ade1a4f795sm4251315eja.168.2023.11.06.08.21.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 08:21:03 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so104775e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 08:21:02 -0800 (PST)
X-Received: by 2002:a05:600c:5406:b0:404:74f8:f47c with SMTP id
 he6-20020a05600c540600b0040474f8f47cmr138103wmb.5.1699287662548; Mon, 06 Nov
 2023 08:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
 <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
 <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
 <ze5xz52jt4helttcmntzmr6fr4ohu7wtslywalbxc4w7w6uvly@nwweqyyl4wf2>
In-Reply-To: <ze5xz52jt4helttcmntzmr6fr4ohu7wtslywalbxc4w7w6uvly@nwweqyyl4wf2>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Nov 2023 08:20:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0sVSGEECFEOeNOEXty2UkO2-F7gK_FVhQ7MCsmn1Qkw@mail.gmail.com>
Message-ID: <CAD=FV=U0sVSGEECFEOeNOEXty2UkO2-F7gK_FVhQ7MCsmn1Qkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 6, 2023 at 12:06=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Thu, Nov 02, 2023 at 07:33:48AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 1, 2023 at 11:31=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, 1 Nov 2023 at 23:26, Hsin-Yi Wang <hsinyi@chromium.org> wrote=
:
> > > >
> > > > If a non generic edp-panel is under aux-bus, the mode read from edi=
d would
> > > > still be selected as preferred and results in multiple preferred mo=
des,
> > > > which is ambiguous.
> > > >
> > > > If a hard-coded mode is present, unset the preferred bit of the mod=
es read
> > > > from edid.
> > >
> > > Can we skip the EDID completely if the hardcoded override is present?
> >
> > Yeah, I wondered about that too. The blending of the hardcoded with
> > the EDID predates my involvement with the driver. You can see even as
> > of commit 280921de7241 ("drm/panel: Add simple panel support") that
> > the driver would start with the EDID modes (if it had them) and then
> > go onto add the hardcoded modes. At least for eDP panels, though,
> > nobody (or almost nobody?) actually provided panel-simple a DDC bus at
> > the same time it was given a hardcoded panel.
> >
> > I guess I could go either way, but I have a slight bias to adding the
> > extra modes and just making it clear to userspace that none of them
> > are "preferred". That seems like it would give userspace the most
> > flexibility
>
> I disagree. "Flexibility" here just means "the way to shoot itself in
> the foot without knowing it's aiming at its foot".
>
> If a mode is broken, we shouldn't expose it, just like we don't for all
> modes that require a maximum frequency higher than what the controller
> can provide on HDMI for example.

In this particular case we aren't saying that modes are broken. There
are two (somewhat separate) things in Hsin-Yi's series.

The first thing is a quirk for panels with incorrect modes in their
EDID when using the generic "edp-panel" compatible. In that case we
now _replace_ the broken mode with a more correct one because, as you
say, we shouldn't be telling userspace about a broken mode.

The second thing in Hsin-Yi's series is for when we're _not_ using the
generic "edp-panel". In that case we have a hardcoded mode from the
"compatible" string but we also have modes from the EDID and that's
what ${SUBJECT} patch is about. Here we don't truly know that the
modes in the EDID are broken.


> > and also is closer to what we've historically done (though,
> > historically, we just allowed there to be more than one "preferred"
> > mode).
>
> I have no idea what history you're referring to here

History =3D historical behavior? As above, I pointed out that the kernel
has been merging the hardcoded and EDID modes as far back as commit
280921de7241 ("drm/panel: Add simple panel support") in 2013.

That being said, the historical behavior has more than one mode marked
preferred which is bad, so we're changing the behavior anyway. I'm not
against changing it to just have the hardcoded mode if that's what
everyone else wants (and it sounds like it is).
