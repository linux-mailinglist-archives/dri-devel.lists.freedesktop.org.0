Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD869F225
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 10:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15710E439;
	Wed, 22 Feb 2023 09:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423510E1B8;
 Wed, 22 Feb 2023 09:49:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w27so9290300lfu.4;
 Wed, 22 Feb 2023 01:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hUTsw3c3dGl69gFjc2IPLlLseEpyU+BsJ/tXKcVGvJE=;
 b=UfBONU13JoaYcQsCFIsDBmRdKbIhPk9GiK9bQJCcqCj2Ual6SFTndJ5DNxei8DGVF2
 e++IlSQgRPd082iwJLNPlCKrVKSedW6SWbYAuV8YKIHlZ3V9Osm0jKf6NaDa5/8MJaBd
 dARDXUEScOKGsXYEccBP+IM3wQl9Z7YBT97phvyqPa7mbNswkoq56FnN0EqG1/wCpvVS
 WbVvCW1KAwboDqSdHVl5cwoWYAs22XWxmMCCtL9nXEc8tAP7nRJnbVwcUCRHXPzb9SlB
 2EMEtSQSvoqHCQOSNKsUXLBJGt6nKI+wU9q4pINS72LopCt4c3RVZMg0PPSMuQhqA05X
 ENCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hUTsw3c3dGl69gFjc2IPLlLseEpyU+BsJ/tXKcVGvJE=;
 b=bm3zHrVK8D0DBDo8xyZiaHMDA2tjeWBjb+6kg0f/1EkKXWSLcqG7bIhSvvR9sLJY/E
 rU4qOaJjyL5bLSMjsXF9SftzrCjOmgsMRfdg4cYrXPrLGiR1uBj83juGSHCxeMO9AfJO
 RBI+2jtpXx/HJmIB77drkeURbePTfcUrp5ihoVohyXqg3hAB9NbPAUdsl3GBKAFDNxKd
 WHMdnEbyEgarQYtKzMALumgp8A03ilgYudUWx95JTfzvynUTs6IpbHvPqKBt67WriFRZ
 rfBSelvuIycB+SFO8PP9nL/3SrIEJnujAB4xzenclhEazLqQm6YjrcTFXcE7/isnuCly
 iqtg==
X-Gm-Message-State: AO0yUKWya0KwzYm9cQz6qGkdlQy2EkKexZLEuo3kTNtmaE7cLVNUZ9vu
 GuIrw6iPPdn5knF8LMT9RyE=
X-Google-Smtp-Source: AK7set+/N70WpQDEBCEnI2DY3oZ18dabG3BI02ASZ7Aq5pjZT+kZQ8aYZsNj2eWwNwtMnlKRydoyCg==
X-Received: by 2002:ac2:5494:0:b0:4db:3605:9bdd with SMTP id
 t20-20020ac25494000000b004db36059bddmr2770417lfk.5.1677059352364; 
 Wed, 22 Feb 2023 01:49:12 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q13-20020ac25a0d000000b004b578e52d81sm2121394lfn.176.2023.02.22.01.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 01:49:11 -0800 (PST)
Date: Wed, 22 Feb 2023 11:49:00 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <20230222114900.1b6baf95@eldfell>
In-Reply-To: <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vMp1DRNCFLeCBFsykIrKQNo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vMp1DRNCFLeCBFsykIrKQNo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Feb 2023 09:53:56 -0800
Rob Clark <robdclark@gmail.com> wrote:

> On Tue, Feb 21, 2023 at 8:48 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
> >
> > On 2023-02-20 11:14, Rob Clark wrote: =20
> > > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com>=
 wrote: =20
