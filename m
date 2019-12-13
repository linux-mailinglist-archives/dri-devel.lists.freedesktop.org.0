Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7C411E6EC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694B6E90A;
	Fri, 13 Dec 2019 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746E96E915
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:48:22 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 07:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="265564643"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 13 Dec 2019 07:48:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Dec 2019 17:48:18 +0200
Date: Fri, 13 Dec 2019 17:48:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213154818.GZ1208@intel.com>
References: <20191212203301.142437-1-sean@poorly.run>
 <87mubw1bpa.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mubw1bpa.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 05:34:25PM +0200, Jani Nikula wrote:
> On Thu, 12 Dec 2019, Sean Paul <sean@poorly.run> wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > For a long while now, we (ChromeOS) have been struggling getting any
> > value out of user feedback reports of display failures (notably external
> > displays not working). The problem is that all logging, even fatal
> > errors (well, fatal in the sense that a display won't light up) are
> > logged at DEBUG log level. So in order to extract these logs, users need
> > to be able to turn on logging, and reproduce the issue with debug
> > enabled. Unfortunately, this isn't really something we can ask CrOS use=
rs
> > to do. I spoke with airlied about this and RHEL has similar issues. Aft=
er
> > a few more people piped up on previous versions of this patch, it is a
> > Real Issue.
> >
> > So why don't we just enable DRM_UT_BLAH? Here are the reasons in
> > ascending order of severity:
> >  1- People aren't consistent with their categories, so we'd have to
> >     enable a bunch to get proper coverage
> >  2- We don't want to overwhelm syslog with drm spam, others have to use
> >     it too
> >  3- Console logging is slow
> >
> > So what we really want is a ringbuffer of the most recent logs
> > (filtered by categories we're interested in) exposed via debugfs so the
> > logs can be extracted when users file feedback.
> >
> > It just so happens that there is something which does _exactly_ this!
> > This patch dumps drm logs into tracepoints, which allows us to turn tra=
cing
> > on and off depending on which category is useful, and pull them from
> > tracefs on demand.
> >
> > What about trace_printk()? It doesn't give us the control we get from u=
sing
> > tracepoints and it's not meant to be left sprinkled around in code.
> >
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.1955=
40-1-sean@poorly.run #v1
> >
> > Changes in v2:
> > - Went with a completely different approach: https://lists.freedesktop.=
org/archives/dri-devel/2019-November/243230.html
> >
> > Changes in v3:
> > - Changed commit message to be a bit less RFC-y
> > - Make class_drm_category_log an actual trace class
> > ---
> >
> > Even though we don't want it to be, this is UAPI. So here's some usersp=
ace
> > code which uses it:
> > https://chromium-review.googlesource.com/c/chromiumos/platform2/+/19655=
62
> >
> >
> >  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++-----
> >  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
> >  2 files changed, 239 insertions(+), 20 deletions(-)
> >  create mode 100644 include/trace/events/drm_print.h
> >
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 9a25d73c155c..f591292811aa 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -27,11 +27,15 @@
> >  =

> >  #include <stdarg.h>
> >  =

> > +#include <linux/bitops.h>
> >  #include <linux/io.h>
> >  #include <linux/moduleparam.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  =

> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/drm_print.h>
> > +
> >  #include <drm/drm.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_print.h>
> > @@ -241,10 +245,10 @@ void drm_dev_printk(const struct device *dev, con=
st char *level,
> >  	struct va_format vaf;
> >  	va_list args;
> >  =

> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > +	va_start(args, format);
> >  	if (dev)
> >  		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
> >  			   __builtin_return_address(0), &vaf);
> > @@ -253,49 +257,145 @@ void drm_dev_printk(const struct device *dev, co=
nst char *level,
> >  		       level, __builtin_return_address(0), &vaf);
> >  =

> >  	va_end(args);
> > +
> > +	va_start(args, format);
> > +	trace_drm_log(level, dev, &vaf);
> > +	va_end(args);
> >  }
> >  EXPORT_SYMBOL(drm_dev_printk);
> >  =

> > +static unsigned int drm_trace_enabled(unsigned int category)
> > +{
> > +	unsigned int bit;
> > +
> > +	for_each_set_bit(bit, (unsigned long*)&category, sizeof(category) * 8=
) {
> =

> You'll want to use BITS_PER_TYPE().
> =

> But wait, I've switched category to an enum upstream, and there should
> only ever be one bit set anyway?
> =

> > +		switch (BIT(bit)) {
> > +		case DRM_UT_NONE:
> > +			return trace_drm_dbg_none_enabled();
> > +		case DRM_UT_CORE:
> > +			return trace_drm_dbg_core_enabled();
> > +		case DRM_UT_DRIVER:
> > +			return trace_drm_dbg_driver_enabled();
> > +		case DRM_UT_KMS:
> > +			return trace_drm_dbg_kms_enabled();
> > +		case DRM_UT_PRIME:
> > +			return trace_drm_dbg_prime_enabled();
> > +		case DRM_UT_ATOMIC:
> > +			return trace_drm_dbg_atomic_enabled();
> > +		case DRM_UT_VBL:
> > +			return trace_drm_dbg_vbl_enabled();
> > +		case DRM_UT_STATE:
> > +			return trace_drm_dbg_state_enabled();
> > +		case DRM_UT_LEASE:
> > +			return trace_drm_dbg_lease_enabled();
> > +		case DRM_UT_DP:
> > +			return trace_drm_dbg_dp_enabled();
> > +		default:
> > +			return trace_drm_dbg_unknown_enabled();
> > +		}
> > +	}
> > +	return false;
> > +}
> > +
> > +static void drm_do_trace(const struct device *dev, unsigned int catego=
ry,
> > +			 struct va_format *vaf)
> > +{
> > +	WARN_ON(hweight32(category) > 1);
> > +
> > +	switch (category) {
> > +	case DRM_UT_NONE:
> > +		trace_drm_dbg_none(dev, vaf);
> > +		break;
> > +	case DRM_UT_CORE:
> > +		trace_drm_dbg_core(dev, vaf);
> > +		break;
> > +	case DRM_UT_DRIVER:
> > +		trace_drm_dbg_driver(dev, vaf);
> > +		break;
> > +	case DRM_UT_KMS:
> > +		trace_drm_dbg_kms(dev, vaf);
> > +		break;
> > +	case DRM_UT_PRIME:
> > +		trace_drm_dbg_prime(dev, vaf);
> > +		break;
> > +	case DRM_UT_ATOMIC:
> > +		trace_drm_dbg_atomic(dev, vaf);
> > +		break;
> > +	case DRM_UT_VBL:
> > +		trace_drm_dbg_vbl(dev, vaf);
> > +		break;
> > +	case DRM_UT_STATE:
> > +		trace_drm_dbg_state(dev, vaf);
> > +		break;
> > +	case DRM_UT_LEASE:
> > +		trace_drm_dbg_lease(dev, vaf);
> > +		break;
> > +	case DRM_UT_DP:
> > +		trace_drm_dbg_dp(dev, vaf);
> > +		break;
> > +	default:
> > +		trace_drm_dbg_unknown(dev, vaf);
> > +		break;
> > +	}
> > +}
> > +
> >  void drm_dev_dbg(const struct device *dev, unsigned int category,
> >  		 const char *format, ...)
> >  {
> >  	struct va_format vaf;
> > +	unsigned int bit;
> >  	va_list args;
> >  =

> > -	if (!drm_debug_enabled(category))
> > -		return;
> > -
> > -	va_start(args, format);
> >  	vaf.fmt =3D format;
> >  	vaf.va =3D &args;
> >  =

> > -	if (dev)
> > -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> > -			   __builtin_return_address(0), &vaf);
> > -	else
> > -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > -		       __builtin_return_address(0), &vaf);
> > +	if (drm_debug_enabled(category)) {
> =

> Ville wants to move this check outside of the functions in the macro
> level in the header file. Apparently it's pretty bad for performance on
> some (older Atom) machines to do the call for nothing.

I've been meaning to measure if this actually matters. But haven't
managed to motivate myself enough. Could be a good project for
some random person to write a test that just does tons of different
kinds of atomic TEST_ONLY commits to measure how badly we suck.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
