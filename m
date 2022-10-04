Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7EC5F4118
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E940D10E052;
	Tue,  4 Oct 2022 10:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E710E052;
 Tue,  4 Oct 2022 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664880735; x=1696416735;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GsLBEQ+iiyq0tqzhsDbPlBVlnya42aOoxzUP/81MpLo=;
 b=L5uFUZFjiPQmh5nBWG07O43wNuwKoqGJU1AOzZiXX5KRmZwPGOZ2GGnb
 PoF8H8Qlj9ZNJ/hurlVaDXiTTPOS/uxtQ7Dj1J4S70qGjsjkrYth7im4O
 9FZ1Gjdh4OZTBUi11oGlLEQSIWDUPVqox/+QZwCi0C+dWXl5EHRLmwVzh
 8HvqsRxNZ4VYw4iRdcS06R1kQskyp0vf9s9nTyFQr/ZS3Ragq3wcjwITV
 Hfdfl+zHFVN8DYT0qM3oM6IGd3y1L41qlEA2PcK56AaKXopCUU8HmU2qi
 xDpjxnyzRhpwPfXxefFDNPYYLkzohrVXkLqettYBIJ0MDAJQMhUJDvGaK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="286070571"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="286070571"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:52:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="686506525"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="686506525"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost)
 ([10.252.39.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:52:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915/display: fix randconfig build
In-Reply-To: <20221004102837.12181-1-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221004102837.12181-1-jirislaby@kernel.org>
Date: Tue, 04 Oct 2022 13:52:08 +0300
Message-ID: <87mtabuahz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Martin =?utf-8?Q?Li=C5=A1ka?= <mliska@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Oct 2022, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> When DRM_I915=3Dy and BACKLIGHT_CLASS_DEVICE=3Dm, the build fails:
> ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_ba=
cklight_device_register':
> intel_backlight.c:(.text+0x5587): undefined reference to `backlight_devic=
e_get_by_name'
>
> ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_ba=
cklight_device_unregister':
> intel_backlight.c:(.text+0x576e): undefined reference to `backlight_devic=
e_unregister'
>
> To fix this, use IS_REACHABLE(), not IS_ENABLED() in backlight. That is,
> with the above config, backlight support is disabled.

So I don't want this. I'll take a patch that fixes the dependencies to
block DRM_I915=3Dy and BACKLIGHT_CLASS_DEVICE=3Dm. Nobody wants that combo,
and IMO using IS_REACHABLE() is a workaround to hide a broken config
under the carpet.

The right thing to do is

config DRM_I915
	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=3Dn.

We're selecting BACKLIGHT_CLASS_DEVICE because almost everyone else is
too, and a combo of selecting and depending leads to circular
dependencies. But depending is the right fix.

Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.


BR,
Jani.

>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Reported-by: Martin Li=C5=A1ka <mliska@suse.cz>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_backlight.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu=
/drm/i915/display/intel_backlight.c
> index beba39a38c87..c1ba68796b6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -825,7 +825,7 @@ void intel_backlight_enable(const struct intel_crtc_s=
tate *crtc_state,
>  	mutex_unlock(&dev_priv->display.backlight.lock);
>  }
>=20=20
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  static u32 intel_panel_get_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.h b/drivers/gpu=
/drm/i915/display/intel_backlight.h
> index 339643f63897..207fe1c613d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.h
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.h
> @@ -36,7 +36,7 @@ u32 intel_backlight_invert_pwm_level(struct intel_conne=
ctor *connector, u32 leve
>  u32 intel_backlight_level_to_pwm(struct intel_connector *connector, u32 =
level);
>  u32 intel_backlight_level_from_pwm(struct intel_connector *connector, u3=
2 val);
>=20=20
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  int intel_backlight_device_register(struct intel_connector *connector);
>  void intel_backlight_device_unregister(struct intel_connector *connector=
);
>  #else /* CONFIG_BACKLIGHT_CLASS_DEVICE */

--=20
Jani Nikula, Intel Open Source Graphics Center
