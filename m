Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799ED78836F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D129E10E648;
	Fri, 25 Aug 2023 09:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBF310E648
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692955283; x=1724491283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J994JRI+fRnunrBXP4WK+3tE2os0ATDa3+yt0fYJsyg=;
 b=Ro56UcAgD08twhFGDXI1Qgzz9q0gKkKm1kOHRnzGuD9kVFgBbVrMMxxu
 vgs22r1NN5ZOSrH9hN3crWuIlE6T4LDNHG/lBnNaNYanBFHHxWb3q4Hve
 3InW8b1K9UotrIJWGkg42TP9nRas7+vHUy85Zvv4c9Lja4aB1+93ZDG/w
 Suo5NxLoDTcGx4rWZMSyXjDIGoeKng5+VuS6TrsWtkUmxEbBlM0QaCj0o
 W0hDXmoKdedC6M6a+p07qTKb6fR2cRNsoM5JH/RTVC427rI4/9fvzXOpe
 fe5pxMB92MlU5t9u5VkMV/7NuKZxTKfoKgA47VpgumTNUp4VeC7nO1VWM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364868601"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364868601"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802901144"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802901144"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:21:21 -0700
Date: Fri, 25 Aug 2023 11:21:19 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] habanalabs/goya: refactor deprecated strncpy
Message-ID: <20230825092119.GE3748525@linux.intel.com>
References: <20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 08:49:11PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
