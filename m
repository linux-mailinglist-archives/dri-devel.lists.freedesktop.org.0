Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD4715353
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 03:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4596010E31D;
	Tue, 30 May 2023 01:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8110E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 01:58:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVbBp3YVbz4x2c;
 Tue, 30 May 2023 11:57:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1685411875;
 bh=F4lGD1/qKcCBYCrQ7p5cZ8cJZ8QFNHvhrDk22QJDn7c=;
 h=Date:From:To:Cc:Subject:From;
 b=soa0HbXzRLHOCK7pYNUw3wzZ77a4t4M4+0TVLqLFRreQa2DW2sx2U+tAPLdCbgGjj
 wKpAZfNVY2f0vqHBzdfWhAm+azgXqW9gBOY2DhLdjdL/ARoHx0C/Nz+DMTt/1GJ0Lh
 XMvf7EAvLVy2Je57xaOTu4gdA3XkfZ44UNmXikWhMCdXIso7Hqy4n4VjgGXjhpwM7i
 FboT0C7M2aUsQbRsyciOquUCM3PGG6b5GAGAosmA2xRfS5XLTOmh6B4IbpiWw/FM31
 u42BndVNbLsKNz7Miv4tV8kZRtd9UZTHGH2PiiQGkxpWPrP6PSTZCdxrDcQSkXtI7k
 ZEhnarHD5FCRw==
Date: Tue, 30 May 2023 11:57:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20230530115752.14f0f1b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/80HTALxCF.GMDcmyyet5Nn4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Fei Yang <fei.yang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/80HTALxCF.GMDcmyyet5Nn4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_pci.c

between commit:

  5e352e32aec2 ("drm/i915: preparation for using PAT index")

