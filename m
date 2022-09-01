Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD35A93E2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1210E680;
	Thu,  1 Sep 2022 10:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1B010E56D;
 Thu,  1 Sep 2022 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662026688; x=1693562688;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kxRMAx8hcBHz3UWeVNSASg3lrgVxgisAsGlxHg7N18g=;
 b=aUqTFi7lM7giXQJY8LXhCcReeGYxkVoDldiLxm2Z5zcUeS65mETEy8Y4
 YvfWToRHplWZXD/0G7k1Bcd7z2t1cHokt+T/ADSGfFxEqDt8UiC1TKE2f
 ATLbZWXwnUdp4hVPvVaHhTc1oJ0u9k66kpYUuBs5hr0TMc/+lNAle3CA/
 I1mBPeM3Yzlt7/WuBKwC2soZhbnD70NH9MUzZJ96MsSFq+7KF6jYp1zJa
 NL1ufvrtEoZN+lovnGNr+paSgcfQzEe/O6anXCyPV6Pwhk+SGXsvWD7a2
 p6H9YVj/sUkQCkx9EkbyICEf5ewYbAIhNJTVCSN+Vph3AJscQkVfbZsK4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="293252579"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="293252579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:04:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642269734"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:04:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 01/11] drm/i915: Move display and media IP version to
 runtime info
In-Reply-To: <5a5538e3-9a79-2210-3632-483b4ee329db@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
 <20220831214958.109753-2-radhakrishna.sripada@intel.com>
 <878rn3czbh.fsf@intel.com>
 <5a5538e3-9a79-2210-3632-483b4ee329db@intel.com>
Date: Thu, 01 Sep 2022 13:04:35 +0300
Message-ID: <87zgfjbebw.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Sep 2022, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 01.09.2022 09:45, Jani Nikula wrote:
>> On Wed, 31 Aug 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:
>
> ...
>
>>>  	struct ip_version graphics;
>>> +	struct ip_version media;
>>> +	struct ip_version display;
>> 
>> The runtime display info is now in an unnamed struct under struct
>> intel_runtime_info below, and this belongs there.
>> 
>> There's also some pressure to name it, and "display" would be the name,
>> so this would collide.
>> 
>> Seems like all of the above are overly generic names, including the
>> pre-existing "graphics". Something to consider.
>
> maybe
>
> struct {
> 	struct {
> 		struct ip_version version;
> 		...
> 	} graphics;
>
> 	struct {
> 		struct ip_version version;
> 		...
> 	} media;
>
> 	struct {
> 		struct ip_version version;
> 		...
> 	} display;
> } runtime;
>
> then
>
> drm_printf(p, "display version: %u.%02u\n",
> 	runtime->display.version.ver,
> 	runtime->display.version.rel);

Looks good to me. The other display related stuff can be moved later.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
