Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334086E2073
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678AB10ECB7;
	Fri, 14 Apr 2023 10:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8C610ECB7;
 Fri, 14 Apr 2023 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681467187; x=1713003187;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4JBsiH7awDA5kkWPQO2QU8JRGS4XqO4oFVMkl40mKcQ=;
 b=FyyKkXpnicFLIr6lKGhZ3rF5/RGpCjY2yNgqGNdEg1P/gWufBfMOn61B
 L75RgBh0A/seUXrpObyEkJzZdNNCCU4m1LAX9QJqpCFtxcItbsF1WFDHq
 xhksPJ6oQvJvSzrKSWwl91cuki4dsUPpnicaZF5OusVr4hutQ+/NNWZ4V
 b9F73XV5n1KwDDx7oB4+dUKTnwdBoMWG2pnGPvX8ssPtEEfCSH6TjxZ1d
 aaCvxEzzUmJBMLGtri1U8N5B7lNOx4PuWie7AIDod3K+L+zhn8GC+lixZ
 NWW2piD6yS7P+nXjwUF+GggcRhlGuaZmpawAhvjsuDgUEFCOEOyDWwJbx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346263747"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="346263747"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="754405071"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="754405071"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.117])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:13:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Luca Coelho
 <luca@coelho.fi>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: avoid flush_scheduled_work()
 usage
In-Reply-To: <9ee23b3f-e2e1-6a78-4a28-2ed8790636e5@I-love.SAKURA.ne.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <b10d5ada60ab823a09b64f3bfd79db2dd601d5fd.camel@coelho.fi>
 <9ee23b3f-e2e1-6a78-4a28-2ed8790636e5@I-love.SAKURA.ne.jp>
Date: Fri, 14 Apr 2023 13:13:01 +0300
Message-ID: <87edomg4b6.fsf@intel.com>
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
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrot=
e:
> On 2023/03/15 19:47, Luca Coelho wrote:
>> On Tue, 2023-03-14 at 20:21 +0900, Tetsuo Handa wrote:
>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
>>> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
>>>
>>> Now that i915 is the last flush_scheduled_work() user, for now let's
>>> start with blind conversion inside the whole drivers/gpu/drm/i915/
>>> directory. Jani Nikula wants to use two workqueues in order to avoid
>>> adding new module globals, but I'm not familiar enough to audit and
>>> split into two workqueues.
>>>
>>> Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>> ---
>>> Changes in v2:
>>>   Add missing alloc_workqueue() failure check.
>>=20
>> Hi,
>>=20
>> Thanks for your patch! But it seems that you only fixed that failure
>> check, without making the other change Jani proposed, namely, move the
>> work to the i915 struct instead of making it a global.
>>=20
>> I'm working on that now.
>
> What is estimated time of arrival on this?
> Can we expect your work in Linux 6.4 ?

I'm afraid that ship has sailed. Sorry. :(

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
