Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8063E5509
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7BA89F07;
	Tue, 10 Aug 2021 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB04089F07
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:24:55 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g30so7592901lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4UPAxW5MIbAqUBt0Q38y09xWmSlUCzjYCvtZtpiSSvw=;
 b=xnsCLqDlaE1iroWceRCX/zrxILZnYE3ziQNSQAa2yeEz7vKTCXQ5wHeB86ezjmdRce
 dyXzF66M7vo8TJ1T0GNOSqS3cKjL1iczioeKEBTYM3BTSgaKtBd+A2b09W1SWr+8A/bo
 xkZBNqbicSw2ekKk8dWjPsqH4gMxqvawxiRFcSTz4P9xZTqwGSRuP7Sen2TkIt/7LKOG
 qx7DAgYer2IqWBWSotil94om9sJ9dRCdlLK/kQWvHRzyIeM2PvL5T5qZNzSOxeBAwPMW
 aEmMuPbBuKQDvDwRNOPsdpKUCI+nBP+rH3mehNvsPXNvyZSI1cclbyE4NdwjS5ZfWRwd
 jCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4UPAxW5MIbAqUBt0Q38y09xWmSlUCzjYCvtZtpiSSvw=;
 b=MlayCEMr7G5bX3ULFtmp5cHOank76yF2t18fmeOLpnoVakPfWoUWAI09SU7iQGpnE1
 pswEMp5WMxC6fgccUMfSvl63VYW+a+EDC6C4ztPB8NQv+QEFEwquKJx4uGR55kAYHTs6
 6/XzGrSmEHcv05+qLxwmcUfmWpFO9C2+Mh5WyRm3oapCMvis3/oIQpPez0/jJvecl1V7
 O9aN4x4NrhqA44FNhVXsqdwHTJIkp41uX/qb1FI9HI5Op+ewkvUL1BCocinxA2+YoR6/
 FJlVtT46/i6YHpedHa/y5u52acVjR81lFt9qeJghi0RnhjrvSvPXbKhgoleaqo7Vt8Su
 TntA==
X-Gm-Message-State: AOAM530Ncjxs26JNY7kYlBAhYH6dX/4dLsIXlnLUbwaqGtOZ3pI3EUIA
 jXJM5lCrlbNJum3tCULhONWXjyfoU5vmb9PNF0stSg==
X-Google-Smtp-Source: ABdhPJxcBXYgZKNkiAp2ugSNzy7vnaoigI/Mj+RRoR287jRmW4SJZCQNaA/zmjIz3YAfl38ZMm59l6Ifd69f0nbwFXY=
X-Received: by 2002:ac2:50c6:: with SMTP id h6mr3256787lfm.343.1628583892636; 
 Tue, 10 Aug 2021 01:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com>
 <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
 <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
In-Reply-To: <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 10 Aug 2021 13:54:41 +0530
Message-ID: <CAO_48GFS5SsdNCwOp6Jb+nmZJ+SdNkQkq628VhxXRGSLVeP0Yg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To: Hridya Valsaraju <hridya@google.com>
Cc: John Stultz <john.stultz@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000068671c05c9303ce5"
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

--00000000000068671c05c9303ce5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hridya,

Apologies for the delay in responding.

On Wed, 4 Aug 2021 at 03:09, Hridya Valsaraju <hridya@google.com> wrote:

> On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote=
:
> >
> > On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com>
> wrote:
> > > This patch limits the size of total memory that can be requested in a
> > > single allocation from the system heap. This would prevent a
> > > buggy/malicious client from depleting system memory by requesting for
> an
> > > extremely large allocation which might destabilize the system.
> > >
> > > The limit is set to half the size of the device's total RAM which is
> the
> > > same as what was set by the deprecated ION system heap.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >
> > Seems sane to me, unless folks have better suggestions for allocation
> limits.
> >
> > Reviewed-by: John Stultz <john.stultz@linaro.org>
>
> Thank you for taking a look John!
>
Looks good to me; I will apply it to drm-misc today.


>
> Regards,
> Hridya
>
> >
> > thanks
> > -john
>
Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

--00000000000068671c05c9303ce5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Hridya,<div><br></div><div>Apologies f=
or the delay in responding.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Aug 2021 at 03:09, Hridya Valsar=
aju &lt;<a href=3D"mailto:hridya@google.com">hridya@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 2=
, 2021 at 7:18 PM John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org"=
 target=3D"_blank">john.stultz@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju &lt;<a href=3D"mailt=
o:hridya@google.com" target=3D"_blank">hridya@google.com</a>&gt; wrote:<br>
&gt; &gt; This patch limits the size of total memory that can be requested =
in a<br>
&gt; &gt; single allocation from the system heap. This would prevent a<br>
&gt; &gt; buggy/malicious client from depleting system memory by requesting=
 for an<br>
&gt; &gt; extremely large allocation which might destabilize the system.<br=
>
&gt; &gt;<br>
&gt; &gt; The limit is set to half the size of the device&#39;s total RAM w=
hich is the<br>
&gt; &gt; same as what was set by the deprecated ION system heap.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Hridya Valsaraju &lt;<a href=3D"mailto:hridya@goog=
le.com" target=3D"_blank">hridya@google.com</a>&gt;<br>
&gt;<br>
&gt; Seems sane to me, unless folks have better suggestions for allocation =
limits.<br>
&gt;<br>
&gt; Reviewed-by: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org"=
 target=3D"_blank">john.stultz@linaro.org</a>&gt;<br>
<br>
Thank you for taking a look John!<br></blockquote><div>Looks good to me; I =
will apply it to drm-misc today.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Regards,<br>
Hridya<br>
<br>
&gt;<br>
&gt; thanks<br>
&gt; -john<br>
</blockquote></div>Best,<div>Sumit.<br><div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Thanks and regards,<br>=
<br>Sumit Semwal (he / him)<br>Tech Lead - LCG, Vertical Technologies<br>Li=
naro.org =E2=94=82 Open source software for ARM SoCs</div></div></div></div=
></div>

--00000000000068671c05c9303ce5--
