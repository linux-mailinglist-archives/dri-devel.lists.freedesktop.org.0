Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400785FF81
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E2510E9CD;
	Thu, 22 Feb 2024 17:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sq9K460x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38ED10E9CD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:36:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5654ef0c61fso6843a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708623374; x=1709228174;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmEKVyetFL548x1phH+vDmo2g1KI7fqBu5h2gLzPo5M=;
 b=sq9K460xNUeVAQ41n1x0zyT0nlm1o/Zf9y44ihLnA3HCHzllOyJ7+Gru7hU5QAJyFc
 SNtmom/w8YTMFk7xROP39aaYhkwDY++CFhIZ2X45xHi1Te/r3Sb8ArHWmV+TSMUgLS2w
 Hki3Ua5DoLwt+asFOo/4VTZUPDT3zbzKJVnnSCe2vUxi6TNdIWWOeeP8b/tZb/A16w4n
 XSZBAGAL3+fby/T4oplsVagd+8u790xJeviT8BW8wrBe7QoQ6rmXEczbLB1iatxvErWa
 LgS1NXcNmDIVHuR+J9p9lo5f2SWRu10wbId7TY1+EUEQJDATO8pQp116l/93/uxF7jCv
 eiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708623374; x=1709228174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmEKVyetFL548x1phH+vDmo2g1KI7fqBu5h2gLzPo5M=;
 b=IgPPzeP9qzNFKHxyB+UORvJh4LVEOQTMwMXVy5iPf20VwiQWTOJDK4tVZvXQD94oss
 ZMx8ydyGjZCMKkL8wRIzy3zaLYCuY0TP5UwOfF8f7FMcaUUfBj+ToTlUEXlWUUoiWESW
 OVquXwhyfx6gMQICUGu8+4dob1wMaHslAhbOUG88qXl910EhlgM0oSTTmJX0hbkYkVfc
 hcUEuUAtLmnDcmfpiQbZBZCTZ8dTcb58Z9KpX5Yv/G6neuwCZaOpGgjuxDotx/makiEA
 zK5qZp6vzZEu/rlBauSX13IUQOPHim8tLSbvkiiUsSsar+YhtIkb+vUZU35zHb6FdgDW
 TtYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnShuLBnMEwmHHe02xO2jMjvYWwaiJQq0w6oJzUOyAf8a7ahm34yfU/ed72sZDBN08dbuR27mGYfTtEaNkILBQPxTnPHu6NNrSDd6dMMAP
X-Gm-Message-State: AOJu0YzT+fbahYy6zPMeTgfMYaWZ8m1SVh5u+pscycpjS8skyx9hIf8U
 fGqNSJtVy1+r4JNRb9YRQq8JC8RNc+NnqeGgH6raDicn/+PP/BuD+ET/MpUWkv5tIVFbA4GMPvt
 i1dFND1OuNgTj1xF7IxKhw7JKL4TE0hsp/VT9
X-Google-Smtp-Source: AGHT+IH+4QsAKS6v2wz/3Ohm5UGixFC1Is/yek5Qgz+ij5+wrc7QXl4sCi0AbqHTx6nwjSX1cBP+z7ipSxtuApYMC+k=
X-Received: by 2002:a50:c309:0:b0:565:4b98:758c with SMTP id
 a9-20020a50c309000000b005654b98758cmr128301edb.4.1708623373891; Thu, 22 Feb
 2024 09:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-3-davidgow@google.com>
 <20240221201008.ez5tu7xvkedtln3o@google.com>
 <CABVgOSn+VxTb5TOmZd82HN04j_ZG9J2G-AoJmdxWG8QDh9xGxg@mail.gmail.com>
In-Reply-To: <CABVgOSn+VxTb5TOmZd82HN04j_ZG9J2G-AoJmdxWG8QDh9xGxg@mail.gmail.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 22 Feb 2024 09:36:01 -0800
Message-ID: <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
To: David Gow <davidgow@google.com>
Cc: Justin Stitt <justinstitt@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Rae Moar <rmoar@google.com>, Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Wed, Feb 21, 2024 at 10:22=E2=80=AFPM David Gow <davidgow@google.com> wr=
ote:
>
> On Thu, 22 Feb 2024 at 04:10, 'Justin Stitt' via KUnit Development
> <kunit-dev@googlegroups.com> wrote:
> >
> > Hi,
> >
> > On Wed, Feb 21, 2024 at 05:27:15PM +0800, David Gow wrote:
> > > The correct format specifier for p - n (both p and n are pointers) is
> > > %td, as the type should be ptrdiff_t.
> >
> > I think %tu is better. d specifies a signed type. I don't doubt that th=
e
> > warning is fixed but I think %tu represents the type semantics here.
> >
>
> While I agree that this should never be negative, I'd still lean on
> this being a signed type, for two reasons:
> - I think, if there's a bug in this code, it's easier to debug this if
> a 'negative' value were to appear as such.
> - While, as I understand it, the C spec does provide for a
> ptrdiff_t-sized unsigned printf specifier in '%tu', the difference
> between two pointers is always signed:
>
> "When two pointers are subtracted, both shall point to elements of the
> same array object,
> or one past the last element of the array object; the result is the
> difference of the
> subscripts of the two array elements. The size of the result is
> implementation-defined,
> and its type (a signed integer type) is ptrdiff_t defined in the
> <stddef.h> header"
>
> (Technically, the kernel's ptrdiff_t type isn't defined in stddef.h,
> so a bit of deviation from the spec is happening anyway, though.)
>
> If there's a particularly good reason to make this unsigned in this
> case, I'd be happy to change it, of course. But I'd otherwise prefer
> to keep it as-is.

Copying the line for context, it's about `p-r` where
  p =3D memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
`p-r` should never be negative unless something has gone horribly
horribly wrong.

So in this particular case, either %tu or %td would be fine.

(sorta bikeshedding warning)
But, I'd personally lean towards using the signed %td in tests to
guard against typos in test code as _a guiding principle._

This is especially true given that the failure messages aren't
verified since they are mostly "dead code."
You can have crazy incorrect things going on in the format arguments,
see patch 1/9 in this series [1]. One of kunit's own tests would do a
read from a ~random memory region if that specific assertion failed.
Not a good look ;)
We never noticed until this series enabled the format string checks.
You also can't expect reviewers to go through and modify every
assertion to fail to see what the failure mode looks like, so these
kinds of errors will continue to slip through.

*So IMO, we should generally adopt a more defensive stance when it
comes to these.*

Also consider the user experience if there is a failure and I
accidentally wrote `r-p` here.
Someone else sees an error report from this test and needs to investigate.

What message is easier to deal with?
>  in test 18 at -5 out of bound
or
> in test 18 at 18446744073709551611 out of bound

Sure, I can eventually figure out what both messages mean, but it's a
immediately obvious from the first that there's a
a) real error: something is wrong at index 5
b) test code error: there's a flipped sign somewhere

So I'd strongly prefer the current version of the patch over one with %tu.
Reviewed-by: Daniel Latypov <dlatypov@google.com>

[1] https://lore.kernel.org/linux-kselftest/20240221092728.1281499-2-davidg=
ow@google.com/

Thanks,
Daniel
