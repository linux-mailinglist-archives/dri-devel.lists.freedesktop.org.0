Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0094F6AB8BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A2A10E0A7;
	Mon,  6 Mar 2023 08:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 06 Mar 2023 08:48:02 UTC
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6112110E196
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:48:02 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:b745:671d:a946:57fa])
 by albert.telenet-ops.be with bizsmtp
 id Uwiy2900F4LuvSS06wiyHW; Mon, 06 Mar 2023 09:42:59 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pZ6Qs-00AzRe-ER;
 Mon, 06 Mar 2023 09:42:58 +0100
Date: Mon, 6 Mar 2023 09:42:58 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.3-rc1
In-Reply-To: <20230306082035.3709036-1-geert@linux-m68k.org>
Message-ID: <148a4a5f-d228-e289-f333-8d5df6cad4f5@linux-m68k.org>
References: <CAHk-=wgr1D8hb75Z+nn+4LXUnosp0HM+gP+YJEcEav1DgTC=Cw@mail.gmail.com>
 <20230306082035.3709036-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Mar 2023, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.3-rc1[1] compared to v6.2[2].
>
> Summarized:
>  - build errors: +9/-14
>  - build warnings: +4/-1447
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fe15c26ee26efa11741a7b632e9f23b01aca4cc6/ (all 152 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/c9c3395d5e3dcc6daee66c6908354d47bf98cb0c/ (all 152 configs)
>
>
> *** ERRORS ***
>
> 9 error regressions:
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: error: 'struct cpuinfo_um' has no member named 'apicid':  => 2157:41, 2157:48

um-x86_64/um-all{mod,yes}config
um-x86_64-gcc12/um-all{mod,yes}config

>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: error: the frame size of 2208 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 7086:1

arm64-gcc5/arm64-allmodconfig

(Already improved from 2224 to 2208 bytes)

>  + /kisskb/src/drivers/gpu/drm/msm/msm_mdss.c: error: case label does not reduce to an integer constant:  => 299:2, 300:2, 296:2

powerpc-gcc5/{ppc32,ppc64_book3e,ppc64le}_allmodconfig
powerpc-gcc5/powerpc-all{mod,yes}config
arm64-gcc5/arm64-allmodconfig

>  + /kisskb/src/drivers/media/i2c/imx290.c: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]:  => 1082:12
>  + /kisskb/src/drivers/media/i2c/imx290.c: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]:  => 1090:12

m68k-gcc{8,11}/m68k-allmodconfig
parisc-gcc{8,11}/parisc-allmodconfig
s390x-gcc11/s390-all{mod,yes}config

Fix available since Feb 7.

>  + /kisskb/src/fs/btrfs/inode.c: error: 'location.type' may be used uninitialized [-Werror=maybe-uninitialized]:  => 5730:21

sparc64-gcc11/sparc{,64}-allmodconfig
parisc-gcc11/parisc-allmodconfig

>  + /kisskb/src/fs/btrfs/send.c: error: 'right_gen' may be used uninitialized in this function [-Werror=maybe-uninitialized]:  => 1909:13, 1902:23

powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/{ppc32,ppc64_book3e,ppc64le}_allmodconfig
powerpc-gcc5/{ppc64,ppc64le,pseries,pseries_le,skiroot}_defconfig

>  + /opt/cross/kisskb/fe-x86-64-core-i7-2017.05/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/stdlib-float.h: error: SSE register return with SSE disabled:  => 27:1

um-x86_64/um-allyesconfig

>  + {standard input}: Error: unknown pseudo-op: `.':  => 1118

sh4-gcc11/sh-all{mod,yes}config (ICE)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
