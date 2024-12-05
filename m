Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348FD9E60D0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 23:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC57710EFCE;
	Thu,  5 Dec 2024 22:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlVn95ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E89510EFCE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733438968; x=1764974968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ou2gxSX0BGU8dCJZomlYlLR0SXr+L0Qw1dH4P4elyPw=;
 b=VlVn95htHPGKlPbJ34c35WKnHa1gvh+7ExuDsdnK9be2kzGHVu3jtWa1
 rWRSMkMfVztsIZL935NAgdyJUiCI/HKLDREdBm2QkC6nW5fFWB7dPaeAm
 fy+EoWcd4ASQhEuhxRTEROEo41lM8o/DrN2KeqzTY+qtYD84klLSL2bFy
 6Oyx+ZuI+CpHmMtEYEvHp1gjZmUr6KxTtdExf7B5poR0O+jrkSpCu5Wtu
 hNxLk5Xv9Lz94ZP6kpmFtm+Bk0Pqb+eaR6wrJOiYGy3sMdeGo+e5mfLTe
 cUcyoRRbwEKFMgo1ddG2H7+YV8egcExgQtaTA/CDLsONeG0ISpzUUjWX5 g==;
X-CSE-ConnectionGUID: y5ha47gAQxWjQzRytfNXhw==
X-CSE-MsgGUID: kAWGE6nKS0O/8JSsLodG/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34022297"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="34022297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:49:27 -0800
X-CSE-ConnectionGUID: G9L0aRp/QR2YhMCrZdSRAQ==
X-CSE-MsgGUID: rpoBs8CmRH2FtJjzsBGktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94042939"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan)
 ([10.125.108.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:49:26 -0800
Date: Thu, 5 Dec 2024 14:49:23 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 10/11] cxl/pmem: Remove match_nvdimm_bridge()
Message-ID: <Z1It83v8xuNuLrOt@aschofie-mobl2.lan>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-10-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-10-1611f1486b5a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:10:19AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>

Suggest conveying more detail in the commit msg:

cxl/pmem> Replace match_nvdimm_bridge() w device_match_type()

> 
> match_nvdimm_bridge(), as matching function of device_find_child(), is to
> match a device with device type @cxl_nvdimm_bridge_type, and is unnecessary

Prefer being clear that this function recently become needless.
Something like:

match_nvdimm_bridge(), as matching function of device_find_child(),
matches a device with device type @cxl_nvdimm_bridge_type. The recently
added API, device_match_type, simplifies that task.
 
Replace match_nvdimm_bridge() usage with device_match_type().

With that you can add:

Reviewed-by: Alison Schofield <alison.schofield@intel.com>

> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/cxl/core/pmem.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
> index a8473de24ebfd92f12f47e0556e28b81a29cff7c..0f8166e793e14fc0b1c04ffda79e756a743d9e6b 100644
> --- a/drivers/cxl/core/pmem.c
> +++ b/drivers/cxl/core/pmem.c
> @@ -57,11 +57,6 @@ bool is_cxl_nvdimm_bridge(struct device *dev)
>  }
>  EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
>  
> -static int match_nvdimm_bridge(struct device *dev, const void *data)
> -{
> -	return is_cxl_nvdimm_bridge(dev);
> -}
> -
>  /**
>   * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
>   * @port: any descendant port of an nvdimm-bridge associated
> @@ -75,7 +70,9 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
>  	if (!cxl_root)
>  		return NULL;
>  
> -	dev = device_find_child(&cxl_root->port.dev, NULL, match_nvdimm_bridge);
> +	dev = device_find_child(&cxl_root->port.dev,
> +				&cxl_nvdimm_bridge_type,
> +				device_match_type);
>  
>  	if (!dev)
>  		return NULL;
> 
> -- 
> 2.34.1
> 
> 
