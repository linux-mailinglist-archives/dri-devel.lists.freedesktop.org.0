Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1348B58F920
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517018B11F;
	Thu, 11 Aug 2022 08:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE1310F6F8;
 Thu, 11 Aug 2022 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660206808; x=1691742808;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xoZeswWC5uikhXIWMEX56vJhMGj3B7Pt03UnG2ou+vs=;
 b=iJJG8c6VNnKUMeI9H5riK2nNGIxLSJN62/4tzj4u+vXZOernT++F76hi
 oRCRUPLp0FdhXfgMqM1tVeNreVm7g1kAJU+rAYU/IeXesivdlpsyZ6Ij1
 Yc5TGCCUkQlBokiMT6L3EuyfS/S5yLXIiYxo57hkZEsxY007aB+UC5ElC
 4UP+v8S8ren0QJAX1IfT5tQwBibMw2AHxRiVkSgsgsy3p5hkOtZk6Zs2N
 YAL0PVAUEaZeMcGuiIZ5h9RP/A6lDmbXSC0wX/aFd99QOp0oxl3CS4BBv
 CzGCoik1X7MM1rIf4pSlASX6PoVTkaSeLG/+D5+P6P9JpEV5aTJp7v8Cd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="353033592"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="353033592"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 01:33:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="665278766"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.241])
 ([10.213.6.241])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 01:33:19 -0700
Message-ID: <7418ebd6-a969-c2db-1704-aacad08c3000@intel.com>
Date: Thu, 11 Aug 2022 10:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v6 0/4] drm/i915/display: stop HPD workers
 before display driver unregister
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Deak, Imre" <imre.deak@intel.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
 <94d076ad-b0ff-0469-a741-255360a7da41@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <94d076ad-b0ff-0469-a741-255360a7da41@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre, Jani, Ville,

Since one of CI test machines is back (bat-rpls-2) tests are regularly 
aborted on this machine due to bugs this patchset resolves [1], 
reviewing/merging these patches would allow to cure the situation on CI.

[1]: https://intel-gfx-ci.01.org/tree/drm-tip/bat-rpls-2.html

Regards
Andrzej

On 02.08.2022 14:24, Gwan-gyeong Mun wrote:
> Hi Jani, Ville and Imre,
> 
> If there are no problems after reviewing this patch series, could you 
> please merge it?
> 
> Many thanks,
> G.G.
> 
> On 7/22/22 3:51 PM, Andrzej Hajda wrote:
>> Hi Jani, Ville, Arun,
>>
>> This patchset is replacement of patch
>> "drm/i915/display: disable HPD workers before display driver 
>> unregister" [1].
>> Ive decided to split patch into two parts - fbdev and MST, there are 
>> different
>> issues.
>> Ive also dropped shutdown path, as it has slightly different 
>> requirements,
>> and more importantly I am not able to test properly.
>>
>> v2 (thx Arun for review):
>>    - reword of commit message (Arun)
>>    - intel_fbdev_hpd_set_suspend replaced with intel_fbdev_set_suspend 
>> (Arun)
>> v3:
>>    - new patch adding suspended flag, to handle
>>      https://gitlab.freedesktop.org/drm/intel/-/issues/5950
>> v4:
>>    - check suspend flag also in i915_digport_work_func
>> v5:
>>    - added patch blocking FB creation in case HPD is supended,
>>    - added R-B from Arun to patch 3, thx
>> v6:
>>    - finally, after getting direct access to bat-rpls-2, I have found 
>> the source of last WARN,
>>      intel_fbdev_hpd_set_suspend was not called in case of deferred 
>> setup, fixed in patch 2.
>>
>> [1]: https://patchwork.freedesktop.org/series/103811/
>>
>> Regards
>> Andrzej
>>
>>
>> Andrzej Hajda (4):
>>    drm/i915/hpd: postpone HPD cancel work after last user suspension
>>    drm/i915/fbdev: suspend HPD before fbdev unregistration
>>    drm/i915/display: add hotplug.suspended flag
>>    drm/i915/fbdev: do not create fbdev if HPD is suspended
>>
>>   drivers/gpu/drm/i915/display/intel_display.c |  3 +++
>>   drivers/gpu/drm/i915/display/intel_fbdev.c   | 12 ++++++++++--
>>   drivers/gpu/drm/i915/display/intel_hotplug.c | 11 ++++++++++-
>>   drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
>>   drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
>>   drivers/gpu/drm/i915/i915_drv.h              |  2 ++
>>   drivers/gpu/drm/i915/i915_irq.c              |  1 -
>>   7 files changed, 28 insertions(+), 7 deletions(-)
>>

