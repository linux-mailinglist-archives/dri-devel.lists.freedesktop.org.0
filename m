Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB6788367
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1310910E647;
	Fri, 25 Aug 2023 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4D10E647
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692955217; x=1724491217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FDMl+onuToDyEOluRAGKzyB6iREgmusYLPjxALDtjeU=;
 b=gOylUTwJeMv53CVutmmdrBENHVMQFh5Pvve6G77uMFdRcSholTbj9mKJ
 pFswJ6OmUGfygtxVDirzxku1OCAuuF2IMEoC5zX2EkyAPucP/caaWrV4e
 TGht/MNqBBcvQH4eZ25Jy3lWCD+WwRkbTz55zoI5XiiBzjqbMf8IPyzND
 Mn81SBQIusq/vIt6b08cgwnwc6Vjh3r/EzZ2Xo76U60c6yr2/Vp1jdCZP
 bWdOuGaajGsQ0ClYen//nW/OxDnepuY2PDBaCRCMNh8ikgJcry+eX5JPC
 HWpkhMPnWwQXqvAv7i6AiWUcLcoobA/SDo1uaJQ/pO8I+hBwzU9aRG5x4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377412580"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377412580"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="911228524"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911228524"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:20:13 -0700
Date: Fri, 25 Aug 2023 11:20:11 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] habanalabs/gaudi2: refactor deprecated strncpy
Message-ID: <20230825092011.GD3748525@linux.intel.com>
References: <20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com>
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

On Thu, Aug 24, 2023 at 08:45:08PM +0000, Justin Stitt wrote:
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
