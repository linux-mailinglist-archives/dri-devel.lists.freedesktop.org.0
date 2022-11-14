Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A56279E2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869AD10E035;
	Mon, 14 Nov 2022 10:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1EA10E035
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668420154; x=1699956154;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZpphfstUP7oMJ91iN9xXMmrOJnu/uu6RmVG1mEwLx1g=;
 b=NkgOE1oreI5EBn6otBquUMjnTgk2Gtdsbh1/ETULRcy5VAtEi/Joe4zn
 iml+hCW9Pj24w8j0TmM1Wv7MzpabgiJ2iJodvf1YoXvtLgy6UXe0pFeSq
 KnyRL05Ko2O8d4FTnjZ8R+9MnleOtYLSSLWu1cpQEQ9JeepteAwFbs4Z6
 1FB9mkvwqMDJjGaC65ztHlrb7lKqO7Wr5kXqnF89vg4qC+yUUbifCAUmo
 iEJgmCu6guR6sUVgrZ40bwgb6fhtYSAihBcs4CiyCK8r49UtyS+aeuORt
 eSPZ5O3a03IzCJXtkmJYrAy8Sib0ht5+2tfmNSubPVRuo61ftVrKKTa+3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311934951"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311934951"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 02:02:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="763420378"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="763420378"
Received: from dsmahang-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.240])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 02:02:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id()
 has an error
In-Reply-To: <CAD=FV=UUpR9Euq5r+MujO6BdTk2cnWe_0JTdcP_e5RP47apUcw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
 <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
 <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
 <956de566-d60a-f257-edff-85a2eac06d99@quicinc.com>
 <CAD=FV=UUpR9Euq5r+MujO6BdTk2cnWe_0JTdcP_e5RP47apUcw@mail.gmail.com>
Date: Mon, 14 Nov 2022 12:02:28 +0200
Message-ID: <87iljh4zwr.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Nov 2022, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Oct 25, 2022 at 1:39 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> On 10/24/2022 1:28 PM, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Fri, Oct 21, 2022 at 2:18 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> >>
>> >> Hi Doug
>> >>
>> >> On 10/21/2022 1:07 PM, Douglas Anderson wrote:
>> >>> If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
>> >>> like to see the EDID that was read so we have a chance of
>> >>> understanding what's wrong. There's already a function for that, so
>> >>> let's call it in the error case.
>> >>>
>> >>> NOTE: edid_block_read() has a retry loop in it, so actually we'll only
>> >>> print the block read back from the final attempt. This still seems
>> >>> better than nothing.
>> >>>
>> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> >>
>> >> Instead of checkinf for edid_block_status_valid() on the base_block, do
>> >> you want to use drm_edid_block_valid() instead?
>> >>
>> >> That way you get the edid_block_dump() for free if it was invalid.
>> >
>> > I can... ...but it feels a bit awkward and maybe not quite how the
>> > functions were intended to work together?
>> >
>> > One thing I notice is that if I call drm_edid_block_valid() I'm doing
>> > a bunch of duplicate work that already happened in edid_block_read(),
>> > which already calls edid_block_check() and handles fixing headers. I
>> > guess also if I call drm_edid_block_valid() then I should ignore the
>> > "status" return value of edid_block_read() because we don't need to
>> > pass it anywhere (because the work is re-done in
>> > drm_edid_block_valid()).
>> >
>> > So I guess I'm happy to do a v2 like that if everyone likes it better,
>> > but to me it feels a little weird.
>> >
>> > -Doug
>>
>> Alright, agreed. There is some duplication of code happening if we use
>> drm_edid_block_valid(). I had suggested that because it has inherent
>> support for dumping the bad EDID.
>>
>> In that case, this change LGTM, because in principle you are doing the
>> same thing as _drm_do_get_edid() (with the only difference being here we
>> read only the base block as opposed to the full EDID there).
>>
>> Hence,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> I've given this patch a bunch of time because it wasn't urgent, but
> seems like it could be about time to land. I'll plan to land it next
> Monday or Tuesday unless anyone has any other comments.

Ack, it's benign enough.

BR,
Jani.

>
> Thanks!
>
> -Doug

-- 
Jani Nikula, Intel Open Source Graphics Center
