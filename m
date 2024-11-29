Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E99DC072
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 09:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1DF10E16D;
	Fri, 29 Nov 2024 08:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0nIIVYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A010E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732868685; x=1764404685;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ywnHbtv0bBYcFlDghJLER0X3vgXttyRYB75Rs0azQcY=;
 b=e0nIIVYFdhG1hXozzphwOxVioYibxvTMM6V6eslnRO0SXdgtizUG5I+L
 Dw4WDGET4syOeG8MyY701HxDuIOxqOVu9YtqxDL40aTVYK0R0ZtITjIsj
 o7tpK+RDr+E8lM2XmEYmK4/AZm0or78zdy9hUCc08hkMpJZglqtEdGR5o
 B+jmmHazy9Fv5lSojwAyJCgqQ+w0IFUlOD7uARVcJ1APnSQiG6S3OCByp
 stJ3Xp+JJSG+j+bfneMGVz9SJGq2ChWFCLYzKJxrv9kHBnQ11hG7oyAaJ
 xanFy7rYC5CmC1mHJthDGMnIna4mM+ijXJ1kiPiRdQR/ak1kq9EJmzYQY w==;
X-CSE-ConnectionGUID: 7apw3tlHT028BIMPMCqncQ==
X-CSE-MsgGUID: Kx2k7fUzTiGNDiI5jSq2kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36884410"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="36884410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:24:45 -0800
X-CSE-ConnectionGUID: NsfbDU4eTwu1Jf9oMckKDQ==
X-CSE-MsgGUID: aw3Fab1aR8CHmerVVpcnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="92336155"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.227])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:24:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <20241127095308.3149411-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241127095308.3149411-1-jani.nikula@intel.com>
Date: Fri, 29 Nov 2024 10:24:37 +0200
Message-ID: <87plme78hm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Having cec.h include linux/debugfs.h leads to all users of all cec
> headers include and depend on debugfs.h and its dependencies for no
> reason. Drop the include from cec.h, and include debugfs.h and
> seq_file.h where needed.
>
> Sort all the modified include lists while at it.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Depends on commit ae19ba915eb7 ("drm/i915/display: include
> media/cec-notifier.h and linux/debugfs.h where needed")

I'll resend after -rc1 and some backmerges.

BR,
Jani.

-- 
Jani Nikula, Intel
