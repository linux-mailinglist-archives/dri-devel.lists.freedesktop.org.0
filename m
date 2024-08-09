Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4C94CFCD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 14:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD34F10E8DD;
	Fri,  9 Aug 2024 12:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYRwCkCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADED010E8DB;
 Fri,  9 Aug 2024 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723205240; x=1754741240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/RtfoT6QM6ZytFegC6wt0VcS7y8xo1xFb3gPsmITtjY=;
 b=OYRwCkCNsSkZprJYLlG+kxhOcVgNkHz5k18rWR7cnn6/TWg45xIQ1U+g
 1eo6os4mSLU/voTybil047IOidw63hcKdZz6h7tByahr8RU2RJvI2dYai
 hljcHcuZ4+anRxDA+IH7LBIqufFdEm4PL8mPEhkntjURJJYQKZN/5lVB/
 u5Qa/j8XU6REg6sV6txaHnbQvP68FOvTK/j1XdJ4cB0h2LnhIi+uyhIEz
 OJsxXQ4dlDva7eVpaeJmPv0/a0rhWC1mSdfCXDVIE/bw7boFSN4rtEhCW
 VYa78F4Q1bQO3BMNloWwrt29TtXT11lWN2+e5oGL5Ol2AGlWYNGYVRm8x w==;
X-CSE-ConnectionGUID: pqoCL0gBTuuTVjY1E3swkA==
X-CSE-MsgGUID: veyxjDllSxuzUpmKRwTCpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21257604"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21257604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:07:19 -0700
X-CSE-ConnectionGUID: i2l27iTAT8SGS1qwenBiWw==
X-CSE-MsgGUID: lOOzyfClT1G5K+CLQTBdBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="88185093"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.169])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:07:17 -0700
Date: Fri, 9 Aug 2024 13:07:12 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Mark the GT as dead when mmio is unreliable
Message-ID: <ZrYGcM5e6tF8h_rX@ashyti-mobl2.lan>
References: <20240807091014.469992-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807091014.469992-1-andi.shyti@linux.intel.com>
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

Hi,

On Wed, Aug 07, 2024 at 10:10:14AM +0100, Andi Shyti wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> After we detect that mmio is returning all 0xff, we believe that the GPU
> has dropped off the pci bus and is dead. Mark the device as wedged such
> that we can propagate the failure back to userspace and wait for
> recovery.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

merged to drm-intel-gt-next.

Thanks,
Andi
