Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC6C2BD6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 04:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B389FDB;
	Tue,  1 Oct 2019 02:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B432789FD9;
 Tue,  1 Oct 2019 02:18:34 +0000 (UTC)
Received: from [10.0.0.153] (unknown [173.243.43.162])
 (Authenticated sender: martin.peres)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5E4E57802C5;
 Tue,  1 Oct 2019 02:18:24 +0000 (UTC)
Subject: Re: [PATCH i-g-t] tests/kms_crtc_background_color: overhaul to match
 upstream ABI (v5.1)
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org
References: <20190930224707.14904-1-matthew.d.roper@intel.com>
 <20190930231305.16488-1-matthew.d.roper@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <ff5d6177-b8a8-1459-efe1-9a0728795a2c@free.fr>
Date: Mon, 30 Sep 2019 22:18:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930231305.16488-1-matthew.d.roper@intel.com>
Content-Type: multipart/mixed; boundary="------------818AB5D06C66F58AD0DF79B7"
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

This is a multi-part message in MIME format.
--------------818AB5D06C66F58AD0DF79B7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/09/2019 19:13, Matt Roper wrote:
> CRTC background color kernel patches were written about 2.5 years ago
> and floated on the upstream mailing list, but since no opensource
> userspace materialized, we never actually merged them.  However the
> corresponding IGT test did get merged and has basically been dead code
> ever since.
>=20
> A couple years later we finally have an open source userspace
> (ChromeOS), so lets update the IGT test to match the ABI that's actuall=
y
> going upstream and to remove some of the cruft from the original test
> that wouldn't actually work.
>=20
> It's worth noting that CRC's don't seem to work properly on Intel gen9.=

> The bspec does tell us that we must have one plane enabled before takin=
g
> a pipe-level ("dmux") CRC, so this test is violating that by disabling
> all planes; it's quite possible that this is the source of the CRC
> mismatch.  If running on an Intel platform, you may want to run in
> interactive mode ("--interactive-debug=3Dbgcolor --skip-crc-compare") t=
o
> ensure that the colors being generated actually do match visually since=

> the CRC's can't be trusted.

Hmm, landing a feature without automating testing for it is a bit too
much to ask IMO.

I have two proposals to make it happen:

- Could we add a workaround for the affected intel platforms? If the
problem really is because no planes are enabled, then surely a
fully-transparent plane would be a sufficient workaround.

- If CRCs really cannot be used for this, then we should use the
chamelium for it. The idea would be to detect if the connector is
connected to a chamelium, and if so use chamelium's CRC.

How does this sound?

Martin

>=20
> v2:
>  - Swap red and blue ordering in property value to reflect change
>    in v2 of kernel series.
>=20
> v3:
>  - Minor updates to proposed uapi helpers (s/rgba/argb/).
>=20
> v4:
>  - General restructuring into pipe/color subtests.
>  - Use RGB2101010 framebuffers for comparison so that we match the bits=

>    of precision that Intel hardware background color accepts
>=20
> v5:
>  - Re-enable CRC comparisons; just because these don't work on Intel
>    doesn't mean we shouldn't use them on other vendors' platforms
>    (Daniel).
>  - Use DRIVER_ANY rather than DRIVER_INTEL. (Heiko Stuebner)
>=20
> v5.1:
>  - Update commit message body discussion of CRC issues.
>=20
> Cc: igt-dev@lists.freedesktop.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/igt_kms.c                     |   2 +-
>  tests/kms_crtc_background_color.c | 263 ++++++++++++++----------------=

