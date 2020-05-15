Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDE1D5261
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6C36ECCC;
	Fri, 15 May 2020 14:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4004D6ECCC;
 Fri, 15 May 2020 14:48:19 +0000 (UTC)
IronPort-SDR: X1zQ65WihPOHohBEVCP4xmKQuOYTlStxAktVf9rVIwi8b5DQDY8MvwD9oLjyf/82tZ+6qGPNxH
 PfY9SWWIMuXg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:48:18 -0700
IronPort-SDR: 4156NkPbKguXHUl/tTSYeDICywodZN3o+27s77ul80c2TBA/FRwR+8R9lx5aB6ThNAJ7a2rV82
 jEO6Hf4KbFow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="464923815"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 07:48:15 -0700
Date: Fri, 15 May 2020 20:18:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 00/16] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Message-ID: <20200515144812.GB11877@intel.com>
References: <20200429195502.39919-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-29 at 15:54:46 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v6:
> -Rebased on -tip
> -Disabled HDCP over MST on GEN12
> -Addressed Lyude's review comments in the QUERY_STREAM_ENCRYPTION_STATUS patch

Sean,

What is the test setup you have used?

I am afraid our CI dont have the coverage for MST capability yet to provide
the functional status of the code.

-Ram.
> 
> Sean Paul (16):
>   drm/i915: Fix sha_text population code
>   drm/i915: Clear the repeater bit on HDCP disable
>   drm/i915: WARN if HDCP signalling is enabled upon disable
>   drm/i915: Intercept Aksv writes in the aux hooks
>   drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
>     signalling
>   drm/i915: Factor out hdcp->value assignments
>   drm/i915: Protect workers against disappearing connectors
>   drm/i915: Don't fully disable HDCP on a port if multiple pipes are
>     using it
>   drm/i915: Support DP MST in enc_to_dig_port() function
>   drm/i915: Use ddi_update_pipe in intel_dp_mst
>   drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
>   drm/i915: Plumb port through hdcp init
>   drm/i915: Add connector to hdcp_shim->check_link()
>   drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband
>     message
>   drm/i915: Print HDCP version info for all connectors
>   drm/i915: Add HDCP 1.4 support for MST connectors
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 142 ++++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  29 +-
>  drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
>  .../drm/i915/display/intel_display_debugfs.c  |  21 +-
>  .../drm/i915/display/intel_display_types.h    |  30 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 654 +--------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 743 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  19 +
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 217 +++--
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  25 +-
>  .../drm/selftests/test-drm_dp_mst_helper.c    |  17 +
>  include/drm/drm_dp_helper.h                   |   3 +
>  include/drm/drm_dp_mst_helper.h               |  44 ++
>  include/drm/drm_hdcp.h                        |   3 +
>  17 files changed, 1235 insertions(+), 726 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> 
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
