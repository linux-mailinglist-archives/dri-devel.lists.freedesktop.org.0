Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB8C9459B7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 10:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDE310E188;
	Fri,  2 Aug 2024 08:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpHKfKtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700A10E125;
 Fri,  2 Aug 2024 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722586548; x=1754122548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P2cFxlkpLoki29fYwCYVoDeB+KCzVMfwjhGxnySsB8s=;
 b=BpHKfKtMQT8TeYhQFdpybnkyBPSlb5sslmVW6m66r5RGm1EPLNq5RDp5
 NTKK0auOKFrtk51ShJZ34cbF5QWXuPqy5oNSO082CoUmX7dtSCtD9FwG8
 e1hxoTZNkJfMur7uyBPmbiZ8P3zbRmlthZl4USQ5vMkZjlWf2FNuw1YCG
 rCMEB0pRdnGAqm+TiUNtT9Q1NZ0RxL5cj59jxJlHtAAk0pqPRy/T3dqID
 PBIJZZOpwadKU7f8bQMI1v3TIamME71h3mIWJTec5vf4omh29TlhpagOv
 lza7uQ82JSz2cs5OG65h/l4GKmGG7Vvccj95NLSmDNgcD/LwmMSqdJSS2 g==;
X-CSE-ConnectionGUID: Mj1/fD26TUS1jwMBIEwtng==
X-CSE-MsgGUID: oQ7KOlTgTBG5hH20SqSYrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31167817"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31167817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:15:47 -0700
X-CSE-ConnectionGUID: FfBD1IlUSD+BaGNaRLmLxw==
X-CSE-MsgGUID: jTlk+8ICSs24A6O+6l4ZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55253660"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:15:45 -0700
Date: Fri, 2 Aug 2024 10:15:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Delete sysfs entries for engines on driver
 unload
Message-ID: <ZqyVrXUZosUmTt6L@ashyti-mobl2.lan>
References: <20240801154047.115176-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801154047.115176-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

On Thu, Aug 01, 2024 at 05:40:48PM +0200, Krzysztof Niemiec wrote:
> While the sysfs entries for engines are added in intel_engines_init()
> during driver load, the corresponding function intel_engines_release()
> does not correctly get rid of them. This can lead to a UAF if, after
> failed initialization (for example when gt is set wedged on init), we
> try to access the engines.
> 
> Empty the engines llist in intel_engines_release().
> 
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