>  2 files changed, 127 insertions(+), 138 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e9b80b9b..9a7f0e23 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -391,7 +391,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLA=
NE_PROPS] =3D {
>  };
> =20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D {
> -	[IGT_CRTC_BACKGROUND] =3D "background_color",
> +	[IGT_CRTC_BACKGROUND] =3D "BACKGROUND_COLOR",
>  	[IGT_CRTC_CTM] =3D "CTM",
>  	[IGT_CRTC_GAMMA_LUT] =3D "GAMMA_LUT",
>  	[IGT_CRTC_GAMMA_LUT_SIZE] =3D "GAMMA_LUT_SIZE",
> diff --git a/tests/kms_crtc_background_color.c b/tests/kms_crtc_backgro=
und_color.c
> index 3df3401f..58cdd7a9 100644
> --- a/tests/kms_crtc_background_color.c
> +++ b/tests/kms_crtc_background_color.c
> @@ -25,164 +25,153 @@
>  #include "igt.h"
>  #include <math.h>
> =20
> -
>  IGT_TEST_DESCRIPTION("Test crtc background color feature");
> =20
> +/*
> + * Paints a desired color into a full-screen primary plane and then co=
mpares
> + * that CRC with turning off all planes and setting the CRTC backgroun=
d to the
> + * same color.
> + *
> + * At least on current Intel platforms, the CRC tests appear to always=
 fail,
> + * even though the resulting pipe output seems to be the same.  The bs=
pec tells
> + * us that we must have at least one plane turned on when taking a pip=
e-level
> + * CRC, so the fact that we're violating that may explain the failures=
=2E  If
> + * your platform gives failures for all tests, you may want to run wit=
h
> + * --interactive-debug=3Dbgcolor --skip-crc-compare to visually inspec=
t that the
> + * background color matches the equivalent solid plane.
> + */
> +
>  typedef struct {
> -	int gfx_fd;
>  	igt_display_t display;
> -	struct igt_fb fb;
> -	igt_crc_t ref_crc;
> +	int gfx_fd;
> +	igt_output_t *output;
>  	igt_pipe_crc_t *pipe_crc;
> +	drmModeModeInfo *mode;
>  } data_t;
> =20
> -#define BLACK      0x000000           /* BGR 8bpc */
> -#define CYAN       0xFFFF00           /* BGR 8bpc */
> -#define PURPLE     0xFF00FF           /* BGR 8bpc */
> -#define WHITE      0xFFFFFF           /* BGR 8bpc */
> -
> -#define BLACK64    0x000000000000     /* BGR 16bpc */
> -#define CYAN64     0xFFFFFFFF0000     /* BGR 16bpc */
> -#define PURPLE64   0xFFFF0000FFFF     /* BGR 16bpc */
> -#define YELLOW64   0x0000FFFFFFFF     /* BGR 16bpc */
> -#define WHITE64    0xFFFFFFFFFFFF     /* BGR 16bpc */
> -#define RED64      0x00000000FFFF     /* BGR 16bpc */
> -#define GREEN64    0x0000FFFF0000     /* BGR 16bpc */
> -#define BLUE64     0xFFFF00000000     /* BGR 16bpc */
> -
> -static void
> -paint_background(data_t *data, struct igt_fb *fb, drmModeModeInfo *mod=
e,
> -		uint32_t background, double alpha)
> +/*
> + * Local copy of kernel uapi
> + */
> +static inline __u64
> +local_argb(__u8 bpc, __u16 alpha, __u16 red, __u16 green, __u16 blue)
>  {
> -	cairo_t *cr;
> -	int w, h;
> -	double r, g, b;
> -
> -	w =3D mode->hdisplay;
> -	h =3D mode->vdisplay;
> -
> -	cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->fb);
> +       int msb_shift =3D 16 - bpc;
> =20
> -	/* Paint with background color */
> -	r =3D (double) (background & 0xFF) / 255.0;
> -	g =3D (double) ((background & 0xFF00) >> 8) / 255.0;
> -	b =3D (double) ((background & 0xFF0000) >> 16) / 255.0;
> -	igt_paint_color_alpha(cr, 0, 0, w, h, r, g, b, alpha);
> -
> -	igt_put_cairo_ctx(data->gfx_fd, &data->fb, cr);
> +       return (__u64)alpha << msb_shift << 48 |
> +              (__u64)red   << msb_shift << 32 |
> +              (__u64)green << msb_shift << 16 |
> +              (__u64)blue  << msb_shift;
>  }
> =20
> -static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe=
 pipe,
