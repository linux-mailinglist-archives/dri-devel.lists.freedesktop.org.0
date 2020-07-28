Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A6231294
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B266E398;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD346E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=yBYvIwf9TAceURjTfcYJWCSxycUdyCXExJl0HOeXT9k=; b=SW89oCq4NVmToiCnFUrJCN6ESd
 JytiZ/mUug+oIj6e+zEeWlHiSOLXfoN+DB3W4fZyWLGB2JdgB/k1PhX4n3N5JJPnj2sRBF2ioO8bW
 mxjQx2rKpwYDLbVKQFTwnZABaW1K+3Kk+lbNiG92oTDwpX72vQ4dQSvLBBII0bqG5Gwfm6XNnf5Xm
 4N+/Gxt8iILk45H665pENdW9nFzakkmTjuOuAW8C+pxqX49BoPxLO2rt3YeQnAAYU9hXYBvdLItUt
 X2yrtQIrca5f7n1qfE5PxLkED5b5yKIbB0lyV25kAKdyC5o6dkvto9yMUh931OHkDaJccLWx7lC8n
 fnqI1X7A==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0OgC-0001rr-4Y; Tue, 28 Jul 2020 12:26:00 +0000
Subject: Re: [PATCH RFC v6 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5ef12508-4600-a5f1-f456-ef0762b81d51@infradead.org>
Date: Tue, 28 Jul 2020 05:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/20 3:07 AM, Kevin Tang wrote:
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 0000000..b189a54
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	help
> +	  Choose this option if you have a Unisoc chipsets.

	                                          chipset.

> +	  If M is selected the module will be called sprd-drm.

	                                             sprd_drm.

> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 0000000..86d95d9
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y += -I$(srctree)/$(src)
> +
> +obj-y := sprd_drm.o


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
