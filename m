Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D438C70D987
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 11:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F29C10E41F;
	Tue, 23 May 2023 09:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740410E41C;
 Tue, 23 May 2023 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684835404; x=1716371404;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=z+PhmPjSvAdptOmQesLi0iHqQbygzxTXNrjRxXGKZnA=;
 b=fwqtny9Ih6QvJMxeRikErKYVXnGNMiLO/kjBh/IfVHFNuljI5YLayYoy
 OHjhyc+IlzXKLsAUJCFNTQ3OIRGJ7VOccGXEEvQC6YjiWxG1DG7+H+riN
 tdEGvcoDdfzLJFe6OgLw3q2Z1zOa5xtXmUhAN1OaNiM96Mmqec5FUJvof
 Ut5zuGSE643yFGZs2tlYIQaG2ulRhWKcON1K/yZlVoDZA+HRItViRDX8+
 zSvGnqxemRX9XawcFYUcqnzdZEel+zij2CD1UZExViBhGPGdvviGVD2Bl
 Cp4f7kpdNFffDyWejFkIDczMyFfgeBjmbq7skM7tZ6iQ8dCqGln0jTFdm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342651765"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="342651765"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681325468"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="681325468"
Received: from chauvina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:49:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
In-Reply-To: <87a5y3guvv.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
 <87cz2zgvdd.fsf@intel.com>
 <2a1b81da-39c8-4111-7e42-18f5f2f557c4@linaro.org>
 <87a5y3guvv.fsf@intel.com>
Date: Tue, 23 May 2023 12:49:57 +0300
Message-ID: <87a5xvml6i.fsf@intel.com>
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

On Wed, 17 May 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 17 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> On 17/05/2023 11:28, Jani Nikula wrote:
>>> On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>> Statically allocated array of pointers to hwmon_channel_info can be made
>>>> const for safety.
>>>>
>>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> 
>>> FYI we'll merge this once we've done a backmerge to get the hwmon
>>> changes to our tree.
>>
>> There are no dependencies. hwmon changes are already in rc1.
>
> That's what I'm saying, drm-intel-next doesn't have rc1. :)

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

>
> BR,
> Jani.
>
>>
>> Best regards,
>> Krzysztof
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
