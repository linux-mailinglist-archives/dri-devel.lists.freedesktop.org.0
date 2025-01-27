Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1664A1D3B4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 10:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1007710E225;
	Mon, 27 Jan 2025 09:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7Y8YoFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D744C10E225;
 Mon, 27 Jan 2025 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737970992; x=1769506992;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xtvdBoA3cwqsMwflfoLoRaGjPZhkrO4EFSq7d0kAxkg=;
 b=i7Y8YoFqsn47vSX/34Z5EwhZZv76mKIXnPAn75OdgEOC+WVg8S8vgxt0
 yqPFauvBdyH4zHBlePV7jkZg8SDPRk6Sv1LIBZuk76/asbgL8zgxyue2M
 cz3Qrn4tZnYsNFm4OSDTdryIFqH0cwf6EhSODvCARDpfYYUrJ/9Bx+OE/
 7FzNRbi5W7Yg8YsqwOmcF/0gwbblWa5DHGuDFsX0rr2FgCp6pBCltJ7re
 emX9t7hvydomZFnDDGfXmZqlCKui7TpOHt5l7QH9Ys6kTjUKrosOx9EPk
 JbPpHtWSTq9b5V5ZiyycY5N1SkS5I+Ii0nGTAHKuJTjKXlkhBniH8d7lP w==;
X-CSE-ConnectionGUID: zHUghLtNQnWTwyOC5nlC2g==
X-CSE-MsgGUID: ADwVJh5QTeCx9LuT6eje1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="37678668"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="37678668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:43:11 -0800
X-CSE-ConnectionGUID: A01s2DWgTUeQF2/SIRrHDA==
X-CSE-MsgGUID: LLkVV6qUR5Ct2l9j2jDqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="139265070"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:43:08 -0800
Date: Mon, 27 Jan 2025 11:44:00 +0200
From: Imre Deak <imre.deak@intel.com>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 lyude@redhat.com
Subject: Re: [BUG,BISECTED] WARNING dcn20_find_secondary_pipe
Message-ID: <Z5dVYAPYu1d34dlC@ideak-desk.fi.intel.com>
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
 <Z5Zm-STfRzJ_PIkI@debian.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Zm-STfRzJ_PIkI@debian.local>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 26, 2025 at 04:46:49PM +0000, Chris Bainbridge wrote:
> Hardware is HP Pavilion Aero 13 laptop with Dell WD19 dock and three
> external monitors. I get a warning with recent kernel builds when
> enabling the external monitors with xrandr after initial boot:
> 
> 16:57:49 kernel: WARNING: CPU: 4 PID: 1347 at drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn20/dcn20_resource.c:1734 dcn20_find_secondary_pipe+0x1a6/0x400 [amdgpu]
>
> [...]
> 
> The bisect leads to a merge commit 43102a2012c2 ("Merge tag
> 'drm-misc-fixes-2024-09-26'"). Neither parent commit produces the
> warning, but the merged commit does.
> 
> There are two commits that interact to cause this warning:
> 
> 2a2a865aee43 ("drm/amd/display: Add all planes on CRTC to state for
> overlay cursor").
> 
> and
> 
> 70a6587dca37 ("drm/dp_mst: Fix DSC decompression detection in Synaptics
> branch devices")
> 
> 2a2a865aee43 was added to the mainline Linux repo first, but the warning
> only appears following the merge of 70a6587dca37.

The effect of 70a6587dca37 is to enable DSC only if the dock supports
this. IIRC the WD19 dock does support DSC in both of the branch devices
within it, so not sure how the commit makes a difference on it.

Checking if it's the DP_DSC_SUPPORT DPCD register AUX read which fails,
or if the DP_DSC_DECOMPRESSION_IS_SUPPORTED flag is not set in the
register would tell more (maybe by using drm.debug=0x100).

In any case not sure how the reported DSC capability would relate to
the above warn in dcn20_find_secondary_pipe(), the driver should handle
a dock both with and without DSC support.

> #regzbot introduced: 43102a2012c2
