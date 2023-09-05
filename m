Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2397792FC3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 22:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D4510E4FE;
	Tue,  5 Sep 2023 20:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8710E4FE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 20:16:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so476274a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693944982; x=1694549782;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOMURYJK1jPXbcrQ6jgRnAGfsBHD/Md4WVv2cMc23FQ=;
 b=bKQy8Fj+j6PGNt+Q070EUebZQlbxVKtt5aJuLkVgmXUoKB1xlZNZpA/3K09AvBI1QY
 RpQXh5f2ozg4nbmpB26Qa++aGgp996L9jauhZxk9Ciqyh4ZopaV2JUnUH8kurGw6hOpz
 uElxstgnju0C9PhzJr0zyNR9uA8TZnPTuF2ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693944982; x=1694549782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOMURYJK1jPXbcrQ6jgRnAGfsBHD/Md4WVv2cMc23FQ=;
 b=e7C3XF4JfgLf6HqGnpn5a4Dk8YC6QObSKpuSjThJmwPRdmbJhacrfXzHsdvkvVdSEz
 xVnU4Uv8R/bFGf+H1vQs0+N93UbO03NPuSPvFvrFCNqbVkwryKd/n+3MPTx7sjbQdf+/
 wHk4LflgjDoh3VS/ZEbOGLMzR7RpVOOQrg0d+UJ9YAlQtkMIHOSqpUaiXPGTDhFWFv5z
 iVQr/A4vfxAYiOV+yO2ZX8cnClk9o/6oAMYfBnLubURRCKcuIuCc69BUtnOfEvPvCCNi
 dVNgvFblH3DUXUHKFV1DqsoBnkrNFcP+T+oLzIDqLqf62PvqmAeX+/+iOuWarx0vd/XM
 qTng==
X-Gm-Message-State: AOJu0YwJJMHpmlYlSv9Q6mqBDqnrGsLZr2E2q4PgYaoJtR87w6xfdW/K
 kDBdibcsWIcD2hRbi/RoPDpMqZhJ1E0ORTm7qcFqG8Xc
X-Google-Smtp-Source: AGHT+IFL0IiGRYxCEotLpQQkXWRYe53vYt3pZOLyzRlszPFgIVYkQNTepUoZ1xGZLYenmjM8wvhfHQ==
X-Received: by 2002:a05:6402:2788:b0:52e:83d0:203e with SMTP id
 b8-20020a056402278800b0052e83d0203emr928251ede.10.1693944981731; 
 Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 v18-20020a056402349200b0052e1783ab25sm3522454edc.70.2023.09.05.13.16.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-521e046f6c7so847a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
X-Received: by 2002:a50:d0c1:0:b0:523:bdc9:48a9 with SMTP id
 g1-20020a50d0c1000000b00523bdc948a9mr54207edf.0.1693944980934; Tue, 05 Sep
 2023 13:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
In-Reply-To: <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 13:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
Message-ID: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: linux-mips@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Paul,

On Mon, Sep 4, 2023 at 2:15=E2=80=AFAM Paul Cercueil <paul@crapouillou.net>=
 wrote:
>
> Hi Douglas,
>
> Le vendredi 01 septembre 2023 =C3=A0 16:41 -0700, Douglas Anderson a =C3=
=A9crit :
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that
> > it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Since this driver uses the component model and shutdown happens at
> > the
> > base driver, we communicate whether we have to call
> > drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> LGTM.
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks for the Ack! Would you expect this patch to land through
"drm-misc", or do you expect it to go through some other tree?
Running:

./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/ingenic/ingenic-drm-dr=
v.c

...does not show that this driver normally goes through drm-misc, but
it also doesn't show that it goes through any other tree so maybe it's
just an artifact of the way it's tagged in the MAINTAINERS file? If
it's fine for this to go through drm-misc, I'll probably land it (with
your Ack and Maxime's Review) sooner rather than later just to make
this patch series less unwieldy.


> > ---
> > This commit is only compile-time tested.
> >
> > NOTE: this patch touches a lot more than other similar patches since
> > the bind() function is long and we want to make sure that we unset
> > the
> > drvdata if bind() fails.
> >
> > While making this patch, I noticed that the bind() function of this
> > driver is using "devm" and thus assumes it doesn't need to do much
> > explicit error handling. That's actually a bug. As per kernel docs
> > [1]
> > "the lifetime of the aggregate driver does not align with any of the
> > underlying struct device instances. Therefore devm cannot be used and
> > all resources acquired or allocated in this callback must be
> > explicitly released in the unbind callback". Fixing that is outside
> > the scope of this commit.
> >
> > [1] https://docs.kernel.org/driver-api/component.html
> >
>
> Noted, thanks.

FWIW, I think that at least a few other DRM drivers handle this by
doing some of their resource allocation / acquiring in the probe()
function and then only doing things in the bind() that absolutely need
to be in the bind. ;-)


-Doug
