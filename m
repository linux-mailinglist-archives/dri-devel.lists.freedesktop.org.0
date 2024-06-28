Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016191B8C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0DD10E169;
	Fri, 28 Jun 2024 07:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVShF5+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983010E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719560755; x=1751096755;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=h1q38NJ33i5TNhWIH8gnY8i8PsYkk5nZjKmUvOrM3mQ=;
 b=NVShF5+GVHbMFI92dcDDvNN6xkDXkqmQ6gtSJf2RlSDjZQvuA/i70U+B
 SGQMF+fmOoMwxLAVz3wc6Mu409kriLvskSF/rvshcBNCVSJNEj38lv6R4
 dLwQbTlpFM17qjaWGjzhmN2uVWEE/1T0FDDdqEDy73H5sE7L5VRnfstkl
 wJKyJb75gXTpkxFWL4dGQhi8GSfveZFXHrWHM/5OKmlJozbhgx5oQb4Xy
 ed940HQGQgDKL/6FYKp08KLMDioDZdHdN447EBmPRsN+aBkQyb4BeWopA
 KCNqlkoL3miHZvF7M4DIwP0ExvyoOrggsT/8QAX7IHxU3icmfmqj6ioVm g==;
X-CSE-ConnectionGUID: 1H67E0afRAGMgnl5suU91w==
X-CSE-MsgGUID: j/3xC8czRV6QPfZNxjYumA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16470295"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16470295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 00:45:54 -0700
X-CSE-ConnectionGUID: Uf6RRY0WQvaFTwkPybWoiw==
X-CSE-MsgGUID: afdBx0/qR7GyLjkTv2LCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="75393792"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 00:45:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org
Subject: Re: How to specify panel bit order in driver?
In-Reply-To: <Zn4z_OJJ07xg_xmh@titan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Zn4z_OJJ07xg_xmh@titan>
Date: Fri, 28 Jun 2024 10:45:48 +0300
Message-ID: <87le2pbjdf.fsf@intel.com>
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

On Fri, 28 Jun 2024, John Watts <contact@jookia.org> wrote:
> Hello there,
>
> A while ago I added support for the FS035VG158 panel to the kernel, with its
> use case being on a Allwinner T113 board.

Might be helpful to actually point at the source code or commits or
something.

> While troubleshooting some other issue (I will be posting about that this
> weekend) I found that I need to tell the panel controller to use a bit depth of
> 18-bit in order for the panel to work correctly.
>
> I plan to add another panel to the kernel that also requires setting the bit
> depth, but has more configurations than just 24, 18, 16, it also supports
> packing 18 of the bits together.
>
> How all of this is configured depends on how the board and panel are wired
> together, it can't be determined at runtime based on pixel formats or anything
> like that. It seems to me that this needs to be specified in the device tree.
>
> My question is: How would I represent this? A property like 'bit-depth'?
> 'color-mapping'? Or is there already some subsystem or convention designed for
> this?

Maybe look at include/uapi/drm/drm_fourcc.h, and how the DRM_FORMAT_*
macros are used.

Can't help you with device tree, but maybe this gives you pointers to
other places for examples.


HTH,
Jani.


-- 
Jani Nikula, Intel
