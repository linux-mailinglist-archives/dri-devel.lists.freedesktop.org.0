Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EDE78835E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FCE10E646;
	Fri, 25 Aug 2023 09:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD62410E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692955140; x=1724491140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gmrsNWY4+QS5tyCiAogZ574zDVYYOApC/VkIfTywXhQ=;
 b=PzOCMgDr5jAiaB2QSp4e7+0BlT3XVg+y0JyN4MGwtFucGnHbqMtxZfnR
 QN5eB7fvQY04eeNhvOFp06MpjInf1LwjHRyx4mLBAPaSmeM/tKZiHQbaE
 MYDpH0DEKU941ura4DPg6icEVeB++ru28LQV0ddo2qa/3cZhA1x+iALmH
 3pGT6jg08iRLygXFJssBRcw5GTob3hgx27Z5ghdXjW62HrL+T1EIkZYzl
 wz+WKBJLnk35IW0YJHQmkWV9Z2EJLooSuSJnr2SRGwOCjf+vhuUSuQVbW
 Axv4/e8Jv1rxWkdQPBFmbKl/u8G2MwgMWZxL824d1ViPnV+3MYYTrJuPT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364868266"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364868266"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802899875"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802899875"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:18:58 -0700
Date: Fri, 25 Aug 2023 11:18:56 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] accel/habanalabs: refactor deprecated strncpy
Message-ID: <20230825091856.GB3748525@linux.intel.com>
References: <20230823-strncpy-drivers-accel-habanalabs-common-habanalabs_drv-v1-1-147656947586@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823-strncpy-drivers-accel-habanalabs-common-habanalabs_drv-v1-1-147656947586@google.com>
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

On Wed, Aug 23, 2023 at 12:23:08AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> There is likely no bug happening in this case since HL_STR_MAX is
> strictly larger than all source strings. Nonetheless, prefer a safer and
> more robust interface.
> 
> It should also be noted that `strscpy` will not pad like `strncpy`. If
> this NUL-padding behavior is _required_ we should use `strscpy_pad`
> instead of `strscpy`.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

