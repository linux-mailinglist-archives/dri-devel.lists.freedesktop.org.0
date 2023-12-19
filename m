Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731F818730
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF8710E48C;
	Tue, 19 Dec 2023 12:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347410E48C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702988142; x=1734524142;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=lmSP+s2quBd1WrxnpUaM0qffn94kZ7wfgiSpXA276Xk=;
 b=Vk9Zb6yj4vMu7bGj7QwAMbUd3YZfvNqzuVZOn9uU5xz9cOgbCjEjTgcF
 eVO3D6rRc1iB3UpwYNpfS9I/IIq6wRiIor3LnmNpNNSanuvL7NtUIZWpH
 XI3fzZWmxta8TCZRCnO5Y7VhAFJExKctb7gMSugpdi09ffUmQPUya2643
 NT5aE5Bk0eIETCXiAHWGnz0nuBvWh3a/Mx836hFj3uVo6a0Rq6ivXzaL1
 xXgInin1MMiu69QydSfaSXIsWQGyUQ9GjNO25QW/W8XnvvQZzuUdvgonm
 MjRz7DkEoa2+3xFLfkXRRfZZ4qTh8yJfOkif9CjN6KEF4Az59WDhTUhRt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="375139536"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="375139536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="919604022"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="919604022"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:15:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
In-Reply-To: <87jzqksg8g.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698312534.git.jani.nikula@intel.com>
 <87jzqksg8g.fsf@intel.com>
Date: Tue, 19 Dec 2023 14:15:36 +0200
Message-ID: <87frzytml3.fsf@intel.com>
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

On Tue, 14 Nov 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 26 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> This is just the first two patches of a lengthy series that I'm not
>> really sure how to proceed with. Basically the series converts all of
>> drm/bridge to the new struct drm_edid infrastructure. It's safer than
>> struct edid, because it contains meta information about the allocated
>> size of the EDID, instead of relying on the size (number of extensions)
>> originating from outside of the kernel.
>>
>> The rest is at [1]. The commit messages are lacking, and I don't really
>> have the toolchain to even build test most of it. But I think this is
>> where drm/bridge should go. Among all of drm, I think bridge has the
>> most uses of struct edid that do not originate from the drm_get_edid()
>> family of functions, which means the validity checks are somewhat
>> inconsistent, and having the meta information is more crucial.
>>
>> Bridge maintainers, please instruct how to best proceed with this.
>
> Ping.

Ping.

>
> The two patches posted here could be merged, to add something to build
> the later commits on gradually.
>
> BR,
> Jani.
>
>>
>>
>> Thanks,
>> Jani.
>>
>>
>>
>> [1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge
>>
>>
>>
>> Jani Nikula (2):
>>   drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
>>   drm/bridge: switch to drm_bridge_read_edid()
>>
>>  drivers/gpu/drm/drm_bridge.c           | 46 +++++++++++++++++++++++++-
>>  drivers/gpu/drm/drm_bridge_connector.c | 16 ++++-----
>>  include/drm/drm_bridge.h               | 33 ++++++++++++++++++
>>  3 files changed, 86 insertions(+), 9 deletions(-)

-- 
Jani Nikula, Intel
