Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEAE81CC6A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 16:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891A10E7B8;
	Fri, 22 Dec 2023 15:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9839E10E7B8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703260394; x=1734796394;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CFoJa5ypwAz/SUt5Uf6VhykKJNuyXga6qSB/d5ti3uk=;
 b=P/orfo5/5dF/McSwqOaMkhZw29p4IZkm6Ph/g67HBU88dL0f+RVzNgqs
 VMP179TMbym/A7jmtMVhFFSCyzwGxKJcvDwzWS++H3mEHmzJqHrcT6cY5
 Vl4koh/b5oXCYlrmQ8WciPnfK4IY2quJJpVttV88P9QI7b1dfyuIfGpBn
 YUG8Gf8M29XTphdEF5OFWkZrZne6uyUgSQxYr8RRndUq5vg2Ewo9qZzJ5
 NToUCHWmelYpHMBf/7QyrQ1Q9ulZM0agELt/M4t5WcO84Q88Ut7G5yHWq
 QEKd0r4L+tKXZA4DIp4qArhDFAZXb8HBQJKWnefnvG3ip5ed4+JwtXySF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="9528663"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="9528663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 07:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="867667122"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="867667122"
Received: from yspisare-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.50.156])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 07:53:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, Andrzej
 Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
In-Reply-To: <87msu2si7q.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698312534.git.jani.nikula@intel.com>
 <87jzqksg8g.fsf@intel.com> <87frzytml3.fsf@intel.com>
 <dcad8756-c723-4dc9-91db-a386a1b2824a@linaro.org>
 <87msu2si7q.fsf@intel.com>
Date: Fri, 22 Dec 2023 17:53:06 +0200
Message-ID: <87edfes07x.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Fri, 22 Dec 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> On 19/12/2023 13:15, Jani Nikula wrote:
>>> On Tue, 14 Nov 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> On Thu, 26 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>> This is just the first two patches of a lengthy series that I'm not
>>>>> really sure how to proceed with. Basically the series converts all of
>>>>> drm/bridge to the new struct drm_edid infrastructure. It's safer than
>>>>> struct edid, because it contains meta information about the allocated
>>>>> size of the EDID, instead of relying on the size (number of extensions)
>>>>> originating from outside of the kernel.
>>>>>
>>>>> The rest is at [1]. The commit messages are lacking, and I don't really
>>>>> have the toolchain to even build test most of it. But I think this is
>>>>> where drm/bridge should go. Among all of drm, I think bridge has the
>>>>> most uses of struct edid that do not originate from the drm_get_edid()
>>>>> family of functions, which means the validity checks are somewhat
>>>>> inconsistent, and having the meta information is more crucial.
>>>>>
>>>>> Bridge maintainers, please instruct how to best proceed with this.
>>>>
>>>> Ping.
>>> 
>>> Ping.
>>
>> Sorry for the delay, I would have preferred changing the get_edid to return
>> a drm_edid, but I understand the task is too high, could you instead use
>> @get_drm_edid instead of @edid_read ?
>
> edid_read matches the changes in drm_edid.c, going from drm_get_edid()
> to drm_edid_read().
>
> There's a nice symmetry when ->get_edid() hooks using drm_get_edid() are
> converted to ->edid_read() hooks using drm_edid_read().
>
>> And perhaps convert one very common bridge to this so we can validate
>> the change in CI.
>
> So I did convert all of bridge over a few months back, and pushed the
> branch to [1]. Should I brush that up and send the entire series? I
> don't really know what's common and what's not.

Okay, I rebased and pushed [1]. Probably doesn't make sense to send a
patch bomb like that right now...

BR,
Jani.


[1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge


-- 
Jani Nikula, Intel
