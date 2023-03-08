Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B366B0B26
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935310E5D6;
	Wed,  8 Mar 2023 14:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1B10E5D6;
 Wed,  8 Mar 2023 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678285789; x=1709821789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nodI/9eAhPIhkPyqYJ0CHRSS1IeiQDsVTeHSO1jEhEw=;
 b=lyd/swpiFgfYCZ94KkBvMgr5b58DdtaNI7K3DKC9Alb4k0aBjXns0zkb
 iOxEymfMiUJ8MaYkR2gak4ubKfuKRnF8S40A3jSzbkbLsD1c2AEtXrxb9
 7vN5sug7XSbvwKxLmqZn/Jfh0RDlLh0uEWkizDwuV0OWAOmYNMfPGjrDl
 Q9W+Z6zhbNEHHVOhq6Ndwi9HMv54aOIHE7VhiDmpuJXKcFeHkKJPIHjZE
 DlVRcz/aE5LWEBnIrdiiIFAt9qT78fTbLnmH3+2Y+pNJehsR4KjSqhmd2
 PjRF6xDEzaJeYGhdcLY3oIcIgPoPuNN1/ME9m/dU+Dz1avdCn7/ad/Vjj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334875733"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="334875733"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 06:29:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006344125"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="1006344125"
Received: from lcojocar-mobl.ger.corp.intel.com (HELO [10.251.219.243])
 ([10.251.219.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 06:29:47 -0800
Message-ID: <e917ebb7-3cf3-cec1-d247-edb25cb0b681@linux.intel.com>
Date: Wed, 8 Mar 2023 15:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
 <fc1c5bf4-8174-50e4-5109-cbf73aafe771@linux.intel.com>
 <ZAiPTaBhfhddI+DU@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZAiPTaBhfhddI+DU@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,


On 2023-03-08 14:36, Ville Syrjälä wrote:
> On Wed, Mar 08, 2023 at 01:47:12PM +0100, Maarten Lankhorst wrote:
>> On 2023-03-06 21:58, Ville Syrjälä wrote:
>>> On Mon, Mar 06, 2023 at 09:23:50PM +0100, Maarten Lankhorst wrote:
>>>> Hey,
>>>>
>>>> On 2023-03-06 16:23, Souza, Jose wrote:
>>>>> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
>>>>>> As a fallback if we decide not to merge the frontbuffer tracking, allow
>>>>>> i915 to keep its own implementation, and do the right thing in Xe.
>>>>>>
>>>>>> The frontbuffer tracking for Xe is still done per-fb, while i915 can
>>>>>> keep doing the weird intel_frontbuffer + i915_active thing without
>>>>>> blocking Xe.
>>>>> Please also disable PSR and FBC with this or at least add a way for users to disable those features.
>>>>> Without frontbuffer tracker those two features will break in some cases.
>>>> FBC and PSR work completely as expected. I don't remove frontbuffer
>>>> tracking; I only remove the GEM parts.
>>>>
>>>> Explicit invalidation using pageflip or CPU rendering + DirtyFB continue
>>>> to work, as I validated on my laptop with FBC.
>>> Neither of which are relevant to the removal of the gem hooks.
>>>
>>> Like I already said ~10 times in the last meeting, we need a proper
>>> testcase. Here's a rough idea what it should do:
>>>
>>> prepare a batch with
>>> 1. spinner
>>> 2. something that clobbers the fb
>>>
>>> Then
>>> 1. grab reference crc
>>> 2. execbuffer
>>> 3. dirtyfb
>>> 4. wait long enough for fbc to recompress
>>> 5. terminate spinner
>>> 6. gem_sync
>>> 7. grab crc and compare with reference
>>>
>>> No idea what the current status of PSR+CRC is, so not sure
>>> whether we can actually test PSR or not.
>> This test doesn't make sense. DirtyFB should simply not return before
>> execbuffer finishes.
> Of course it should. It's not a blocking ioctl, and can't
> be because that will make X unusable.

Except it actually is.

DirtyFB blocks in its default implementation, and waits for the next vblank.

drm_atomic_helper_dirtyfb() blocks by default as it's a synchronous 
plane update.

Considering every driver except i915 uses it, it works just fine. :)

~Maarten

