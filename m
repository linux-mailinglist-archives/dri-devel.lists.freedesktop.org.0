Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601EC8230B4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 16:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924A710E050;
	Wed,  3 Jan 2024 15:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DA710E050;
 Wed,  3 Jan 2024 15:41:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5E09601D5;
 Wed,  3 Jan 2024 15:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20BDC433C8;
 Wed,  3 Jan 2024 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1704296474;
 bh=aEJnG2VlNw6NSwF4y8+XKqOc5IR7JWeAEFNGBBFHiLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLFtTi2a/GL9P10mlSrOO9kHj1j77DENeV6ovGrlwE/FViNfIXSzY5oysBG1YO3mw
 lLisUCDB9n5oR6mngtgnlHotZXcb8M6Bc90NgQ1r5GqDpCBfHv4dQeONFGbpYU2G5X
 rLkaSRCCnpKPyP5hBCoZgHmTmb8muTuAgIXifoMk=
Date: Wed, 3 Jan 2024 16:41:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [RFC PATCH] drm/amd/display: fix bandwidth validation failure on
 DCN 2.1
Message-ID: <2024010301-diameter-debatable-ec3b@gregkh>
References: <20231229163821.144599-1-mwen@igalia.com>
 <e8d478fe-a66b-4165-b2bc-ca5b263034c5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8d478fe-a66b-4165-b2bc-ca5b263034c5@amd.com>
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
Cc: kernel-dev@igalia.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 09:44:18AM -0500, Hamza Mahfooz wrote:
> On 12/29/23 11:25, Melissa Wen wrote:
> > IGT `amdgpu/amd_color/crtc-lut-accuracy` fails right at the beginning of
> > the test execution, during atomic check, because DC rejects the
> > bandwidth state for a fb sizing 64x64. The test was previously working
> > with the deprecated dc_commit_state(). Now using
> > dc_validate_with_context() approach, the atomic check needs to perform a
> > full state validation. Therefore, set fast_validation to false in the
> > dc_validate_global_state call for atomic check.
> > 
> > Fixes: b8272241ff9d ("drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams")
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> > 
> > Hi,
> > 
> > It's a long story. I was inspecting this bug report:
> > - https://gitlab.freedesktop.org/drm/amd/-/issues/2016
> > and noticed the IGT test `igt@amdgpu/amd_color@crtc-lut-accuracy`
> > mentioned there wasn't even being executed on a laptop with DCN 2.1
> > (HP HP ENVY x360 Convertible 13-ay1xxx/8929). The test fails right at
> > the beginning due to an atomic check rejection, as below:
> > 
> > Starting subtest: crtc-lut-accuracy
> > (amd_color:14772) igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:4530:
> > (amd_color:14772) igt_kms-CRITICAL: Failed assertion: ret == 0
> > (amd_color:14772) igt_kms-CRITICAL: Last errno: 22, Invalid argument
> > (amd_color:14772) igt_kms-CRITICAL: error: -22 != 0
> > Stack trace:
> >    #0 ../lib/igt_core.c:1989 __igt_fail_assert()
> >    #1 [igt_display_commit_atomic+0x44]
> >    #2 ../tests/amdgpu/amd_color.c:159 __igt_unique____real_main395()
> >    #3 ../tests/amdgpu/amd_color.c:395 main()
> >    #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
> >    #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> >    #6 [_start+0x21]
> > Subtest crtc-lut-accuracy failed.
> > 
> > Checking dmesg, we can see that a bandwidth validation failure causes
> > the atomic check rejection:
> > 
> > [  711.147663] amdgpu 0000:04:00.0: [drm] Mode Validation Warning: Unknown Status failed validation.
> > [  711.147667] [drm:amdgpu_dm_atomic_check [amdgpu]] DC global validation failure: Bandwidth validation failure (BW and Watermark) (13)
> > [  711.147772] [drm:amdgpu_irq_dispatch [amdgpu]] Unregistered interrupt src_id: 243 of client_id:8
> > [  711.148033] [drm:amdgpu_dm_atomic_check [amdgpu]] Atomic check failed with err: -22
> > 
> > I also noticed that the atomic check doesn't fail if I change the fb
> > width and height used in the test from 64 to 66, and I can get the test
> > execution back (and with success). However, I recall that all test cases
> > of IGT `amd_color` were working in the past, so I bisected and found the
> > first bad commit:
> > 
> > b8272241ff9d drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams
> > 
> > Bringing the `dc_commit_state` machinery back also prevents the
> > bandwidth validation failure, but the commit above says
> > dc_commit_streams validation is more complete than dc_commit_state, so I
> > discarded this approach.
> > 
> > After some debugging and code inspection, I found out that avoiding fast
> > validation on dc_validate_global_state during atomic check solves the
> > issue, but I'm not sure if this change may affect performance. I
> > compared exec time of some IGT tests and didn't see any differences, but
> > I recognize it doesn't provide enough evidence.
> > 
> > What do you think about this change? Should I examine other things? Do
> > you see any potential issue that I should investigate? Could you
> > recommend a better approach to assess any side-effect of not enabling
> > fast validation in the atomic check?
> > 
> > Please, let me know your thoughts.
> 
> We shouldn't be doing fast updates when lock_and_validation_needed is
> true, so this seems to be correct.
> 
> Which is to say, applied, thanks!
> 
> Cc: stable@vger.kernel.org

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
