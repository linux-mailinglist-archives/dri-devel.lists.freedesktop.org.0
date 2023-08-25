Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDD788327
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD110E10F;
	Fri, 25 Aug 2023 09:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE2110E10F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692954745; x=1724490745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eGxkO6pWElUh9VCtq/z4PhgMeq1KmRq1BNRNSeDk+a8=;
 b=LHGJbPbwGdhNcUN1kGJJzbiBUWoNHB7QGrenn7M1SjLaNefJNEnTCJJ+
 GDL3ILrHgBPu7Y1+pL8rjPicwCpHPOJ+H+ITz4Gl7J713nITWC94bS6ab
 Q9o1k7yWl45d1Sug2uJGsOTm6FxGI3jdNJtli4tb2qx0/yZo76L+m7fYx
 rf6Zf78qbEJo5KmFiHAHC61ZnGyPl6zmaCGbBZXeFkAGvUqSIB47D6Rl5
 lKNHucvvExlFAPcUMlZ2NCPCDmNgzbEXtZANuUrRoqCvM9R+poRcsu5SY
 KcJ2hxYqUO3bqYVOqMJv9SM4ee9y9Utj3qQoty1mipkHjEJWZUTveLgj6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441018158"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="441018158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827517344"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="827517344"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:12:22 -0700
Date: Fri, 25 Aug 2023 11:12:20 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] accel/ivpu: refactor deprecated strncpy
Message-ID: <20230825091220.GA3748525@linux.intel.com>
References: <20230824-strncpy-drivers-accel-ivpu-ivpu_jsm_msg-c-v1-1-12d9b52d2dff@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-strncpy-drivers-accel-ivpu-ivpu_jsm_msg-c-v1-1-12d9b52d2dff@google.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 09:20:25PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> Also remove extraneous if-statement as it can never be entered. The
> return value from `strncpy` is it's first argument. In this case,
> `...dyndbg_cmd` is an array:
> | 	char dyndbg_cmd[VPU_DYNDBG_CMD_MAX_LEN];
>              ^^^^^^^^^^
> This can never be NULL which means `strncpy`'s return value cannot be
> NULL here. Just use `strscpy` which is more robust and results in
> simpler and less ambiguous code.
> 
> Moreover, remove needless `... - 1` as `strscpy`'s implementation
> ensures NUL-termination and we do not need to carefully dance around
> ending boundaries with a "- 1" anymore.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
Applied to drm-misc-next-fixes

Thanks
Stanislaw