> -			igt_plane_t *plane, int opaque_buffer, int plane_color,
> -			uint64_t pipe_background_color)
> +static void test_background(data_t *data, enum pipe pipe, int w, int h=
,
> +			    __u64 r, __u64 g, __u64 b)
>  {
> -	drmModeModeInfo *mode;
> -	igt_display_t *display =3D &data->display;
> -	int fb_id;
> -	double alpha;
> -
> -	igt_output_set_pipe(output, pipe);
> -
> -	/* create the pipe_crc object for this pipe */
> -	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CR=
C_SOURCE_AUTO);
> -
> -	mode =3D igt_output_get_mode(output);
> -
> -	fb_id =3D igt_create_fb(data->gfx_fd,
> -			mode->hdisplay, mode->vdisplay,
> -			DRM_FORMAT_XRGB8888,
> -			LOCAL_DRM_FORMAT_MOD_NONE, /* tiled */
> -			&data->fb);
> -	igt_assert(fb_id);
> -
> -	/* To make FB pixel win with background color, set alpha as full opaq=
ue */
> -	igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, pipe_back=
ground_color);
> -	if (opaque_buffer)
> -		alpha =3D 1.0;    /* alpha 1 is fully opque */
> -	else
> -		alpha =3D 0.0;    /* alpha 0 is fully transparent */
> -	paint_background(data, &data->fb, mode, plane_color, alpha);
> -
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -}
> -
> -static void cleanup_crtc(data_t *data, igt_output_t *output, igt_plane=
_t *plane)
> -{
> -	igt_display_t *display =3D &data->display;
> -
> -	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D NULL;
> -
> -	igt_remove_fb(data->gfx_fd, &data->fb);
> -
> -	igt_pipe_obj_set_prop_value(plane->pipe, IGT_CRTC_BACKGROUND, BLACK64=
);
> +	igt_crc_t plane_crc, bg_crc;
> +	struct igt_fb colorfb;
> +	igt_plane_t *plane =3D igt_output_get_plane_type(data->output,
> +						       DRM_PLANE_TYPE_PRIMARY);
> +
> +
> +	/* Fill the primary plane and set the background to the same color */=

> +	igt_create_color_fb(data->gfx_fd, w, h, DRM_FORMAT_XRGB2101010,
> +			    LOCAL_DRM_FORMAT_MOD_NONE,
> +			    (double)r / 0xFFFF,
> +			    (double)g / 0xFFFF,
> +			    (double)b / 0xFFFF,
> +			    &colorfb);
> +	igt_plane_set_fb(plane, &colorfb);
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
> +				local_argb(16, 0xffff, r, g, b));
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &plane_crc);
> +	igt_debug_wait_for_keypress("bgcolor");
> +
> +	/* Turn off the primary plane so only bg shows */
>  	igt_plane_set_fb(plane, NULL);
> -	igt_output_set_pipe(output, PIPE_ANY);
> -
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &bg_crc);
> +	igt_debug_wait_for_keypress("bgcolor");
> +
> +	/*
> +	 * The following test relies on hardware that generates valid CRCs
> +	 * even when no planes are on.  Sadly, this doesn't appear to be the
> +	 * case for current Intel platforms; pipe CRC's never match bgcolor
> +	 * CRC's, likely because we're violating the bspec's guidance that th=
ere
> +	 * must always be at least one real plane turned on when taking the
> +	 * pipe-level ("dmux") CRC.
> +	 */
> +	igt_assert_crc_equal(&plane_crc, &bg_crc);
>  }
> =20
> -static void test_crtc_background(data_t *data)
> +igt_main
>  {
> -	igt_display_t *display =3D &data->display;
> +	data_t data =3D {};
>  	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	int w, h;
>  	enum pipe pipe;
> -	int valid_tests =3D 0;
> -
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> -		igt_plane_t *plane;
> -
> -		igt_output_set_pipe(output, pipe);
> -
> -		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);=

