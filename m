Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7459564B2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7110E190;
	Mon, 19 Aug 2024 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92D510E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:30:35 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4WnPQJ5WCkz4x9gF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:30:32 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7674:86dc:e300:ce10])
 by laurent.telenet-ops.be with bizsmtp
 id 1jWY2D0052ltMuT01jWYrk; Mon, 19 Aug 2024 09:30:32 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sfwqW-000Hig-1Z;
 Mon, 19 Aug 2024 09:30:32 +0200
Date: Mon, 19 Aug 2024 09:30:32 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: sparclinux@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: Build regressions/improvements in v6.11-rc4
In-Reply-To: <20240819070639.2558629-1-geert@linux-m68k.org>
Message-ID: <e43d6c-90df-32d2-c7ac-2991e8c5672f@linux-m68k.org>
References: <CAHk-=wgP=qzODR60Xxzem5LQi6sH+6EFCDMOApAgBy37SQ59hA@mail.gmail.com>
 <20240819070639.2558629-1-geert@linux-m68k.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Aug 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.11-rc4[1] to v6.11-rc3[3], the summaries are:
>  - build errors: +6/-4

   + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]:  => 254:1
   + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]:  => 282:1
   + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]:  => 307:1
   + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]:  => 343:1

sparc64-gcc13/sparc64-allmodconfig
(pre-existing, but now emitted twice in this config only?)

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_952' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_953' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38

powerpc-gcc5/powerpc-all{mod,yes}config

In function 'decode_oa_format.isra.26',
     inlined from 'xe_oa_set_prop_oa_format' at drivers/gpu/drm/xe/xe_oa.c:1664:6:
drivers/gpu/drm/xe/xe_oa.c:1573:18: note: in expansion of macro 'FIELD_GET'
   u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
                   ^
Seen before, patch available.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    - Linus Torvalds
