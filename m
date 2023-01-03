Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01A65C319
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 16:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EB710E1FC;
	Tue,  3 Jan 2023 15:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52E010E1FC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672760236; x=1704296236;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xUEGoKe0WHFkygUVT+AMNzShNf6suNc81fz0PS2YIRY=;
 b=gt38gQkqUaT2qtQsRIn8e1pwyETtt5P3En7LlgIH4XfmR1tzFLMkA8y4
 EIirlJx3xXUitTqcecVZ2ZA6gQzgP/Un4VSOPLkGwgLDi+RoKqP/RPZUn
 W1ppQfj7LoJyAq/V9qwAAc154AQx+mCUyy6MpdLSq+PXSFqc7TEPBBioV
 94OInLj0OS706abjQgB0u0XKNPELrasyWePOzfnjhPU2UmFmlVBIXXann
 Jc3njkkUKB4G6AxUOzWvQteFzVnpLkw06SFCR5NPrGHuXv1Tn3hhH61p5
 F4pqYo8Is8V6kU3gXSR4qptHyiNT9o41CsLBVo1zGBOdWe72BDt1m4FMi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="302058043"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="302058043"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 07:37:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="656799275"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="656799275"
Received: from adorney-mobl.ger.corp.intel.com (HELO [10.213.222.30])
 ([10.213.222.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 07:37:13 -0800
Message-ID: <c7337539-9d75-49c5-286a-d94e3e78c4df@linux.intel.com>
Date: Tue, 3 Jan 2023 15:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
To: Simon Ser <contact@emersion.fr>
References: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
 <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/12/2022 11:26, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thanks - adding some drm-misc maintainers to consider pulling the patch in.

Regards,

Tvrtko