> -		igt_require(igt_pipe_has_prop(display, pipe, IGT_CRTC_BACKGROUND));
> -
> -		prepare_crtc(data, output, pipe, plane, 1, PURPLE, BLACK64);
> -
> -		/* Now set background without using a plane, i.e.,
> -		 * Disable the plane to let hw background color win blend. */
> -		igt_plane_set_fb(plane, NULL);
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, PURPLE64=
);
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -		/* Try few other background colors */
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, CYAN64);=

> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, YELLOW64=
);
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> =20
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, RED64);
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	igt_fixture {
> +		data.gfx_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> =20
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, GREEN64)=
;
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, BLUE64);=

> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -		igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND, WHITE64)=
;
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -		valid_tests++;
> -		cleanup_crtc(data, output, plane);
> +		igt_require_pipe_crc(data.gfx_fd);
> +		igt_display_require(&data.display, data.gfx_fd);
>  	}
> -	igt_require_f(valid_tests, "no valid crtc/connector combinations foun=
d\n");
> -}
> =20
> -igt_simple_main
> -{
> -	data_t data =3D {};
> -
> -	igt_skip_on_simulation();
> -
> -	data.gfx_fd =3D drm_open_driver(DRIVER_INTEL);
> -	igt_require_pipe_crc(data.gfx_fd);
> -	igt_display_require(&data.display, data.gfx_fd);
> -
> -	test_crtc_background(&data);
> +	for_each_pipe_static(pipe) igt_subtest_group {
> +		igt_fixture {
> +			igt_display_require_output_on_pipe(&data.display, pipe);
> +			igt_require(igt_pipe_has_prop(&data.display, pipe,
> +						      IGT_CRTC_BACKGROUND));
> +
> +			output =3D igt_get_single_output_for_pipe(&data.display,
> +								pipe);
> +			igt_output_set_pipe(output, pipe);
> +			data.output =3D output;
> +
> +			mode =3D igt_output_get_mode(output);
> +			w =3D mode->hdisplay;
> +			h =3D mode->vdisplay;
> +
> +			data.pipe_crc =3D igt_pipe_crc_new(data.gfx_fd, pipe,
> +							  INTEL_PIPE_CRC_SOURCE_AUTO);
> +		}
> +
> +		igt_subtest_f("background-color-pipe-%s-black",
> +			      kmstest_pipe_name(pipe))
> +			test_background(&data, pipe, w, h,
> +					0, 0, 0);
> +
> +		igt_subtest_f("background-color-pipe-%s-white",
> +			      kmstest_pipe_name(pipe))
> +			test_background(&data, pipe, w, h,
> +					0xFFFF, 0xFFFF, 0xFFFF);
> +
> +		igt_subtest_f("background-color-pipe-%s-red",
> +			      kmstest_pipe_name(pipe))
> +			test_background(&data, pipe, w, h,
> +					0xFFFF, 0, 0);
> +
> +		igt_subtest_f("background-color-pipe-%s-green",
> +			      kmstest_pipe_name(pipe))
> +
> +			test_background(&data, pipe, w, h,
> +					0, 0xFFFF, 0);
> +
> +		igt_subtest_f("background-color-pipe-%s-blue",
> +			      kmstest_pipe_name(pipe))
> +			test_background(&data, pipe, w, h,
> +					0, 0, 0xFFFF);
> +
> +		igt_fixture {
> +			igt_display_reset(&data.display);
> +			igt_pipe_crc_free(data.pipe_crc);
> +			data.pipe_crc =3D NULL;
> +		}
> +	}
> =20
> -	igt_display_fini(&data.display);
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +	}
>  }
>=20


