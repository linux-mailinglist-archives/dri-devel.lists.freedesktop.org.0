Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBFCC0909
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847F410E07D;
	Tue, 16 Dec 2025 02:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="k4KK9Mi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B6510E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:07:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47a95a96d42so10045e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 18:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765850831; cv=none;
 d=google.com; s=arc-20240605;
 b=c5m9YORXEfMEikCEHCLNxBuUgbrYEyGST2Qd2z8goqzymnrwxaYf8D0ijlDBe7hObN
 PVnCNkcBymhFnjaqpbiB05XrDVboS0THbIdks6s0xBcVT9wkA/By5EM/14Fiy00Wsl26
 V7L4uoWaEc9enxTyN2QWf9vOIiaA+BkCLbbHlULIyWLlZFbjKCyoAXqK0B46/Beu5SGr
 Nvyuo/D3EZHQMEIuv0JB6nO2yds9caDyBa2M5J6LcGzELPXxs6JnK+Q4Dq/CA/1sr5dO
 XhUPGJFs+2yMuc6ZFxnBLna2oVRedwEXiNcjvVJzpxGL5WrvV9K5otaQQc0xlFqyh7PW
 Yv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
 fh=J3jsdBGi/Sqyec9qpykfRUiR85mVtqTuMniMI6XQDig=;
 b=NMShMzhJ8Ux8agmZFFZbjbOHZ9JydQcpRPEAvy04HX2WAZsXQjDbxlF7yNSZsyzEbl
 XwFNQ4JuUAiLio2x/yT9zEscPXIsLpnJwuMl0hqfdlHoVfQyhaSwZ3uNkcsrfAsVmvQa
 ZrVe03E2xF17lXMMJ51q3bG56BDhrA88nTNab2pNbTCsNQROThmPBTcrm7MN8QHs1e51
 Lt2AQNB6GKDcdo/bADLyU/v8TM/+mbj87Uj0DEDXJxSUdolu5BLGhrlEfKmrePXBI/oA
 1gMWSQ/1+HnUzefy1nfMPEfQpolq8SuVX8JHUvIxUV7HPRlIgRH7et7oD37gzyTVYb5A
 Gt7A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765850831; x=1766455631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
 b=k4KK9Mi2s5UKWbCusr6m2f3PhbbCWsoHipXR/joiYH4CXeEMdLAlyz4whvWJH6BD8O
 POES2zES+qkIo6+tnnVCYlV2Dmf5yLnyZ6ZjF01ahtkYjGI+9L/IijpLFHExz5ljvLga
 t41ZSHVZAwbeSAIfkqGY487Ory6G+nSNeDh2H8+MOQ+UYjw8xcKXeD2iJRUbhzrmkVa4
 3aFeaDxyA+sVv7uB2S7LXYbNVDfQWUex9DTEXBZEXKN68uSzOupIsD9nbIcDQtnapTIm
 ipbqqXUqT+kajxW7h/yPwetldiXXtd3MfYpffujjf0Q0FVf8mKcuQKWVVS6GW32j05g7
 uueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765850831; x=1766455631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
 b=lp1oCj/n8029p4jCGvQ0Xt7hCeNX/iSisQNlWNSDJNTHn0qBMx4V4UMxjhgOwIK02O
 +DA96TTSqh6AHEqg+Pm55xKSRNXeDVPPnBy85rJFBpcqAU2YQ1rMQbalL8ymwWJEfZHV
 zJUIiPUhjpWffP7w2akasuiMk2UEtUEKcHsF7lTcEUIwSAtZp7t0DmCFZAcI3H5HUSgB
 ME/jFOELvj5Yhg0NKEAdPCa0wNIL0CMGeU+xy+k6EMqPCkWdDMtavE4SH7SlP267i/S5
 ZxK6BhI1IuDl6dPk4NpE1XT+wRJULn/fSSs8lALY41ZW+NbkEdv/vtum1H2bThMwIn6Q
 P0sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXInnOpIqe9RdlxBiUD3Zi/vC2c6gHFDm2GRII6IMu7u55dOSmW18m+pPnWTWTp2CHQe5lVCgmuYOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTkk/KL0yLbu6j+XvwVJkGLhRMO81qW8U48anueK2TxWHirBQ+
 J39YBZVJtZukx2G5fAt4s8c7D846uR2wk7mZq7r3fHLoiZNGSI4zNipM4IMscJ3F5q+MDD6q/4A
 RavvZriKU6CFkLe4oB9bZFgGbqHlSUEKPKSSwOORu
