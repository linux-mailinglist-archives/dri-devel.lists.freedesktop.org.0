Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578167DFD2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3810210E17F;
	Fri, 27 Jan 2023 09:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D639F10E17F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674810980; x=1706346980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PZvGD9jJs3AQxKwOXh5YNYV0CIuV12BOFWOtoN/4oNE=;
 b=ZhA0+prnaXk85QHzHSdFlt/U7hYhLISs1mVeNkTc48es6MandkPIo3ht
 F8+M6EJoNwPPF/8fOcjQqFQF94OFXP5aOIX1uyK9/u8Jqjen8bpaBNiVk
 BzhWjQ8WHC+wrvH6XYZVBBPykSfJbp5IOcz7zaOQZyiNu5so8P3IA3eGk
 4ug//59bpIffe+8ADONHvmqg2cR+wPc0c1unsMnOd2b2Ws00D2LkHJH8K
 5dQTMouuZP5Xs2GRWoN/XIdE4sHuQAcnB/JeWPT2aqGp8Lban+5jEnRVv
 ow97QnRGJyebXB9XxEyfkhtTRuM4ZJX2E3hKh0JvaoDkntk4IwiQomR41 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="391600464"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="391600464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 01:16:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751927452"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="751927452"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 01:16:18 -0800
Date: Fri, 27 Jan 2023 10:16:16 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/2] accep/ivpu: PM: remove broken ivpu_dbg() statements
Message-ID: <20230127091616.GA837200@linux.intel.com>
References: <20230126163804.3648051-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126163804.3648051-1-arnd@kernel.org>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 05:37:54PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, the driver fails to build:
> 
> drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get':
> drivers/accel/ivpu/ivpu_pm.c:240:84: error: 'struct dev_pm_info' has no member named 'usage_count'
>   240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>       |                                                                                    ^
> include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
>   223 |                 func(&id, ##__VA_ARGS__);                       \
>       |                             ^~~~~~~~~~~
> include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
>   249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>       |         ^~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
>   155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~
> drivers/accel/ivpu/ivpu_drv.h:65:17: note: in expansion of macro 'dev_dbg'
>    65 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
>       |                 ^~~~~~~
> drivers/accel/ivpu/ivpu_pm.c:240:9: note: in expansion of macro 'ivpu_dbg'
>   240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>       |         ^~~~~~~~
> 
> It would be possible to rework these statements to only conditionally print
> the reference counter, or to make the driver depend on CONFIG_PM, but my
> impression is that these are not actually needed at all if the driver generally
> works, or they could be put back when required. Just remove all four of these
> to make the driver build in all configurations.
> 
> Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
