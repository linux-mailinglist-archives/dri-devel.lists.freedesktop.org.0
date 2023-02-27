Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C066A3F8B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D6910E3B0;
	Mon, 27 Feb 2023 10:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1410E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677494278; x=1709030278;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lbriUZ8YDUdLm75pRAQtvLKSIwX7Z6Uxi7I/SUAfONw=;
 b=P8/iucestYsU9kjtJvY5TwdCzHAK/He602b+OpnTsCvZek4TUdKDcvwR
 VMrxVQKBZTscfXRnaCx81Jv9dlthfv3uC1/31mBARjAtwbm7VHMIObVEs
 jbXCtVZupawzncbKoAUBMXKWeY6/bTdX8aunIWCqESnPoJE6eMhEMXQTp
 WsBZgl/fvnkdhGvcdlnBwjVwizSWxOACoG6jjvnEYhqqP7fZGx7DTTqi1
 vuImwq7XTkeUy8qPi5UrAevwkA8icjrBerSGHtS8AoEHNYFLLBNAn6qcQ
 Z57HjgZpIioX1aExWP4Q+DTd2YiDjMpuCeUs5k5Fos9ce1yO+O4QLLkgy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="335310498"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="335310498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 02:37:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="706136106"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="706136106"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 02:37:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Gustavo Padovan
 <gustavo.padovan@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>, Alyssa
 Rosenzweig <alyssa.rosenzweig@collabora.com>, Rob Herring
 <robh@kernel.org>, Sean Paul <sean@poorly.run>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
In-Reply-To: <6c16f303-81df-7ebe-85e9-51bb40a8b301@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
 <e9364e10-1ad8-aaaf-3d78-a29b0c1516ef@collabora.com>
 <6c16f303-81df-7ebe-85e9-51bb40a8b301@collabora.com>
Date: Mon, 27 Feb 2023 12:37:46 +0200
Message-ID: <87a60z2y2t.fsf@intel.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> On 2/17/23 16:41, Dmitry Osipenko wrote:
>> On 2/17/23 16:28, Thomas Zimmermann wrote:
>>> Hi,
>>>
>>> I looked through the series. Most of the patches should have an r-b or
>>> a-b at this point. I can't say much about patch 2 and had questions
>>> about others.
>>>
>>> Maybe you can already land patches 2, and 4 to 6? They look independent
>>> from the shrinker changes. You could also attempt to land the locking
>>> changes in patch 7. They need to get testing. I'll send you an a-b for
>>> the patch.
>> 
>> Thank you, I'll apply the acked patches and then make v11 with the
>> remaining patches updated.
>> 
>> Not sure if it will be possible to split patch 8, but I'll think on it
>> for v11.
>> 
>
> Applied patches 1-2 to misc-fixes and patches 3-7 to misc-next, with the
> review comments addressed.

Please resolve the drm-tip rebuild conflict [1].

BR,
Jani.


[1] https://paste.debian.net/1272275/


-- 
Jani Nikula, Intel Open Source Graphics Center
