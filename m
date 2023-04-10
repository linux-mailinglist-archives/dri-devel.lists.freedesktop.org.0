Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E176DC443
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 10:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C45010E25D;
	Mon, 10 Apr 2023 08:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B510E25D;
 Mon, 10 Apr 2023 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681115041; x=1712651041;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=9zTMhQjBSMrmpp3t5rh3NIbfiaHV3UcaF9aPOHUQvck=;
 b=IVoH3GopwKTkxRkcKuxYXWttHqB6dUXAlJtGG7FBfqGi0Rmrc4rQqQOf
 TgwBB12k47b1pzlV234qEcjXEvDsMb7VzXcDJZz682/NPo8yzxGsYtBgs
 af8gfOs9NfEHSuZa/gBjVgTjhwewGxN4kzeUwz9kAUnxiToqtnJGVUwzV
 1epy9eUTt+EexDuqLlAQ3SK+8560XSdVe+CEAqWLuFpARbVmMNqAT9Dyk
 bVC5ewSxzm/Gyy3gykwYA/cYm0uZy6Qy7PeNHk9rv6J6PnuXwKEDWu0oW
 lqkoENqtrZpcC7Bjvrrw3MdzK3VianIbf5ezp/4W9frHU8ksj9hNGH4E7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="343319058"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="343319058"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 01:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="681674077"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681674077"
Received: from mgenc-mobl.amr.corp.intel.com (HELO localhost) ([10.209.7.100])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 01:23:59 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168072640394.392286.10003850953246720395@jljusten-skl>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
 <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
 <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
 <168072640394.392286.10003850953246720395@jljusten-skl>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 10 Apr 2023 01:23:59 -0700
Message-ID: <168111503901.392286.9448911281846869775@jljusten-skl>
User-Agent: alot/0.10
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
Cc: Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-05 13:26:43, Jordan Justen wrote:
> On 2023-04-05 00:45:24, Lionel Landwerlin wrote:
> > On 04/04/2023 19:04, Yang, Fei wrote:
> > >> Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cac=
he at BO creation
> > >>
> > >> Just like the protected content uAPI, there is no way for userspace =
to tell
> > >> this feature is available other than trying using it.
> > >>
> > >> Given the issues with protected content, is it not thing we could wa=
nt to add?
> > > Sorry I'm not aware of the issues with protected content, could you e=
laborate?
> > > There was a long discussion on teams uAPI channel, could you comment =
there if
> > > any concerns?
> > >
> >=20
> > We wanted to have a getparam to detect protected support and were told =

> > to detect it by trying to create a context with it.
> >=20
>=20
> An extensions system where the detection mechanism is "just try it",
> and assume it's not supported if it fails. ??
>=20

I guess no one wants to discuss the issues with this so-called
detection mechanism for i915 extensions. (Just try it and if it fails,
it must not be supported.)

I wonder how many ioctls we will be making a couple years down the
road just to see what the kernel supports.

Maybe we'll get more fun 8 second timeouts to deal with. Maybe these
probing ioctls failing or succeeding will alter the kmd's state in
some unexpected way.

It'll also be fun to debug cases where the driver is not starting up
with the noise of a bunch of probing ioctls flying by.

I thought about suggesting at least something like
I915_PARAM_CMD_PARSER_VERSION, but I don't know if that could have
prevented this 8 second timeout for creating a protected content
context. Maybe it's better than nothing though.

Of course, there was also the vague idea I threw out below for getting
a list of supported extentions.

-Jordan

>=20
> This seem likely to get more and more problematic as a detection
> mechanism as more extensions are added.
>=20
> >=20
> > Now it appears trying to create a protected context can block for=20
> > several seconds.
> >=20
> > Since we have to report capabilities to the user even before it creates=
=20
> > protected contexts, any app is at risk of blocking.
> >=20
>=20
> This failure path is not causing any re-thinking about using this as
> the extension detection mechanism?
>=20
> Doesn't the ioctl# + input-struct-size + u64-extension# identify the
> extension such that the kernel could indicate if it is supported or
> not. (Or, perhaps return an array of the supported extensions so the
> umd doesn't have to potentially make many ioctls for each extension of
> interest.)
>=20
> -Jordan