> > >>
> > >> On Sat, 18 Feb 2023 13:15:49 -0800
> > >> Rob Clark <robdclark@gmail.com> wrote:
> > >> =20
> > >>> From: Rob Clark <robdclark@chromium.org>
> > >>>
> > >>> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urg=
ent
> > >>> wait (as opposed to a "housekeeping" wait to know when to cleanup a=
fter
> > >>> some work has completed).  Usermode components of GPU driver stacks
> > >>> often poll() on fence fd's to know when it is safe to do things like
> > >>> free or reuse a buffer, but they can also poll() on a fence fd when
> > >>> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI fl=
ag
> > >>> lets the kernel differentiate these two cases.
> > >>>
> > >>> Signed-off-by: Rob Clark <robdclark@chromium.org> =20
> > >>
> > >> Hi,
> > >>
> > >> where would the UAPI documentation of this go?
> > >> It seems to be missing. =20
> > >
> > > Good question, I am not sure.  The poll() man page has a description,
> > > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > > bit vague).
> > > =20
> > >> If a Wayland compositor is polling application fences to know which
> > >> client buffer to use in its rendering, should the compositor poll wi=
th
> > >> PRI or not? If a compositor polls with PRI, then all fences from all
> > >> applications would always be PRI. Would that be harmful somehow or
> > >> would it be beneficial? =20
> > >
> > > I think a compositor would rather use the deadline ioctl and then poll
> > > without PRI.  Otherwise you are giving an urgency signal to the fence
> > > signaller which might not necessarily be needed.
> > >
> > > The places where I expect PRI to be useful is more in mesa (things
> > > like glFinish(), readpix, and other similar sorts of blocking APIs) =
=20
> > Hi,
> >
> > Hmm, but then user-space could do the opposite, namely, submit work as =
usual--never
> > using the SET_DEADLINE ioctl, and then at the end, poll using (E)POLLPR=
I. That seems
> > like a possible usage pattern, unintended--maybe, but possible. Do we w=
ant to discourage
> > this? Wouldn't SET_DEADLINE be enough? I mean, one can call SET_DEADLIN=
E with the current
> > time, and then wouldn't that be equivalent to (E)POLLPRI? =20
>=20
> Yeah, (E)POLLPRI isn't strictly needed if we have SET_DEADLINE.  It is
> slightly more convenient if you want an immediate deadline (single
> syscall instead of two), but not strictly needed.  OTOH it piggy-backs
> on existing UABI.

In that case, I would be conservative, and not add the POLLPRI
semantics. An UAPI addition that is not strictly needed and somewhat
unclear if it violates any design principles is best not done, until it
is proven to be beneficial.

Besides, a Wayland compositor does not necessary need to add the fd
to its main event loop for poll. It could just SET_DEADLINE, and then
when it renders simply check if the fence passed or not already. Not
polling means the compositor does not need to wake up at the moment the
fence signals to just record a flag.

On another matter, if the application uses SET_DEADLINE with one
timestamp, and the compositor uses SET_DEADLINE on the same thing with
another timestamp, what should happen?

Maybe it's a soft-realtime app whose primary goal is not display, and
it needs the result faster than the window server?

Maybe SET_DEADLINE should set the deadline only to an earlier timestamp
and never later?


Thanks,
pq

--Sig_/vMp1DRNCFLeCBFsykIrKQNo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP15QwACgkQI1/ltBGq
qqfMTQ/9FH4Z7EQ5jdc+1jGvO29uR7Ih0y1/k/wFFU3l7XCftBRKTn040aMGRnq7
fQTG3rTSC47mHT2FlwO+gXfwHpW1z80FOy9tD/fl2CDmqxqJbHE6DyGYdFMjzK5y
920v4kfJFeJ99CLssA6yQwxlfobHP+M3rbX0cFTOJ0YGeP8ZY3DyQng4lZgwa2wD
/MYnAs+589mU93gBEB/rUWKbHIFnZFv7psLpf7iP3aRU7muQAieSMpJGWtW1f/M4
YMPMAAJagplQAfwDhbBFMBNz2dJpzUFiCk4uPYSLh+ysD6KhR4K+LYBrlC237Obe
9dSrnuaL0hfzkedElz/edHetggNhvPzoYgJlf+VqjoXwNwDN1IFYW9RGeikAvFhr
7tK+yxIDHwB/grglQFEiaF8+BrUMAuXWc2IgIuZvG0blE/6JxEvfeh7mBT+R2kF0
1xAdrFGrPw7/ALH5bvGLfOCkY8pTC+QBkwknGDZGszr1pP6gs0tUHI0uqonAPQ6k
b+TmMJA8OtC/Te6fk7NSDvvxNjtRupS+M0c9avOVc3LrWpIK0SDi5RSIz0MSzXfr
/2lo3AUYiY6GYt59msHwnNPK8jVvSLxs3yR0q6LE/2MICreclpVXxiUsP7SfBNR0
VWlFWhFMQjiZWdS4m3ZZBoEn8JR7fTBPIXVCUQgX0+X7D6oQlJg=
=+sLE
-----END PGP SIGNATURE-----

--Sig_/vMp1DRNCFLeCBFsykIrKQNo--
