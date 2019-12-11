Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4CB11B891
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 17:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC256EB7E;
	Wed, 11 Dec 2019 16:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B736EB7E;
 Wed, 11 Dec 2019 16:23:27 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 08:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="264926006"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 11 Dec 2019 08:23:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Dec 2019 18:23:22 +0200
Date: Wed, 11 Dec 2019 18:23:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/i915: remove redundant checks for a null fb
 pointer
Message-ID: <20191211162322.GL1208@intel.com>
References: <20191210142349.333171-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210142349.333171-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 02:23:49PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> =

> A prior check and return when pointer fb is null makes
> subsequent null checks on fb redundant.  Remove the redundant
> null checks.
> =

> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index 062e5bef637a..a48478be6e8f 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -2600,8 +2600,8 @@ static void intel_plane_hw_info(struct seq_file *m,=
 struct intel_plane *plane)
>  		       plane_state->hw.rotation);
>  =

>  	seq_printf(m, "\t\thw: fb=3D%d,%s,%dx%d, visible=3D%s, src=3D" DRM_RECT=
_FP_FMT ", dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
> -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> -		   fb ? fb->width : 0, fb ? fb->height : 0,
> +		   fb->base.id, format_name.str,
> +		   fb->width, fb->height,

Thanks.

Pushed to drm-intel-next-queued.

>  		   yesno(plane_state->uapi.visible),
>  		   DRM_RECT_FP_ARG(&plane_state->uapi.src),
>  		   DRM_RECT_ARG(&plane_state->uapi.dst),
> -- =

> 2.24.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
