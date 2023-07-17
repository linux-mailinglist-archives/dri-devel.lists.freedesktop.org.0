Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACE756248
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 14:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211D10E13C;
	Mon, 17 Jul 2023 12:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F42410E236;
 Mon, 17 Jul 2023 12:03:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7516D61043;
 Mon, 17 Jul 2023 12:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9BAC433C8;
 Mon, 17 Jul 2023 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689595398;
 bh=87YEnb4RVTsop9Dg82Qsre2m50EF2pmn8OKNSu9bV8A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Et/y5cPhEQ8OZIVjXlFfEV1a6lXR9JIxAJvE4Jmr5wOMW4ckfdFGiwhqovKVXqUnw
 E2ybJWFS/jGEAo1jCp70mhN8mkrJ3gn3BdSehVomYsryrRXzkDpS030fk9rfm5XdE8
 vX5SjkjjOHRrhkLxMjPyud4jqbToOBGXApqrUP2WGMNnqpt4m91UvQyhPrp0VvBKV0
 l4A8Vv33JgAC2C5+IVbf0qqiYFrXygmOuleC89iK764rOO1Jh9a1Z9tDymdM4Pq7xo
 KgSaRjcGpfUwZVjOcUkicNW19bRfsNbUyqJ6s+tO5gccrdYQs6oVT1o5UfvvU2XMPj
 h8qH6ovJfyEvg==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-cb7b6ecb3cdso4082982276.1; 
 Mon, 17 Jul 2023 05:03:18 -0700 (PDT)
X-Gm-Message-State: ABy/qLZAHn+Fbx+a7ZtmjLCirM/DXAB9wjVM6chejbsZCq2wSqyvgl8/
 WlgtOkfKK6b0+o6Op3uXp5gfmqYZU4zhPiAbEgI=
X-Google-Smtp-Source: APBJJlG2Vce8ww9gklso+RJZTYk+0V/tsdcdjepKlXa3TXLhLbmc7zxLtRIsSG+cQGViAirz2RJDhlP4o5ZsLvDqGT0=
X-Received: by 2002:a25:1e45:0:b0:c8e:3061:d66b with SMTP id
 e66-20020a251e45000000b00c8e3061d66bmr9514590ybe.7.1689595397065; Mon, 17 Jul
 2023 05:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <CA+hFU4x3tKz9L8W3N8iOsbHJHqWJJ+Fr-C8NMbAfsmWg2xQnUA@mail.gmail.com>
