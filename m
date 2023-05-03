Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE296F5591
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 12:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CE910E250;
	Wed,  3 May 2023 10:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44E010E250;
 Wed,  3 May 2023 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683108411; x=1714644411;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wXTKpIgcNJcKBmw7wE/sa1YRHjVIbRIem99rf4NCvjc=;
 b=Zh15QvdBYbkeNg3d6yYAu6Fas41YMkqxxtXmmPY74JJvqzYzQFguykhY
 gNDEaaT92b/P0MfftqcZTgP2xPPkic8f/XGBySI/YU8SwzeZOSUOgrtj9
 4LmCs1gdWtNtos/K9oVodhm9t15Jf8IUcBk0Q7pKXhlhRxrcs0o5lP1/5
 ZQaFcpADtn5i0AwGkp2Z+uhKS/PW5quhxZpTM2w1XUE6EVpnARr2Fx3xj
 Igf59EOww5oujEQGoARsjBfURL0PwZkaMmHuC7iwaUB4OLlqvAx5twKga
 f2ANm9F+yPnTdCYghtMLxcHL2sV0UeuL6eJIdn65pdpgVzvxXXUiGHfKY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="332980286"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="332980286"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 03:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870881384"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="870881384"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 03:06:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Tetsuo Handa
 <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: avoid flush_scheduled_work()
 usage
In-Reply-To: <ZDuntOkUeh0Eve8a@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <b10d5ada60ab823a09b64f3bfd79db2dd601d5fd.camel@coelho.fi>
 <9ee23b3f-e2e1-6a78-4a28-2ed8790636e5@I-love.SAKURA.ne.jp>
 <87edomg4b6.fsf@intel.com>
 <95e9f67f-b198-4946-327c-626de07e45f9@I-love.SAKURA.ne.jp>
 <ZDuntOkUeh0Eve8a@phenom.ffwll.local>
Date: Wed, 03 May 2023 13:06:45 +0300
Message-ID: <87sfcdzq2y.fsf@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Luca Coelho <luca@coelho.fi>, DRI <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 16 Apr 2023, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Apr 14, 2023 at 07:52:12PM +0900, Tetsuo Handa wrote:
>> On 2023/04/14 19:13, Jani Nikula wrote:
>> > On Fri, 14 Apr 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>=
 wrote:
>> >> On 2023/03/15 19:47, Luca Coelho wrote:
>> >>> On Tue, 2023-03-14 at 20:21 +0900, Tetsuo Handa wrote:
>> >>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() us=
ing a
>> >>>> macro") says, flush_scheduled_work() is dangerous and will be forbi=
dden.
>> >>>>
>> >>>> Now that i915 is the last flush_scheduled_work() user, for now let's
>> >>>> start with blind conversion inside the whole drivers/gpu/drm/i915/
>> >>>> directory. Jani Nikula wants to use two workqueues in order to avoid
>> >>>> adding new module globals, but I'm not familiar enough to audit and
>> >>>> split into two workqueues.
>> >>>>
>> >>>> Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
>> >>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> >>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> >>>> Cc: Jani Nikula <jani.nikula@intel.com>
>> >>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >>>> ---
>> >>>> Changes in v2:
>> >>>>   Add missing alloc_workqueue() failure check.
>> >>>
>> >>> Hi,
>> >>>
>> >>> Thanks for your patch! But it seems that you only fixed that failure
>> >>> check, without making the other change Jani proposed, namely, move t=
he
>> >>> work to the i915 struct instead of making it a global.
>> >>>
>> >>> I'm working on that now.
>> >>
>> >> What is estimated time of arrival on this?
>> >> Can we expect your work in Linux 6.4 ?
>> >=20
>> > I'm afraid that ship has sailed. Sorry. :(
>>=20
>> Well, then, can we temporarily apply "[PATCH v2] drm/i915: avoid flush_s=
cheduled_work() usage" ?
>> This patch is a mechanical conversion which unlikely causes regressions.=
 This patch eliminates
>> interference from work items outside of i915, which is small but an impr=
ovement for i915 users.
>
> I think if someone from i915 team triple-checks that i915 really doesn't
> use any of the drm workers (hotplug handling, atomic commit, ...) then I
> think we should be fine. The one that's unavoidable is the rmfb work
> (which really only exists to avoid signal interruptions when doing this in
> userspace process context, it's entirely synchronous otherwise), but I
> think that's safe.
>
> With that tripled checked I think the mechanical conversion is ok to land
> late for 6.4 and has my
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> [Dropped this on irc already, here just for the record]

The patch conflicts already, I was out sick for a week, and nobody
picked this up in the mean time. I just don't see a way to rush it to
v6.4 anymore, with mere days remaining in the merge window. I'm sorry.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
