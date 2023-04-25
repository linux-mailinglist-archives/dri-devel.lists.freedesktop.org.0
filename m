Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EC6EE0DE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 13:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6410E27B;
	Tue, 25 Apr 2023 11:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EAF10E094;
 Tue, 25 Apr 2023 11:07:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-506b8c6bbdbso8389387a12.1; 
 Tue, 25 Apr 2023 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682420865; x=1685012865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=294bt+ZrwNFQAKB725MjScGMzyeCkwKGIpThRbfLnHE=;
 b=We5mE5PXGjZ0RoDgoH4h+IR9tNAwA16dgGL47dvC3IwjGvFpoI1xkLeAJl7Vjn9rAw
 gZMXWtp59TOXrBVIVnUFRPmP5zm4p/+aOEtG3uoYhtxN16p/lOERDxo/i0LDpFxNtg0z
 d4W+bo2L4ayhPQ04hRgoTa9lVn926dh3I4646fJbip/VfuPSxegKLI6IgQlYkEvCqu/k
 HonVooeoQexu5PDkSjx3pjMv0UWj5PFgfN+ooGZsNP6TFPTSTM0YlwPI94zL2Oo9PjPX
 jyQaHByNptuyC2WdD7+pUgCGU+eIk8FAnhlcvfGxiwL0fR8rK8fppn3VgmbeCrdILADG
 6OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682420865; x=1685012865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=294bt+ZrwNFQAKB725MjScGMzyeCkwKGIpThRbfLnHE=;
 b=FFKvTRKwCdgDOWy3hq1fOluqmOeduWmvFh7wZZ/IEFIRh55bbOeA4qwJ3TS0JSWdO/
 QH1Ak/lJjJRM+8VAE837/gDnlHcNCTS2SNtvsZXDhVKKQGfbnSikTdqVIlvXb7exof90
 ZxfynXl/189sRNpL7hSQW0AcUazZeHrIMFOpbOvlH5YUCo5zuEpGIuCAKuUaIrRRm/dD
 bi9LCspToZAZEmiFVHK01aEIzvezoEPHRDAo+YnZ0SjTQWrRwDXpjujrwWa5wVlxTrlI
 9hJ6KNxK7BiwbzVLSGPZ9l39V3sDLVtlXEZYkjdl2BwGGTUlihiBg+Qj0gluzzAtolPy
 /Elw==
X-Gm-Message-State: AAQBX9ersy5Bi8dVldNkojwype6yw85qVCNt0v1XJMcCzlSCdK9r1nJn
 qRTxQ5+kYU0HnyTealGVrS0b/cFw1kvwjtgDOV0=
X-Google-Smtp-Source: AKy350bYgthAOyKHlSdFr584umaKiVe3ve22i+PG8lmVSC0e9Gu3GeOWVZOxunbIHagpCYz77OQOrWOkrMa6ePb5Gc4=
X-Received: by 2002:aa7:df0d:0:b0:506:9984:9239 with SMTP id
 c13-20020aa7df0d000000b0050699849239mr13646182edy.26.1682420864944; Tue, 25
 Apr 2023 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
In-Reply-To: <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 25 Apr 2023 07:07:08 -0400
Message-ID: <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: multipart/alternative; boundary="000000000000048f6805fa2722cb"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000048f6805fa2722cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That supposedly depends on the compositor. There may be compositors for
very specific cases (e.g. Steam Deck) that handle resets very well, and
those would like to be properly notified of all resets because that's how
they get the best outcome, e.g. no corruption. A soft reset that is
unhandled by userspace may result in persistent corruption.

Marek

On Tue, Apr 25, 2023 at 6:27=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org>
wrote:

> On 4/24/23 18:45, Marek Ol=C5=A1=C3=A1k wrote:
> > Soft resets are fatal just as hard resets, but no reset is "always
> fatal". There are cases when apps keep working depending on which feature=
s
> are being used. It's still unsafe.
>
> Agreed, in theory.
>
> In practice, from a user PoV, right now there's pretty much 0 chance of
> the user session surviving if the GPU context in certain critical process=
es
> (e.g. the Wayland compositor or Xwayland) hits a fatal reset. There's a >=
 0
> chance of it surviving after a soft reset. There's ongoing work towards
> making user-space components more robust against fatal resets, but it's
> taking time. Meanwhile, I suspect most users would take the > 0 chance.
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
>

--000000000000048f6805fa2722cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That supposedly depends on the compositor. There may =
be compositors for very specific cases (e.g. Steam Deck) that handle resets=
 very well, and those would like to be properly notified of all resets beca=
use that&#39;s how they get the best outcome, e.g. no corruption. A soft re=
set that is unhandled by userspace may result in persistent corruption.</di=
v><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 25, 2023 at 6:27=E2=80=AFA=
M Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel.daenzer@mailbox.org" targ=
et=3D"_blank">michel.daenzer@mailbox.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 4/24/23 18:45, Marek Ol=C5=A1=C3=
=A1k wrote:<br>
&gt; Soft resets are fatal just as hard resets, but no reset is &quot;alway=
s fatal&quot;. There are cases when apps keep working depending on which fe=
atures are being used. It&#39;s still unsafe.<br>
<br>
Agreed, in theory.<br>
<br>
In practice, from a user PoV, right now there&#39;s pretty much 0 chance of=
 the user session surviving if the GPU context in certain critical processe=
s (e.g. the Wayland compositor or Xwayland) hits a fatal reset. There&#39;s=
 a &gt; 0 chance of it surviving after a soft reset. There&#39;s ongoing wo=
rk towards making user-space components more robust against fatal resets, b=
ut it&#39;s taking time. Meanwhile, I suspect most users would take the &gt=
; 0 chance.<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
s://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat.com</a>=
<br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
<br>
</blockquote></div>

--000000000000048f6805fa2722cb--
