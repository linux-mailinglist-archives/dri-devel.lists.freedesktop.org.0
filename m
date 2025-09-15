Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8DB57F44
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6310E4E7;
	Mon, 15 Sep 2025 14:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A2A910E4D5;
 Mon, 15 Sep 2025 14:40:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61D9E1424;
 Mon, 15 Sep 2025 07:40:36 -0700 (PDT)
Received: from [10.57.5.5] (unknown [10.57.5.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775073F673;
 Mon, 15 Sep 2025 07:40:41 -0700 (PDT)
Message-ID: <3ef3dc64-69dc-43b2-a77a-7fb3e552e4e6@arm.com>
Date: Mon, 15 Sep 2025 15:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/3] Add initial Panthor tests
To: Daniel Almeida <daniel.almeida@collabora.com>, adrinael@adrinael.net,
 arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, aliceryhl@google.com,
 jeffv@google.com
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250912181931.3738444-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/09/2025 19:19, Daniel Almeida wrote:
> This series adds basic Panthor tests. In particular, these are being
> used to test both Panthor[0] and Tyr[1], i.e.: the new Rust GPU driver
> that implements Panthor's uAPI (i.e.: panthor_drm.h). Most of the
> initial tests were chosen in order to have something to test Tyr with,
> but this series lays the groundwork so that more interesting tests can
> be added to test more of Panthor itself.
> 
> This work is being tested on a RockPi 5, featuring an rk3588 SoC and
> Mali-G610 Valhall.
> 
> Note that there's a few (less than five?) remaining checkpatch.pl
> comments about long lines. IMHO there's no way to format them better so
> I hope we can live with this.
> 
> [0]: https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
> [1]: https://lore.kernel.org/dri-devel/aMLB0Vs0dJ_AkU4z@google.com/
> 
> Changes from v1:
> - Rebased on top of the latest master
> - Squashed patch 3 from v1 into patch 2.
> - Switched to /* */ comments in headers
> - Initialized padding fields to 0 as applicable in group_destroy and
>   vm_destroy
> - Removed wrong assert(gpu_rev != 0)
> - Changed indentation to use tabs
> - Rework igt_panthor_mmap_bo to take an offset (so we don't call the
>   mmap_offset ioctl twice)
> - Added igt_describe and docs to the functions igt_panthor.c
> - Linked to the driver in the cover letter and patch 1.
> - Improved the commit message for patch 1.
> Link to v1: https://lore.kernel.org/dri-devel/20250828130402.2549948-1-daniel.almeida@collabora.com/

Looks good to me, and all the tests now pass (using Panthor) on my Rock5B.

Tested-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> 
> Daniel Almeida (3):
>   lib: add support for opening Panthor devices
>   panthor: add initial infrastructure
>   tests/panthor: add panthor tests
> 
>  lib/drmtest.c                 |   1 +
>  lib/drmtest.h                 |   1 +
>  lib/igt_panthor.c             | 229 ++++++++++++++++++++++++++++
>  lib/igt_panthor.h             |  30 ++++
>  lib/meson.build               |   1 +
>  meson.build                   |   8 +
>  tests/meson.build             |   2 +
>  tests/panthor/meson.build     |  15 ++
>  tests/panthor/panthor_gem.c   |  66 ++++++++
>  tests/panthor/panthor_group.c | 276 ++++++++++++++++++++++++++++++++++
>  tests/panthor/panthor_query.c |  25 +++
>  tests/panthor/panthor_vm.c    |  80 ++++++++++
>  12 files changed, 734 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
>  create mode 100644 tests/panthor/meson.build
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 

