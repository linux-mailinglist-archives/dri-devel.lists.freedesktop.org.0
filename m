Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95850706444
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C0410E145;
	Wed, 17 May 2023 09:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF2310E145;
 Wed, 17 May 2023 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684316332; x=1715852332;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CNGqGF8c6TYzh812PwaejYLAHsNgbc/gb9bSy9QoNbo=;
 b=nD2Nx0ltDSYNDEAiDzeW3fUEp4lsqlWmCZ9GogLpPWeSLvCNPA0g9uuv
 CaXx162j9ZnyZyA5kqZrHlmmTLCgc2ADkG5efhGKbadolh2jSkivibsgb
 DG5CavA1HX4y1PbMprUTt4gXu0hzN0C4/nE4cj+9sBRm8nLnghW/+vWVW
 zpsNS61HgOb4ZRlpbRg8qnr6R2HhsuA+Tnn4m49tNVVzbBLYgFuyWgjfp
 6tcQlhViSJRluPJf2SflCXAQPZ8BCtXOmFJdlgnYP56w3IBTV92YfbE/Z
 mQinF3LR7DRvqlAjpofrj+CbOrzZ1BJ/5ItNJOvX8BxHi/q7kQEoqdZ0r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331329008"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="331329008"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="948199481"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="948199481"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:38:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
In-Reply-To: <2a1b81da-39c8-4111-7e42-18f5f2f557c4@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
 <87cz2zgvdd.fsf@intel.com>
 <2a1b81da-39c8-4111-7e42-18f5f2f557c4@linaro.org>
Date: Wed, 17 May 2023 12:38:44 +0300
Message-ID: <87a5y3guvv.fsf@intel.com>
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

On Wed, 17 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> On 17/05/2023 11:28, Jani Nikula wrote:
>> On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>> Statically allocated array of pointers to hwmon_channel_info can be made
>>> const for safety.
>>>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> 
>> FYI we'll merge this once we've done a backmerge to get the hwmon
>> changes to our tree.
>
> There are no dependencies. hwmon changes are already in rc1.

That's what I'm saying, drm-intel-next doesn't have rc1. :)

BR,
Jani.

>
> Best regards,
> Krzysztof
>

-- 
Jani Nikula, Intel Open Source Graphics Center
