Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2C51D67B
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 13:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FCD1120E5;
	Fri,  6 May 2022 11:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4611120E5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651835790; x=1683371790;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ffv8NjpypTctGSjcYAJAG04MB4c0QqG3L0uxm5pUCHs=;
 b=AqEcMMxg4dcJxqjyswDOJZb32SkX5hEiCSErwZnKdJhLsWvY8vTXlky3
 /xhA7Z00ErdU8WMVLdUg/ucpV4IF4DPyH5xwnI+zdE38R3roCqdvE2FVB
 /Q/EH8QwA+ElyK4WstwVVyne2wybmxKDDyCA+Aym3mOUGrv0/INh4TMVl
 6mkgc5GtNayfewMg1eMVR71FeN5mbKPvgzRFVsd6XteEsTX8PEHJeCUMx
 HZoE2TtkS97rLxIRfY8UBjG5FJ5sa2floO4bbFjMUYloBm3kYIdmAOOi1
 v4ryZP8pM5vLgE6v9XViBUaOEN6NplPKqFxhGO1SN1fp8v6I6u0vRfaP0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331428502"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="331428502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="695132735"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:16:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
In-Reply-To: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Date: Fri, 06 May 2022 14:16:22 +0300
Message-ID: <874k22lxmh.fsf@intel.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
> Ville,
>
> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> If we're unable to read the EDID for a display because it's corrupt /
>> bogus / invalid then we'll add a set of standard modes for the
>> display. When userspace looks at these modes it doesn't really have a
>> good concept for which mode to pick and it'll likely pick the highest
>> resolution one by default. That's probably not ideal because the modes
>> were purely guesses on the part of the Linux kernel.
>>
>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>  drivers/gpu/drm/drm_edid.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>
> Someone suggested that you might have an opinion on this patch and
> another one I posted recently [1]. Do you have any thoughts on it?
> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
> don't have an opinion, that's OK too.
>
> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

There are a number of drivers with combos:

	drm_add_modes_noedid()
	drm_set_preferred_mode()

which I think would be affected by the change. Perhaps you should just
call drm_set_preferred_mode() in your referenced patch?

Alternatively, perhaps drm_set_preferred_mode() should erase the
previous preferred mode(s) if it finds a matching new preferred mode.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