from the drm tree and commits:

  5af5169d7582 ("drm/i915: Convert INTEL_INFO()->display to a pointer")
  18e0deeed8c8 ("drm/i915/display: Move display runtime info to display str=
ucture")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pci.c
index 75cbccd1a441,34bc732a6375..000000000000
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@@ -27,9 -27,9 +27,10 @@@
  #include <drm/i915_pciids.h>
 =20
  #include "display/intel_display.h"
+ #include "display/intel_display_driver.h"
  #include "gt/intel_gt_regs.h"
  #include "gt/intel_sa_media.h"
 +#include "gem/i915_gem_object_types.h"
 =20
  #include "i915_driver.h"
  #include "i915_drv.h"
@@@ -40,162 -40,8 +41,40 @@@
  #define PLATFORM(x) .platform =3D (x)
  #define GEN(x) \
  	.__runtime.graphics.ip.ver =3D (x), \
- 	.__runtime.media.ip.ver =3D (x), \
- 	.__runtime.display.ip.ver =3D (x)
-=20
- #define NO_DISPLAY .__runtime.pipe_mask =3D 0
-=20
- #define I845_PIPE_OFFSETS \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET,	\
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 	}
-=20
- #define I9XX_PIPE_OFFSETS \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET,	\
- 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
- 	}
-=20
- #define IVB_PIPE_OFFSETS \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET,	\
- 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
- 		[TRANSCODER_C] =3D PIPE_C_OFFSET, \
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
- 		[TRANSCODER_C] =3D TRANSCODER_C_OFFSET, \
- 	}
-=20
- #define HSW_PIPE_OFFSETS \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET,	\
- 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
- 		[TRANSCODER_C] =3D PIPE_C_OFFSET, \
- 		[TRANSCODER_EDP] =3D PIPE_EDP_OFFSET, \
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
- 		[TRANSCODER_C] =3D TRANSCODER_C_OFFSET, \
- 		[TRANSCODER_EDP] =3D TRANSCODER_EDP_OFFSET, \
- 	}
-=20
- #define CHV_PIPE_OFFSETS \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET, \
- 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
- 		[TRANSCODER_C] =3D CHV_PIPE_C_OFFSET, \
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
- 		[TRANSCODER_C] =3D CHV_TRANSCODER_C_OFFSET, \
- 	}
-=20
- #define I845_CURSOR_OFFSETS \
- 	.display.cursor_offsets =3D { \
- 		[PIPE_A] =3D CURSOR_A_OFFSET, \
- 	}
-=20
- #define I9XX_CURSOR_OFFSETS \
- 	.display.cursor_offsets =3D { \
- 		[PIPE_A] =3D CURSOR_A_OFFSET, \
- 		[PIPE_B] =3D CURSOR_B_OFFSET, \
- 	}
-=20
- #define CHV_CURSOR_OFFSETS \
- 	.display.cursor_offsets =3D { \
- 		[PIPE_A] =3D CURSOR_A_OFFSET, \
- 		[PIPE_B] =3D CURSOR_B_OFFSET, \
- 		[PIPE_C] =3D CHV_CURSOR_C_OFFSET, \
- 	}
-=20
- #define IVB_CURSOR_OFFSETS \
- 	.display.cursor_offsets =3D { \
- 		[PIPE_A] =3D CURSOR_A_OFFSET, \
- 		[PIPE_B] =3D IVB_CURSOR_B_OFFSET, \
- 		[PIPE_C] =3D IVB_CURSOR_C_OFFSET, \
- 	}
-=20
- #define TGL_CURSOR_OFFSETS \
- 	.display.cursor_offsets =3D { \
- 		[PIPE_A] =3D CURSOR_A_OFFSET, \
- 		[PIPE_B] =3D IVB_CURSOR_B_OFFSET, \
- 		[PIPE_C] =3D IVB_CURSOR_C_OFFSET, \
- 		[PIPE_D] =3D TGL_CURSOR_D_OFFSET, \
- 	}
-=20
- #define I845_COLORS \
- 	.display.color =3D { .gamma_lut_size =3D 256 }
- #define I9XX_COLORS \
- 	.display.color =3D { .gamma_lut_size =3D 129, \
- 		   .gamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING, \
- 	}
- #define ILK_COLORS \
- 	.display.color =3D { .gamma_lut_size =3D 1024 }
- #define IVB_COLORS \
- 	.display.color =3D { .degamma_lut_size =3D 1024, .gamma_lut_size =3D 102=
4 }
- #define CHV_COLORS \
- 	.display.color =3D { \
- 		.degamma_lut_size =3D 65, .gamma_lut_size =3D 257, \
- 		.degamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING, \
- 		.gamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING, \
- 	}
- #define GLK_COLORS \
- 	.display.color =3D { \
- 		.degamma_lut_size =3D 33, .gamma_lut_size =3D 1024, \
- 		.degamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING | \
- 				     DRM_COLOR_LUT_EQUAL_CHANNELS, \
- 	}
- #define ICL_COLORS \
- 	.display.color =3D { \
- 		.degamma_lut_size =3D 33, .gamma_lut_size =3D 262145, \
- 		.degamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING | \
- 				     DRM_COLOR_LUT_EQUAL_CHANNELS, \
- 		.gamma_lut_tests =3D DRM_COLOR_LUT_NON_DECREASING, \
- 	}
+ 	.__runtime.media.ip.ver =3D (x)
 =20
 +#define LEGACY_CACHELEVEL \
 +	.cachelevel_to_pat =3D { \
 +		[I915_CACHE_NONE]   =3D 0, \
 +		[I915_CACHE_LLC]    =3D 1, \
 +		[I915_CACHE_L3_LLC] =3D 2, \
 +		[I915_CACHE_WT]     =3D 3, \
 +	}
 +
 +#define TGL_CACHELEVEL \
 +	.cachelevel_to_pat =3D { \
 +		[I915_CACHE_NONE]   =3D 3, \
 +		[I915_CACHE_LLC]    =3D 0, \
 +		[I915_CACHE_L3_LLC] =3D 0, \
 +		[I915_CACHE_WT]     =3D 2, \
 +	}
 +
 +#define PVC_CACHELEVEL \
 +	.cachelevel_to_pat =3D { \
 +		[I915_CACHE_NONE]   =3D 0, \
 +		[I915_CACHE_LLC]    =3D 3, \
 +		[I915_CACHE_L3_LLC] =3D 3, \
 +		[I915_CACHE_WT]     =3D 2, \
 +	}
 +
 +#define MTL_CACHELEVEL \
 +	.cachelevel_to_pat =3D { \
 +		[I915_CACHE_NONE]   =3D 2, \
 +		[I915_CACHE_LLC]    =3D 3, \
 +		[I915_CACHE_L3_LLC] =3D 3, \
 +		[I915_CACHE_WT]     =3D 1, \
 +	}
 +
  /* Keep in gen based order, and chronological order within a gen */
 =20
  #define GEN_DEFAULT_PAGE_SIZES \
