Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC8365CA4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 17:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49B96E84C;
	Tue, 20 Apr 2021 15:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DB46E842
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:50:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w4so34424050wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ipeZPzpvIpDWtHcVPvQ48biPNtUsowmAQLcelN41gM=;
 b=sSFs1z0mKsTQ8hoy3Fq6RAygsUtRWSVuWzrFYvrKjrJtK6+EBlHaMLVy/xf42ASNfy
 cCjppCzFfok2W+hmtuShkkwOtQ/VtcLwMbkFeyYsg/ieQh9Lfkc7WBJuATS+aJPYyUsy
 +5v7oKz8sHFRDusY/xkYg67jlGxM52mV7VcKAwb0na9HyqBROli7m3ZfyZUN98OLVOSx
 QEaMOEV+0oj1E/YrL9515yQypkDPjX3E2yDEBWkKScEdR6Z4PCtrEoFTKJ1+uo+EvpBK
 aKNudqFW4V+wyoTCxoaelR/H32jmnraQZ1sInwWb8fndZBWlhNOxIWXHT31ZfyJtK+sm
 g1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ipeZPzpvIpDWtHcVPvQ48biPNtUsowmAQLcelN41gM=;
 b=izyKp6e7hJ/xrAy1qdxEUzSVYQEAjkX8G3o+GgRwbGrQicgkWwlUfD1YXAcGo0aurH
 ecPUvdvPZs1BJh7ZWTAW4BUqM3wTnabl2vwcu1E40VVDEwCLa4vOWsNfF/vH1JKkEoXm
 i/ZQpHT5DHMwDLlAV3edjBhN7E9+jAPMOphs6Eed6hWJtN6Tl6+6JAgj3PhqI+jb1s9J
 OZm8yfi2hV8syGKziXjtfsOidm/LZLcCJCUtYrOpJ/fyd4jxLXvKjTYSaGzc3RpYXO1u
 mnB91Chol7RCPVJMHbe+VZ5jPxs850ri5G+5iAGo6gRuclHTDaqY/x8rZk6EBTB0f9jP
 RwZw==
X-Gm-Message-State: AOAM53170gQOp5SKZHCH0m5+88uWFdNKH0LuFP7kpVyIpy7DD7y+vbIV
 Yrv1JzipsiJ2A42urgFAftSAAwvc/N2FNqa/WIPdj35tpfxaTWEM
X-Google-Smtp-Source: ABdhPJyzGMfb+t9YuwvizV0nUsPeOQiz8lno3CQocveAVZknxZOhKOSZVvzT5ADtEyWkzkVPWATdSgij1i0E5z8bSwY=
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr21213791wrt.256.1618933812979; 
 Tue, 20 Apr 2021 08:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
 <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
 <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
In-Reply-To: <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 16:49:25 +0100
Message-ID: <CAPj87rMzFfouhv89-Vj3jDsH8JB5NFiyv+yV07KvJZaa2rB7Kw@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: multipart/mixed; boundary="===============1096632453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1096632453==
Content-Type: multipart/alternative; boundary="000000000000d68a7e05c06966af"

--000000000000d68a7e05c06966af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 20 Apr 2021 at 16:16, Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 20.04.21 um 17:07 schrieb Daniel Stone:
>
> If the compositor no longer has a guarantee that the buffer will be ready
> for composition in a reasonable amount of time (which dma_fence gives us,
> and this proposal does not appear to give us), then the compositor isn't
> trying to use the buffer for compositing, it's waiting asynchronously on =
a
> notification that the fence has signaled before it attempts to use the
> buffer.
>
> Marek's initial suggestion is that the kernel signal the fence, which
> would unblock composition (and presumably show garbage on screen, or at
> best jump back to old content).
>
> My position is that the compositor will know the process has crashed
> anyway - because its socket has been closed - at which point we destroy a=
ll
> the client's resources including its windows and buffers regardless.
> Signaling the fence doesn't give us any value here, _unless_ the composit=
or
> is just blindly waiting for the fence to signal ... which it can't do
> because there's no guarantee the fence will ever signal.
>
>
> Yeah, but that assumes that the compositor has change to not blindly wait
> for the client to finish rendering and as Daniel explained that is rather
> unrealistic.
>
> What we need is a fallback mechanism which signals the fence after a
> timeout and gives a penalty to the one causing the timeout.
>
> That gives us the same functionality we have today with the in software
> scheduler inside the kernel.
>

OK, if that's the case then I think I'm really missing something which
isn't explained in this thread, because I don't understand what the
additional complexity and API change gains us (see my first reply in this
thread).

By way of example - say I have a blind-but-explicit compositor that takes a
drm_syncobj along with a dmabuf with each client presentation request, but
doesn't check syncobj completion, it just imports that into a VkSemaphore +
VkImage and schedules work for the next frame.

Currently, that generates an execbuf ioctl for the composition (ignore KMS
for now) with a sync point to wait on, and the kernel+GPU scheduling
guarantees that the composition work will not begin until the client
rendering work has retired. We have a further guarantee that this work will
complete in reasonable time, for some value of 'reasonable'.

