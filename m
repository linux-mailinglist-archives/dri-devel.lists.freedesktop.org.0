Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB497DB314
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 07:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3A010E203;
	Mon, 30 Oct 2023 06:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B970A10E203
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 06:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698645911; x=1730181911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pwncb6T0eW2Uq8n6x+uGybwl8osJ5Cv6Ek3h44u2Tic=;
 b=Y3zLa7aqoPsZwPhxBe2HRE3+SUt2cT95NBgfBQB9ZfGLDGT4n4sHo63Y
 icLDGd3f/JhwNub96WExRNRVNOuv35xrX78IoxEO9Ru/o1NPFxBYmrVyw
 KQbFNlAjv+PYLj7yGMf8d5MvGRLgdYo3HKC1xGoClrwAjbiS0RsXEh6PF
 r25anzE4mIqAP0AA3A+QyTIlpTtBAflMOSfwJTv9v0kAoVZNmy51llyyi
 ARmYuNXttWAvm/JSEg/drV8LGgDjF/jTMGG7IEXN2EvDjx3Hy+FozeZ+L
 sgR5wG/DOL5ZItHmt6ScSlXfxPnG1pvWUefGrp7tJuHr9bOw/G1Av7eIC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367362414"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="367362414"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="763814127"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="763814127"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:05:08 -0700
Date: Mon, 30 Oct 2023 07:05:06 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] accel/ivpu: avoid build failure with CONFIG_PM=n
Message-ID: <ZT9HkiflwVKnZlzk@linux.intel.com>
References: <20231027152633.528490-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027152633.528490-1-arnd@kernel.org>
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
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 05:26:23PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The usage count of struct dev_pm_info is an implementation detail that
> is only available if CONFIG_PM is enabled, so printing it in a debug message
> causes a build failure in configurations without PM:
> 
> In file included from include/linux/device.h:15,
>                  from include/linux/pci.h:37,
>                  from drivers/accel/ivpu/ivpu_pm.c:8:
> drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get_if_active':
> drivers/accel/ivpu/ivpu_pm.c:254:51: error: 'struct dev_pm_info' has no member named 'usage_count'
>   254 |                  atomic_read(&vdev->drm.dev->power.usage_count));
>       |                                                   ^
> include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
>   129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>       |                                                ^~~~~~~~~~~
> drivers/accel/ivpu/ivpu_drv.h:75:17: note: in expansion of macro 'dev_dbg'
>    75 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
>       |                 ^~~~~~~
> drivers/accel/ivpu/ivpu_pm.c:253:9: note: in expansion of macro 'ivpu_dbg'
>   253 |         ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
>       |         ^~~~~~~~
> 
> The print message does not seem essential, so the easiest workaround is
> to just remove it.
> 
> Fixes: c39dc15191c4 ("accel/ivpu: Read clock rate only if device is up")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Applied to drm-misc-next

Thanks
Stanislaw
