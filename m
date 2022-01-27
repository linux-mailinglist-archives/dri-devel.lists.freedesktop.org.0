Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4E49E274
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 13:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0545110EFAC;
	Thu, 27 Jan 2022 12:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665EA10EFAF;
 Thu, 27 Jan 2022 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643287134; x=1674823134;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y8MlwG9hDurhyeh0zga5gIoydRV+aw++dAwtusN1etQ=;
 b=c+YJsRSKI/THIKXS9ltzMuOeyUNb6O7DoUP27l7btTfSZROd0mH5GvoP
 EJ/PaGACK2Ojzbemlh0s0N7sDqx6UnjVmBpLGLsw7CVhVCRtLBsZA3hfO
 ulsnLM3JF3+GQCzdpdUh7eqihXGyJwrV/2TBrMhPTZTRNdjcSTMhV76pi
 xLBG0znwQ0I0DKvi5/tybF0DpMABCHSmJYjMoIV1CVSg8JK/ej9qTy54N
 x3lnda9AWyTKedOWBFSHYknnD5ge23oVQCv2SnOSLPogHrDttolVD6nC8
 6b10EZl/KGBi/7KSgxDr1C5CK2RMEvGRZd27Ed8trsR+Vgm4nK4m2RI4A g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="310149940"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="310149940"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:38:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480275217"
Received: from grossi-mobl.ger.corp.intel.com (HELO [10.252.33.31])
 ([10.252.33.31])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:38:51 -0800
Message-ID: <44532d97-6701-93f2-dd06-4429b523f666@linux.intel.com>
Date: Thu, 27 Jan 2022 13:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock dpt_obj around
 set_cache_level, v2.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126073703.1215696-1-maarten.lankhorst@linux.intel.com>
 <fdea6db7-44e4-dcbc-548a-7888c089d25e@intel.com>
 <83aec5cf-2e5c-77ec-b716-0416551c3f2a@linux.intel.com>
 <27506ac8eff06662f063d563662555cb08f2ce64.camel@linux.intel.com>
 <982820d1-0d9a-ac01-e4f5-9a11556d8690@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <982820d1-0d9a-ac01-e4f5-9a11556d8690@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 27-01-2022 om 13:09 schreef Thomas Hellström:
>
> On 1/27/22 13:05, Thomas Hellström wrote:
>>
>>> The bug on vm_close is a separate bug, and would probably best be
>>> fixed in a separate patch.
>>>
>>> Could I get a r-b on this? It should fix some issues, even if the
>>> unbind there is a separate bug.
>>>
>>> ~Maarten
>>>
>> Recognizing that it doesn't fix the vm_close issue,
>>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Oh, BTW should probably carefully review those seemingly unrelated stall warnings from BAT to check whether the newly introduced object lock might stall a workqueue causing those.
>
> /Thomas

Which ones? I mostly see ext4 failures, where it doesn't seem to have any i915 lock held at all.

