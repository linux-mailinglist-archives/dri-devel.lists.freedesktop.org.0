Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB8C4C6F9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CD210E508;
	Tue, 11 Nov 2025 08:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbW0KT4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9375D10E508;
 Tue, 11 Nov 2025 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762850601; x=1794386601;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0v0Jtgl9ARnONMGzGj32WLscEffYpaujXorUUW25ELM=;
 b=lbW0KT4+lrBTDG6Yzm7N2fArBevv5ME3QAD6w93bgujze3rhnzZtbRKc
 Su4QiVX4txmEfvZaH9sssV2tAuD0sAhnUyKyaby0ME96++L++W5v0qHxL
 PVfgc8fW+LKxiNwP/2ipM6CFDIM2Uspi208jvQ+iRCHafe/OKvx4kHswC
 Zsy1CPAgu36rv3F+yDqsP1HpbtS0kX5WEMgOXfCTg1kCqC2dQVTlspuU/
 wjqji4XghxDRqOhji3T1ncqH83V0ee05f4U3RxOgELIn61RHS3VDBhZ1A
 A1lyL+9gV/DouLYFqya64Lo26MPu4VmOSqN0JKmuexY8D7e5POi3UEn4m A==;
X-CSE-ConnectionGUID: 5M/bfIqkTXm25OhivQcIfw==
X-CSE-MsgGUID: SH5hm+ctTuy6ZFhM8LrMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68551498"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68551498"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:43:21 -0800
X-CSE-ConnectionGUID: hFwRs/CoQy+PlF0epsld2A==
X-CSE-MsgGUID: rbCgK/t2QtCBeSkBGPXRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="193162977"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:43:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 06/24] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
In-Reply-To: <bcdc1246-d589-4769-b89f-d779ac4984b2@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762791343.git.jani.nikula@intel.com>
 <2a20632181adc85a737b0a87dce7e753ff8d5b0d.1762791343.git.jani.nikula@intel.com>
 <bcdc1246-d589-4769-b89f-d779ac4984b2@suse.de>
Date: Tue, 11 Nov 2025 10:43:15 +0200
Message-ID: <acce5e2b3827d8dfa12e571f8a4dfef475f7f232@intel.com>
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

On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 10.11.25 um 17:17 schrieb Jani Nikula:
>> Use the higher level function where crtc is available.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Is there a long-term plan to replace drm_vblank_crtc() entirely? 
> Otherwise this looks a bit pointless.

Well, almost entirely. There are a few cases (plus the one that Ville
mentioned later in the series) that need to operate on dev + pipe
alone. The main point is that when you have a crtc and use that for the
source of pipe, you don't have to do range checks on the pipe. This
becomes gradually more evident in the series.

BR,
Jani.



>
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index e3a5a783686f..96dbff63f52d 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -712,7 +712,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>>   {
>>   	struct drm_device *dev = crtc->dev;
>>   	unsigned int pipe = crtc->index;
>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>>   	struct timespec64 ts_etime, ts_vblank_time;
>>   	ktime_t stime, etime;
>>   	bool vbl_status;
>> @@ -1302,7 +1302,7 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
>>   {
>>   	struct drm_device *dev = crtc->dev;
>>   	int pipe = drm_crtc_index(crtc);
>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>>   	int ret;
>>   	u64 last;
>>   

-- 
Jani Nikula, Intel
