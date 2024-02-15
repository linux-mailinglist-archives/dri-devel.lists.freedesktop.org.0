Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11703856A97
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264D10E9E5;
	Thu, 15 Feb 2024 17:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VYl0Bolk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD3710E9E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:09:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso498753a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708016946; x=1708621746;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1/ASlNWdXM10uIzZ2ikbKUIZYgIKrRa/y3zX+Zh6qk=;
 b=VYl0Bolkbd1zOHCjFp3dQ+2WzbfKxl8mkhBSQCeMg0RmHjfNulT3fu3LCX9k3EMNCK
 cUEZ72tMXpNInYKmgTkOjqeU9p/j2OiqC8NjzsN+n2jxlHT9y6cPBeAkbXsAOxcq+t8n
 XLhdfQpXrQP0pz5vXluf8lAz70eu0HTX6ZJsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708016946; x=1708621746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1/ASlNWdXM10uIzZ2ikbKUIZYgIKrRa/y3zX+Zh6qk=;
 b=C+0SaJJ+CgWb/7iUxv7aPhbm6Sv7dlLLqLAMAvtDrHXEmF6b57xy00nAEci9OvgyoM
 oy14cAKeBJMJYKiFanv2yVMJR56qwOSBaMs26l3cvbOKTK+iXdWl/S0yOwYA/Imfe5pw
 l/TdyLMpbZe18MA1tcbJ/baS58oSGph7apvjXzB2FoxRZ+ZzuHSr6zDkPz1/yjqiGqAS
 Bj2gOQgld1qFDmTW5TjFsij/yXMTChCO652K+Df1+5EXwsZuyXvnQEIFoa5uENgwTkDQ
 BlndpEauDJkIPOHyHqUU4rwFPfRNsmh6ihRnP/zd7g0N8JJrO4c7raPUcKT1zCBNJ8MK
 PmcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4tLYVC2i+g1LmdsYSTtRhVweNb772DVMWtiQ9tBTqetfM569C4Wn1drsSPfmXfahFI9S6FRpuh6e4PAjqksU5Y3qNDKdQxlNMTP+IpyAd
X-Gm-Message-State: AOJu0Yzi304yQ9FEiLcFvAbNpDA3KZFIFfTDjBGyOBYCeAo05nnDpKDs
 J+YCxf+ZCyZ/MCWu/VUv2498GcZhZbNG75mpBJc1DveiApwXFinifuG0TzVm8jZ7F4Dfq54ucyr
 GoMbI
X-Google-Smtp-Source: AGHT+IF6gMuWpB+2EIAFWLLoqKh6cyrPo3nDG/Jj5+yAhDih9PIcLVZmAzKb3vVnaFFh8IxOqKv3nw==
X-Received: by 2002:aa7:c48c:0:b0:561:4238:e6e2 with SMTP id
 m12-20020aa7c48c000000b005614238e6e2mr2051756edq.29.1708016945527; 
 Thu, 15 Feb 2024 09:09:05 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 s10-20020a50d48a000000b0055c63205052sm772633edi.37.2024.02.15.09.09.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 09:09:05 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-410c9f17c9eso79155e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:09:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrJ1LHUBP6u6WZkqB1pWk88SyE/cTa4oiDbyg5NvkJC80NWVtm6A5kPjTyeSIXIXkbxaY6aXkTgoltmeHL1AuX1ZecszywFslbxg0+JRxf
X-Received: by 2002:a05:600c:3d9b:b0:412:255a:f7dc with SMTP id
 bi27-20020a05600c3d9b00b00412255af7dcmr20552wmb.5.1708016943776; Thu, 15 Feb
 2024 09:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
In-Reply-To: <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Feb 2024 09:08:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
Message-ID: <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: neil.armstrong@linaro.org, Javier Martinez Canillas <javierm@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 linux-kernel@vger.kernel.org
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

