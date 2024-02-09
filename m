Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7284F507
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 13:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D09710EE80;
	Fri,  9 Feb 2024 12:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1pukkJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB03210EE80;
 Fri,  9 Feb 2024 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707480449; x=1739016449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jsV1Z2yguwUVdxBBsziY9m+bhLEE+xWD3WOAuTiGCC0=;
 b=Z1pukkJQToLfU/8nBypqcb8mTCyElsvXcV6qOXj95Aj3WY/sQDmumhEO
 bnTJbUTddWq8gdEyNLQGzOrKG1/Yx5jOx6+pOe57v8M1J2SqZBajhPE8c
 rn680GGaTpx32tFQqChPX6HLz1qMQ09QG1bpMjMJQKcPDQPQ2vCwlj8Gv
 T6aQMtaCjjPQ+dgTiPtE59kLfUk0ciNAaXDKtYiH0e50QXM2SuQQzEmWs
 Oyjc61harJwlCIhRsPseURFCC78f1bX3X/Vnn4m6rWsz0TYz9+T+Qbv6a
 4b39NfVW0l1XlH45i6jgw5Ngl8kYrKQs54k4ZRhnSQxTKigjqFYgscXDx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1274632"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1274632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1955382"
Received: from dfischbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.64])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:07:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: Re: [PATCH 09/10] drm/xe: switch from drm_debug_printer() to
 device specific drm_dbg_printer()
In-Reply-To: <yivsrvud5khq4vjl5g4aigjwru4zyxfzp7bgzzxcifchpv7kll@4bdjrna2levy>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1705410327.git.jani.nikula@intel.com>
 <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
 <87y1c4fis8.fsf@intel.com>
 <yivsrvud5khq4vjl5g4aigjwru4zyxfzp7bgzzxcifchpv7kll@4bdjrna2levy>
Date: Fri, 09 Feb 2024 14:07:22 +0200
Message-ID: <87r0hlalj9.fsf@intel.com>
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

On Thu, 01 Feb 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Do you plan to also merge the last patch where you remove
> drm_debug_printer()?  Any conflict to be solved in the merge commit?
>
> This is just a question to know what's the plan, not preferring
> something else.

I looked into it, didn't see any conflicts, and merged away. Hopefully
none pop up until the branches merge again.

> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks,
Jani.

-- 
Jani Nikula, Intel
