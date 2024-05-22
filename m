Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807F8CBD6D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 11:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1066210E145;
	Wed, 22 May 2024 09:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKBXCcy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4744410E1DB;
 Wed, 22 May 2024 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716368563; x=1747904563;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vdwobsLhXA+dEshrN25AFE+od2yRZgrn+VUsbx+5L+o=;
 b=BKBXCcy+pQssMnhNnrAHOb1/ucz7cnoGGA/z8BXxTC9QaMxIdYpmfsNf
 iKbGLxdG91rJ94ReaFataUKtbcQ976Ac9mcYi0dHDrub/myOJ+V5cbBSd
 cokVa9t2Mlk4WgUYIWXichan+xQlCBIU+FXZgKgJwCYi5Vgg1kwTD335+
 DTZsYdgChi6HIFGkS6szKaXUmsy0qyfHYdjj2VUSzVHAsw4AfvzhLD30b
 Ik8IAAfJnk5eNQ1VoArcJdZUFvLC9/nkQ5Pp00quJTronWy2ihWp0i0wg
 HsyyhaX1QylfzK1ri4WpGKl13UmhO55SaFcCbN2BvPCP15ZuLYjuX57Rx w==;
X-CSE-ConnectionGUID: TwznFqzuQpqg7yS3sOUL/g==
X-CSE-MsgGUID: z+o0Gn4FQuOgrmpRPEX1zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15555443"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15555443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 02:02:42 -0700
X-CSE-ConnectionGUID: 4nepj5b8Rw69Glla60MnEA==
X-CSE-MsgGUID: 5r9PF/NgRty/hsiKECXZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37801256"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 22 May 2024 02:02:30 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7B115312CD;
 Wed, 22 May 2024 10:02:29 +0100 (IST)
Message-ID: <d638971e-0a63-4632-8500-63bc893e6d65@intel.com>
Date: Wed, 22 May 2024 11:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Improve drm printer code
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240517163406.2348-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240517163406.2348-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

++

It's already reviewed, but since this touches shared code, extra acks
are still welcomed

On 17.05.2024 18:34, Michal Wajdeczko wrote:
> We already have some drm printk functions that need to duplicate
> a code to get a similar format of the final result, for example:
> 
>   [ ] 0000:00:00.0: [drm:foo] bar
>   [ ] 0000:00:00.0: [drm] foo bar
>   [ ] 0000:00:00.0: [drm] *ERROR* foo
> 
> Add a generic __drm_dev_vprintk() function that can format the
> final message like all other existing function do and allows us
> to keep the formatting code in one place.
> 
> Above also allows to improve drm_dbg_printer() that today lacks
> of outputing symbolic name of the caller, like drm_dbg() does.
> 
> v1: https://patchwork.freedesktop.org/series/133749/
> v2: make it static, keep it simple and use braces (Jani)
> 
> Michal Wajdeczko (3):
>   drm/print: Add generic drm dev printk function
>   drm/print: Improve drm_dbg_printer
>   drm/i915: Don't use __func__ as prefix for drm_dbg_printer
> 
>  drivers/gpu/drm/drm_print.c                | 53 ++++++++++++----------
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c |  2 +-
>  include/drm/drm_print.h                    |  2 +
>  4 files changed, 34 insertions(+), 25 deletions(-)
> 
