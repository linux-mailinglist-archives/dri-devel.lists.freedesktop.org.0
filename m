Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469831A0772
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5DC6E516;
	Tue,  7 Apr 2020 06:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CC6E516;
 Tue,  7 Apr 2020 06:40:10 +0000 (UTC)
IronPort-SDR: R1g4FoC++bcpf3K+vP977gvmTdVrDuR5l0wf+9aDaFE8iTVMsbavm+TmTjqDiIvOfvnbIjrgwb
 ErImZ7d1lByA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 23:40:10 -0700
IronPort-SDR: i4PRgE8ZRe2DLJdUwFjQBQ0GuvfnsLNttg/JS+fksyonvkFwCotbJR7m676bfJaOoDNA6wliJ9
 p7Pzye2D159Q==
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; d="scan'208";a="424640672"
Received: from vogtstef-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.40.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 23:40:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/i915/dp_mst: Cast intel_connector->port as
 drm_dp_mst_port
In-Reply-To: <20200406200646.1263435-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406200646.1263435-1-lyude@redhat.com>
Date: Tue, 07 Apr 2020 09:40:02 +0300
Message-ID: <87eeszlry5.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Apr 2020, Lyude Paul <lyude@redhat.com> wrote:
> The only reason for having this cast as void * before was because we
> originally needed to use drm_dp_mst_get_port_validated() and friends in
> order to (attempt to) safely access MST ports. However, we've since
> improved how reference counting works with ports and mstbs such that we
> can now rely on drm_dp_mst_port structs remaining in memory for as long
> as the driver needs. This means we don't really need to cast this as
> void* anymore, and can just access the struct directly.

To/from void* does not need a cast in C anyway. ;)

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> We'll also need this for the next commit, so that we can remove
> drm_dp_mst_port_has_audio().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 5a0adf14ebef..0ddc98afe252 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -438,7 +438,7 @@ struct intel_connector {
>  	   state of connector->polled in case hotplug storm detection changes it */
>  	u8 polled;
>  
> -	void *port; /* store this opaque as its illegal to dereference it */
> +	struct drm_dp_mst_port *port;
>  
>  	struct intel_dp *mst_port;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