My understanding of this current proposal is that:
* userspace creates a 'present fence' with this new ioctl
* the fence becomes signaled when a value is written to a location in
memory, which is visible through both CPU and GPU mappings of that page
* this 'present fence' is imported as a VkSemaphore (?) and the userspace
Vulkan driver will somehow wait on this value  either before submitting
work or as a possibly-hardware-assisted GPU-side wait (?)
* the kernel's scheduler is thus eliminated from the equation, and every
execbuf is submitted directly to hardware, because either userspace knows
that the fence has already been signaled, or it will issue a GPU-side wait
(?)
* but the kernel is still required to monitor completion of every fence
itself, so it can forcibly complete, or penalise the client (?)

Lastly, let's say we stop ignoring KMS: what happens for the
render-with-GPU-display-on-KMS case? Do we need to do the equivalent of
glFinish() in userspace and only submit the KMS atomic request when the GPU
work has fully retired?

Clarifying those points would be really helpful so this is less of a
strawman. I have some further opinions, but I'm going to wait until I
understand what I'm actually arguing against before I go too far. :) The
last point is very salient though.

Cheers,
Daniel

--000000000000d68a7e05c06966af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 16:16, Christia=
n K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoeni=
g.leichtzumerken@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div>
    <div>Am 20.04.21 um 17:07 schrieb Daniel
      Stone:</div><blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>If the compositor no longer has a guarantee that the
            buffer will be ready for composition in a reasonable amount
            of time (which dma_fence gives us, and this proposal does
            not appear to give us), then the compositor isn&#39;t trying to
            use the buffer for compositing, it&#39;s waiting asynchronously
            on a notification that the fence has signaled before it
            attempts to use the buffer.</div>
          <div><br>
          </div>
          <div>Marek&#39;s initial suggestion is that the kernel signal the
            fence, which would unblock composition (and presumably show
            garbage on screen,=C2=A0or at best jump back to old content).</=
div>
          <div><br>
          </div>
          <div>My position is that the compositor will know the process
            has crashed anyway - because its socket has been closed - at
            which point we destroy all the client&#39;s resources including
            its windows and buffers regardless. Signaling the fence
            doesn&#39;t give us any value here, _unless_ the compositor is
            just blindly waiting for the fence to signal ... which it
            can&#39;t do because there&#39;s no guarantee the fence will ev=
er
            signal.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, but that assumes that the compositor has change to not blindly
    wait for the client to finish rendering and as Daniel explained that
    is rather unrealistic.<br>
    <br>
    What we need is a fallback mechanism which signals the fence after a
    timeout and gives a penalty to the one causing the timeout.<br>
    <br>
    That gives us the same functionality we have today with the in
    software scheduler inside the kernel.<br></div></blockquote><div><br></=
div><div>OK, if that&#39;s the case then I think I&#39;m really missing som=
ething which isn&#39;t explained in this thread, because I don&#39;t unders=
tand what the additional=C2=A0complexity and API change gains us (see my fi=
rst reply in this thread).</div><div><br></div><div>By way of example - say=
 I have a blind-but-explicit compositor that takes a drm_syncobj along with=
 a dmabuf with each client presentation request, but doesn&#39;t check sync=
obj completion, it just imports that into a VkSemaphore=C2=A0+ VkImage and =
schedules work for the next frame.</div><div><br></div><div>Currently, that=
 generates an execbuf=C2=A0ioctl for the composition (ignore KMS for now) w=
ith a sync point to wait on, and the kernel+GPU scheduling guarantees that =
the composition work will not begin until the client rendering work has ret=
ired. We have a further guarantee that this work will complete in reasonabl=
e time, for some value of &#39;reasonable&#39;.</div><div><br></div><div>My=
 understanding of this current proposal is that:</div><div>* userspace crea=
tes a &#39;present fence&#39; with this new ioctl</div><div>* the fence bec=
omes signaled when a value is written to a location in memory, which is vis=
ible through both CPU and GPU mappings of that page</div><div>* this &#39;p=
resent fence&#39; is imported as a VkSemaphore=C2=A0(?) and the userspace V=
ulkan driver will somehow wait on this value=C2=A0 either before submitting=
 work or as a possibly-hardware-assisted GPU-side wait (?)</div><div>* the =
kernel&#39;s scheduler is thus eliminated from the equation, and every exec=
buf=C2=A0is submitted directly to hardware, because either userspace knows =
that the fence has already been signaled, or it will issue a GPU-side wait =
(?)</div><div>* but the kernel is still required to monitor completion of e=
very fence itself, so it can forcibly complete, or penalise the client (?)<=
/div><div><br></div><div>Lastly, let&#39;s say we stop ignoring KMS: what h=
appens for the render-with-GPU-display-on-KMS case? Do we need to do the eq=
uivalent of glFinish() in userspace and only submit the KMS atomic request =
when the GPU work has fully retired?</div><div><br></div><div>Clarifying th=
ose points would be really helpful so this is less of a strawman. I have so=
me further opinions, but I&#39;m going to wait until I understand what I&#3=
9;m actually arguing against before I go too far. :) The last point is very=
 salient though.</div><div><br></div><div>Cheers,</div><div>Daniel=C2=A0</d=
iv></div></div>

--000000000000d68a7e05c06966af--

--===============1096632453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1096632453==--
