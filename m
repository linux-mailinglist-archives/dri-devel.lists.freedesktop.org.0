Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A370FA8A
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968410E473;
	Wed, 24 May 2023 15:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5F710E3CA;
 Wed, 24 May 2023 15:39:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF0D63435;
 Wed, 24 May 2023 15:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45569C433D2;
 Wed, 24 May 2023 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684942760;
 bh=BpCAurSKPwob11gneAgJ8P2mOu9iuo4b658ZEi08zv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGWYVZq2A9TMs7NNmp6g9pD/Y0Xd+SJzWwkYWMZHq+GIqf6WokGzg/+ZlC3OPJ5j2
 0vYBHuouJDtNWXPNfD/6UHFk2aaVUTWd5opuyjsrXcyxnIEB2wazErIwXwBsy4Fk2j
 fKRBk02FTaOed5Or5jpd0Nm8T+X1W3Etu3jZmSi0c7y73kc2zIucDDdtNctfoLz158
 AEooe/2s9Fw2MWbogFANbQKK3j1xhm2TPQE1QQxH9obQwncAKQLS7HLWQg0UkvQkdi
 NyUG5PjiHe3VVd/XVVdn7LGdhjijXq5aHP3Ja+VQyaC0TKfCF3rwklkbCIHWO+2nth
 5jndca+onEC1g==
Date: Wed, 24 May 2023 08:39:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
Message-ID: <20230524153918.GA869320@dev-arch.thelio-3990X>
References: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Naresh,

On Wed, May 24, 2023 at 12:32:24PM +0530, Naresh Kamboju wrote:
> Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
> with clang.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> make --silent --keep-going \
>   --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 \
>   SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- \
>   'HOSTCC=sccache clang' 'CC=sccache clang' \
>    LLVM=1 LLVM_IAS=1
> 
> drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
> unannotated fall-through between switch labels
> [-Werror,-Wimplicit-fallthrough]
>                 case I915_FORMAT_MOD_X_TILED:
>                 ^
> drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
> 'break;' to avoid fall-through
>                 case I915_FORMAT_MOD_X_TILED:
>                 ^
>                 break;
> 1 error generated.

Thanks for the report, I have sent
https://lore.kernel.org/20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org/
for this.

Cheers,
Nathan
