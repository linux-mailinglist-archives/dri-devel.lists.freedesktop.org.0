Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C639310BD1
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 19:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBA089218;
	Wed,  1 May 2019 17:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1EEF89218
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 17:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 77CF310A3435;
 Wed,  1 May 2019 10:12:45 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id P3z2s9vEiK-7; Wed,  1 May 2019 10:12:43 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id BB6A610A33F0;
 Wed,  1 May 2019 10:12:43 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 340182FE3AA9; Wed,  1 May 2019 10:12:43 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 0/3] drm/panfrost: Expose HW counters to userspace
In-Reply-To: <20190430144238.49963521@collabora.com>
References: <20190404152051.17996-1-boris.brezillon@collabora.com>
 <ba54e655-6316-8d36-dfd1-c5df418cee3a@arm.com>
 <20190430144238.49963521@collabora.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Wed, 01 May 2019 10:12:42 -0700
Message-ID: <87zho614l1.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Mark Janes <mark.a.janes@intel.com>,
 kernel@collabora.com, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: multipart/mixed; boundary="===============0763399869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0763399869==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@collabora.com> writes:

> +Rob, Eric, Mark and more
>
> Hi,
>
> On Fri, 5 Apr 2019 16:20:45 +0100
> Steven Price <steven.price@arm.com> wrote:
>
>> On 04/04/2019 16:20, Boris Brezillon wrote:
>> > Hello,
>> >=20
>> > This patch adds new ioctls to expose GPU counters to userspace.
>> > These will be used by the mesa driver (should be posted soon).
>> >=20
>> > A few words about the implementation: I followed the VC4/Etnaviv model
>> > where perf counters are retrieved on a per-job basis. This allows one
>> > to have get accurate results when there are users using the GPU
>> > concurrently.
>> > AFAICT, the mali kbase is using a different approach where several
>> > users can register a performance monitor but with no way to have fined
>> > grained control over what job/GPU-context to track.=20=20
>>=20
>> mali_kbase submits overlapping jobs. The jobs on slot 0 and slot 1 can
>> be from different contexts (address spaces), and mali_kbase also fully
>> uses the _NEXT registers. So there can be a job from one context
>> executing on slot 0 and a job from a different context waiting in the
>> _NEXT registers. (And the same for slot 1). This means that there's no
>> (visible) gap between the first job finishing and the second job
>> starting. Early versions of the driver even had a throttle to avoid
>> interrupt storms (see JOB_IRQ_THROTTLE) which would further delay the
>> IRQ - but thankfully that's gone.
>>=20
>> The upshot is that it's basically impossible to measure "per-job"
>> counters when running at full speed. Because multiple jobs are running
>> and the driver doesn't actually know when one ends and the next starts.
>>=20
>> Since one of the primary use cases is to draw pretty graphs of the
>> system load [1], this "per-job" information isn't all that relevant (and
>> minimal performance overhead is important). And if you want to monitor
>> just one application it is usually easiest to ensure that it is the only
>> thing running.
>>=20
>> [1]
>> https://developer.arm.com/tools-and-software/embedded/arm-development-st=
udio/components/streamline-performance-analyzer
>>=20
>> > This design choice comes at a cost: every time the perfmon context
>> > changes (the perfmon context is the list of currently active
>> > perfmons), the driver has to add a fence to prevent new jobs from
>> > corrupting counters that will be dumped by previous jobs.
>> >=20
>> > Let me know if that's an issue and if you think we should approach
>> > things differently.=20=20
>>=20
>> It depends what you expect to do with the counters. Per-job counters are
>> certainly useful sometimes. But serialising all jobs can mess up the
>> thing you are trying to measure the performance of.
>
> I finally found some time to work on v2 this morning, and it turns out
> implementing global perf monitors as done in mali_kbase means rewriting
> almost everything (apart from the perfcnt layout stuff). I'm not against
> doing that, but I'd like to be sure this is really what we want.
>
> Eric, Rob, any opinion on that? Is it acceptable to expose counters
> through the pipe_query/AMD_perfmon interface if we don't have this
> job (or at least draw call) granularity? If not, should we keep the
> solution I'm proposing here to make sure counters values are accurate,
> or should we expose perf counters through a non-standard API?

You should definitely not count perf results from someone else's context
against your own!  People doing perf analysis will expect slight
performance changes (like missing bin/render parallelism between
contexts) when doing perf queries, but they will be absolutely lost if
their non-texturing job starts showing texturing results from some
unrelated context.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzJ04oACgkQtdYpNtH8
nug7sw//eUxxl1M8C+lChy/8kd4KMyJ9xQtXM6Xj+qnuTJS289R1DLWfixR/h4gP
VCuctXPj4YTxi9BsK/5t2oraqtI1zoQwejA8zDEg3VXt8yoxF7H0bO2LxB3lQj/o
QfJdGAeuMDPBsMsJIQuEKvObNoyIQsTx6lch30JUZF3xM/gGUjCld9TQ8HH6tOGn
f2MxpTaeqNwUZzSo11pRi1s+aX27i71021ywVhU2BUzDv122At1RShN3+MBgmWW2
20nd0PICOH0O0DgG1mxx8tEVURtErz+vDpxYe/ADYwgu/SSNTIalHIOHl4jngICf
yuGc3mkXngLuwyup5FIL1M0PFvGeZnBw1FG4oJa1us2PEcQ6B6Xkb+zUCaUsOGXI
+LEMZcxYMlZosEGZxj9NUcemcvoYqeGLQDrW/78DiAp0+ehZLeW/dH4zTWNkXAuA
oPVfLOo8z9mXny1Xve9w65hEpN+X2h4GLqJsL2ULSOwxvf25Ls1MCtxKszbWhwzD
i0CJZqc4wHPRuZuAc1zhrNOZoxOW7rzCt44UUNbfVW/OxQ5zLkTiCdUH8yFB0aJk
mYte3Fvb177ONEjbP8WFFIxyv5h4nN4POnQcUHKblUHZcELPNn+XDiRBXTZMMmaD
BG6p/RQrRyoMH8QVMvIJGzYMXBABRylOBIKlPJ0olTt/F8VhVOI=
=2fZr
-----END PGP SIGNATURE-----
--=-=-=--

--===============0763399869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0763399869==--
