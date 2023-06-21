Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E99738D01
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A41610E33F;
	Wed, 21 Jun 2023 17:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3788310E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687368289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RV05p51Ee4BoE6g21Q4SiMggA1pPMC3T4CIGp3x1ss=;
 b=fbPtoN/jKGViVPwC91TyEWQa2/142obFzbQPQ41dGiWRzNNjT2fbB9Y1CdI75Cuj4SrWM8
 SuTLsbLGqKiorBjIT5cqGNCUCO2pL4MAxxIEHX72otjioB3TPq6yO5DAUwsE6Nr2VtgMwC
 vhtkARkV86VRUoOzx+JPRV2TssgrhAA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-TJXZYsj4Mpy-eus4QsIuNA-1; Wed, 21 Jun 2023 13:24:47 -0400
X-MC-Unique: TJXZYsj4Mpy-eus4QsIuNA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f8fceddaeaso1940027e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687368286; x=1689960286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RV05p51Ee4BoE6g21Q4SiMggA1pPMC3T4CIGp3x1ss=;
 b=KpsR/2CHeFLauce684jwNNOYPFPwcH1WZNYKAr9aWeauvO0ukrS7b5HmnG4sWooAup
 WZg3n9y5FQC/yU7PAJz10N1ySoAtfmde3ja7IJT+gJc+ZaDkMlp8bUuKJaMro7dkhJkU
 h1q/CyY0J1SvHKzyIBB9fjOn4hS68YW8Q312GnWkXg/cf60DRGAhLs2kbCOKtXa3xZMk
 iDSgRXVVjyytlFIUxhSzsmdFAO+/HnBN8xM1AOWuAi+Ze8FSTX/kL7zAWBgTE8lIAusK
 nDeRQG4rQNInSideQeUXBGectTAp1JnMDRJNu13JX2oRSxqNNWnVXLuKfkf7p/Qq6/vK
 EJSA==
X-Gm-Message-State: AC+VfDw/1FMutI2beUDP0DmYC57cdGKgGRYg2MWVkXY6IewHh8huxCDf
 e7nLrTLZfF5DkQaVLkn5wlo89ThRXNkudd4VNN37eMkbhAXje/6r+Pl62vVZfBCZS2SlgyKcTfE
 aoaNoRzm2WScl6ws8yn0hgnoGb+VHUdaRMlC3gb6KwKVjoAswOtE4akI=
X-Received: by 2002:ac2:5b5a:0:b0:4f8:66b2:c417 with SMTP id
 i26-20020ac25b5a000000b004f866b2c417mr8584418lfp.15.1687368285863; 
 Wed, 21 Jun 2023 10:24:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dthpEH27KtX9neetl72IKDyKtuHIWvUXLZh7t+n7gmhEga/G166T0JL1o97K63/AxfEjIqOpwzXQ/pq7f5lU=
X-Received: by 2002:ac2:5b5a:0:b0:4f8:66b2:c417 with SMTP id
 i26-20020ac25b5a000000b004f866b2c417mr8584399lfp.15.1687368285499; Wed, 21
 Jun 2023 10:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Wed, 21 Jun 2023 19:24:34 +0200