@@@ -221,13 -61,8 +94,10 @@@
  	.has_snoop =3D true, \
  	.has_coherent_ggtt =3D false, \
  	.dma_mask_size =3D 32, \
 +	.max_pat_index =3D 3, \
- 	I9XX_PIPE_OFFSETS, \
- 	I9XX_CURSOR_OFFSETS, \
- 	I9XX_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  #define I845_FEATURES \
  	GEN(2), \
@@@ -244,13 -74,8 +109,10 @@@
  	.has_snoop =3D true, \
  	.has_coherent_ggtt =3D false, \
  	.dma_mask_size =3D 32, \
 +	.max_pat_index =3D 3, \
- 	I845_PIPE_OFFSETS, \
- 	I845_CURSOR_OFFSETS, \
- 	I845_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  static const struct intel_device_info i830_info =3D {
  	I830_FEATURES,
@@@ -285,13 -105,8 +142,10 @@@ static const struct intel_device_info i
  	.has_snoop =3D true, \
  	.has_coherent_ggtt =3D true, \
  	.dma_mask_size =3D 32, \
 +	.max_pat_index =3D 3, \
- 	I9XX_PIPE_OFFSETS, \
- 	I9XX_CURSOR_OFFSETS, \
- 	I9XX_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  static const struct intel_device_info i915g_info =3D {
  	GEN3_FEATURES,
@@@ -379,13 -166,8 +205,10 @@@ static const struct intel_device_info p
  	.has_snoop =3D true, \
  	.has_coherent_ggtt =3D true, \
  	.dma_mask_size =3D 36, \
 +	.max_pat_index =3D 3, \
- 	I9XX_PIPE_OFFSETS, \
- 	I9XX_CURSOR_OFFSETS, \
- 	I9XX_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  static const struct intel_device_info i965g_info =3D {
  	GEN4_FEATURES,
@@@ -435,13 -208,8 +249,10 @@@ static const struct intel_device_info g
  	/* ilk does support rc6, but we do not implement [power] contexts */ \
  	.has_rc6 =3D 0, \
  	.dma_mask_size =3D 36, \
 +	.max_pat_index =3D 3, \
- 	I9XX_PIPE_OFFSETS, \
- 	I9XX_CURSOR_OFFSETS, \
- 	ILK_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  static const struct intel_device_info ilk_d_info =3D {
  	GEN5_FEATURES,
@@@ -471,15 -234,10 +277,12 @@@ static const struct intel_device_info i
  	.has_rc6p =3D 0, \
  	.has_rps =3D true, \
  	.dma_mask_size =3D 40, \
 +	.max_pat_index =3D 3, \
  	.__runtime.ppgtt_type =3D INTEL_PPGTT_ALIASING, \
  	.__runtime.ppgtt_size =3D 31, \
- 	I9XX_PIPE_OFFSETS, \
- 	I9XX_CURSOR_OFFSETS, \
- 	ILK_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  #define SNB_D_PLATFORM \
  	GEN6_FEATURES, \
@@@ -526,15 -280,10 +325,12 @@@ static const struct intel_device_info s
  	.has_reset_engine =3D true, \
  	.has_rps =3D true, \
  	.dma_mask_size =3D 40, \
 +	.max_pat_index =3D 3, \
  	.__runtime.ppgtt_type =3D INTEL_PPGTT_ALIASING, \
  	.__runtime.ppgtt_size =3D 31, \
- 	IVB_PIPE_OFFSETS, \
- 	IVB_CURSOR_OFFSETS, \
- 	IVB_COLORS, \
  	GEN_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  #define IVB_D_PLATFORM \
  	GEN7_FEATURES, \
@@@ -585,22 -331,14 +378,16 @@@ static const struct intel_device_info v
  	.has_rc6 =3D 1,
  	.has_reset_engine =3D true,
  	.has_rps =3D true,
- 	.display.has_gmch =3D 1,
- 	.display.has_hotplug =3D 1,
  	.dma_mask_size =3D 40,
 +	.max_pat_index =3D 3,
  	.__runtime.ppgtt_type =3D INTEL_PPGTT_ALIASING,
  	.__runtime.ppgtt_size =3D 31,
  	.has_snoop =3D true,
  	.has_coherent_ggtt =3D false,
  	.__runtime.platform_engine_mask =3D BIT(RCS0) | BIT(VCS0) | BIT(BCS0),
- 	.display.mmio_offset =3D VLV_DISPLAY_BASE,
- 	I9XX_PIPE_OFFSETS,
- 	I9XX_CURSOR_OFFSETS,
- 	I9XX_COLORS,
  	GEN_DEFAULT_PAGE_SIZES,
  	GEN_DEFAULT_REGIONS,
 +	LEGACY_CACHELEVEL,
  };
 =20
  #define G75_FEATURES  \
@@@ -686,21 -415,14 +464,16 @@@ static const struct intel_device_info c
  	.has_rc6 =3D 1,
  	.has_rps =3D true,
  	.has_logical_ring_contexts =3D 1,
- 	.display.has_gmch =3D 1,
  	.dma_mask_size =3D 39,
 +	.max_pat_index =3D 3,
  	.__runtime.ppgtt_type =3D INTEL_PPGTT_FULL,
  	.__runtime.ppgtt_size =3D 32,
  	.has_reset_engine =3D 1,
  	.has_snoop =3D true,
  	.has_coherent_ggtt =3D false,
- 	.display.mmio_offset =3D VLV_DISPLAY_BASE,
- 	CHV_PIPE_OFFSETS,
- 	CHV_CURSOR_OFFSETS,
- 	CHV_COLORS,
  	GEN_DEFAULT_PAGE_SIZES,
  	GEN_DEFAULT_REGIONS,
 +	LEGACY_CACHELEVEL,
  };
 =20
  #define GEN9_DEFAULT_PAGE_SIZES \
@@@ -781,14 -482,8 +533,10 @@@ static const struct intel_device_info s
  	.has_reset_engine =3D 1, \
  	.has_snoop =3D true, \
  	.has_coherent_ggtt =3D false, \
- 	.display.has_ipc =3D 1, \
 +	.max_pat_index =3D 3, \
- 	HSW_PIPE_OFFSETS, \
- 	IVB_CURSOR_OFFSETS, \
- 	IVB_COLORS, \
  	GEN9_DEFAULT_PAGE_SIZES, \
 -	GEN_DEFAULT_REGIONS
 +	GEN_DEFAULT_REGIONS, \
 +	LEGACY_CACHELEVEL
 =20
  static const struct intel_device_info bxt_info =3D {
  	GEN9_LP_FEATURES,
@@@ -920,33 -587,8 +640,9 @@@ static const struct intel_device_info j
  #define GEN12_FEATURES \
  	GEN11_FEATURES, \
  	GEN(12), \
- 	.display.abox_mask =3D GENMASK(2, 1), \
- 	.__runtime.pipe_mask =3D BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(P=
IPE_D), \
- 	.__runtime.cpu_transcoder_mask =3D BIT(TRANSCODER_A) | BIT(TRANSCODER_B)=
 | \
- 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
- 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
- 	.display.pipe_offsets =3D { \
- 		[TRANSCODER_A] =3D PIPE_A_OFFSET, \
- 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
- 		[TRANSCODER_C] =3D PIPE_C_OFFSET, \
- 		[TRANSCODER_D] =3D PIPE_D_OFFSET, \
- 		[TRANSCODER_DSI_0] =3D PIPE_DSI0_OFFSET, \
- 		[TRANSCODER_DSI_1] =3D PIPE_DSI1_OFFSET, \
- 	}, \
- 	.display.trans_offsets =3D { \
- 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
- 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
- 		[TRANSCODER_C] =3D TRANSCODER_C_OFFSET, \
- 		[TRANSCODER_D] =3D TRANSCODER_D_OFFSET, \
- 		[TRANSCODER_DSI_0] =3D TRANSCODER_DSI0_OFFSET, \
- 		[TRANSCODER_DSI_1] =3D TRANSCODER_DSI1_OFFSET, \
- 	}, \
- 	TGL_CURSOR_OFFSETS, \
- 	TGL_CACHELEVEL, \
++	.max_pat_index =3D 3 \
  	.has_global_mocs =3D 1, \
- 	.has_pxp =3D 1, \
- 	.display.has_dsb =3D 1, \
- 	.max_pat_index =3D 3
+ 	.has_pxp =3D 1
 =20
  static const struct intel_device_info tgl_info =3D {
  	GEN12_FEATURES,
@@@ -1162,24 -739,14 +795,16 @@@ static const struct intel_device_info p
  	.__runtime.graphics.ip.rel =3D 60,
  	.__runtime.media.ip.rel =3D 60,
  	PLATFORM(INTEL_PONTEVECCHIO),
- 	NO_DISPLAY,
  	.has_flat_ccs =3D 0,
 +	.max_pat_index =3D 7,
  	.__runtime.platform_engine_mask =3D
  		BIT(BCS0) |
  		BIT(VCS0) |
  		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
  	.require_force_probe =3D 1,
 +	PVC_CACHELEVEL,
  };
 =20
- #define XE_LPDP_FEATURES	\
- 	XE_LPD_FEATURES,	\
- 	.__runtime.display.ip.ver =3D 14,	\
- 	.display.has_cdclk_crawl =3D 1, \
- 	.display.has_cdclk_squash =3D 1, \
- 	.__runtime.fbc_mask =3D BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
-=20
  static const struct intel_gt_definition xelpmp_extra_gt[] =3D {
  	{
  		.type =3D GT_MEDIA,

--Sig_/80HTALxCF.GMDcmyyet5Nn4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR1WCAACgkQAVBC80lX
0GwDCQgAkCIOWxrmIQ+J0WNx8ZK+Uqt9GT8oUhlI7TPuB0Fhq190TvFJfP6XaVM8
KFJPy1HHhB0NJP6+V9Tp+azF0IzTYsTSUFBgz0chjEAFFkxtQkT8SEKXdYLv635w
L5+TxTYOa0mn93Yhsj0NVxh1MPUfWcK4YiTMbbyJSXKIXJnv2R8r1Hm0/qgwH+ao
nnGj+CRQiDuct55d78virIXbK9VjQX6uSUy+q3rrnDWLm3MqhaauFfuu0BRrpzFJ
WzZQTOWpyRTqUgRhfoZ+O3WDx4NqqG6MTYmcWjiIRQlfdjn4B7CktvG+jrmVYroL
ZDBM0Jw1jWC2hzbcr/Sow4Z1LM1D7g==
=HB54
-----END PGP SIGNATURE-----

--Sig_/80HTALxCF.GMDcmyyet5Nn4--
