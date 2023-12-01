Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D9801220
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 18:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBD210E915;
	Fri,  1 Dec 2023 17:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB810E901;
 Fri,  1 Dec 2023 17:59:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0936CE27AF;
 Fri,  1 Dec 2023 17:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A494C433C8;
 Fri,  1 Dec 2023 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701453582;
 bh=3dXR8wL3fR9bSemkvvqodZiJJVT4and4PNMjIPPenY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uR+T4GoC4D7Q0aufVDe9ekcSR3mFWG/5dO5W3BtOWkNPTeAUDLaE8aoLIcymGC2u1
 camLgMKe/f/SHi2fgFcJLfAVwnlTsZjYIXc5CCJ13g+F9XMMecZ5E3g16WFVYDrre9
 dYodgDuiOin7OayOTsmLVe68y4nVGlzzbu9/QYuEWSjRCQiiEstDTnaiAss3+7EneN
 JIBoO0SBRWFQ3/RF127oMlsIMwfV4f3elNamgORdVaSkvNahbBPa+Ue0Oq//Ew9N3w
 1H02Za7MOsX9nHP/oYVJpysvpE3t0QP+Ec/Q6RorH4404nyTacACU9FHHYxb9Q2SDm
 HuCgR/7r9Dbiw==
Date: Fri, 1 Dec 2023 10:59:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
Message-ID: <20231201175939.GA231094@dev-arch.thelio-3990X>
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
 <874jh362ta.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jh362ta.fsf@intel.com>
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 10:52:17AM +0200, Jani Nikula wrote:
> On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> > Cc: Nathan Chancellor <nathan@kernel.org>
> >
> > On 11/29/23 13:12, Jani Nikula wrote:
> >> At least the i915 and amd drivers enable a bunch more compiler warnings
> >> than the kernel defaults.
> >> 
> >> Extend the W=1 warnings to the entire drm subsystem by default. Use the
> >> copy-pasted warnings from scripts/Makefile.extrawarn with
> >> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
> >> up with them in the future.
> >> 
> >> This is similar to the approach currently used in i915.
> >> 
> >> Some of the -Wextra warnings do need to be disabled, just like in
> >> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> >> builds, depending on the warning.
> >
> > I think this should go in after drm-misc-next has a clean build (for
> > COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
> > lot of build configs.
> 
> Oh, I'm absolutely not suggesting this should be merged before known
> warnings have been addressed one way or another. Either by fixing them
> or by disabling said warning in driver local Makefiles, depending on the
> case.
> 
> While I'm suggesting this, I obviously (I hope) can't take on fixing all
> the warnings this exposes. One way to scale would be for folks to apply
> this locally, see what it uncovers in their drivers, and fix some.
> 
> As an intermediate step we might also apply this to a topic branch in
> drm-tip, so you'd see the warnings when building drm-tip, but not in
> indidual branches or in anything that's merged upstream.

For what it's worth, I ran this through my personal build matrix with
LLVM/clang and it only found a few instances of
-Wunused-but-set-variable:

drivers/gpu/drm/mediatek/mtk_disp_gamma.c:121:6: warning: variable 'cfg_val' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/nouveau/nouveau_svm.c:115:24: warning: variable 'priority' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/qxl/qxl_cmd.c:424:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: warning: variable 'num_relocs' set but not used [-Wunused-but-set-variable]

I know that clang does not support all the warnings that are being
enabled here but I suspect there won't be too many instances of the
other warnings. -Wformat-overflow and -Wformat-truncation might be the
big ones. I know -Wstringop-overflow is being turned on globally
in -next so that is one that you shouldn't have to worry much about.

Cheers,
Nathan
