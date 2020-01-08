Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A698133F88
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 11:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E88892B5;
	Wed,  8 Jan 2020 10:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAFF6E1B3;
 Wed,  8 Jan 2020 10:45:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19806929-1500050 for multiple; Wed, 08 Jan 2020 10:44:59 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <8736cqs2uf.fsf@intel.com>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
 <b79ee0f6efbf8358cbb4f2e163fa6b5bb04db794.1578409433.git.wambui.karugax@gmail.com>
 <157847199686.4725.87481257304852182@jlahtine-desk.ger.corp.intel.com>
 <8736cqs2uf.fsf@intel.com>
Message-ID: <157848029770.2273.9590955422248556735@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: convert to using the
 drm_dbg_kms() macro.
Date: Wed, 08 Jan 2020 10:44:57 +0000
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

Quoting Jani Nikula (2020-01-08 09:40:40)
> On Wed, 08 Jan 2020, Joonas Lahtinen <joonas.lahtinen@linux.intel.com> wrote:
> > Quoting Wambui Karuga (2020-01-07 17:13:29)
> >> Convert the use of the DRM_DEBUG_KMS() logging macro to the new struct
> >> drm_device based drm_dbg_kms() logging macro in i915/intel_pch.c.
> >> 
> >> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> >> ---
> >>  drivers/gpu/drm/i915/intel_pch.c | 46 +++++++++++++++++---------------
> >>  1 file changed, 24 insertions(+), 22 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
> >> index 43b68b5fc562..4ed60e1f01db 100644
> >> --- a/drivers/gpu/drm/i915/intel_pch.c
> >> +++ b/drivers/gpu/drm/i915/intel_pch.c
> >> @@ -12,90 +12,91 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
> >>  {
> >>         switch (id) {
> >>         case INTEL_PCH_IBX_DEVICE_ID_TYPE:
> >> -               DRM_DEBUG_KMS("Found Ibex Peak PCH\n");
> >> +               drm_dbg_kms(&dev_priv->drm, "Found Ibex Peak PCH\n");
> >
> > Did we at some point consider i915_dbg_kms alias? That would just take
> > dev_priv (or i915, as it's called in newer code). It would shorten many
> > of the statements.
> >
> > i915_dbg_kms(dev_priv, ...) or i915_dbg_kms(i915, ...)
> 
> I'd rather use the common drm logging macros. I thought about adding
> i915 specific ones only if the drm device specific logging macros
> weren't going to be merged.

Why do they even exist? Why isn't it enough to do
#define drm_info(drm, fmt, ...) dev_info(&(drm)->dev, fmt, ##__VA_ARGS) ?
#define i915_info(i915, fmt, ...) drm_info(&(i915)->drm, fmt, ##__VA_ARGS)

The lea for &i915->drm.dev is the same as the mov, so we shave off an
unnecessary wrapper.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
