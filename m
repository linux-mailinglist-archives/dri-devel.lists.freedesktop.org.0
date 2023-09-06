Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97E879395B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B467110E5E5;
	Wed,  6 Sep 2023 10:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BB110E5E5;
 Wed,  6 Sep 2023 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693994671; x=1725530671;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=P0b/otjmIHI6otfHXkCwXeQeYXMI8IOH75FQnuvPwn0=;
 b=kj60hl1/RM2TkOMkUjs92i1gZAd7wsbDaK4jTE7PPCSGijMWyEBb0iQ4
 F8h+GMIHGm1x7UR10QHg4bLoeq4gD3m8nf/nphDLrWLTQrUBKlRxQTnlH
 BlnqSNY89fNRvH7xnWhFiVuA2+iUI6Mtj9O676R+I268LHsdjGMkgZVMB
 dSKD78qjFJoqvISaEL07bbj5l2E24+qoSoUjShWKgyCIQXlG3SVzYxzKS
 K6M2n5oyzjmomOtBXcdzCKkNoQNu7hvC1v7R1a8LrAWEU8Nz8BIaPWi1v
 1DVwSMKxfgsiWZg2JvWi0jPopFd/Y2/uZq8gXelOyty/8SswZFcGNPfa6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357335064"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="357335064"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 03:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806950478"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806950478"
Received: from iiervoli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 03:04:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, John Harrison
 <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Avoid circular locking
 dependency when flush delayed work on gt reset
In-Reply-To: <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
 <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
 <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan>
Date: Wed, 06 Sep 2023 13:04:06 +0300
Message-ID: <87jzt3hb3d.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Sep 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>> > I was actually thinking why not leave things as they are and just
>> > disable lockdep from CI. This doesn't look like a relevant report
>> > to me.
>> >=20
>> > Andi
>> Disable lockdep? The whole of lockdep? We absolutely do not want to disa=
ble
>> an extremely important deadlock testing infrastructure in our test
>> framework. That would be defeating the whole point of CI.
>>=20
>> Potentially we could annotate this one particular scenario to suppress t=
his
>> one particular error.=C2=A0 But it seems simpler and safer to just updat=
e the
>> code to not hit that scenario in the first place.
>
> yes... lockdep is a debug tool and might provide false reports...
> We need to have a great willingness to start fixing and hunting
> debug lockdep's false positives (like this one, for instance).
>
> It's even more annoying to reduce our CI pass rates, especially
> when in BAT tests, with such false deadlocks.

Make lockdep understand what you're doing, and there are no false
positives. That's all there is to it.

> It's the developer's responsibility to test its code with
> debug_lockdep and fix all the potential deadlocks and ignore the
> false ones.

No. Manual validation of lockdep reports is not feasible. Lockdep is the
tool to validate locking. It's the developer's responsibility to make
lockdep understand the design.

Besides, locking is often subtle. Stuff can change as a side effect even
when you're not intentionally changing locking, e.g. during
refactoring. What you're suggesting effectively means all developers
should run all of igt on a bunch of different generations of machines
with lockdep enabled. Realistically, not going to happen, and we have CI
because of this.

> I sent a patch for this[*] already.
>
> Andi
>
> [*] https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/128

Yeah, no.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
