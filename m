Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4AB133D0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BBB6E86B;
	Wed,  8 Jan 2020 08:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8D96E86B;
 Wed,  8 Jan 2020 08:26:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 00:26:42 -0800
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; d="scan'208";a="215883541"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.84.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 00:26:39 -0800
MIME-Version: 1.0
In-Reply-To: <b79ee0f6efbf8358cbb4f2e163fa6b5bb04db794.1578409433.git.wambui.karugax@gmail.com>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
 <b79ee0f6efbf8358cbb4f2e163fa6b5bb04db794.1578409433.git.wambui.karugax@gmail.com>
Subject: Re: [PATCH 1/5] drm/i915: convert to using the drm_dbg_kms() macro.
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 08 Jan 2020 10:26:36 +0200
Message-ID: <157847199686.4725.87481257304852182@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Wambui Karuga (2020-01-07 17:13:29)
> Convert the use of the DRM_DEBUG_KMS() logging macro to the new struct
> drm_device based drm_dbg_kms() logging macro in i915/intel_pch.c.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/i915/intel_pch.c | 46 +++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
> index 43b68b5fc562..4ed60e1f01db 100644
> --- a/drivers/gpu/drm/i915/intel_pch.c
> +++ b/drivers/gpu/drm/i915/intel_pch.c
> @@ -12,90 +12,91 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
>  {
>         switch (id) {
>         case INTEL_PCH_IBX_DEVICE_ID_TYPE:
> -               DRM_DEBUG_KMS("Found Ibex Peak PCH\n");
> +               drm_dbg_kms(&dev_priv->drm, "Found Ibex Peak PCH\n");

Did we at some point consider i915_dbg_kms alias? That would just take
dev_priv (or i915, as it's called in newer code). It would shorten many
of the statements.

i915_dbg_kms(dev_priv, ...) or i915_dbg_kms(i915, ...)

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
