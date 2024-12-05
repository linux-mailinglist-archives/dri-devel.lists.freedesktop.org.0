Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543729E60B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 23:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467910E2F3;
	Thu,  5 Dec 2024 22:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy/vx/1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E0E10E2F3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 22:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733438396; x=1764974396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bDWc4rhMgoZqDeL0AXlS3HEyZRI+NGFW7RdxbN26PwE=;
 b=Uy/vx/1fj3GLd8ox1adnrbQwXHQ65x3zq9ZsT9ptKkASPpdG2We1/eQp
 DmPqBxnWWueTA5l/v+jEILfm2sK5O1PqcLBuvWHBP6wfnBn+w364fvxNh
 0XGRHzcseUuOD/KaLcNppUhcweVPoKY4Bg5DXN4YZyJCU4Y31MO1pcy/P
 F2/NaQ91cxDrLRzOQnxNQbdkDG1zMnX0KK4uI+J8sx9oEO01xKjIZcvBO
 njcRmN+2VzogVGSTU8OiBn1HjFxQV17c00Yu6I4dMo2cxql1z3hnCCL93
 i8s9Abj1CIdhxnb89tttX9o1Mcqh8KXq/ZFOa4R4s6yQOhZbchoctC2d2 w==;
X-CSE-ConnectionGUID: x41pk6wRQzCINYa/hIIeiw==
X-CSE-MsgGUID: PBk9IYElQdWCwg7NvvGxPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33660979"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33660979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:39:55 -0800
X-CSE-ConnectionGUID: s9cK9Ag1RGqhkbjPJGPt5g==
X-CSE-MsgGUID: +9UlsE4TSWCPuUIT6GPzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="99052989"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan)
 ([10.125.108.192])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:39:53 -0800
Date: Thu, 5 Dec 2024 14:39:51 -0800
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
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <Z1IrtwPo4Pj52fuY@aschofie-mobl2.lan>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
> 
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
> 
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
> 
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
> 
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  arch/sparc/kernel/vio.c                |  6 +++---
>  drivers/base/core.c                    |  6 +++---
>  drivers/block/sunvdc.c                 |  6 +++---
>  drivers/bus/fsl-mc/dprc-driver.c       |  4 ++--
>  drivers/cxl/core/pci.c                 |  4 ++--
>  drivers/cxl/core/pmem.c                |  2 +-
>  drivers/cxl/core/region.c              | 21 ++++++++++++---------
>  drivers/firewire/core-device.c         |  4 ++--
>  drivers/firmware/arm_scmi/bus.c        |  4 ++--
>  drivers/firmware/efi/dev-path-parser.c |  4 ++--
>  drivers/gpio/gpio-sim.c                |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
>  drivers/hwmon/hwmon.c                  |  2 +-
>  drivers/media/pci/mgb4/mgb4_core.c     |  4 ++--
>  drivers/nvdimm/bus.c                   |  2 +-
>  drivers/pwm/core.c                     |  2 +-
>  drivers/rpmsg/rpmsg_core.c             |  4 ++--
>  drivers/scsi/qla4xxx/ql4_os.c          |  3 ++-
>  drivers/scsi/scsi_transport_iscsi.c    | 10 +++++-----
>  drivers/slimbus/core.c                 |  8 ++++----
>  drivers/thunderbolt/retimer.c          |  2 +-
>  drivers/thunderbolt/xdomain.c          |  2 +-
>  drivers/tty/serial/serial_core.c       |  4 ++--
>  drivers/usb/typec/class.c              |  8 ++++----
>  include/linux/device.h                 |  4 ++--
>  include/scsi/scsi_transport_iscsi.h    |  4 ++--
>  net/dsa/dsa.c                          |  2 +-
>  tools/testing/cxl/test/cxl.c           |  2 +-
>  28 files changed, 66 insertions(+), 62 deletions(-)
>

For these cxl and nvdimm pieces:

  drivers/cxl/core/pci.c                 |  4 ++--
  drivers/cxl/core/pmem.c                |  2 +-
  drivers/cxl/core/region.c              | 21 ++++++++++++---------
  drivers/nvdimm/bus.c                   |  2 +-
  tools/testing/cxl/test/cxl.c           |  2 +-

Reviewed-by: Alison Schofield <alison.schofield@intel.com>


snip to end