X-Gm-Gg: AY/fxX6M4TvByeGTeBNO+klhYCBmymoxT8lwy32zBbMqNUq+58s3PtMEDGNo6FVHEDP
 aLGi93pmRGrWEJ7RcOPT13RUey7e1S5VGFoN7xpwt5s4zVzYD7zuASQ76I87oIEvsmUeyx37uTx
 i1sEQv9OmsYmO8DTK+Ha+doZhuxF9FLTzEdMkeSZCdF7WpfAbDcUZa+qGn8SSVr3rAky+QDxWZI
 +sMbHEik1Nxe8Aailf3kAQP2Wwn9UtJxoEeagfxfucLZNPuWJIocfMO2QTSM6NtKLsx2/3WoeUx
 qqkbkOwdbq0urznnkXqO/0QGrxR7Ik/IJHu4ZaE=
X-Google-Smtp-Source: AGHT+IEUmHtyIm4mkuG1Lw9nrtCCNOT3mva1Q+G2lidhB9qtF9TON4fldFLcKbTg56beBWDZhQDUCL/VH1kJamQBSf8=
X-Received: by 2002:a05:600c:8a0d:10b0:477:779a:67fc with SMTP id
 5b1f17b1804b1-47bd797450emr116395e9.5.1765850831139; Mon, 15 Dec 2025
 18:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
In-Reply-To: <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 16 Dec 2025 11:06:59 +0900
X-Gm-Features: AQt7F2qPBf3y-Wy7fvkcCllXNhzIQ5MM-o21_RdxOwKfkIHj_isVetCaxCEFurk
Message-ID: <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
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

On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi TJ,

Hi Maxime,

> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> > >
> > > The system dma-buf heap lets userspace allocate buffers from the page
> > > allocator. However, these allocations are not accounted for in memcg,
> > > allowing processes to escape limits that may be configured.
> > >
> > > Pass the __GFP_ACCOUNT for our allocations to account them into memcg=
.
> >
> > We had a discussion just last night in the MM track at LPC about how
> > shared memory accounted in memcg is pretty broken. Without a way to
> > identify (and possibly transfer) ownership of a shared buffer, this
> > makes the accounting of shared memory, and zombie memcg problems
> > worse. :\
>
> Are there notes or a report from that discussion anywhere?

The LPC vids haven't been clipped yet, and actually I can't even find
the recorded full live stream from Hall A2 on the first day. So I
don't think there's anything to look at, but I bet there's probably
nothing there you don't already know.

> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> the moment and that's definitely broken. Any application can bypass its
> cgroups limits trivially, and that's a pretty big hole in the system.

Agree, but if we only charge the first allocator then limits can still
easily be bypassed assuming an app can cause an allocation outside of
its cgroup tree.

I'm not sure using static memcg limits where a significant portion of
the memory can be shared is really feasible. Even with just pagecache
being charged to memcgs, we're having trouble defining a static memcg
limit that is really useful since it has to be high enough to
accomodate occasional spikes due to shared memory that might or might
not be charged (since it can only be charged to one memcg - it may be
spread around or it may all get charged to one memcg). So excessive
anonymous use has to get really bad before it gets punished.

What I've been hearing lately is that folks are polling memory.stat or
PSI or other metrics and using that to take actions (memory.reclaim /
killing / adjust memory.high) at runtime rather than relying on
memory.high/max behavior with a static limit.

> The shared ownership is indeed broken, but it's not more or less broken
> than, say, memfd + udmabuf, and I'm sure plenty of others.

One thing that's worse about system heap buffers is that unlike memfd
the memory isn't reclaimable. So without killing all users there's
currently no way to deal with the zombie issue. Harry's proposing
reparenting, but I don't think our current interfaces support that
because we'd have to mess with the page structs behind system heap
dmabufs to change the memcg during reparenting.

Ah... but udmabuf pins the memfd pages, so you're right that memfd +
udmabuf isn't worse.

> So we really improve the common case, but only make the "advanced"
> slightly more broken than it already is.
>
> Would you disagree?

I think memcg limits in this case just wouldn't be usable because of
what I mentioned above. In our common case the allocator is in a
different cgroup tree than the real users of the buffer.

> Maxime
