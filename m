Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5ED769276
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 11:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAA510E198;
	Mon, 31 Jul 2023 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571DC10E198
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690797371; x=1722333371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1oL+ZoSZBkg9yYNkBmf41Emceg10dKGbAKKXHudy5G0=;
 b=X9k7PplJD+VFZZLapbM/iHMRHXE0Vrd9Zsz3DLjrztzbIgmxIkfXcfhz
 842Maavh12HjEDMOzo0eXnsvTz1kVekFpNljyI5Cry3mLy2CKSRwxydT/
 ZjB1bjbvpW85qzzN3X7UzHhp6fXr51fon4Mf/wo4KVqrbXoW87RYFiEm5
 mHVjWjXJTMYRO324tkGBwCkjxnpds/GNvfVEW6XD7Lx6NSFHZmFTO9pnr
 RQGZaMsAjDyX7Qjh5STwLidhuEdTjjzeBx9iIeoYAoCyT6Ch5DbXJijdO
 Xu/JwByHJtDFg7NqSg9GxYf9qucuQEEtaQrgUkOuZTzL1D3b+qBiAvYwE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="366456226"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="366456226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 02:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="974815497"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="974815497"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO localhost)
 ([10.252.36.230])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 02:56:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: sunran001@208suo.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: fix application of sizeof to pointer
In-Reply-To: <442918910b90b9a8e2e5f8a3874fdb44@208suo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230720073355.3196-1-xujianghui@cdjrlc.com>
 <442918910b90b9a8e2e5f8a3874fdb44@208suo.com>
Date: Mon, 31 Jul 2023 12:56:05 +0300
Message-ID: <87leewxv4a.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jul 2023, sunran001@208suo.com wrote:
> The coccinelle check report:
> ./drivers/scsi/csiostor/csio_mb.c:1554:46-52: ERROR: application
> of sizeof to pointer

Please don't just assume coccinelle is right, and send "fixes" based on
the cocci reports alone. You need to read and understand the code you're
changing.


BR,
Jani.

>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/i915/i915_syncmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_syncmap.c 
> b/drivers/gpu/drm/i915/i915_syncmap.c
> index 60404dbb2e9f..4eeaf12be72d 100644
> --- a/drivers/gpu/drm/i915/i915_syncmap.c
> +++ b/drivers/gpu/drm/i915/i915_syncmap.c
> @@ -282,7 +282,7 @@ static noinline int __sync_set(struct i915_syncmap 
> **root, u64 id, u32 seqno)
>   			unsigned int above;
>
>   			/* Insert a join above the current layer */
> -			next = kzalloc(sizeof(*next) + KSYNCMAP * sizeof(next),
> +			next = kzalloc(sizeof(*next) + KSYNCMAP * sizeof(*next),
>   				       GFP_KERNEL);
>   			if (unlikely(!next))
>   				return -ENOMEM;

-- 
Jani Nikula, Intel Open Source Graphics Center
