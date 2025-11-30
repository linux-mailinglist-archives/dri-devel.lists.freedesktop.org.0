Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13FC95302
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 18:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DAE10E1A0;
	Sun, 30 Nov 2025 17:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GvpNvrV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2C610E267
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 17:42:37 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-786943affbaso22530497b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764524556; x=1765129356; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=haLVYkWZOmKHtpHDbk/b7m3f6L/rKnHvLY96AT2R3kQ=;
 b=GvpNvrV2kPOdAF6F0Gfg6I1st6gbKXuEyfYwZJWUTOJBXgVZL3+l1rva70wJtaxnUb
 gnev2blzc0IHC7TquZCMPejP5LS7QzbF7X1ywYtGOyYBDIno2sJTC+OyzE/+/z7szE0/
 aacbJbAwZJBHshzHA/Tg2PNNh07+jOJvKZ8gT6I4YIlUZ244piz6s1DKP5Uad3uBdm4J
 QqE/4vcgJULXU0cH0aExEzFZ8lVOH7z34XB9qxJRF8XGE7lKSXYKqvPay0ONJ0XThulA
 AoTQ53+v1ysElZWuK1ZndfdDnUS6L4Omiq+3wtgAo6DgdOid3XZhTX9f7tyjoBujGqdE
 lCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764524556; x=1765129356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=haLVYkWZOmKHtpHDbk/b7m3f6L/rKnHvLY96AT2R3kQ=;
 b=w4QT5SBXpCHMDPtQLJ5Xc0vkT9yrsUNd6L7l95P8TTovtgSKMzonbubdfRMDjmY+ci
 0cUYXvtpZ+ebPfJG0ruw3l1BZRnhsT8DKBoEYAS6Bf1mrEGekOg7XUQE3Ywp9W4EC1rj
 NVGoP5uGtzQ4UuMKjBFJhmr14qsV5Lobi3Q6H7jsSTfZUaF67fDt45qvjFZ1C5c4+Cul
 DnkvcxrdT9RsqYeu0KZlH9ILyUKoEUla8UOFlxaGoAAbt+/pP1S1sYUdDDVc9CFZ+RdN
 D14Qz4GyEXwa+oEeTyYXRbwfPJhwkqjFrAlZpXngQL+ehexvBiYCtOWFxNhWPovue7oX
 xyfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHtdjYcOqt56w5FZ9drIcWzlKtYbIHKZyru/SIvpJQsOrvzzcn2RhLv8q4EE7he0k5i6qyNR4W9Rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1JYyxfK1DA1LogtO5u1NUUT2mHSYmlD9gIltbU7i1b7FAY68z
 3pEAXe4nwvJhC4SrS0Wd71qIbZQZwKLRCm2EQnV6bjp9fYFYsKj9q7/p
X-Gm-Gg: ASbGncsEACQRH1hwjX4Co/PL1l5nDYJwMDp1XotqO92R0oLaBFwKIeCNEcrOE+YxbXy
 fEfTWJnb37oJJc273tgwYGYL6UbZBODCuprT33bvzfDAwfHAF6MaCcQhm2vd3LqCephWzlgpWVS
 q7Rm90G0UVGnRMhTjjTapc+E3NUe+ymmFeJA4fQE+LKRC8YP0LpXuX42uAPOpSOJY9Ak32pfdrR
 x1p0JD9gwI4v3sEhiqWUm+MHYVvzJoTM310K4lx3gpLerU3JrtGog/IHsWUwWig3ZSk3ieBdL6B
 YHveQbai9tUFiTyOT+PFpgowDmTcQv+jRTEADEAWZkIw+bdB+lEpNiRm+Ata7x+Ju4X9mRG56wc
 xtxX7ICCWYIdmlZvQMqVXHZr0YqkvZ3MxQAZ0jUtm36p8nl4+KVov6dVsaM/fnaGO/6S511zZsL
 rj2CYyCeE=
X-Google-Smtp-Source: AGHT+IGF0tX2hZjw3AGlknQ4v+/l0LWFo5zB2gFptAlJjQKMRQgk4Vh85OcdRysXZbzgzlA3JZDqcQ==
X-Received: by 2002:a05:690e:14c4:b0:63f:b2ca:80e1 with SMTP id
 956f58d0204a3-6432913f51dmr15585557d50.0.1764524555929; 
 Sun, 30 Nov 2025 09:42:35 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:b42b:4ad9:10af:cabc])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6433c443ce5sm3870009d50.12.2025.11.30.09.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 09:42:35 -0800 (PST)
Date: Sun, 30 Nov 2025 12:42:35 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aSyCC7TQoGgTn2rT@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <e0d34a20-7547-4788-8449-95fcd5588434@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d34a20-7547-4788-8449-95fcd5588434@infradead.org>
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

