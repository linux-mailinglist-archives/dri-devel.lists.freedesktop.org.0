Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E284E95B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 21:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4381E10ECB7;
	Thu,  8 Feb 2024 20:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeqvQWG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7558A10ECB7;
 Thu,  8 Feb 2024 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707422859; x=1738958859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jEFILA4AOQFKP5N74g+wybLTvwBqH/t+DpqAbP4ze7w=;
 b=UeqvQWG0s+88VLr9PLHkm7S/0TB/sqYnyj6uNIrFYwapIOSfP4f69q6/
 4/VIOkV1hBZmZwiihtHinnWG31qCifqVX3HjeMgbXDMvARWy4LToe34U3
 xAvZE29yrcXEzsAPVHaJxYJcXTfyzQZvw5R8JPNJlbc6cS+E3PRRnsmIo
 o8tBSH9yErF+8HhIV1bPNlFQPtPMrBtgKN0WOWv9zwAP9BI5m258+EBvj
 BcxsUEsES17LkBurlfnyJE+XD7lDyhKpoE0XvImjkO6NGABw4sAZNBXtk
 MyYAhaq/mvLlphh/HIDgliiZIuuPFSxpUNibjAQJIwYPjWPi4QzBdFZlL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1463071"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1463071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 12:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6388559"
Received: from udig-mobl1.ger.corp.intel.com (HELO intel.com) ([10.246.32.229])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 12:07:35 -0800
Date: Thu, 8 Feb 2024 21:07:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 3/3] drm/i915: Convert REG_GENMASK* to fixed-width
 GENMASK_*
Message-ID: <ZcU0hDSPOmhX76pq@ashyti-mobl2.lan>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208074521.577076-4-lucas.demarchi@intel.com>
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

...

> +#define REG_GENMASK(__high, __low)	GENMASK_U32(__high, __low)
> +#define REG_GENMASK64(__high, __low)	GENMASK_U64(__high, __low)
> +#define REG_GENMASK16(__high, __low)	GENMASK_U16(__high, __low)
> +#define REG_GENMASK8(__high, __low)	GENMASK_U8(__high, __low)

I was hoping to use directly GENMASK_U*() functions.

Andi
