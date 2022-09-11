Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208C5B5130
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 22:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C28010E1A0;
	Sun, 11 Sep 2022 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7484310E0ED;
 Sun, 11 Sep 2022 20:59:05 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MQht0278fzDsCl;
 Sun, 11 Sep 2022 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662929944; bh=1N35O6XhmkneDsnvy/2oWxg1XykGRWHKDLRp0cSqA50=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DC7D6TGbMzcb3dXoMgZs2YErzM9mFa0S/e7w/ymmXpw6YTwGLJAHi96pHKKSJTNj0
 H8SvTufd/PY7OLICleSPlsACnBcFaMcH0LhabZ/xsNQy8TCZX8E5VY7rG9ewFSTOB0
 0PLzGL1NKjg8JX9QtTL2iqZj5Y7LpArLCFtnX0NY=
X-Riseup-User-ID: 6F65FF3CA326C820EF73C2DA7271A46B0F2C1755CF664F5B5ED7AFDF43971D89
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MQhsw153wz1xx1;
 Sun, 11 Sep 2022 20:58:59 +0000 (UTC)
Message-ID: <6ef3abfb-27de-7044-dae1-153284504c05@riseup.net>
Date: Sun, 11 Sep 2022 17:58:56 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] drm/amd/display: Reduce stack usage for clang
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20220830203409.3491379-1-nathan@kernel.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220830203409.3491379-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

I have built-tested the whole series with clang 14.0.5 (Fedora
14.0.5-1.fc36), using:

$ make -kj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper allmodconfig
drivers/gpu/drm/amd/amdgpu/

Great to see this patchset coming for DML!

To the whole series:

Tested-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

On 8/30/22 17:34, Nathan Chancellor wrote:
> Hi all,
> 
> This series aims to address the following warnings, which are visible
> when building x86_64 allmodconfig with clang after commit 3876a8b5e241
> ("drm/amd/display: Enable building new display engine with KCOV
> enabled").
> 
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>     void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>         ^
>     1 error generated.
> 
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>     void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>         ^
>     1 error generated.
> 
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>     void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>         ^
>     1 error generated.
> 
> This series is based on commit b3235e8635e1 ("drm/amd/display: clean up
> some inconsistent indentings"). These warnings are fatal for
> allmodconfig due to CONFIG_WERROR so ideally, I would like to see these
> patches cherry-picked to a branch targeting mainline to allow our builds
> to go back to green. However, since this series is not exactly trivial
> in size, I can understand not wanting to apply these to mainline during
> the -rc cycle. If they cannot be cherry-picked to mainline, I can add a
> patch raising the value of -Wframe-larger-than for these files that can
> be cherry-picked to 6.0/mainline then add a revert of that change as the
> last patch in the stack so everything goes back to normal for -next/6.1.
> I am open to other options though!
> 
> I have built this series against clang 16.0.0 (ToT) and GCC 12.2.0 for
> x86_64. It has seen no runtime testing, as my only test system with AMD
> graphics is a Renoir one, which as far as I understand it uses DCN 2.1.
> 
> Nathan Chancellor (5):
>   drm/amd/display: Reduce number of arguments of
>     dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
>   drm/amd/display: Reduce number of arguments of
>     dml32_CalculatePrefetchSchedule()
>   drm/amd/display: Reduce number of arguments of dml31's
>     CalculateWatermarksAndDRAMSpeedChangeSupport()
>   drm/amd/display: Reduce number of arguments of dml31's
>     CalculateFlipSchedule()
>   drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack
>     usage
> 
>  .../dc/dml/dcn30/display_mode_vba_30.c        |   2 +-
>  .../dc/dml/dcn31/display_mode_vba_31.c        | 420 +++++-------------
>  .../dc/dml/dcn32/display_mode_vba_32.c        | 236 +++-------
>  .../dc/dml/dcn32/display_mode_vba_util_32.c   | 323 ++++++--------
>  .../dc/dml/dcn32/display_mode_vba_util_32.h   |  51 +--
>  5 files changed, 318 insertions(+), 714 deletions(-)
> 
> 
> base-commit: b3235e8635e1dd7ac1a27a73330e9880dfe05154
