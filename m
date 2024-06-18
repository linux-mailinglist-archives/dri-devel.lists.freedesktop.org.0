Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB590C56B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CF910E609;
	Tue, 18 Jun 2024 09:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdTAddo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093B010E607;
 Tue, 18 Jun 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718703520; x=1750239520;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QenCB3euq69QSB//DNTS+Hjnrm1i70bry2vnqFA0Xns=;
 b=jdTAddo5r9wk4ihplKkCPVsKLpjzLIF8enlC3fXWtbd78LSWIW/lWruP
 l940wLds9UHU+8syqnDE6S0GPk85xLexobd68NPVeTgFj71XlbjBZHCTh
 NitWfzj7AlCNwU/ez/R0FhIlEKgs88k6O7Jqadmt9M5JBi4DGeZBFtZgp
 U3Rr9zfwmW6uwwYBLHMJHL//Eztdh3epIqE7Yg+Kdj+lKfGRZSXTHeXe2
 QeNynxLVLy9BpB1nfCLef9psRBjUyB+vq5Yzo9Dtn/gyRTQuqeBVGsza4
 CSht8xoZfjPaoy97/j0ChmDlid8OBv2WrZekPfk7Zxv+MefFey/5t8RbX Q==;
X-CSE-ConnectionGUID: JZ6PkSu/Tli1IY3GeHEPXQ==
X-CSE-MsgGUID: aTHy11FCQXGA3UktqvWX8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="40973750"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="40973750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 02:38:39 -0700
X-CSE-ConnectionGUID: 8q3IjEVeRvOFZ8qUIH04zg==
X-CSE-MsgGUID: w6BdYPq0TguAHoQ8bDknCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64724227"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.176])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 02:38:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Simon Ser
 <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>, 'Marek
 =?utf-8?B?T2zFocOhayc=?=
 <maraeo@gmail.com>, Dave Airlie <airlied@gmail.com>,
 ville.syrjala@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>, Joshua
 Ashton <joshua@froggi.es>, Michel =?utf-8?Q?D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, Sam
 Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol
 Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, =?utf-8?Q?And?=
 =?utf-8?Q?r=C3=A9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v7 2/9] drm: Support per-plane async flip configuration
In-Reply-To: <20240618030024.500532-3-andrealmeid@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240618030024.500532-1-andrealmeid@igalia.com>
 <20240618030024.500532-3-andrealmeid@igalia.com>
Date: Tue, 18 Jun 2024 12:38:26 +0300
Message-ID: <878qz2h9pp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jun 2024, Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> Drivers have different capabilities on what plane types they can or
> cannot perform async flips. Create a plane::async_flip field so each
> driver can choose which planes they allow doing async flips.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  include/drm/drm_plane.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 9507542121fa..0bebc72af5c3 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -786,6 +786,11 @@ struct drm_plane {
>  	 * @kmsg_panic: Used to register a panic notifier for this plane
>  	 */
>  	struct kmsg_dumper kmsg_panic;
> +
> +	/**
> +	 * @async_flip: indicates if a plane can do async flips
> +	 */

When is it okay to set or change the value of this member?

If you don't document it, people will find creative uses for this.

BR,
Jani.


> +	bool async_flip;
>  };
>=20=20
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)

--=20
Jani Nikula, Intel
