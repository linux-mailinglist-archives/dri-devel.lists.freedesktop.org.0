Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E47EAB88
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 09:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFAE10E1CE;
	Tue, 14 Nov 2023 08:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9710010E1CE;
 Tue, 14 Nov 2023 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699950164; x=1731486164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MZt/KOjjeBEpZwQs4CWWZOvi6VhSAlgvO9Gjd3zyI/c=;
 b=W764FDrKioTUtlarug7y1+m3SzDamcPKdFm3YKj8s9g5G7FArkboLbpB
 drMZyGwg6bBV/10nk2JOW5jSHFOHPj7V8Oa+3bkJ+zv/3fO4H5hL9KdAA
 BscyuUxPSJdu4rJ3onVBtjFrBlcUS60U1Bms1uOFaQQQvsD33Na/SUAnV
 8RyyFBQljDFgqytlx3cL5/myKj7kPG87d1OvvLVaEsFABF9zEf/P8Fvh/
 MXCURDhOH825Bp+wUu59PihZ9lEzZd7TStr/4VauR6hOqdS5hvyqgaSJR
 oJbv4QKcNarsolSC7S1oMDAulAaKpd8AH0jtP5NdRe1UCDiJlN0tSWR95 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421706973"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="421706973"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 00:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741025692"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="741025692"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 00:22:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
In-Reply-To: <20231114141715.6f435118@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114141715.6f435118@canb.auug.org.au>
Date: Tue, 14 Nov 2023 10:22:25 +0200
Message-ID: <8734x8u4la.fsf@intel.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5484: ERROR: Unexpected indentation.
> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5488: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Introduced by commit
>
>   1cd0a5ea4279 ("drm/dp_mst: Factor out a helper to check the atomic state of a topology manager")

Imre, please fix this.

Thanks,
Jani.

-- 
Jani Nikula, Intel
