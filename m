Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C319B17128C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85756EC3A;
	Thu, 27 Feb 2020 08:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936A86EC3A;
 Thu, 27 Feb 2020 08:29:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 00:29:41 -0800
X-IronPort-AV: E=Sophos;i="5.70,491,1574150400"; d="scan'208";a="231747674"
Received: from lohmeies-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 00:29:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Laxminarayan Bharadiya\, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: RE: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
 MISSING_CASE macro
In-Reply-To: <E92BA18FDE0A5B43B7B3DA7FCA03128605776BFE@BGSMSX107.gar.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225134709.6153-2-pankaj.laxminarayan.bharadiya@intel.com>
 <158263931977.26598.171017617509031302@skylake-alporthouse-com>
 <E92BA18FDE0A5B43B7B3DA7FCA03128605776BFE@BGSMSX107.gar.corp.intel.com>
Date: Thu, 27 Feb 2020 10:29:50 +0200
Message-ID: <87mu94qvpd.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Feb 2020, "Laxminarayan Bharadiya, Pankaj"	<pankaj.laxminarayan.bharadiya@intel.com> wrote:
> Hi Chris,
>
>> -----Original Message-----
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>> Sent: 25 February 2020 19:32
>> To: David Airlie <airlied@linux.ie>; Joonas Lahtinen
>> <joonas.lahtinen@linux.intel.com>; Laxminarayan Bharadiya, Pankaj
>> <pankaj.laxminarayan.bharadiya@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; daniel@ffwll.ch; dri-devel@lists.freedesktop.org;
>> intel-gfx@lists.freedesktop.org; jani.nikula@linux.intel.com
>> Cc: Laxminarayan Bharadiya, Pankaj
>> <pankaj.laxminarayan.bharadiya@intel.com>
>> Subject: Re: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
>> MISSING_CASE macro
>> 
>> Quoting Pankaj Bharadiya (2020-02-25 13:47:00)
>> > Now that we have struct drm_device based drm_WARN, introduce struct
>> > drm_i915_private based i915_MISSING_CASE macro which uses
>> drm_WARN so
>> > that device specific information will also get printed in backtrace.
>> >
>> > i915_MISSING_CASE macro should be preferred over MISSING_CASE,
>> > wherever possible.
>> 
>> Whatever for? MISSING_CASE() itself should be a complete picture for the
>> forgotten code.
>
> Are you saying, no need to have a new device specific macro?
>
> We want convert all the calls of WARN* with device specific drm_WARN* 
> in i915, hence I introduced new i915_MISSING_CASE macro.
>
> Jani, Will you please share your opinion on this?

In general, many or most WARNs are device specific, and the device
information is useful. However MISSING_CASE is about the *code*. That
was the intent anyway. Perhaps there are cases where the device
information might be useful, but for most cases probably not.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
