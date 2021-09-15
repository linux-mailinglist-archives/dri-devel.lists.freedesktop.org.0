Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436B40C62E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 15:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E353E6E92E;
	Wed, 15 Sep 2021 13:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228C56E92C;
 Wed, 15 Sep 2021 13:19:53 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id t4so3307667qkb.9;
 Wed, 15 Sep 2021 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q2xi20PA46pswgXW5gl4LvVuTEcsdCz7hwUq+6rgOB8=;
 b=o3BS3GQmI95ouU7URDEZ0K6rqIDTqHLeC5j4uexAqc5aDPzFOqJ8HD2e1BHv6Z27sV
 7iD0O71MldhrkT6/IRdFsYtCyPLAhAwWcDxoQY8JZtNXMAlWTGqbipZXZrE5T1ik137b
 uVXyMRXlYyAZiSyUHVXmog5wzj9ixltoqCEQOGPG9G+RWCBlQeDaaQ+ZzAVQPR84YXiX
 6ELDkhtj7oZhX97t8IsbtX7NFddXr13Y/k5SAPCK7QaJYOhYpXJ/cNSY7epSyRBR4mEE
 m/huwdc5Pre/jnggCFZAdomcEe3Db6u8J0/7nWbjB/tcAPhC1FIsamIRkyBa8Y8qQ3Jr
 RGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q2xi20PA46pswgXW5gl4LvVuTEcsdCz7hwUq+6rgOB8=;
 b=BQW1v/gm6iZmQ8chzmlGH4i5TWxvgM7c0FlaxIKF4f8ZLFQj1yv6oxJOrLLhdAu+9b
 YBTwJ3aK1cyyPy72iwegW6fpm0VGjpz83YCIebzh1xslS2j0qJ09w96jObFvmOju52Fk
 UeXm5i9P0PcUdZVebgI9RJgOZtSq1ZYHG6Ezi1Hr5OYymfmEgeq6NhdZNXKl6U/u3zA5
 nYoMV9LnvZqxLO6xKGx0D4HBtLx6X0TZ5qUkziItWJ7UddWsn5fPLAeH6VFdmw7ZWxa1
 olvehPrKmT0Dbe9bobIdC94PGQLvlTtmrYJyFfBiruzYACAqO5Ts7DwYh7MXLo7tPsqZ
 0GhA==
X-Gm-Message-State: AOAM5311FLuaRVTfNd1eIQvtP1z7fi7vEOt5dXq7OM0qRG98m1KhxAWg
 eYerGktRNpnFblEovoTgfcmTjgi5VJ1x8yrZ8tI=
X-Google-Smtp-Source: ABdhPJyNhv3eqloFJYYmVXXPHhNE3E9Yi7I8Dm0NcVWU23nVG04u1qODJAOWOz863JyrdXUTwQyJihgJHb3sdfK5gKw=
X-Received: by 2002:ae9:f304:: with SMTP id p4mr10166957qkg.334.1631711992148; 
 Wed, 15 Sep 2021 06:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210915105946.394412-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210915105946.394412-1-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 15 Sep 2021 14:19:24 +0100
Message-ID: <CAM0jSHNFcYSvSgPuxdq-it-V9ARkOLbndTqJT3wK8awEZ_dqWA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add mmap lock around vma_lookup()
 to prevent lockdep splats
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, 15 Sept 2021 at 12:00, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Fixes the following splat:
>
> i915: Running i915_gem_mman_live_selftests/igt_mmap
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 5654 at include/linux/mmap_lock.h:164 find_vma+0x4e/=
0xb0
> Modules linked in: i915(+) vgem fuse snd_hda_codec_hdmi snd_hda_codec_rea=
ltek snd_hda_codec_generic ledtrig_audio mei_hdcp x86_pkg_temp_thermal core=
temp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_intel_dspcfg snd=
_hda_codec snd_hwdep e1000e snd_hda_core ptp snd_pcm ttm mei_me pps_core i2=
c_i801 prime_numbers i2c_smbus mei [last unloaded: i915]
> CPU: 3 PID: 5654 Comm: i915_selftest Tainted: G     U            5.15.0-r=
c1-CI-Trybot_7984+ #1
> Hardware name: Micro-Star International Co., Ltd. MS-7B54/Z370M MORTAR (M=
S-7B54), BIOS 1.00 10/31/2017
> RIP: 0010:find_vma+0x4e/0xb0
> Code: de 48 89 ef e8 d3 94 fe ff 48 85 c0 74 34 48 83 c4 08 5b 5d c3 48 8=
d bf 28 01 00 00 be ff ff ff ff e8 d6 46 8b 00 85 c0 75 c8 <0f> 0b 48 8b 85=
 b8 00 00 00 48 85 c0 75 c6 48 89 ef e8 12 26 87 00
> RSP: 0018:ffffc900013df980 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 00007f9df2b80000 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: ffffffff822e314c RDI: ffffffff8233c83f
> RBP: ffff88811bafc840 R08: ffff888107d0ddb8 R09: 00000000fffffffe
> R10: 0000000000000001 R11: 00000000ffbae7ba R12: 0000000000000000
> R13: 0000000000000000 R14: ffff88812a710000 R15: ffff888114fa42c0
> FS:  00007f9def9d4c00(0000) GS:ffff888266580000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f799627fe50 CR3: 000000011bbc2006 CR4: 00000000003706e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  __igt_mmap+0xe0/0x490 [i915]
>  igt_mmap+0xd2/0x160 [i915]
>  ? __trace_bprintk+0x6e/0x80
>  __i915_subtests.cold.7+0x42/0x92 [i915]
>  ? i915_perf_selftests+0x20/0x20 [i915]
>  ? __i915_nop_setup+0x10/0x10 [i915]
>  __run_selftests.part.3+0x10d/0x172 [i915]
>  i915_live_selftests.cold.5+0x1f/0x47 [i915]
>  i915_pci_probe+0x93/0x1d0 [i915]
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/4129
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
