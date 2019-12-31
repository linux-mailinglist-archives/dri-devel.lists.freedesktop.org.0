Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511112D97F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 15:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49B36E233;
	Tue, 31 Dec 2019 14:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4576E233
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 14:36:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 06:36:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,379,1571727600"; d="scan'208";a="213654348"
Received: from taktemur-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 06:35:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
In-Reply-To: <20191223123500.GC10745@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org> <87r20vuvow.fsf@intel.com>
 <20191223123500.GC10745@ravnborg.org>
Date: Tue, 31 Dec 2019 16:35:55 +0200
Message-ID: <87a778lfzo.fsf@intel.com>
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
Cc: Joe Perches <joe@perches.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Jani.
>
> On Mon, Dec 23, 2019 at 01:29:19PM +0200, Jani Nikula wrote:
>> On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
>> > There are a lot of cases where we have a device * but no drm_device *.
>> > Add drm_dev_* variants of the logging functions to cover these cases.
>> 
>> So I know there are some valid cases where we only have struct device *,
>> and instead of passing struct drm_device * will need the distinction
>> between multiple struct device *.
>> 
>> Not all current uses of DRM_DEV_* meet that criteria, however. I think
>> I'd like to have those converted over to the drm_device based logging
>> first, and then see what's left. Because I fear adding these will just
>> lead to mass conversion from DRM_DEV_* to drm_dev_*, and the ball gets
>> dropped there.
>
> Hmm...
> $ git grep -E '(DRM_DEV_ERROR|DRM_DEV_INFO|DRM_DEV_WARN|DRM_DEV_DEBUG)'
> 953
> There are 4 hits in drm/* - the rest is in drivers (no suprise).
>
>
> $ git grep -E '(DRM_ERROR|DRM_INFO|DRM_WARN|DRM_DEBUG)' | wc -l
> 8380
> There are 626 hits in drm/* - the rest in drivers.
>
>
> So moving over all DRM_DEV looks doable with a lot of effort. It touches
> all drivers.
> But the non-DEV variants - thats just too much.
> This is a lot of effort required before we can offer new drivers
> a simple a logical logging solution.

I guess that's part of the point. Do we even want to offer new non-dev
based alternatives for (DRM_ERROR|DRM_INFO|DRM_WARN|DRM_DEBUG)? We'll
end up carrying the alternatives for years. And face tons of churn for
no real benefit. Why not just stick to the old ones when you're not
using a drm device based alternative?

Switching from non-dev based logging to drm device based logging, OTOH,
is worth the churn.

> On top of this - there is today no gain using drm_device * versus device *.
> The output is exactly the same.

For me and i915 the gain is in not having to do the dereference
everywhere. Having drm device available is the more common case.

If you go through the current DRM_DEV_* uses, a significant portion of
them use drm->dev or have drm device readily available. Again, I'd
prefer converting them over to drm device instead of just changing the
call to another struct device based version. And then see how big the
demand really is for struct device based logging before adding all
possible variations of it. Could they do with less?

Using drm device gives us the benefit that we can also add drm device
based debug control if we want, for example to enable debug only for a
certain device in a multi-GPU system. That option is not easily
available with struct device based logging.

> We should discuss what is required before we can offer the full solution
> for new drivers. And how much the existing usage should hold this back.

I guess I'm more concerned about existing drivers and the conversion
than new drivers...


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