On Thu, Feb 15, 2024 at 8:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi Doug,
>
> On 15/02/2024 16:08, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Feb 15, 2024 at 2:24=E2=80=AFAM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> >>> Hi,
> >>>
> >>> On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromiu=
m.org> wrote:
> >>>>
> >>>> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@c=
hromium.org> wrote:
> >>>>>
> >>>>> If an eDP panel is not powered on then any attempts to talk to it o=
ver
> >>>>> the DP AUX channel will timeout. Unfortunately these attempts may b=
e
> >>>>> quite slow. Userspace can initiate these attempts either via a
> >>>>> /dev/drm_dp_auxN device or via the created i2c device.
> >>>>>
> >>>>> Making the DP AUX drivers timeout faster is a difficult proposition=
.
> >>>>> In theory we could just poll the panel's HPD line in the AUX transf=
er
> >>>>> function and immediately return an error there. However, this is
> >>>>> easier said than done. For one thing, there's no hard requirement t=
o
> >>>>> hook the HPD line up for eDP panels and it's OK to just delay a fix=
ed
> >>>>> amount. For another thing, the HPD line may not be fast to probe. O=
n
> >>>>> parade-ps8640 we need to wait for the bridge chip's firmware to boo=
t
> >>>>> before we can get the HPD line and this is a slow process.
> >>>>>
> >>>>> The fact that the transfers are taking so long to timeout is causin=
g
> >>>>> real problems. The open source fwupd daemon sometimes scans DP buss=
es
> >>>>> looking for devices whose firmware need updating. If it happens to
> >>>>> scan while a panel is turned off this scan can take a long time. Th=
e
> >>>>> fwupd daemon could try to be smarter and only scan when eDP panels =
are
> >>>>> turned on, but we can also improve the behavior in the kernel.
> >>>>>
> >>>>> Let's let eDP panels drivers specify that a panel is turned off and
> >>>>> then modify the common AUX transfer code not to attempt a transfer =
in
> >>>>> this case.
> >>>>>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>
> >>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>>
> >>> Thanks for the review!
> >>>
> >>> Given that this touches core DRM code and that I never got
> >>> confirmation that Jani's concerns were addressed with my previous
> >>> response, I'm still going to wait a little while before applying. I'm
> >>> on vacation for most of next week, but if there are no further replie=
s
> >>> between now and then I'll plan to apply this to "drm-misc-next" the
> >>> week of Feb 26th. If someone else wants to apply this before I do the=
n
> >>> I certainly won't object. Jani: if you feel this needs more discussio=
n
> >>> or otherwise object to this patch landing then please yell. Likewise
> >>> if anyone else in the community wants to throw in their opinion, feel
> >>> free.
> >>
> >> Sorry for dropping the ball after my initial response. I simply have n=
ot
> >> had the time to look into this.
> >>
> >> It would be great to get, say, drm-misc maintainer ack on this before
> >> merging. It's not fair for me to stall this any longer, I'll trust the=
ir
> >> judgement.
> >>
> >> Reasonable?
> >
> > I'd be more than happy for one of the drm-misc maintainers to Ack.
> > I'll move Maxime, Thomas, and Maarten to the "To:" line to see if that
> > helps get through their filters.
>
> I'll like some test reports to be sure it doesn't break anything,
> then I'll be happy to give my ack !

Sounds good. I know Eizan (CCed, but also a ChromeOS person) was going
to poke at it a bit and seemed willing to provide a Tested-by. I'll
let him chime in.

...but perhaps some better evidence that it's not breaking hardware is
that we actually landed this into one (but not all) ChromeOS kernel
trees [1] and it's rolled out to at least "beta" channel without
anyone screaming. Normally we like things to land upstream before
picking, but in this case we needed to land another patch to gather
in-field data [2] that would have made the problem even worse.

The kernel tree we landed on was the v5.15 tree, which is currently
serving all Qualcomm sc7180-based Chromebooks, all Mediatek 8173
Chromebooks and all Mediatek 8186 Chromebooks. There are also a pile
of x86 Chromebooks running our v5.15 kernel. This code shouldn't
affect them because (unless I'm mistaken) they don't use the two
affected panel drivers. In any case, I haven't heard any screams from
them either. Given my landing plans of "the week of the 26th", this
still gives another 1.5 weeks for any screams to reach my ears.

...or are you looking for non-ChromeOS test reports? I'm not sure how
to encourage those. I suppose sometimes folks at Red Hat end up
stumbling over similar panel problems to those of us in ChromeOS.
Maybe +Javier would be interested in providing a Tested-by?

[1] https://crrev.com/c/5277322
[2] https://crrev.com/c/5277736
