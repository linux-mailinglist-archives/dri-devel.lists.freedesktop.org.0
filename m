Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4DA72D2D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF9B10E0B4;
	Thu, 27 Mar 2025 10:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOvjHkmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86BF10E0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743069612; x=1774605612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=cBmITgd0BnhOeJU68NrtesNuKx5saXHzao6d69yJrhE=;
 b=mOvjHkmyqFIeeko9JKfkraw+IIJI9Y3so4z95+bfwHyZmGoKun5/8nd9
 eNRm+trMz8Kkomu1VY/LJLy+d6m1UKIsmnI9iruzFmVp3zukguErnPeyQ
 QEeiOcKQwtOOFy9JhEjBlmI4XRQg916TwK3cOQSU/eH/8vIII44eMwZhH
 HWusc1fsF4nUwuvmNLH2KQKCdjhw1Quqx5zr5b+qum6CZdIpg7f/92ZRI
 xe0Eq+MwyDXA2xdg6YOe8NdMNvQRfh5P7bqWMdcsUFrRej/hftcLX5pzA
 nU3q6Je2Png/MK6lqdsT5zVu3jz/3CC61O+29biNedtRjAdlrLuT/QkO5 Q==;
X-CSE-ConnectionGUID: Nw6mYgVNQfiDww+AqN0UmA==
X-CSE-MsgGUID: 36NcDgI5Tn6mKRvJBm/xEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44575488"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44575488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:00:08 -0700
X-CSE-ConnectionGUID: 0W3Bwvf7THuQHSh4MGswKA==
X-CSE-MsgGUID: cIW0X/V2SGi3pbBqoNmE5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124855876"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:00:02 -0700
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
In-Reply-To: <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
Date: Thu, 27 Mar 2025 11:59:59 +0200
Message-ID: <87v7ru6bfk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> =E5=9C=A8 2025/3/26 17:32, Jani Nikula =E5=86=99=E9=81=93:
>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>>
>>>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>>>> functions. Add ddc channel in connector initialization to put drm_a=
ux
>>>>>>> in drm_connector.
>>>>>>>
>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>> ChangeLog:
>>>>>>> v6 -> v7:
>>>>>>>      - add if statement about drm aux in hibmc_dp_connector_get_mod=
es(), suggested by Jani Nikula
>>>>>> I don't understand this, and I did not suggest such a thing.
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>> Hi Jani,
>>>>>
>>>>> Is the modification of v8 correct?
>>>> I never received that for whatever reason.
>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-s=
hiyongbang@huawei.com/
>> Thanks.
>>
>> The EDID handling looks fine.
>>
>> AFAICT you leak dp->aux.name though.
>>
>>
>> BR,
>> Jani.
>
> Thanks for for reminding me, actually the dp->aux.name was written becaus=
e I misunderstood what you meant in V7,
> and I deleted it in V8.

This is in the link you posted:

+	dp->aux.name =3D kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");



>
> Thanks,
> Baihan.
>
>>
>>

--=20
Jani Nikula, Intel
