Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384359E5642
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8500D10E3BF;
	Thu,  5 Dec 2024 13:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id8RxF7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A797610E3B0;
 Thu,  5 Dec 2024 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733404349; x=1764940349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jl4bPjywWqj7or9VJEuymg5m7MVK7VoFhl/oA5JlDMk=;
 b=Id8RxF7siRIojvcKzOu5mLa+QaqX7JSlbjXBAgou+y1y77gVLfIFmr5t
 nUK/AFDv95v60qAKB0eAo/g05mygiQqx649M4mGKJ9CMPkOha1JIX0ccB
 ltPgUHBua51p+QPFHVg7NDNH5zov+4yEKQrEiC79/4TOrIysYGpksuCpO
 3EnZoBjmeHwz8Ar6Ay/UnlcgKutujA5RZPEzEnOoVyH7VYmbzk0Pp6uno
 seMtnYGEENxh5tbp2z+AhVfFQA9HRGHJxcLj8wm4RTqFqv8sSiGNYMYtl
 psNq3K2vfOLdScK467wzIrPo/Q4aQn8hgvVVALFs2DbkhFKTf5IKGk+7B g==;
X-CSE-ConnectionGUID: QtTNC4PpTmSPHTnpzprZng==
X-CSE-MsgGUID: 1uATBZuISZS/rb6wp9kAag==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44320854"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="44320854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:12:29 -0800
X-CSE-ConnectionGUID: MLFIij/TQGeRQC2lRjl3eQ==
X-CSE-MsgGUID: jDcdog3JQqm/GVBI0PMeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94532818"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:12:27 -0800
Date: Thu, 5 Dec 2024 14:12:23 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/print: add drm_print_hex_dump()
Message-ID: <Z1Gmt1rdhgjQOlYD@ashyti-mobl2.lan>
References: <cover.1733392101.git.jani.nikula@intel.com>
 <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
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

Hi Jani,

On Thu, Dec 05, 2024 at 11:49:33AM +0200, Jani Nikula wrote:
> Add a helper to print a hex dump to a struct drm_printer. There's no
> fancy formatting stuff, just 16 space-separated bytes per line, with an
> optional prefix.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
