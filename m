Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E895FC266
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 10:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076FA10E061;
	Wed, 12 Oct 2022 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244C010E061;
 Wed, 12 Oct 2022 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665564710; x=1697100710;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vzI5rI1X43j0vMZDrnv2YYPaRQyDQuHgQrzAI7M6QqQ=;
 b=YUeic3SZuKPGXwfYO+aJQ6eE18di15Io9dtXCOYKVD76MZj59p5R3l0q
 yNYYDqVyRTOrgvZBgSDFTsZ48OhjPXV8LiBadWfIruLUCTAwtVQeaQzbH
 ucvH/IrF6sXvET2OLeYXDDmeOay+XSWHaOkucJ8hMdOfxBIeOUMlW6jrN
 WzEayKYLJfpFeoAG8bhWMpyRu+Db7aKTBhSvCntAdus0f13fl6QokvS3T
 AmjGElpfxjflYcSCNJduZ3tQlmtdHSSV/7Y66HhW3e3dR3mO5/oX0ghv8
 GM720MvdMakrJAItZsp+y2e9dlYJ5k6026FHY70cW7oNCcpB9f5k0req4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="288007202"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="288007202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 01:51:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="731340827"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="731340827"
Received: from freeb-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.24])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 01:51:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Lucas De
 Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/3] Add _PICK_EVEN_RANGES
In-Reply-To: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
Date: Wed, 12 Oct 2022 11:51:48 +0300
Message-ID: <87mta1whjv.fsf@intel.com>
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Add a new macro, _PICK_EVEN_RANGES, that supports using 2 address
> ranges. This should cover most of our needs for _MMIO_PLL3 and such.
> To show what is achieved with the new macro, convert some PLL-related
> macros to use it instead of _MMIO_PLL3.

While there's nothing particularly wrong about the solution when looked
at in isolation, I do have pretty strong reservations on the whole.

We have:

1) _PICK_EVEN() used in _PIPE() and friends

2) _PICK() used in _MMIO_PIPE3() and friends

3) ->pipe_offsets[] etc. adjustment used in _MMIO_PIPE2() and friends

4) ->ddi_index[] mapping proposed in [1]

5) _PICK_EVEN_RANGES() proposed here

Originally we only had the first one, when the hardware was
simpler. Every single addition since then made sense at the time, but if
we add 4 & 5 to the mix, I think it's just too many options.

I think it's time to take a step back and figure out if there's a more
generic approach that could be used.


BR,
Jani.


[1] https://patchwork.freedesktop.org/series/108833/

-- 
Jani Nikula, Intel Open Source Graphics Center
