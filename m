Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD0512A25
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 05:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3440310E381;
	Thu, 28 Apr 2022 03:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7610E370;
 Thu, 28 Apr 2022 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651117452; x=1682653452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VCb8zpOLUspRvAY42v8rO2zLGX6/0ngqsK7vLtmJ8XA=;
 b=Du5cLsdFAxv4jihxCS4bmoYhhR3tM5a/g7U4qdrkZLkanwSpgvbMPMFP
 rWfrU469jh/v5oa6WVrm6RqZhDh1qc5zciI/ewxJXm9xPj7vNgK7MFDid
 yuVuvimV99dt79Yhx+1hlRLJ9vZ9pLSdst7L+K9QqTtSWzN6/m1HELviF
 RnPCotrPf9bKMg72Dg5DUTjT5XcX6j7eqPS19tyuVmWnry/7P4TBGBqj6
 HlTsBzoutQi8RkxFTMxgxs23BzYW2MagDD9MNnuTB1O24nhCciSJ5XgeP
 KU1XD6EeZoW4FwAeLtOsrJMgSGDF/xnhr14l0P5OASQST99tmyV+cptaA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265674202"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="265674202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 20:44:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559391365"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 20:44:11 -0700
Date: Wed, 27 Apr 2022 20:44:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/xehp: Add compute engine ABI
Message-ID: <YmoNisg69eZDZL7V@mdroper-desk1.amr.corp.intel.com>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
 <20220422195007.4019661-2-matthew.d.roper@intel.com>
 <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
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
Cc: Szymon Morek <szymon.morek@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 11:41:36AM +0100, Tvrtko Ursulin wrote:
> 
> On 22/04/2022 20:50, Matt Roper wrote:
> > We're now ready to start exposing compute engines to userspace.
> > 
> > While we're at it, let's extend the kerneldoc description for the other
> > engine types as well.
> > 
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Szymon Morek <szymon.morek@intel.com>
> > UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14395
> > UMD (compute): https://github.com/intel/compute-runtime/pull/451
> 
> The compute one points to a commit named "Add compute engine class for xehp"
> but content of which seems more about engine query, including the yet
> non-existent distance query (and more)?! I certainly does not appear to be
> adding a definition of I915_ENGINE_CLASS_COMPUTE. This needs clarifying.
> 

Hi Syzmon, any updates on the compute UMD merge request here?  Is there
a different merge request we should reference for now that just uses the
I915_ENGINE_CLASS_COMPUTE without also relying on the
DRM_I915_QUERY_DISTANCE_INFO that we aren't upstreaming just yet?

I believe distance info is only useful for multi-tile platforms and
isn't necessary for general use of compute engines on a single tile
platform.

Thanks.


Matt

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
