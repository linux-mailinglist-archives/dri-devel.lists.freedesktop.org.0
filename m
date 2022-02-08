Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13E4AE4E3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 23:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21EB10E2D8;
	Tue,  8 Feb 2022 22:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8734310E2D8;
 Tue,  8 Feb 2022 22:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644360338; x=1675896338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yZxu8/u6DLwM0+EeTFPxD9Q+e83yD8UuDt5DaTQavNk=;
 b=kCqxD6OruYs+FHrjweQTfO8TQiH1QzMcqxQNdH6IAdtjs8iZD/j1mkWh
 +y1mposp00N1vO9YRM7ISRtYv6kGbUcUOcJ4t4zhLm+biUUkPY1B/tVT6
 WCi+XBfkI4lsOIlKt8dSnn+6YAdrbm/Nm8fTrM94gBWorhwbDmy/YAdgi
 0CvUZSz6gdb+sCxKORssGZfVKtmD/UOygeCUM/sFYnvWCdKmqs0cacB5v
 ZjbNVWaKo4m/ySB9c3sVe46do7vK3LDkfifrZrsSxrL4t0XJjF+1dF/Vx
 Nc9s8CMjuMyxOLcDwivI/g2uLsEvmSo7heC8nEF7acQv11nThWk1O1MUq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249275890"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="249275890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 14:45:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="633009534"
Received: from fpaillet-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.65.117])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 14:45:37 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
In-Reply-To: <f23cd56f-786f-358a-c363-70417d10fcab@linux.intel.com>
References: <20220207192854.862959-1-jordan.l.justen@intel.com>
 <20220207192854.862959-5-jordan.l.justen@intel.com>
 <f23cd56f-786f-358a-c363-70417d10fcab@linux.intel.com>
Date: Tue, 08 Feb 2022 14:45:37 -0800
Message-ID: <877da5c6zy.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:

> Will GuC folks be reviewing this work?

I don't know. If you mean the i915 devs interfacing with the GuC, I know
John/Rodrigo seemed a bit resistant writing the patches to give
userspace this trivial format guarantee on the blob.

So, I hoped they would write the patches (3 & 4 in my series), but now
I'm hoping they will at least accept the patches.

> Quick sanity check maybe makes sense, given data is being "sent" to 
> userspace directly, I am just not sure if it is worth having in 
> non-debug builds of i915. Though I will agree not having it in 
> production then largely defeats the purpose so dunno.

The check seems fairly trivial, and it seems like i915 should provide
whatever guidance/guarantee is possible to userspace. (Thus, do it once
per boot even on release builds.) See also, the commit message I added.

> Effective difference if GuC load fails versus userspace libraries
> failing to parse hwconfig?

Lots of potential things to consider. Personally, I think for internal
Intel builds, if this check fails, then it ought to cause the GuC to
always fail to load, which today means the device will be wedged.

For external builds, I think it should still load the GuC but not send
the blob to userspace. This is what should happen with the patches in
this series. (I really hope this never happens, which it why I think the
internal builds should be so harsh.)

Now ... if i915 ever regains the ability to drive the device without the
closed source GuC, well... No reason to go off on unrealistic tangents. :)

Also, later down the road for released products, userspace drivers may
choose to bypass the hwconfig to limit the dependence on GuC. That is a
related, but different topic.

-Jordan
