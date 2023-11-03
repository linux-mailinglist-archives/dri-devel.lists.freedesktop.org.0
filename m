Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780967DFFB4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 09:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F2910E164;
	Fri,  3 Nov 2023 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC6810E164;
 Fri,  3 Nov 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698999818; x=1730535818;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+kaMKIAxrDUWFRDqMEzckWhttZfmRsKXnzhvNoQg/D0=;
 b=Mg0/0Nx26tpqX+4tvXwu9Xc3RAFtX4Nt3TDqA9FvsT+ZD3LOKki+sM0o
 v9DnpUighJIKR9/bS+52VZfWs4NXIkMiFB6usoiloi5CKhiKmNqGev3iQ
 7idrIUEnl/hbHkJYXuvB44ff1CzzGsNpk/4ZUcagEoM6lAwHNQ1VdWo7J
 RPSqapRDdCn6cCyfdpg5EZ3tCJAPaDhaQ3OKD0cYHcLHIB1iU0GhG8ZlJ
 bQGesFRJO27dvAdwYzFT7w43eEJ2SI/Li1TXalHYyJDjrPmapSPlyALTs
 k59rOhpuW4rhlrcof58ucoixNwWW8sxHuQXjV7mYRUPyN1y20h+L4CWg2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475141677"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="475141677"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827417641"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="827417641"
Received: from sdobbela-mobl.ger.corp.intel.com (HELO [10.213.223.51])
 ([10.213.223.51])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:23:35 -0700
Message-ID: <7ce9eaf8-bb3e-489e-bb62-e99504ebd3df@linux.intel.com>
Date: Fri, 3 Nov 2023 08:23:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Fix potential spectre vulnerability
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Kunwu Chan <chentao@kylinos.cn>
References: <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
 <20231103023257.58199-1-chentao@kylinos.cn>
 <3d633ff6-e5e9-46bc-941a-258540ebbfc4@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <3d633ff6-e5e9-46bc-941a-258540ebbfc4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: robdclark@chromium.org, andrzej.hajda@intel.com,
 alan.previn.teres.alexis@intel.com, kunwu.chan@hotmail.com,
 intel-gfx@lists.freedesktop.org, jonathan.cavitt@intel.com,
 linux-kernel@vger.kernel.org, chris.p.wilson@intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/11/2023 06:56, Krzysztof Kozlowski wrote:
> On 03/11/2023 03:32, Kunwu Chan wrote:
>> Fix smatch warning:
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:847 set_proto_ctx_sseu()
>> warn: potential spectre issue 'pc->user_engines' [r] (local cap)
>>
>> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
>> Cc: <stable@vger.kernel.org> # v5.15+
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> 
> Where did you receive this tag? There is nothing under link below.
>> Link: https://lore.kernel.org/all/20231102101642.52988-1-chentao@kylinos.cn

It is fine, I gave the conditional r-b in 
https://lore.kernel.org/all/d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com/.

Suggested-by I did not and it is not true so I can drop it while applying.

Regards,

Tvrtko
