Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCAA713BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0210E694;
	Wed, 26 Mar 2025 09:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezY3kJ2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CA610E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742981550; x=1774517550;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1HeaFRCuWpC2z81MjaUmAtlo+dMaip5uOptA/vYYllA=;
 b=ezY3kJ2Rue8+t+NVGmSgzh97GXs7tKbkpRQP0mNqQ+86WhiNFFNpvhyq
 jxl3Vb9loh9ugZv1s+5h2/R2fCHIyM7clozLPX2M59rUxW3UdkMqQ/Bhl
 WsQBNTzQXdr8wOqkCB+s0iQ06jbnM8CMocZB+AzIXHU9leyxbBREsiEZw
 j2ltneZBkv9qUU7OaohHdbkvVFFYXSwOAk+MNEAKg0K6v0jqzBKiOm5Ml
 EYP5Y8cie/diE7RvjTqjQMJi7Ta1gaLAw4MbgbMf+usgOO2lS/fiIGjxM
 owapQxmHW3OIj8mkxdWqZGicvq79+WlfA9/9LkJGElftZA1OGJnGQ56Cz Q==;
X-CSE-ConnectionGUID: kl/jqkgQQ5CcgHKgyHFp7Q==
X-CSE-MsgGUID: J0NeKzjTRb+Ok9NuE0EHpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55253998"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="55253998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:32:30 -0700
X-CSE-ConnectionGUID: lSaBGxSJTXakxwy9+HRwnA==
X-CSE-MsgGUID: UHUInTtKRqydZAYSkK+ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124497744"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:32:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shiyongbang@huawei.com
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
In-Reply-To: <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
Date: Wed, 26 Mar 2025 11:32:21 +0200
Message-ID: <875xjw87dm.fsf@intel.com>
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

On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>
>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>> functions. Add ddc channel in connector initialization to put drm_aux
>>>>> in drm_connector.
>>>>>
>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>> ChangeLog:
>>>>> v6 -> v7:
>>>>>     - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
>>>> I don't understand this, and I did not suggest such a thing.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>> Hi Jani,
>>>
>>> Is the modification of v8 correct?
>> I never received that for whatever reason.
>
> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-shiyongbang@huawei.com/

Thanks.

The EDID handling looks fine.

AFAICT you leak dp->aux.name though.


BR,
Jani.



-- 
Jani Nikula, Intel