Message-ID: <CA+hFU4x3tKz9L8W3N8iOsbHJHqWJJ+Fr-C8NMbAfsmWg2xQnUA@mail.gmail.com>
Subject: Re: [RFC 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 6:21=E2=80=AFPM Aravind Iddamsetty
<aravind.iddamsetty@intel.com> wrote:
>
> Our hardware supports RAS(Reliability, Availability, Serviceability) by
> exposing a set of error counters which can be used by observability
> tools to take corrective actions or repairs. Traditionally there were
> being exposed via PMU (for relative counters) and sysfs interface (for
> absolute value) in our internal branch. But, due to the limitations in
> this approach to use two interfaces and also not able to have an event
> based reporting or configurability, an alternative approach to try
> netlink was suggested by community for drm subsystem wide UAPI for RAS
> and telemetry as discussed in [1].
>
> This [1] is the inspiration to this series. It uses the generic
> netlink(genl) family subsystem and exposes a set of commands that can
> be used by every drm driver, the framework provides a means to have
> custom commands too. Each drm driver instance in this example xe driver
> instance registers a family and operations to the genl subsystem through
> which it enumerates and reports the error counters. An event based
> notification is also supported to which userpace can subscribe to and
> be notified when any error occurs and read the error counter this avoids
> continuous polling on error counter. This can also be extended to
> threshold based notification.

Be aware that netlink can be quite awkward in user space because it's
attached to the netns while the device is in the mount ns and there
are special rules for netlink regarding namespacing.

> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summa=
ry.html
>
> this series is on top of https://patchwork.freedesktop.org/series/116181/
>
> Below is an example tool drm_ras which demonstrates the use of the
> supported commands. The tool will be sent to ML with the subject
> "[RFC i-g-t 0/1] A tool to demonstrate use of netlink sockets to read RAS=
 error counters"
>
> read single error counter:
>
> $ ./drm_ras READ_ONE --device=3Ddrm:/dev/dri/card1 --error_id=3D0x0000000=
000000005
> counter value 0
>
> read all error counters:
>
> $ ./drm_ras READ_ALL --device=3Ddrm:/dev/dri/card1
> name                                                    config-id        =
       counter
>
> error-gt0-correctable-guc                               0x000000000000000=
1      0
> error-gt0-correctable-slm                               0x000000000000000=
3      0
> error-gt0-correctable-eu-ic                             0x000000000000000=
4      0
> error-gt0-correctable-eu-grf                            0x000000000000000=
5      0
> error-gt0-fatal-guc                                     0x000000000000000=
9      0
> error-gt0-fatal-slm                                     0x000000000000000=
d      0
> error-gt0-fatal-eu-grf                                  0x000000000000000=
f      0
> error-gt0-fatal-fpu                                     0x000000000000001=
0      0
> error-gt0-fatal-tlb                                     0x000000000000001=
1      0
> error-gt0-fatal-l3-fabric                               0x000000000000001=
2      0
> error-gt0-correctable-subslice                          0x000000000000001=
3      0
> error-gt0-correctable-l3bank                            0x000000000000001=
4      0
> error-gt0-fatal-subslice                                0x000000000000001=
5      0
> error-gt0-fatal-l3bank                                  0x000000000000001=
6      0
> error-gt0-sgunit-correctable                            0x000000000000001=
7      0
> error-gt0-sgunit-nonfatal                               0x000000000000001=
8      0
> error-gt0-sgunit-fatal                                  0x000000000000001=
9      0
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001=
a      0
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001=
b      0
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001=
c      0
> error-gt0-soc-fatal-punit                               0x000000000000001=
d      0
> error-gt0-soc-fatal-psf-0                               0x000000000000001=
e      0
> error-gt0-soc-fatal-psf-1                               0x000000000000001=
f      0
> error-gt0-soc-fatal-psf-2                               0x000000000000002=
0      0
> error-gt0-soc-fatal-cd0                                 0x000000000000002=
1      0
> error-gt0-soc-fatal-cd0-mdfi                            0x000000000000002=
2      0
> error-gt0-soc-fatal-mdfi-east                           0x000000000000002=
3      0
> error-gt0-soc-fatal-mdfi-south                          0x000000000000002=
4      0
> error-gt0-soc-fatal-hbm-ss0-0                           0x000000000000002=
5      0
> error-gt0-soc-fatal-hbm-ss0-1                           0x000000000000002=
6      0
> error-gt0-soc-fatal-hbm-ss0-2                           0x000000000000002=
7      0
> error-gt0-soc-fatal-hbm-ss0-3                           0x000000000000002=
8      0
> error-gt0-soc-fatal-hbm-ss0-4                           0x000000000000002=
9      0
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002=
a      0
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002=
b      0
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002=
c      0
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002=
d      0
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002=
e      0
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002=
f      0
> error-gt0-soc-fatal-hbm-ss1-3                           0x000000000000003=
0      0
> error-gt0-soc-fatal-hbm-ss1-4                           0x000000000000003=
1      0
> error-gt0-soc-fatal-hbm-ss1-5                           0x000000000000003=
2      0
> error-gt0-soc-fatal-hbm-ss1-6                           0x000000000000003=
3      0
> error-gt0-soc-fatal-hbm-ss1-7                           0x000000000000003=
4      0
> error-gt0-soc-fatal-hbm-ss2-0                           0x000000000000003=
5      0
> error-gt0-soc-fatal-hbm-ss2-1                           0x000000000000003=
6      0
> error-gt0-soc-fatal-hbm-ss2-2                           0x000000000000003=
7      0
> error-gt0-soc-fatal-hbm-ss2-3                           0x000000000000003=
8      0
> error-gt0-soc-fatal-hbm-ss2-4                           0x000000000000003=
9      0
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003=
a      0
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003=
b      0
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003=
c      0
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003=
d      0
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003=
e      0
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003=
f      0
> error-gt0-soc-fatal-hbm-ss3-3                           0x000000000000004=
0      0
> error-gt0-soc-fatal-hbm-ss3-4                           0x000000000000004=
1      0
> error-gt0-soc-fatal-hbm-ss3-5                           0x000000000000004=
2      0
> error-gt0-soc-fatal-hbm-ss3-6                           0x000000000000004=
3      0
> error-gt0-soc-fatal-hbm-ss3-7                           0x000000000000004=
4      0
> error-gt0-gsc-correctable-sram-ecc                      0x000000000000004=
5      0
> error-gt0-gsc-nonfatal-mia-shutdown                     0x000000000000004=
6      0
> error-gt0-gsc-nonfatal-mia-int                          0x000000000000004=
7      0
> error-gt0-gsc-nonfatal-sram-ecc                         0x000000000000004=
8      0
> error-gt0-gsc-nonfatal-wdg-timeout                      0x000000000000004=
9      0
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004=
a      0
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004=
b      0
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004=
c      0
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004=
d      0
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004=
e      0
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004=
f      0
> error-gt0-gsc-nonfatal-aon-parity                       0x000000000000005=
0      0
> error-gt1-correctable-guc                               0x100000000000000=
1      0
> error-gt1-correctable-slm                               0x100000000000000=
3      0
> error-gt1-correctable-eu-ic                             0x100000000000000=
4      0
> error-gt1-correctable-eu-grf                            0x100000000000000=
5      0
> error-gt1-fatal-guc                                     0x100000000000000=
9      0
> error-gt1-fatal-slm                                     0x100000000000000=
d      0
> error-gt1-fatal-eu-grf                                  0x100000000000000=
f      0
> error-gt1-fatal-fpu                                     0x100000000000001=
0      0
> error-gt1-fatal-tlb                                     0x100000000000001=
1      0
> error-gt1-fatal-l3-fabric                               0x100000000000001=
2      0
> error-gt1-correctable-subslice                          0x100000000000001=
3      0
> error-gt1-correctable-l3bank                            0x100000000000001=
4      0
> error-gt1-fatal-subslice                                0x100000000000001=
5      0
> error-gt1-fatal-l3bank                                  0x100000000000001=
6      0
> error-gt1-sgunit-correctable                            0x100000000000001=
7      0
> error-gt1-sgunit-nonfatal                               0x100000000000001=
8      0
> error-gt1-sgunit-fatal                                  0x100000000000001=
9      0
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001=
a      0
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001=
b      0
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001=
c      0
> error-gt1-soc-fatal-punit                               0x100000000000001=
d      0
> error-gt1-soc-fatal-psf-0                               0x100000000000001=
e      0
> error-gt1-soc-fatal-psf-1                               0x100000000000001=
f      0
> error-gt1-soc-fatal-psf-2                               0x100000000000002=
0      0
> error-gt1-soc-fatal-cd0                                 0x100000000000002=
1      0
> error-gt1-soc-fatal-cd0-mdfi                            0x100000000000002=
2      0
> error-gt1-soc-fatal-mdfi-east                           0x100000000000002=
3      0
> error-gt1-soc-fatal-mdfi-south                          0x100000000000002=
4      0
> error-gt1-soc-fatal-hbm-ss0-0                           0x100000000000002=
5      0
> error-gt1-soc-fatal-hbm-ss0-1                           0x100000000000002=
6      0
> error-gt1-soc-fatal-hbm-ss0-2                           0x100000000000002=
7      0
> error-gt1-soc-fatal-hbm-ss0-3                           0x100000000000002=
8      0
> error-gt1-soc-fatal-hbm-ss0-4                           0x100000000000002=
9      0
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002=
a      0
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002=
b      0
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002=
c      0
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002=
d      0
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002=
e      0
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002=
f      0
> error-gt1-soc-fatal-hbm-ss1-3                           0x100000000000003=
0      0
> error-gt1-soc-fatal-hbm-ss1-4                           0x100000000000003=
1      0
> error-gt1-soc-fatal-hbm-ss1-5                           0x100000000000003=
2      0
> error-gt1-soc-fatal-hbm-ss1-6                           0x100000000000003=
3      0
> error-gt1-soc-fatal-hbm-ss1-7                           0x100000000000003=
4      0
> error-gt1-soc-fatal-hbm-ss2-0                           0x100000000000003=
5      0
> error-gt1-soc-fatal-hbm-ss2-1                           0x100000000000003=
6      0
> error-gt1-soc-fatal-hbm-ss2-2                           0x100000000000003=
7      0
> error-gt1-soc-fatal-hbm-ss2-3                           0x100000000000003=
8      0
> error-gt1-soc-fatal-hbm-ss2-4                           0x100000000000003=
9      0
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003=
a      0
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003=
b      0
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003=
c      0
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003=
d      0
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003=
e      0
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003=
f      0
> error-gt1-soc-fatal-hbm-ss3-3                           0x100000000000004=
0      0
> error-gt1-soc-fatal-hbm-ss3-4                           0x100000000000004=
1      0
> error-gt1-soc-fatal-hbm-ss3-5                           0x100000000000004=
2      0
> error-gt1-soc-fatal-hbm-ss3-6                           0x100000000000004=
3      0
> error-gt1-soc-fatal-hbm-ss3-7                           0x100000000000004=
4      0
>
> wait on a error event:
>
> $ ./drm_ras WAIT_ON_EVENT --device=3Ddrm:/dev/dri/card1
> waiting for error event
> error event received
> counter value 0
>
> list all errors:
>
> $ ./drm_ras LIST_ERRORS --device=3Ddrm:/dev/dri/card1
> name                                                    config-id
>
> error-gt0-correctable-guc                               0x000000000000000=
1
> error-gt0-correctable-slm                               0x000000000000000=
3
> error-gt0-correctable-eu-ic                             0x000000000000000=
4
> error-gt0-correctable-eu-grf                            0x000000000000000=
5
> error-gt0-fatal-guc                                     0x000000000000000=
9
> error-gt0-fatal-slm                                     0x000000000000000=
d
> error-gt0-fatal-eu-grf                                  0x000000000000000=
f
> error-gt0-fatal-fpu                                     0x000000000000001=
0
> error-gt0-fatal-tlb                                     0x000000000000001=
1
> error-gt0-fatal-l3-fabric                               0x000000000000001=
2
> error-gt0-correctable-subslice                          0x000000000000001=
3
> error-gt0-correctable-l3bank                            0x000000000000001=
4
> error-gt0-fatal-subslice                                0x000000000000001=
5
> error-gt0-fatal-l3bank                                  0x000000000000001=
6
> error-gt0-sgunit-correctable                            0x000000000000001=
7
> error-gt0-sgunit-nonfatal                               0x000000000000001=
8
> error-gt0-sgunit-fatal                                  0x000000000000001=
9
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001=
a
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001=
b
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001=
c
> error-gt0-soc-fatal-punit                               0x000000000000001=
d
> error-gt0-soc-fatal-psf-0                               0x000000000000001=
e
> error-gt0-soc-fatal-psf-1                               0x000000000000001=
f
> error-gt0-soc-fatal-psf-2                               0x000000000000002=
0
> error-gt0-soc-fatal-cd0                                 0x000000000000002=
1
> error-gt0-soc-fatal-cd0-mdfi                            0x000000000000002=
2
> error-gt0-soc-fatal-mdfi-east                           0x000000000000002=
3
> error-gt0-soc-fatal-mdfi-south                          0x000000000000002=
4
> error-gt0-soc-fatal-hbm-ss0-0                           0x000000000000002=
5
> error-gt0-soc-fatal-hbm-ss0-1                           0x000000000000002=
6
> error-gt0-soc-fatal-hbm-ss0-2                           0x000000000000002=
7
> error-gt0-soc-fatal-hbm-ss0-3                           0x000000000000002=
8
> error-gt0-soc-fatal-hbm-ss0-4                           0x000000000000002=
9
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002=
a
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002=
b
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002=
c
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002=
d
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002=
e
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002=
f
> error-gt0-soc-fatal-hbm-ss1-3                           0x000000000000003=
0
> error-gt0-soc-fatal-hbm-ss1-4                           0x000000000000003=
1
> error-gt0-soc-fatal-hbm-ss1-5                           0x000000000000003=
2
> error-gt0-soc-fatal-hbm-ss1-6                           0x000000000000003=
3
> error-gt0-soc-fatal-hbm-ss1-7                           0x000000000000003=
4
> error-gt0-soc-fatal-hbm-ss2-0                           0x000000000000003=
5
> error-gt0-soc-fatal-hbm-ss2-1                           0x000000000000003=
6
> error-gt0-soc-fatal-hbm-ss2-2                           0x000000000000003=
7
> error-gt0-soc-fatal-hbm-ss2-3                           0x000000000000003=
8
> error-gt0-soc-fatal-hbm-ss2-4                           0x000000000000003=
9
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003=
a
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003=
b
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003=
c
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003=
d
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003=
e
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003=
f
> error-gt0-soc-fatal-hbm-ss3-3                           0x000000000000004=
0
> error-gt0-soc-fatal-hbm-ss3-4                           0x000000000000004=
1
> error-gt0-soc-fatal-hbm-ss3-5                           0x000000000000004=
2
> error-gt0-soc-fatal-hbm-ss3-6                           0x000000000000004=
3
> error-gt0-soc-fatal-hbm-ss3-7                           0x000000000000004=
4
> error-gt0-gsc-correctable-sram-ecc                      0x000000000000004=
5
> error-gt0-gsc-nonfatal-mia-shutdown                     0x000000000000004=
6
> error-gt0-gsc-nonfatal-mia-int                          0x000000000000004=
7
> error-gt0-gsc-nonfatal-sram-ecc                         0x000000000000004=
8
> error-gt0-gsc-nonfatal-wdg-timeout                      0x000000000000004=
9
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004=
a
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004=
b
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004=
c
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004=
d
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004=
e
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004=
f
> error-gt0-gsc-nonfatal-aon-parity                       0x000000000000005=
0
> error-gt1-correctable-guc                               0x100000000000000=
1
> error-gt1-correctable-slm                               0x100000000000000=
3
> error-gt1-correctable-eu-ic                             0x100000000000000=
4
> error-gt1-correctable-eu-grf                            0x100000000000000=
5
> error-gt1-fatal-guc                                     0x100000000000000=
9
> error-gt1-fatal-slm                                     0x100000000000000=
d
> error-gt1-fatal-eu-grf                                  0x100000000000000=
f
> error-gt1-fatal-fpu                                     0x100000000000001=
0
> error-gt1-fatal-tlb                                     0x100000000000001=
1
> error-gt1-fatal-l3-fabric                               0x100000000000001=
2
> error-gt1-correctable-subslice                          0x100000000000001=
3
> error-gt1-correctable-l3bank                            0x100000000000001=
4
> error-gt1-fatal-subslice                                0x100000000000001=
5
> error-gt1-fatal-l3bank                                  0x100000000000001=
6
> error-gt1-sgunit-correctable                            0x100000000000001=
7
> error-gt1-sgunit-nonfatal                               0x100000000000001=
8
> error-gt1-sgunit-fatal                                  0x100000000000001=
9
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001=
a
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001=
b
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001=
c
> error-gt1-soc-fatal-punit                               0x100000000000001=
d
> error-gt1-soc-fatal-psf-0                               0x100000000000001=
e
> error-gt1-soc-fatal-psf-1                               0x100000000000001=
f
> error-gt1-soc-fatal-psf-2                               0x100000000000002=
0
> error-gt1-soc-fatal-cd0                                 0x100000000000002=
1
> error-gt1-soc-fatal-cd0-mdfi                            0x100000000000002=
2
> error-gt1-soc-fatal-mdfi-east                           0x100000000000002=
3
> error-gt1-soc-fatal-mdfi-south                          0x100000000000002=
4
> error-gt1-soc-fatal-hbm-ss0-0                           0x100000000000002=
5
> error-gt1-soc-fatal-hbm-ss0-1                           0x100000000000002=
6
> error-gt1-soc-fatal-hbm-ss0-2                           0x100000000000002=
7
> error-gt1-soc-fatal-hbm-ss0-3                           0x100000000000002=
8
> error-gt1-soc-fatal-hbm-ss0-4                           0x100000000000002=
9
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002=
a
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002=
b
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002=
c
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002=
d
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002=
e
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002=
f
> error-gt1-soc-fatal-hbm-ss1-3                           0x100000000000003=
0
> error-gt1-soc-fatal-hbm-ss1-4                           0x100000000000003=
1
> error-gt1-soc-fatal-hbm-ss1-5                           0x100000000000003=
2
> error-gt1-soc-fatal-hbm-ss1-6                           0x100000000000003=
3
> error-gt1-soc-fatal-hbm-ss1-7                           0x100000000000003=
4
> error-gt1-soc-fatal-hbm-ss2-0                           0x100000000000003=
5
> error-gt1-soc-fatal-hbm-ss2-1                           0x100000000000003=
6
> error-gt1-soc-fatal-hbm-ss2-2                           0x100000000000003=
7
> error-gt1-soc-fatal-hbm-ss2-3                           0x100000000000003=
8
> error-gt1-soc-fatal-hbm-ss2-4                           0x100000000000003=
9
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003=
a
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003=
b
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003=
c
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003=
d
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003=
e
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003=
f
> error-gt1-soc-fatal-hbm-ss3-3                           0x100000000000004=
0
> error-gt1-soc-fatal-hbm-ss3-4                           0x100000000000004=
1
> error-gt1-soc-fatal-hbm-ss3-5                           0x100000000000004=
2
> error-gt1-soc-fatal-hbm-ss3-6                           0x100000000000004=
3
> error-gt1-soc-fatal-hbm-ss3-7                           0x100000000000004=
4
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
>
>
> Aravind Iddamsetty (5):
>   drm/netlink: Add netlink infrastructure
>   drm/xe/RAS: Register a genl netlink family
>   drm/xe/RAS: Expose the error counters
>   drm/netlink: define multicast groups
>   drm/xe/RAS: send multicast event on occurrence of an error
>
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_irq.c          |  32 ++
>  drivers/gpu/drm/xe/xe_module.c       |   2 +
>  drivers/gpu/drm/xe/xe_netlink.c      | 526 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_netlink.h      |  14 +
>  include/uapi/drm/drm_netlink.h       |  81 +++++
>  include/uapi/drm/xe_drm.h            |  64 ++++
>  9 files changed, 725 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.h
>  create mode 100644 include/uapi/drm/drm_netlink.h
>
> --
> 2.25.1
>

