Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB926EBD7B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DEF10E08D;
	Sun, 23 Apr 2023 06:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657B10E010;
 Sun, 23 Apr 2023 03:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682222043; x=1713758043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MujmvEf+jmoiPm2N89sMRbCh0pFkyHsT9w/vf8yBLUU=;
 b=mJ3iQfnvaYut0oHDsK5d2pTDUNmL8A5AMJCTgqCe57HOR8YoS08A4557
 uGKg6xuHWnH5saIpBfiNkVlr5kbiD9GXWxmLnGdyPFRr/VlbaSGU3d9g3
 /AWdKKzgAd6UCefo6YPUVpdxx2hkLFW+3OTnCEkvo6q0TPOWwFvvCO4kA
 L1dxHCnxFMdRp6QzDIiqM6JStv1lNBTS8dj+pblKrd2ox2dbkRtWeJA0r
 D34t45L1Tn0upoX8+pNZ1Hu1WugszxB79PP5uyIxQ6Y5Akk44yAUaULbt
 yS3vkTB5drYfWJDSGRO+nQEeXxrR8q+WuX1+3f6+QMVeUUfKr8UVMTKYu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330442447"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="330442447"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 20:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="836557787"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="836557787"
Received: from bjwdesw007.ccr.corp.intel.com (HELO [10.238.154.181])
 ([10.238.154.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 20:53:56 -0700
Message-ID: <01575988-c041-d9f6-f507-994740b50876@linux.intel.com>
Date: Sun, 23 Apr 2023 11:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 7/7] drm/i915: track gt pm wakerefs
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-7-11f08358c1ec@intel.com>
From: Zhou Furong <furong.zhou@linux.intel.com>
In-Reply-To: <20230224-track_gt-v7-7-11f08358c1ec@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 23 Apr 2023 06:47:48 +0000
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If in doubt, say "N"
> +
> +config DRM_I915_DEBUG_WAKEREF
> +	bool "Enable extra tracking for wakerefs"
> +	depends on DRM_I915
> +	default n
'default n' is not need
