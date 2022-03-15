Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A84DA2DD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 20:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAA910E141;
	Tue, 15 Mar 2022 19:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1310E141
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 19:02:50 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dr20so42274236ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYOjHF+WhaOll744zl3KXczQ6UnybRfVr7cW3I5uN/U=;
 b=eWq9aQSnpFSM7gGPtqgzIwr8bb/qKsDMvo0mIbS4s59AMIIHEMyCDMwhpLWRS+EYBR
 qN4oTEZNXWPjiFCM5wbN4L3FVB0yMfHlzKy9DLlhHVCdkUAg+H8m96o6+l6phOAtZZtL
 HqEaabMV1A231GA5THyiGjQn+CcdPV6Wcj7+UPW4PCAGWku/81HP+8C5q//5lWvhO0Pu
 3zeib+NRZoI9eWeTsoj34Li0T9JVhg3Z1kUYOR1XGxD8A2nRmcx8ve9PFlZCqJIC6N4E
 zEz1m0vSJoc3+NJsHrbvJr8ATMwQ+P3zv+QChYRQcRSYL4oNsBWZ06rrB2G0G0fVIJ1p
 NQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYOjHF+WhaOll744zl3KXczQ6UnybRfVr7cW3I5uN/U=;
 b=EeHBKgVBPwXyGkXvnCH+LpNz1I82A5PWHBFD9FZ4WXZzGAefm8Vjn4fkY/J+9IcS63
 SX0ENmiigJGmP+Y03TB/GQ1+31TieTyHHxwhQltdGtyfIwO2im3qM7hoaJfQ9JaT+yzC
 9RSIG+fMrptC9Kw/UeWln4vGrQKhIdIFq8233e/KkPANHXsme/b+MbWCUcasHz3iWsXI
 VU5EW73t3ugr7s0JXa2QlZJzsiZoEq4njFtpTMVbvvQ6GECRQvj04ltmlHCpvSnehVr1
 HemCRv3ZDR6SZO7RWHEWSC+axBzlsukxql/kFDP8iLwHWWb6L98NMRlrvXXcipJVWhoO
 0q/A==
X-Gm-Message-State: AOAM532dpBWmTpISNBejxIvC81b9/K4jAjA0Xcq1qwNwXUCtegv5tEzB
 CydLA7cjqTDSUVZwpm0pmSGtzJNChYaPy3kTHLRR5Q==
X-Google-Smtp-Source: ABdhPJxRVh2ZUD0Nbieh2mZpcZVRDFfmA10fIZydckRgsnzTb2ustxoM9NqZuPCgmtI1mueDRq1Ne12Wp4MutQ+KdLw=
X-Received: by 2002:a17:907:7f2a:b0:6d6:df12:7f57 with SMTP id
 qf42-20020a1709077f2a00b006d6df127f57mr23761361ejc.122.1647370967391; Tue, 15
 Mar 2022 12:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-8-tjmercier@google.com>
 <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
 <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
 <a365a5f6c7864a879b133b99d1f43fb2@AcuMS.aculab.com>
In-Reply-To: <a365a5f6c7864a879b133b99d1f43fb2@AcuMS.aculab.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Mar 2022 12:02:35 -0700
Message-ID: <CABdmKX3NEm8+pDBj2VG-r8E91CVHwQ+gGcKhG8D=5MgWcgincg@mail.gmail.com>
Subject: Re: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Kenny.Ho@amd.com" <Kenny.Ho@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>, Todd Kjos <tkjos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 12:56 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: T.J. Mercier
> > Sent: 14 March 2022 23:45
> >
> > On Thu, Mar 10, 2022 at 11:33 AM Todd Kjos <tkjos@google.com> wrote:
> > >
> > > On Wed, Mar 9, 2022 at 8:52 AM T.J. Mercier <tjmercier@google.com> wrote:
> > > >
> > > > The kernel interface should use types that the kernel defines instead of
> > > > pid_t and uid_t, whose definiton is owned by libc. This fixes the header
> > > > so that it can be included without first including sys/types.h.
> > > >
> > > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > ---
> > > >  include/uapi/linux/android/binder.h | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> > > > index 169fd5069a1a..aa28454dbca3 100644
> > > > --- a/include/uapi/linux/android/binder.h
> > > > +++ b/include/uapi/linux/android/binder.h
> > > > @@ -289,8 +289,8 @@ struct binder_transaction_data {
> > > >
> > > >         /* General information about the transaction. */
> > > >         __u32           flags;
> > > > -       pid_t           sender_pid;
> > > > -       uid_t           sender_euid;
> > > > +       __kernel_pid_t  sender_pid;
> > > > +       __kernel_uid_t  sender_euid;
> > >
> > > Are we guaranteed that this does not affect the UAPI at all? Userspace
> > > code using this definition will have to run with kernels using the old
> > > definition and visa-versa.
> >
> > A standards compliant userspace should be expecting a signed integer
> > type here. So the only way I can think userspace would be affected is
> > if:
> > 1) pid_t is a long AND
> > 2) sizeof(long) > sizeof(int) AND
> > 3) Consumers of the pid_t definition actually attempt to mutate the
> > result to make use of extra bits in the variable (which are not there)
>
> Or the userspace headers have a 16bit pid_t.

Since the kernel uses an int for PIDs, wouldn't a 16 bit pid_t already
be potentially broken (overflow) on systems where int is not 16 bits?
On systems where int is 16 bits, there is no change here except to
achieve uniform use of __kernel_pid_t in the kernel headers and fix
the include problem.

>
> I can't help feeling that uapi headers should only use explicit
> fixed sized types.
> There is no point indirecting the type names - the sizes still
> can't be changes.

I think it's still unlikely to be an actual problem. For example there
are other occasions where a switch like this was made:
https://github.com/torvalds/linux/commit/694a58e29ef27c4c26f103a9decfd053f94dd34c
https://github.com/torvalds/linux/commit/269b8fd5d058f2c0da01a42b20315ffc2640d99b

And also since Binder's only known user is Android through Bionic
which already expects the type of pid_t to be __kernel_pid_t.


>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
