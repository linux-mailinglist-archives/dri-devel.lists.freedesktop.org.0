Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77473BB8FD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 10:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94EB89A77;
	Mon,  5 Jul 2021 08:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C4A89A77
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 08:21:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="294585663"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="294585663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 01:21:30 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="485423753"
Received: from elang-mobl.ger.corp.intel.com (HELO localhost) ([10.252.59.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 01:21:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com
Subject: Re: drm: screen stuck since commit f611b1e7624c: drm: Avoid circular
 dependencies for CONFIG_FB
In-Reply-To: <YODLGdC73lLPpTL3@Red>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YODLGdC73lLPpTL3@Red>
Date: Mon, 05 Jul 2021 11:21:22 +0300
Message-ID: <87lf6l9nnh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 03 Jul 2021, Corentin Labbe <clabbe.montjoie@gmail.com> wrote:
> Hello
>
> On next-20210701, my screen is stuck (see attached photo).
> I bisect the problem to:
> git bisect start
> # good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
> git bisect good 62fb9874f5da54fdb243003b386128037319b219
> # bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific files for 20210701
> git bisect bad fb0ca446157a86b75502c1636b0d81e642fe6bf1
> # good: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking branch 'rdma/for-next'
> git bisect good f63c4fda987a19b1194cc45cb72fd5bf968d9d90
> # bad: [49c8769be0b910d4134eba07cae5d9c71b861c4a] Merge remote-tracking branch 'drm/drm-next'
> git bisect bad 49c8769be0b910d4134eba07cae5d9c71b861c4a
> # good: [4e3db44a242a4e2afe33b59793898ecbb61d478e] Merge tag 'wireless-drivers-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next
> git bisect good 4e3db44a242a4e2afe33b59793898ecbb61d478e
> # good: [5745d647d5563d3e9d32013ad4e5c629acff04d7] Merge tag 'amd-drm-next-5.14-2021-06-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect good 5745d647d5563d3e9d32013ad4e5c629acff04d7
> # bad: [8fe44c080a53ac0ccbe88053a2e40f9acca33091] drm/amdgpu/display: fold DRM_AMD_DC_DCN3_1 into DRM_AMD_DC_DCN
> git bisect bad 8fe44c080a53ac0ccbe88053a2e40f9acca33091
> # good: [2c1b1ac7084edf477309d27c02d9da7f79b33cec] drm/amdgpu/vcn: drop gfxoff control for VCN2+
> git bisect good 2c1b1ac7084edf477309d27c02d9da7f79b33cec
> # good: [2c1b1ac7084edf477309d27c02d9da7f79b33cec] drm/amdgpu/vcn: drop gfxoff control for VCN2+
> git bisect good 2c1b1ac7084edf477309d27c02d9da7f79b33cec
> # bad: [d4c9b03ff6a9914b55e4e23fcac11339a2706cc6] drm/amd/pm: Add renoir throttler translation
> git bisect bad d4c9b03ff6a9914b55e4e23fcac11339a2706cc6
> # bad: [691cf8cd7a531dbfcc29d09a23c509a86fd9b24f] drm/amdgpu: use correct rounding macro for 64-bit
> git bisect bad 691cf8cd7a531dbfcc29d09a23c509a86fd9b24f
> # bad: [2fdcb55dfc86835e4845e3f422180b5596d23cb4] drm/amdkfd: use resource cursor in svm_migrate_copy_to_vram v2
> git bisect bad 2fdcb55dfc86835e4845e3f422180b5596d23cb4
> # bad: [6c3f953381e526a1623d4575660afae8b19ffa20] drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
> git bisect bad 6c3f953381e526a1623d4575660afae8b19ffa20
> # bad: [5ea4dba68305d9648b9dba30036cc36d4e877bca] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
> git bisect bad 5ea4dba68305d9648b9dba30036cc36d4e877bca
> # good: [4a888ba03fd97d1cb0253581973533965bf348c4] drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc format
> git bisect good 4a888ba03fd97d1cb0253581973533965bf348c4
> # good: [c5ef15ae09637fb51ae43e1d1d98329d67dd4fd6] video: fbdev: atyfb: mach64_cursor.c: deleted the repeated word
> git bisect good c5ef15ae09637fb51ae43e1d1d98329d67dd4fd6
> # bad: [f611b1e7624ccdbd495c19e9805629e22265aa16] drm: Avoid circular dependencies for CONFIG_FB
> git bisect bad f611b1e7624ccdbd495c19e9805629e22265aa16
> # good: [ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383] video: fbdev: mb862xx: use DEVICE_ATTR_RO macro
> git bisect good ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383
> # first bad commit: [f611b1e7624ccdbd495c19e9805629e22265aa16] drm: Avoid circular dependencies for CONFIG_FB
>
> reverting ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383 lead to a correct boot (I got a viewable login prompt).

I presume that's a copy-paste error, and you mean
f611b1e7624ccdbd495c19e9805629e22265aa16, the first bad commit, i.e.

commit f611b1e7624ccdbd495c19e9805629e22265aa16
Author: Kees Cook <keescook@chromium.org>
Date:   Wed Jun 2 14:52:50 2021 -0700

    drm: Avoid circular dependencies for CONFIG_FB

> So ff323d6d72e1 cause this config change when compiling my defconfig:
> --- config.fbok	2021-07-03 21:31:08.527260693 +0200
> +++ config.fbko	2021-07-03 21:39:51.604275703 +0200
> -CONFIG_VT_HW_CONSOLE_BINDING=y
> +# CONFIG_VT_HW_CONSOLE_BINDING is not set
> -CONFIG_DRM_FBDEV_EMULATION=y
> -CONFIG_DRM_FBDEV_OVERALLOC=100
> -CONFIG_FB_NOTIFY=y
> -CONFIG_FB=y
> -# CONFIG_FIRMWARE_EDID is not set
> -CONFIG_FB_CFB_FILLRECT=y
> -CONFIG_FB_CFB_COPYAREA=y
> -CONFIG_FB_CFB_IMAGEBLIT=y
> -CONFIG_FB_SYS_FILLRECT=y
> -CONFIG_FB_SYS_COPYAREA=y
> -CONFIG_FB_SYS_IMAGEBLIT=y
> -# CONFIG_FB_FOREIGN_ENDIAN is not set
> -CONFIG_FB_SYS_FOPS=y
> -CONFIG_FB_DEFERRED_IO=y
> -CONFIG_FB_MODE_HELPERS=y
> -CONFIG_FB_TILEBLITTING=y
> -
> -#
> -# Frame buffer hardware drivers
> -#
> -# CONFIG_FB_CIRRUS is not set
> -# CONFIG_FB_PM2 is not set
> -# CONFIG_FB_CYBER2000 is not set
> -# CONFIG_FB_ARC is not set
> -# CONFIG_FB_ASILIANT is not set
> -# CONFIG_FB_IMSTT is not set
> -# CONFIG_FB_VGA16 is not set
> -# CONFIG_FB_UVESA is not set
> -# CONFIG_FB_VESA is not set
> -CONFIG_FB_EFI=y
> -# CONFIG_FB_N411 is not set
> -# CONFIG_FB_HGA is not set
> -# CONFIG_FB_OPENCORES is not set
> -# CONFIG_FB_S1D13XXX is not set
> -# CONFIG_FB_NVIDIA is not set
> -# CONFIG_FB_RIVA is not set
> -# CONFIG_FB_I740 is not set
> -# CONFIG_FB_LE80578 is not set
> -# CONFIG_FB_MATROX is not set
> -# CONFIG_FB_RADEON is not set
> -# CONFIG_FB_ATY128 is not set
> -# CONFIG_FB_ATY is not set
> -# CONFIG_FB_S3 is not set
> -# CONFIG_FB_SAVAGE is not set
> -# CONFIG_FB_SIS is not set
> -# CONFIG_FB_NEOMAGIC is not set
> -# CONFIG_FB_KYRO is not set
> -# CONFIG_FB_3DFX is not set
> -# CONFIG_FB_VOODOO1 is not set
> -# CONFIG_FB_VT8623 is not set
> -# CONFIG_FB_TRIDENT is not set
> -# CONFIG_FB_ARK is not set
> -# CONFIG_FB_PM3 is not set
> -# CONFIG_FB_CARMINE is not set
> -# CONFIG_FB_SMSCUFX is not set
> -# CONFIG_FB_UDL is not set
> -# CONFIG_FB_IBM_GXT4500 is not set
> -# CONFIG_FB_VIRTUAL is not set
> -# CONFIG_FB_METRONOME is not set
> -# CONFIG_FB_MB862XX is not set
> -# CONFIG_FB_SIMPLE is not set
> -# CONFIG_FB_SM712 is not set
> +# CONFIG_FB is not set
> -CONFIG_FRAMEBUFFER_CONSOLE=y
> -CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> -# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
> -# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> -
> -CONFIG_LOGO=y
> -# CONFIG_LOGO_LINUX_MONO is not set
> -# CONFIG_LOGO_LINUX_VGA16 is not set
> -CONFIG_LOGO_LINUX_CLUT224=y
> -# CONFIG_FB_SM750 is not set
> -# CONFIG_FONTS is not set
> -CONFIG_FONT_8x8=y
> +CONFIG_FONT_AUTOSELECT=y
>
> Adding CONFIG_FB to my defconfig fix also my boot.

Then you should do that. It's not like kconfig is UABI.

> But I still dont understand why the absence of CONFIG_FB led my screen stuck like this.

That's another question, and one uncovered, not caused, by the kconfig
change.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
