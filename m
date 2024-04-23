Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEEC8AE0FB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B8210EF24;
	Tue, 23 Apr 2024 09:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRH4DjHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD9F10E735;
 Tue, 23 Apr 2024 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713864463; x=1745400463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wLXR6antpvv/gtV7lYJtQlKMQXhel1VhhCfFTZVP0Dg=;
 b=aRH4DjHKreFWApIca3WgEGDgkX5K9W2hYbeYtId9Rh8u0Y3hx+PDaVJo
 7OHpzHrqadIYZGduFTfZebAcwDHdlH4/2MMf8OQqBx/caWiuB4vscEP6T
 l3bh+fVaxJLTEMAx/wTq2zIB2HzqUUjfK5PObCmOmrWpLDiLUgHRhcfMr
 EKvfH6HmXA2poU+ALz4g4HFFWzsdxBYfUHMhY8G0di6Pp9t9v/v4H7LNK
 c3fnI85ZAiXRpBQ3UcjBZDHxRXSgJDmnfdn4MH90umQPLtXnkVlYt6oBp
 CmyjhraI1bBkDbP0bhcsSUR+DhuXdzDPC0+5NiJqc0Dzgnp7SPURlbzJ4 A==;
X-CSE-ConnectionGUID: 4sg//Kf8RC6NjF1b4lFO2Q==
X-CSE-MsgGUID: 5/YXDCUkSxGwVZnFXBtYOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20135039"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20135039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:27:42 -0700
X-CSE-ConnectionGUID: f5FHc+02RN6OQDxRBtwWMg==
X-CSE-MsgGUID: cUZGYC/yRCOjazBlwcPPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24357435"
Received: from unknown (HELO intel.com) ([10.247.119.79])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:27:37 -0700
Date: Tue, 23 Apr 2024 11:27:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
Subject: Re: [PATCH v2 1/2] drm/i915: Refactor confusing __intel_gt_reset()
Message-ID: <Zid_APtzggnQUYY3@ashyti-mobl2.lan>
References: <20240422201951.633-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422201951.633-1-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Mon, Apr 22, 2024 at 10:19:50PM +0200, Nirmoy Das wrote:
> __intel_gt_reset() is really for resetting engines though
> the name might suggest something else. So add a helper function
> to remove confusions with no functional changes.
> 
> v2: Move intel_gt_reset_all_engines() next to
>     intel_gt_reset_engine() to make diff simple(John)
> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
