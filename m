Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884DB0B5BD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1110E362;
	Sun, 20 Jul 2025 12:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZX4lbXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78D310E360;
 Sun, 20 Jul 2025 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753013089; x=1784549089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MDBvBU+KBKtchS8KA42IMSkfPkXZam4h26mlcgjYKzQ=;
 b=TZX4lbXIdLkca7vQvF5YDu1p1x2iRbKJL8DvvmXmjj4zy8LFAimdUtnf
 D6vRKR9YTF7CXD6UU2WtFxEUXynTC56OlYAoZ1Eh3ibZRfFn+NBbr5r+t
 VnYE2tp6JJnxujlfKLfn5ghvNM9Mls5+lbj0fooTp8do2PEAAlUy1vX60
 pskNtavvfKCLKpvF7jy9rGrmNhcWHYnC4YRmIc1/eioTGfbG5/Rk1sfAq
 gQ5WaixvNDnUL/brxKSoLMxWRdP3AUSbOIsnYV/S8L5Mw+37JuCBm6aoo
 dQLKpFST4zJ8nvC59Az0dHRRNn1VidiLPUeJHSHeQwaydqAPuCCfQJ6tS A==;
X-CSE-ConnectionGUID: n3xWc571RaqyA+Hq/k54pQ==
X-CSE-MsgGUID: pNWhOr9jSZ2NhbwF0Ey+VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="58905383"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="58905383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 05:04:49 -0700
X-CSE-ConnectionGUID: YwqGULdLQt2Km+pwM+zDkw==
X-CSE-MsgGUID: NMURf9aXTVmJ554tbieRxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="157921979"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 05:04:43 -0700
Date: Sun, 20 Jul 2025 15:04:42 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v5 3/9] drm/xe: Add a helper function to set recovery
 method
Message-ID: <aHzbWgCMjfoRA_Bu@black.fi.intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-4-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715104730.2109506-4-riana.tauro@intel.com>
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

On Tue, Jul 15, 2025 at 04:17:23PM +0530, Riana Tauro wrote:
> Add a helper function to set recovery method. The recovery
> method has to be set before declaring the device wedged and sending the
> drm wedged uevent. If no method is set, default unbind/re-bind method
> will be set

...

>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
>   * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The default recovery method is
> - * re-probe (unbind + bind).
> + * specified in the drm wedged uevent. The method needs to be set using

'can be' sounds more suitable to me since it's optional.

> + * xe_device_set_wedged_method before declaring the device as wedged or the
> + * default method of reprobe (unbind/re-bind) will be sent

And with punctuations,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
