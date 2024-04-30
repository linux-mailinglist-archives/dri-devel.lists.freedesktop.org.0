Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14F8B81F1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 23:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02510E610;
	Tue, 30 Apr 2024 21:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j5M6I0nc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2B710E610
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 21:33:34 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-790ff1fa7b3so191659885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714512811; x=1715117611;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+HzTkd4i5A3Jz1EV6LIGTPt2WPRL2keGYFaIW+UNwc=;
 b=j5M6I0ncHF8SErAf6B+7xh61+3nx+0ymf4/4aGZpYrUeIyngzAjf7FefP1c3YWUVpY
 4DNGk34gA4MnMI3Q96aYd7aLKl4LEB68LTJrWZEbE4u+nMhrJI6h4uthgYBCYSxanYM0
 l4p6rC52H8iRqCF22lcpn94D8/k9s6KljCCGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714512811; x=1715117611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+HzTkd4i5A3Jz1EV6LIGTPt2WPRL2keGYFaIW+UNwc=;
 b=pg8+xbj5jD5Inncpnx4StRxa8BRdASH5Z4kq3sQw1kciD3a4n4re/kq6qy4i8skhjO
 s0mBFmTeMLcC67c3T7sRDoAy5a/2uvIRDQVRlYNvS4UdVw/XgnQK30Kv9kxo1MbArmZ0
 EOGSg6yiRFVZzc+PHa18rC3zt1/FhJG1YcHakG9SzPtdoRjr6jg5qNlcr0kpEb0t4Gi1
 OKg9F7tftKSt4HYyMxJvnYVIBrh6EaGb+1x+J8xxJsgajNhyKU7fulUEz8H0NBxmSDX+
 O9/3GhMVfHgqT3u9cD+1gmQMmfwm3otQ16fIeNiqc+sew7kD1pjOF6o/LAuZQSqLrKV0
 Hc9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ4lGkAj5jzDnqh32F9OoO9cwFWIX83pgLKeXQ30N7GmtihK+DyjpHSQzwBZq8jpb43uSJOpnGFpJI20pRLTG6MJLRho2DRQlzfjCMny19
X-Gm-Message-State: AOJu0Yxj+bxCIDXr2Wpv9pvsFOk6kK1vQZz3Y21WO9LMZZFBUCR4VHza
 iSAN/fyFoct0AOJj1dMRJx5K1WcS6JPqxMf2aZM1/m7dq4EOiVoUv0RKLmND9faoMGSbNQi4+fY
 =
X-Google-Smtp-Source: AGHT+IF8OT/VuqIpqd89rIhzH9ban/fLJc339HTBodq1NgpS38yFgW8KbqjRsgPfU7t1LI3XS0efQg==
X-Received: by 2002:ae9:e607:0:b0:78f:ff6:f743 with SMTP id
 z7-20020ae9e607000000b0078f0ff6f743mr594196qkf.22.1714512811299; 
 Tue, 30 Apr 2024 14:33:31 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 b25-20020a05620a271900b007925fc27b1bsm612185qkp.124.2024.04.30.14.33.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:33:30 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43989e6ca42so52021cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7QSVW+iPS//rdGCeciaoxXedfUlpj2oBuSyGYy106E/lpqfv2x9Ty101d2QXXQ15srdYUZwunjbwMZUVDMIwSKrrxeLc3iwnspYazI105
X-Received: by 2002:a05:622a:301:b0:439:ef72:75fb with SMTP id
 q1-20020a05622a030100b00439ef7275fbmr25727qtw.1.1714512809499; Tue, 30 Apr
 2024 14:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
 <caa6fb05-8080-444a-93c3-2d9283ccb74d@bosc.ac.cn>
 <20240429-enchanted-cooperative-jacamar-cf2902@houat>
 <6db82a3f.c7.18f2c927d9f.Coremail.suijingfeng@bosc.ac.cn>
In-Reply-To: <6db82a3f.c7.18f2c927d9f.Coremail.suijingfeng@bosc.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Apr 2024 14:33:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2ksFLtv3o5tqrpXY4aHD_wUq7R7rT9hOHCQa8FLmeoQ@mail.gmail.com>
Message-ID: <CAD=FV=W2ksFLtv3o5tqrpXY4aHD_wUq7R7rT9hOHCQa8FLmeoQ@mail.gmail.com>
Subject: Re: Re: drm/debugfs: Drop conditionals around of_node pointers
To: =?UTF-8?B?6ZqL5pmv5bOw?= <suijingfeng@bosc.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
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

On Mon, Apr 29, 2024 at 6:16=E2=80=AFPM =E9=9A=8B=E6=99=AF=E5=B3=B0 <suijin=
gfeng@bosc.ac.cn> wrote:
>
> Hi,
>
>
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Maxime Ripard" <mripard@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2024-04-29 19:30:24 (=E6=98=9F=E6=
=9C=9F=E4=B8=80)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: "Sui Jingfeng" <suijingfeng@bosc.ac.cn>
> > =E6=8A=84=E9=80=81: "Sui Jingfeng" <sui.jingfeng@linux.dev>, "Maarten L=
ankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann" <tzimmer=
mann@suse.de>, "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@=
ffwll.ch>, "Douglas Anderson" <dianders@chromium.org>, "Laurent Pinchart" <=
laurent.pinchart+renesas@ideasonboard.com>, "Biju Das" <biju.das.jz@bp.rene=
sas.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
> > =E4=B8=BB=E9=A2=98: Re: drm/debugfs: Drop conditionals around of_node p=
ointers
> >
> > On Sun, Apr 28, 2024 at 04:52:13PM +0800, Sui Jingfeng wrote:
> > > ping
> > >
> > > =E5=9C=A8 2024/3/22 06:22, Sui Jingfeng =E5=86=99=E9=81=93:
> > > > Having conditional around the of_node pointer of the drm_bridge str=
ucture
> > > > turns out to make driver code use ugly #ifdef blocks.
> >
> > The code being ugly is an opinion, what problem is it causing exactly?
> >
> > > Drop the conditionals to simplify debugfs.
> >
> > What does it simplifies?
> >
> > > >
> > > > Fixes: d8dfccde2709 ("drm/bridge: Drop conditionals around of_node =
pointers")
> > > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> >
> > Why do we want to backport that patch to stable?

Technically it's not CCing stable and so it's not really incorrect.
...but I agree that this is a bit of a stretch to call it a "Fix".
Maybe drop the "Fixes" line?


> My commit message is written based on commit of d8dfccde2709
>
> $ git show c9e358dfc4a8
>
>     This patch is based on commit c9e358dfc4a8 ("driver-core: remove
>     conditionals around devicetree pointers").
>
>     Having conditional around the of_node pointer of the drm_bridge
>     structure turns out to make driver code use ugly #ifdef blocks. Drop =
the
>     conditionals to simplify drivers. While this slightly increases the s=
ize
>     of struct drm_bridge on non-OF system, the number of bridges used tod=
ay
>     and foreseen tomorrow on those systems is very low, so this shouldn't=
 be
>     an issue.
>
>     So drop #if conditionals by adding struct device_node forward declara=
tion.
>
> > Maxime
>
> I'm just start to contribute by mimic other people's tone, there seems no=
 need
> to over read.

I think the fact that you skipped the reference to commit c9e358dfc4a8
("driver-core: remove conditionals around devicetree pointers") was
relevant here. Referencing that commit makes it easy for the reader to
see that you are following convention used throughout the kernel and
not just asserting your own opinion about style.

If you add that reference into your commit message and send a v2, I'm
happy to apply it.

-Doug