On Sat, Nov 29, 2025 at 10:19:29PM -0800, Randy Dunlap wrote:
> 
> 
> On 11/29/25 12:24 PM, Andy Shevchenko wrote:
> > On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> >> The macro is related to sysfs, but is defined in kernel.h. Move it to
> >> the proper header, and unload the generic kernel.h.
> > 
> > Tough guy :-)
> > I hope it builds well in your case.
> > 
> > FWIW,
> > https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> > https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> > https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/
> > 
> > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I don't build allyesconfigs any more (final? linking takes too long).
> It builds successfully for arm64 allmodconfig, arm allmodconfig,
> i386 allmodconfig, and x86_64 allmodconfig.
> 
> And the source files that use VERIFY_OCTAL_PERMISSIONS() all build successfully
> (which means that they possibly include <linux/sysfs.h> indirectly, i.e.,
> by luck). There aren't many of them, so I checked:
> 
> arch/arc/kernel/perf_event.c:	arc_pmu->attr[j].attr.attr.mode = VERIFY_OCTAL_PERMISSIONS(0444);
> INDIRECT
> drivers/edac/thunderx_edac.c:	.mode = VERIFY_OCTAL_PERMISSIONS(_mode),		    \
> INDIRECT
> drivers/media/platform/amphion/vpu_dbg.c:		    VERIFY_OCTAL_PERMISSIONS(0644),
> INDIRECT
> drivers/soc/aspeed/aspeed-uart-routing.c:	 .mode = VERIFY_OCTAL_PERMISSIONS(0644) },	\
> INDIRECT
> fs/xfs/xfs_error.c:		 .mode = VERIFY_OCTAL_PERMISSIONS(S_IWUSR | S_IRUGO) },	\
> INDIRECT
> include/linux/moduleparam.h:	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
> INDIRECT
> 
> so all of them got lucky. :)
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks, Randy.

This series was tested by 0-day and LKP. 0-day runs allyesconfig, as
far as I know. It only sends email in case of errors. LKP is OK, find
the report below.

All but XFS include it via linux/module.h -> linux/moduleparam.h path.
XFS has a linkage layer: xfs.h -> xfs_linux.h-> linux/module.h, so
it's pretty much the same.

I think, module.h inclusion path is OK for this macro and definitely
better than kernel.h. Notice, none of them, except for vgpu_dbg,
include kernel.h directly.

Thanks,
Yury

tree/branch: https://github.com/norov/linux stack_magic
branch HEAD: d8dffbf7bce40e2fbfe077f9c9f4a3471786666f  tracing: move tracing declarations from kernel.h to a dedicated header

elapsed time: 1669m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                     defconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                       defconfig    gcc-15.1.0
arc         randconfig-001-20251128    gcc-8.5.0
arc         randconfig-002-20251128    gcc-15.1.0
arm                     allnoconfig    clang-22
arm           am200epdkit_defconfig    gcc-15.1.0
arm             aspeed_g5_defconfig    gcc-15.1.0
arm         randconfig-001-20251128    gcc-14.3.0
arm         randconfig-002-20251128    gcc-8.5.0
arm         randconfig-003-20251128    clang-22
arm         randconfig-004-20251128    clang-17
arm               s3c6400_defconfig    gcc-15.1.0
arm                 u8500_defconfig    gcc-15.1.0
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251129    clang-22
arm64       randconfig-002-20251129    clang-22
arm64       randconfig-003-20251129    gcc-8.5.0
arm64       randconfig-004-20251129    clang-22
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251129    gcc-15.1.0
csky        randconfig-002-20251129    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251129    clang-22
hexagon     randconfig-002-20251129    clang-22
i386                    allnoconfig    gcc-14
i386        randconfig-001-20251129    gcc-14
i386        randconfig-002-20251129    gcc-12
i386        randconfig-003-20251129    clang-20
i386        randconfig-004-20251129    gcc-14
i386        randconfig-005-20251129    clang-20
i386        randconfig-006-20251129    clang-20
i386        randconfig-007-20251129    gcc-14
i386        randconfig-011-20251129    clang-20
i386        randconfig-012-20251129    gcc-13
i386        randconfig-013-20251129    clang-20
i386        randconfig-014-20251129    clang-20
i386        randconfig-015-20251129    gcc-14
loongarch               allnoconfig    clang-22
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20251129    gcc-15.1.0
loongarch   randconfig-002-20251129    gcc-14.3.0
m68k                    allnoconfig    gcc-15.1.0
m68k                      defconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze                defconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
nios2       randconfig-001-20251129    gcc-11.5.0
nios2       randconfig-002-20251129    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      generic-64bit_defconfig    gcc-15.1.0
parisc      randconfig-001-20251128    gcc-14.3.0
parisc      randconfig-002-20251128    gcc-15.1.0
parisc64                  defconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc            pcm030_defconfig    clang-22
powerpc     randconfig-001-20251128    gcc-11.5.0
powerpc     randconfig-002-20251128    clang-22
powerpc64   randconfig-001-20251128    clang-22
powerpc64   randconfig-002-20251128    gcc-8.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv                     defconfig    clang-22
s390                    allnoconfig    clang-22
s390                      defconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc       randconfig-001-20251129    gcc-8.5.0
sparc       randconfig-002-20251129    gcc-8.5.0
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20251129    gcc-8.5.0
sparc64     randconfig-002-20251129    gcc-14.3.0
um                      allnoconfig    clang-22
um                        defconfig    clang-22
um                   i386_defconfig    gcc-14
um          randconfig-001-20251129    clang-22
um          randconfig-002-20251129    gcc-14
um                 x86_64_defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64      randconfig-011-20251129    gcc-14
x86_64      randconfig-012-20251129    gcc-14
x86_64      randconfig-013-20251129    gcc-14
x86_64      randconfig-014-20251129    clang-20
x86_64      randconfig-015-20251129    gcc-12
x86_64      randconfig-016-20251129    clang-20
x86_64      randconfig-071-20251129    gcc-14
x86_64      randconfig-072-20251129    clang-20
x86_64      randconfig-073-20251129    gcc-14
x86_64      randconfig-074-20251129    gcc-12
x86_64      randconfig-075-20251129    gcc-14
x86_64      randconfig-076-20251129    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251129    gcc-10.5.0
xtensa      randconfig-002-20251129    gcc-14.3.0
xtensa          xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
