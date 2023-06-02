Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610D7200E0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E669710E66E;
	Fri,  2 Jun 2023 11:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA5010E66E;
 Fri,  2 Jun 2023 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685706646; x=1717242646;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JiVI2jNmcM3OR4qiNnP+2CqY4Fm72BRJpoZhnHZ2V+Y=;
 b=m/hlkw7gwk3eLSom5xnMYD43GDDTUOtzprWiwgP9YB8urkl0DriU+0Qw
 zahOzM/8pWBxXkNQdpkUFm7S7eyNU0whRhj0vPsI5T9/bG8HDcyXNKlHI
 ulXoMLIGCig3isXGXPpysu+9/LRYsD25DMM7VQRAhQ/sWY3oxV/lejrQG
 X7rpSAoIdlk67KxDqChvc3xXqz0jacuU0z81ruzioHzrzUnzzghxVbRvC
 xUs6chRKN4hjbi0d/jp95VS8eSmlqkR/WwB/RFGXKAC/p6tPSQIu24lUM
 K3dzbER3uhiZsblDoYFnGT3CQx9JheaaCRI4ETljjEjCTnwB+NwhGpe0z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354698052"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="354698052"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 04:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777648903"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="777648903"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 04:50:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 00/13] drm/display & drm/i915: more
 struct drm_edid conversions
In-Reply-To: <87wn0ofsba.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1685437500.git.jani.nikula@intel.com>
 <87wn0ofsba.fsf@intel.com>
Date: Fri, 02 Jun 2023 14:50:39 +0300
Message-ID: <871qiuf5gw.fsf@intel.com>
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

On Wed, 31 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 30 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> Rebase of https://patchwork.freedesktop.org/series/116813/
>>
>> Move struct drm_edid conversions forward.
>>
>> There are still some drm_edid_raw() stragglers, but this nudges things
>> forward nicely.
>>
>> Jani Nikula (13):
>>   drm/edid: parse display info has_audio similar to is_hdmi
>>   drm/display/dp_mst: drop has_audio from struct drm_dp_mst_port
>>   drm/edid: add drm_edid_read_switcheroo()
>>   drm/edid: make drm_edid_duplicate() safe to call with NULL parameter
>>   drm/display/dp_mst: convert to struct drm_edid
>
> Maarten, Maxime, Thomas, can I get an ack for merging the above commits
> via drm-intel, please?

Pushed all to drm-intel-next with Thomas' IRC ack.

Thanks,
Jani.

>
> BR,
> Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