--------------818AB5D06C66F58AD0DF79B7
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF0skR8BCACsvF63cJo6hL0XHShl6f112vbmLS7cGbUelL9Kdc59ASS0qzuQ
dvxmYA5R4he6ABwgwneVj2mkBGGAFqVten/ZAL5ws/QzG8SzEEMIBNUbPK3nvfgp
Pfrr8LOKyOof/vu9mITTJWQtXK6RSiqfQIpTccwIiqUwRhjrShOOWADSySyQc/AR
Igqpvn9SPMVHvCTZKeqUIJQD29SHp5UBGZTX4k5KLWNrFL+R7pTI40AzhLrL8Ywv
hfVP7CTydtxtnHLf6ww2Awd+yvmOeeBXdcPFvxgDZzmcfYQ5p6ipfThhG9jNK6EN
1BLBAiAijuft1PA/eGZ3liR6/bGRBSyDMq9rABEBAAG0I01hcnRpbiBQZXJlcyA8
bWFydGluLnBlcmVzQGZyZWUuZnI+iQFUBBMBCAA+FiEEB1fxYcslczVdFosKkX/D
F6u6UIsFAl0skR8CGwMFCQHhM4AFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ
kX/DF6u6UIvnywgAk6tYqcrWlzt0qwFSpH04w9SEByIEnj2RERuVov4Ov3gaPQxn
ztOVqa1zAiVXwCTKc+UhhKvOsvR3BrfIT66+9Vs/qH5yUtMIjuJOesmbrEvG9qZ1
3RnlKXzdhVyjNlq6wQQQclN6tOkO9/QyrzfjLG1QYKpPHotHIEhl+UcVGnTe2Khl
3vvNZD60OaWenNXYlKm0VNZR5MiXo09vZJXuId8HHp58L/Q3A2eVij1PXfDblAk8
Ozu1ODK8JPpemBTmamKKa/EcYznFyrZ9unODVQAXttI1F0JhdbGL6jdgCLNUHH01
NqpwT4NNUMlU/Mi3hJaTSYIrVOBQUOlW+tTE/rkBDQRdLJEfAQgA9DVrAmaYW/j9
xZir9xPf3moFYwoKU4M3hKOBeBI6WqRJ9bAoYd6WzINQRJwWiBxE2+23xyr503J0
BDw7dgmWEC7NwGtM7St6d49mStHNXj89dQMy22f0FAJwIOB5K559Z7fqSISCmga7
+lbx4CtOWDwxOBQYccIXq98TgRgHzAPoq4pJ000XeLE5NhhFFk10mDq0dP9nxNDs
3FU45+JlElZF7vcIIGUqabF3ik/DrAEwrGXNSIjrSrLavQdMQBfyKl5DPAvHWjV6
ZrE8D1PjXdCJOvOvPhtyOc/Pm1wOioRvG/T7kLGWMCPeRTwedu+v1tnZubMl5PWC
EacRwlvEHQARAQABiQE8BBgBCAAmFiEEB1fxYcslczVdFosKkX/DF6u6UIsFAl0s
kR8CGwwFCQHhM4AACgkQkX/DF6u6UIvixwf/d+1JA74h43vEo3lZVl7U3Uf/ZFsH
qUQJpjc+0SDJ22uiLEK6k8u0oeKGF90oouTTxoVR7fVP91wdx+Ne2ciVWTiyI3LN
hwXKGavylaMSo19YX3Kc0BCDhyyAm31+MeoE3gcDW6k9qm2Zo9m2xq5U4ID2zk4L
OzSqb5mIyEfNS8iD/yIJClSgSBnkJrI6yrpw4iLs1Dig7+WU2LOAGRM39HWS1Fvc
Zzlm3nTfBwuKW7uRFiBmKSYSqjkZGjcioLycGjW74xSOm/fgKYSje/oqPXmdloES
sKhWVb8mYR/Ti6+ffn3Fh0cCUvguaCuQ/91XXEENuN1w08Tl2KBxRpvrxQ=3D=3D
=3DeO8M
-----END PGP PUBLIC KEY BLOCK-----

--------------818AB5D06C66F58AD0DF79B7
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--------------818AB5D06C66F58AD0DF79B7--