In-Reply-To: <CA+hFU4x3tKz9L8W3N8iOsbHJHqWJJ+Fr-C8NMbAfsmWg2xQnUA@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 17 Jul 2023 15:02:50 +0300
X-Gmail-Original-Message-ID: <CAFCwf11ULnyuGi4bEYiA=RiWfx7WkyftBc0FubWD-zoVHKX9HQ@mail.gmail.com>
Message-ID: <CAFCwf11ULnyuGi4bEYiA=RiWfx7WkyftBc0FubWD-zoVHKX9HQ@mail.gmail.com>
Subject: Re: [RFC 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 8:24=E2=80=AFPM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Fri, May 26, 2023 at 6:21=E2=80=AFPM Aravind Iddamsetty
> <aravind.iddamsetty@intel.com> wrote:
> >
> > Our hardware supports RAS(Reliability, Availability, Serviceability) by
> > exposing a set of error counters which can be used by observability
> > tools to take corrective actions or repairs. Traditionally there were
> > being exposed via PMU (for relative counters) and sysfs interface (for
> > absolute value) in our internal branch. But, due to the limitations in
> > this approach to use two interfaces and also not able to have an event
> > based reporting or configurability, an alternative approach to try
> > netlink was suggested by community for drm subsystem wide UAPI for RAS
> > and telemetry as discussed in [1].
> >
> > This [1] is the inspiration to this series. It uses the generic
> > netlink(genl) family subsystem and exposes a set of commands that can
> > be used by every drm driver, the framework provides a means to have
> > custom commands too. Each drm driver instance in this example xe driver
> > instance registers a family and operations to the genl subsystem throug=
h
> > which it enumerates and reports the error counters. An event based
> > notification is also supported to which userpace can subscribe to and
> > be notified when any error occurs and read the error counter this avoid=
s
> > continuous polling on error counter. This can also be extended to
> > threshold based notification.
>
> Be aware that netlink can be quite awkward in user space because it's
> attached to the netns while the device is in the mount ns and there
> are special rules for netlink regarding namespacing.
I agree, we need to be sure this works in all common deployments,
mainly dockers and kubernetes, before deciding to go down this path.
Oded

>
> > [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-sum=
mary.html
> >
> > this series is on top of https://patchwork.freedesktop.org/series/11618=
1/
> >
> > Below is an example tool drm_ras which demonstrates the use of the
> > supported commands. The tool will be sent to ML with the subject
> > "[RFC i-g-t 0/1] A tool to demonstrate use of netlink sockets to read R=
AS error counters"
> >
> > read single error counter:
> >
> > $ ./drm_ras READ_ONE --device=3Ddrm:/dev/dri/card1 --error_id=3D0x00000=
00000000005
> > counter value 0
> >
> > read all error counters:
> >
> > $ ./drm_ras READ_ALL --device=3Ddrm:/dev/dri/card1
> > name                                                    config-id      =
         counter
> >
> > error-gt0-correctable-guc                               0x0000000000000=
001      0
> > error-gt0-correctable-slm                               0x0000000000000=
003      0
> > error-gt0-correctable-eu-ic                             0x0000000000000=
004      0
> > error-gt0-correctable-eu-grf                            0x0000000000000=
005      0
> > error-gt0-fatal-guc                                     0x0000000000000=
009      0
> > error-gt0-fatal-slm                                     0x0000000000000=
00d      0
> > error-gt0-fatal-eu-grf                                  0x0000000000000=
00f      0
> > error-gt0-fatal-fpu                                     0x0000000000000=
010      0
> > error-gt0-fatal-tlb                                     0x0000000000000=
011      0
> > error-gt0-fatal-l3-fabric                               0x0000000000000=
012      0
> > error-gt0-correctable-subslice                          0x0000000000000=
013      0
> > error-gt0-correctable-l3bank                            0x0000000000000=
014      0
> > error-gt0-fatal-subslice                                0x0000000000000=
015      0
> > error-gt0-fatal-l3bank                                  0x0000000000000=
016      0
> > error-gt0-sgunit-correctable                            0x0000000000000=
017      0
> > error-gt0-sgunit-nonfatal                               0x0000000000000=
018      0
> > error-gt0-sgunit-fatal                                  0x0000000000000=
019      0
> > error-gt0-soc-fatal-psf-csc-0                           0x0000000000000=
01a      0
> > error-gt0-soc-fatal-psf-csc-1                           0x0000000000000=
01b      0
> > error-gt0-soc-fatal-psf-csc-2                           0x0000000000000=
01c      0
> > error-gt0-soc-fatal-punit                               0x0000000000000=
01d      0
> > error-gt0-soc-fatal-psf-0                               0x0000000000000=
01e      0
> > error-gt0-soc-fatal-psf-1                               0x0000000000000=
01f      0
> > error-gt0-soc-fatal-psf-2                               0x0000000000000=
020      0
> > error-gt0-soc-fatal-cd0                                 0x0000000000000=
021      0
> > error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000=
022      0
> > error-gt0-soc-fatal-mdfi-east                           0x0000000000000=
023      0
> > error-gt0-soc-fatal-mdfi-south                          0x0000000000000=
024      0
> > error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000=
025      0
> > error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000=
026      0
> > error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000=
027      0
> > error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000=
028      0
> > error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000=
029      0
> > error-gt0-soc-fatal-hbm-ss0-5                           0x0000000000000=
02a      0
> > error-gt0-soc-fatal-hbm-ss0-6                           0x0000000000000=
02b      0
> > error-gt0-soc-fatal-hbm-ss0-7                           0x0000000000000=
02c      0
> > error-gt0-soc-fatal-hbm-ss1-0                           0x0000000000000=
02d      0
> > error-gt0-soc-fatal-hbm-ss1-1                           0x0000000000000=
02e      0
> > error-gt0-soc-fatal-hbm-ss1-2                           0x0000000000000=
02f      0
> > error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000=
030      0
> > error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000=
031      0
> > error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000=
032      0
> > error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000=
033      0
> > error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000=
034      0
> > error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000=
035      0
> > error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000=
036      0
> > error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000=
037      0
> > error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000=
038      0
> > error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000=
039      0
> > error-gt0-soc-fatal-hbm-ss2-5                           0x0000000000000=
03a      0
> > error-gt0-soc-fatal-hbm-ss2-6                           0x0000000000000=
03b      0
> > error-gt0-soc-fatal-hbm-ss2-7                           0x0000000000000=
03c      0
> > error-gt0-soc-fatal-hbm-ss3-0                           0x0000000000000=
03d      0
> > error-gt0-soc-fatal-hbm-ss3-1                           0x0000000000000=
03e      0
> > error-gt0-soc-fatal-hbm-ss3-2                           0x0000000000000=
03f      0
> > error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000=
040      0
> > error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000=
041      0
> > error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000=
042      0
> > error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000=
043      0
> > error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000=
044      0
> > error-gt0-gsc-correctable-sram-ecc                      0x0000000000000=
045      0
> > error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000=
046      0
> > error-gt0-gsc-nonfatal-mia-int                          0x0000000000000=
047      0
> > error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000=
048      0
> > error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000=
049      0
> > error-gt0-gsc-nonfatal-rom-parity                       0x0000000000000=
04a      0
> > error-gt0-gsc-nonfatal-ucode-parity                     0x0000000000000=
04b      0
> > error-gt0-gsc-nonfatal-glitch-det                       0x0000000000000=
04c      0
> > error-gt0-gsc-nonfatal-fuse-pull                        0x0000000000000=
04d      0
> > error-gt0-gsc-nonfatal-fuse-crc-check                   0x0000000000000=
04e      0
> > error-gt0-gsc-nonfatal-selfmbist                        0x0000000000000=
04f      0
> > error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000=
050      0
> > error-gt1-correctable-guc                               0x1000000000000=
001      0
> > error-gt1-correctable-slm                               0x1000000000000=
003      0
> > error-gt1-correctable-eu-ic                             0x1000000000000=
004      0
> > error-gt1-correctable-eu-grf                            0x1000000000000=
005      0
> > error-gt1-fatal-guc                                     0x1000000000000=
009      0
> > error-gt1-fatal-slm                                     0x1000000000000=
00d      0
> > error-gt1-fatal-eu-grf                                  0x1000000000000=
00f      0
> > error-gt1-fatal-fpu                                     0x1000000000000=
010      0
> > error-gt1-fatal-tlb                                     0x1000000000000=
011      0
> > error-gt1-fatal-l3-fabric                               0x1000000000000=
012      0
> > error-gt1-correctable-subslice                          0x1000000000000=
013      0
> > error-gt1-correctable-l3bank                            0x1000000000000=
014      0
> > error-gt1-fatal-subslice                                0x1000000000000=
015      0
> > error-gt1-fatal-l3bank                                  0x1000000000000=
016      0
> > error-gt1-sgunit-correctable                            0x1000000000000=
017      0
> > error-gt1-sgunit-nonfatal                               0x1000000000000=
018      0
> > error-gt1-sgunit-fatal                                  0x1000000000000=
019      0
> > error-gt1-soc-fatal-psf-csc-0                           0x1000000000000=
01a      0
> > error-gt1-soc-fatal-psf-csc-1                           0x1000000000000=
01b      0
> > error-gt1-soc-fatal-psf-csc-2                           0x1000000000000=
01c      0
> > error-gt1-soc-fatal-punit                               0x1000000000000=
01d      0
> > error-gt1-soc-fatal-psf-0                               0x1000000000000=
01e      0
> > error-gt1-soc-fatal-psf-1                               0x1000000000000=
01f      0
> > error-gt1-soc-fatal-psf-2                               0x1000000000000=
020      0
> > error-gt1-soc-fatal-cd0                                 0x1000000000000=
021      0
> > error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000=
022      0
> > error-gt1-soc-fatal-mdfi-east                           0x1000000000000=
023      0
> > error-gt1-soc-fatal-mdfi-south                          0x1000000000000=
024      0
> > error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000=
025      0
> > error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000=
026      0
> > error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000=
027      0
> > error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000=
028      0
> > error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000=
029      0
> > error-gt1-soc-fatal-hbm-ss0-5                           0x1000000000000=
02a      0
> > error-gt1-soc-fatal-hbm-ss0-6                           0x1000000000000=
02b      0
> > error-gt1-soc-fatal-hbm-ss0-7                           0x1000000000000=
02c      0
> > error-gt1-soc-fatal-hbm-ss1-0                           0x1000000000000=
02d      0
> > error-gt1-soc-fatal-hbm-ss1-1                           0x1000000000000=
02e      0
> > error-gt1-soc-fatal-hbm-ss1-2                           0x1000000000000=
02f      0
> > error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000=
030      0
> > error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000=
031      0
> > error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000=
032      0
> > error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000=
033      0
> > error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000=
034      0
> > error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000=
035      0
> > error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000=
036      0
> > error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000=
037      0
> > error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000=
038      0
> > error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000=
039      0
> > error-gt1-soc-fatal-hbm-ss2-5                           0x1000000000000=
03a      0
> > error-gt1-soc-fatal-hbm-ss2-6                           0x1000000000000=
03b      0
> > error-gt1-soc-fatal-hbm-ss2-7                           0x1000000000000=
03c      0
> > error-gt1-soc-fatal-hbm-ss3-0                           0x1000000000000=
03d      0
> > error-gt1-soc-fatal-hbm-ss3-1                           0x1000000000000=
03e      0
> > error-gt1-soc-fatal-hbm-ss3-2                           0x1000000000000=
03f      0
> > error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000=
040      0
> > error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000=
041      0
> > error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000=
042      0
> > error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000=
043      0
> > error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000=
044      0
> >
> > wait on a error event:
> >
> > $ ./drm_ras WAIT_ON_EVENT --device=3Ddrm:/dev/dri/card1
> > waiting for error event
> > error event received
> > counter value 0
> >
> > list all errors:
> >
> > $ ./drm_ras LIST_ERRORS --device=3Ddrm:/dev/dri/card1
> > name                                                    config-id
> >
> > error-gt0-correctable-guc                               0x0000000000000=
001
> > error-gt0-correctable-slm                               0x0000000000000=
003
> > error-gt0-correctable-eu-ic                             0x0000000000000=
004
> > error-gt0-correctable-eu-grf                            0x0000000000000=
005
> > error-gt0-fatal-guc                                     0x0000000000000=
009
> > error-gt0-fatal-slm                                     0x0000000000000=
00d
> > error-gt0-fatal-eu-grf                                  0x0000000000000=
00f
> > error-gt0-fatal-fpu                                     0x0000000000000=
010
> > error-gt0-fatal-tlb                                     0x0000000000000=
011
> > error-gt0-fatal-l3-fabric                               0x0000000000000=
012
> > error-gt0-correctable-subslice                          0x0000000000000=
013
> > error-gt0-correctable-l3bank                            0x0000000000000=
014
> > error-gt0-fatal-subslice                                0x0000000000000=
015
> > error-gt0-fatal-l3bank                                  0x0000000000000=
016
> > error-gt0-sgunit-correctable                            0x0000000000000=
017
> > error-gt0-sgunit-nonfatal                               0x0000000000000=
018
> > error-gt0-sgunit-fatal                                  0x0000000000000=
019
> > error-gt0-soc-fatal-psf-csc-0                           0x0000000000000=
01a
> > error-gt0-soc-fatal-psf-csc-1                           0x0000000000000=
01b
> > error-gt0-soc-fatal-psf-csc-2                           0x0000000000000=
01c
> > error-gt0-soc-fatal-punit                               0x0000000000000=
01d
> > error-gt0-soc-fatal-psf-0                               0x0000000000000=
01e
> > error-gt0-soc-fatal-psf-1                               0x0000000000000=
01f
> > error-gt0-soc-fatal-psf-2                               0x0000000000000=
020
> > error-gt0-soc-fatal-cd0                                 0x0000000000000=
021
> > error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000=
022
> > error-gt0-soc-fatal-mdfi-east                           0x0000000000000=
023
> > error-gt0-soc-fatal-mdfi-south                          0x0000000000000=
024
> > error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000=
025
> > error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000=
026
> > error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000=
027
> > error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000=
028
> > error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000=
029
> > error-gt0-soc-fatal-hbm-ss0-5                           0x0000000000000=
02a
> > error-gt0-soc-fatal-hbm-ss0-6                           0x0000000000000=
02b
> > error-gt0-soc-fatal-hbm-ss0-7                           0x0000000000000=
02c
> > error-gt0-soc-fatal-hbm-ss1-0                           0x0000000000000=
02d
> > error-gt0-soc-fatal-hbm-ss1-1                           0x0000000000000=
02e
> > error-gt0-soc-fatal-hbm-ss1-2                           0x0000000000000=
02f
> > error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000=
030
> > error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000=
031
> > error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000=
032
> > error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000=
033
> > error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000=
034
> > error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000=
035
> > error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000=
036
> > error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000=
037
> > error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000=
038
> > error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000=
039
> > error-gt0-soc-fatal-hbm-ss2-5                           0x0000000000000=
03a
> > error-gt0-soc-fatal-hbm-ss2-6                           0x0000000000000=
03b
> > error-gt0-soc-fatal-hbm-ss2-7                           0x0000000000000=
03c
> > error-gt0-soc-fatal-hbm-ss3-0                           0x0000000000000=
03d
> > error-gt0-soc-fatal-hbm-ss3-1                           0x0000000000000=
03e
> > error-gt0-soc-fatal-hbm-ss3-2                           0x0000000000000=
03f
> > error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000=
040
> > error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000=
041
> > error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000=
042
> > error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000=
043
> > error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000=
044
> > error-gt0-gsc-correctable-sram-ecc                      0x0000000000000=
045
> > error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000=
046
> > error-gt0-gsc-nonfatal-mia-int                          0x0000000000000=
047
> > error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000=
048
> > error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000=
049
> > error-gt0-gsc-nonfatal-rom-parity                       0x0000000000000=
04a
> > error-gt0-gsc-nonfatal-ucode-parity                     0x0000000000000=
04b
> > error-gt0-gsc-nonfatal-glitch-det                       0x0000000000000=
04c
> > error-gt0-gsc-nonfatal-fuse-pull                        0x0000000000000=
04d
> > error-gt0-gsc-nonfatal-fuse-crc-check                   0x0000000000000=
04e
> > error-gt0-gsc-nonfatal-selfmbist                        0x0000000000000=
04f
> > error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000=
050
> > error-gt1-correctable-guc                               0x1000000000000=
001
> > error-gt1-correctable-slm                               0x1000000000000=
003
> > error-gt1-correctable-eu-ic                             0x1000000000000=
004
> > error-gt1-correctable-eu-grf                            0x1000000000000=
005
> > error-gt1-fatal-guc                                     0x1000000000000=
009
> > error-gt1-fatal-slm                                     0x1000000000000=
00d
> > error-gt1-fatal-eu-grf                                  0x1000000000000=
00f
> > error-gt1-fatal-fpu                                     0x1000000000000=
010
> > error-gt1-fatal-tlb                                     0x1000000000000=
011
> > error-gt1-fatal-l3-fabric                               0x1000000000000=
012
> > error-gt1-correctable-subslice                          0x1000000000000=
013
> > error-gt1-correctable-l3bank                            0x1000000000000=
014
> > error-gt1-fatal-subslice                                0x1000000000000=
015
> > error-gt1-fatal-l3bank                                  0x1000000000000=
016
> > error-gt1-sgunit-correctable                            0x1000000000000=
017
> > error-gt1-sgunit-nonfatal                               0x1000000000000=
018
> > error-gt1-sgunit-fatal                                  0x1000000000000=
019
> > error-gt1-soc-fatal-psf-csc-0                           0x1000000000000=
01a
> > error-gt1-soc-fatal-psf-csc-1                           0x1000000000000=
01b
> > error-gt1-soc-fatal-psf-csc-2                           0x1000000000000=
01c
> > error-gt1-soc-fatal-punit                               0x1000000000000=
01d
> > error-gt1-soc-fatal-psf-0                               0x1000000000000=
01e
> > error-gt1-soc-fatal-psf-1                               0x1000000000000=
01f
> > error-gt1-soc-fatal-psf-2                               0x1000000000000=
020
> > error-gt1-soc-fatal-cd0                                 0x1000000000000=
021
> > error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000=
022
> > error-gt1-soc-fatal-mdfi-east                           0x1000000000000=
023
> > error-gt1-soc-fatal-mdfi-south                          0x1000000000000=
024
> > error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000=
025
> > error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000=
026
> > error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000=
027
> > error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000=
028
> > error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000=
029
> > error-gt1-soc-fatal-hbm-ss0-5                           0x1000000000000=
02a
> > error-gt1-soc-fatal-hbm-ss0-6                           0x1000000000000=
02b
> > error-gt1-soc-fatal-hbm-ss0-7                           0x1000000000000=
02c
> > error-gt1-soc-fatal-hbm-ss1-0                           0x1000000000000=
02d
> > error-gt1-soc-fatal-hbm-ss1-1                           0x1000000000000=
02e
> > error-gt1-soc-fatal-hbm-ss1-2                           0x1000000000000=
02f
> > error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000=
030
> > error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000=
031
> > error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000=
032
> > error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000=
033
> > error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000=
034
> > error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000=
035
> > error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000=
036
> > error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000=
037
> > error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000=
038
> > error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000=
039
> > error-gt1-soc-fatal-hbm-ss2-5                           0x1000000000000=
03a
> > error-gt1-soc-fatal-hbm-ss2-6                           0x1000000000000=
03b
> > error-gt1-soc-fatal-hbm-ss2-7                           0x1000000000000=
03c
> > error-gt1-soc-fatal-hbm-ss3-0                           0x1000000000000=
03d
> > error-gt1-soc-fatal-hbm-ss3-1                           0x1000000000000=
03e
> > error-gt1-soc-fatal-hbm-ss3-2                           0x1000000000000=
03f
> > error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000=
040
> > error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000=
041
> > error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000=
042
> > error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000=
043
> > error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000=
044
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> >
> >
> > Aravind Iddamsetty (5):
> >   drm/netlink: Add netlink infrastructure
> >   drm/xe/RAS: Register a genl netlink family
> >   drm/xe/RAS: Expose the error counters
> >   drm/netlink: define multicast groups
> >   drm/xe/RAS: send multicast event on occurrence of an error
> >
> >  drivers/gpu/drm/xe/Makefile          |   1 +
> >  drivers/gpu/drm/xe/xe_device.c       |   3 +
> >  drivers/gpu/drm/xe/xe_device_types.h |   2 +
> >  drivers/gpu/drm/xe/xe_irq.c          |  32 ++
> >  drivers/gpu/drm/xe/xe_module.c       |   2 +
> >  drivers/gpu/drm/xe/xe_netlink.c      | 526 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_netlink.h      |  14 +
> >  include/uapi/drm/drm_netlink.h       |  81 +++++
> >  include/uapi/drm/xe_drm.h            |  64 ++++
> >  9 files changed, 725 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_netlink.h
> >  create mode 100644 include/uapi/drm/drm_netlink.h
> >
> > --
> > 2.25.1
> >
>
