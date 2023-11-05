Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F07E1304
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 11:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455A10E04A;
	Sun,  5 Nov 2023 10:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Sun, 05 Nov 2023 09:55:02 UTC
Received: from smtp.gentoo.org (mail.gentoo.org
 [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2E110E04A;
 Sun,  5 Nov 2023 09:55:02 +0000 (UTC)
User-agent: mu4e 1.10.7; emacs 30.0.50
From: Sam James <sam@gentoo.org>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: amdgpu_amdkfd_gfx* triggers new -Walloc-size warnings in GCC 14
Date: Sun, 05 Nov 2023 09:45:24 +0000
Organization: Gentoo
Message-ID: <87wmuwo7i3.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Nov 2023 10:24:07 +0000
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
Cc: Kees Cook <kees@kernel.org>, uecker@gcc.gnu.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GCC 14 introduces a new -Walloc-size warning (https://gcc.gnu.org/onlinedoc=
s/gcc/Warning-Options.html#index-Wno-alloc-size)
which triggers on the following amdgpu files:
"""
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c: In function =E2=80=98kgd_hqd_dump=
=E2=80=99:
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c:241:15: error: allocation of insuffi=
cient size =E2=80=984=E2=80=99 for type =E2=80=98uint32_t[2]=E2=80=99 {aka =
=E2=80=98unsigned int[2
]=E2=80=99} with size =E2=80=988=E2=80=99 [-Werror=3Dalloc-size[https://gcc=
.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Walloc-size]]
  241 |         *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), G=
FP_KERNEL);
      |               ^
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c: In function =E2=80=98kgd_hqd_sdma_d=
ump=E2=80=99:
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c:327:15: error: allocation of insuffi=
cient size =E2=80=984=E2=80=99 for type =E2=80=98uint32_t[2]=E2=80=99 {aka =
=E2=80=98unsigned int[2
]=E2=80=99} with size =E2=80=988=E2=80=99 [-Werror=3Dalloc-size[https://gcc=
.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Walloc-size]]
  327 |         *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), G=
FP_KERNEL);
      |               ^
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: In function =E2=80=98kgd_arcturus=
_hqd_sdma_dump=E2=80=99:
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:203:15: error: allocation of insuf=
ficient size =E2=80=984=E2=80=99 for type =E2=80=98uint32_t[2]=E2=80=99 {ak=
a =E2=80=98unsigned int
[2]=E2=80=99} with size =E2=80=988=E2=80=99 [-Werror=3Dalloc-size[https://g=
cc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Walloc-size]]
  203 |         *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), G=
FP_KERNEL);
      |               ^
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c: In function =E2=80=98kgd_gfx_v9_4=
_3_hqd_sdma_dump=E2=80=99:
/var/tmp/portage/sys-kernel/gentoo-kernel-6.5.10/work/linux-6.5/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c:142:15: error: allocation of insuf=
ficient size =E2=80=984=E2=80=99 for type =E2=80=98uint32_t[2]=E2=80=99 {ak=
a =E2=80=98unsigned int
[2]=E2=80=99} with size =E2=80=988=E2=80=99 [-Werror=3Dalloc-size[https://g=
cc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Walloc-size]]
  142 |         *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), G=
FP_KERNEL);
      |               ^
"""

$ gcc-14 --version
gcc-14 (Gentoo Hardened 14.0.0 p, commit
2b02f083e67e97f8187d3ec023c3d281f49232c0) 14.0.0 20231104 (experimental)
8d22ac6a18cf542cd541c06b2a7df8fdd293946d
Copyright (C) 2023 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPO=
SE.

thanks,
sam
