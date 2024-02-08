Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E684E952
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 21:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548C10EC89;
	Thu,  8 Feb 2024 20:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbcHun+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7564810EC7F;
 Thu,  8 Feb 2024 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707422703; x=1738958703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3z64KEFV+ywZgeTSGpLc92WSDJ22y1rSBk7p5RJceio=;
 b=lbcHun+KqOxSh+sR4Xi5LH8jiRNrr6QccqpedN6rV8HmCbPxgAmrYogY
 qZ3BQckelKu5kcjRBIqBznKyo+civSe+l6tik0q3p/0QJG1kf3Qh143Qo
 R7YdpBSjFlSKfI6pCCe0Ecg/wzs81CPHBV2k21T0GLYMKDM9/+JQr5rVT
 bMVWZ7Cd30VPS+E5LJlLkwe7fjr/Avg9jb6KshuhTcdeUbo65iUX1bOqP
 ODQpffDsKOmHgGR46gzUNOWCQ/WHgxL5hodX/eajKJVGP2VK/h48qnxyU
 qtYRi3SIKiTmDy/6zFzEZndve9Ixx+SBfy6m4Gj/Ylx2JY97hYRI5Xchy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12675170"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="12675170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 12:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6409306"
Received: from udig-mobl1.ger.corp.intel.com (HELO intel.com) ([10.246.32.229])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 12:04:48 -0800
Date: Thu, 8 Feb 2024 21:04:45 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <ZcUz3V56qNeTVq66@ashyti-mobl2.lan>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208074521.577076-3-lucas.demarchi@intel.com>
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

Hi Lucas,

looks good, just one idea...

...

> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))

considering that BIT defines are always referred to unsigned
types, I would just call them

#define BIT8
#define BIT16
#define BIT32
#define BIT64

what do you think?

Andi
