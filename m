Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41026EBD7D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D8E10E374;
	Sun, 23 Apr 2023 06:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064B910E010;
 Sun, 23 Apr 2023 04:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682225158; x=1713761158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bdRNz+e+eYTIoxHI9aB0m86TKGuGAia3gtQEZ0ujnko=;
 b=fGKXuGuaVIzyM9hkdtUlIkbZVUt+Ehg3lJyiW5700xamfWOvIbttyt23
 eOCWVuGwB8ynFAxYJLszP/aPiNLhtGIS4i29fSKy081+Ysum8UjAY+aoW
 F9bnzZUSVjaZtjsBzs834Y8jEYeQN5G+goTkrsQCuUaoVO9HRrtcdXCzF
 7VAv2LP6jHXF8DPjANKvEo0tUG1ByHxq5kJWkvWwSqhHcIulqQ4FgnbxR
 NMILOshzMntdv6XZs9mgHS2rodj3terGEoDU7gcUhkfXAW1lDYsJUGSY0
 PiLzVsMHoyV2i0yEN7DN9BlSRKQyo3fhEeGELBGB1aEGqFyP0hQY1ZDbi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411516560"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="411516560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 21:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="836564075"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="836564075"
Received: from bjwdesw007.ccr.corp.intel.com (HELO [10.238.154.181])
 ([10.238.154.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 21:45:52 -0700
Message-ID: <bc7374f0-4b1c-a632-4581-9e4da0a5090f@linux.intel.com>
Date: Sun, 23 Apr 2023 12:45:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 6/7] drm/i915: Replace custom intel runtime_pm tracker
 with ref_tracker library
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-6-11f08358c1ec@intel.com>
From: Zhou Furong <furong.zhou@linux.intel.com>
In-Reply-To: <20230224-track_gt-v7-6-11f08358c1ec@intel.com>
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



> +
> +static inline void
> +intel_wakeref_tracker_show(struct ref_tracker_dir *dir,
> +			   struct drm_printer *p)
> +{
> +	const size_t buf_size = PAGE_SIZE;
> +	char *buf, *sb, *se;
> +	size_t count;
> +
> +	buf = kmalloc(buf_size, GFP_NOWAIT);
> +	if (!buf)
> +		return;
> +
> +	count = ref_tracker_dir_snprint(dir, buf, buf_size);
> +	if (!count)
> +		goto free;
> +	/* printk does not like big buffers, so we split it */
> +	for (sb = buf; *sb; sb = se + 1) {
> +		se = strchrnul(sb, '\n');
> +		drm_printf(p, "%.*s", (int)(se - sb + 1), sb);
> +		if (!*se)
> +			break;
> +	}
> +	if (count >= buf_size)
> +		drm_printf(p, "\n...dropped %zd extra bytes of leak report.\n",
> +			   count + 1 - buf_size);
> +free:
> +	kfree(buf);
> +}
> +

move to c source?

