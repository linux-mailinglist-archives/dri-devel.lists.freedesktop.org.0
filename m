Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603416C3F17
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 01:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57D010E114;
	Wed, 22 Mar 2023 00:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E3810E114;
 Wed, 22 Mar 2023 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679444855; x=1710980855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AxT4gKMF+Ze3+5GrQDXU4rgOoBznShabNwONzJNA1J4=;
 b=A7TSiw4jH+I0vNr6jGoDFv6zt3V8jF3qoQqYY3ZBdqvLYBz/N+jEhrbQ
 SSwZVD26pHme4fPwxRshpW0yLDEM9YJnKy0vBWQ5OcPHZ1THBR4TgFiSg
 THyliq3uTiHV7r+YKqkisd1fAAYdSeU5i+1wavJThZtbOIvyYrrFmxlzQ
 tpUV5z5CgVMM55bzl8Q/LR9T3VJfB915fc9WxAIa6fP95cqnG7CaMrBSj
 nMNz9E8a+rp2CN2xCrS3a+uP7vCRV+vnN9nAzcrjdAILuZqbff9frmVHE
 E5bH6kMcvzhWZeiZn9aJEEh5lQbyvw5b/1oNdMOH/UnhfeFbwXTWEmUYT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322933432"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="322933432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631791878"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="631791878"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:27:31 -0700
Date: Wed, 22 Mar 2023 01:27:08 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <ZBpLXDo65Mq8CzI5@ashyti-mobl2.lan>
References: <20230321232009.541585-1-andi.shyti@linux.intel.com>
 <20230322001051.GU4085390@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322001051.GU4085390@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Tue, Mar 21, 2023 at 05:10:51PM -0700, Matt Roper wrote:
> On Wed, Mar 22, 2023 at 12:20:09AM +0100, Andi Shyti wrote:
> > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > 
> > In multitile systems IRQ need to be reset and enabled per GT.
> 
> At the moment we're not enabling multi-tile support on any platforms
> yet.  Xe_HP SDV has pretty much already served its purpose as an early
> Xe_HP test platform, and most PVC effort is refocusing on the Xe KMD
> right now.
> 
> Note that we don't want/need changes like this on non-tile multi-gt
> platforms like MTL.  The interrupt registers you're accessing here are
> sgunit registers so there's only ever a single copy of the register on
> such platforms; looping around and processing the same register two
> times in a row doesn't accomplish anything that just processing them a
> single time doesn't.

Right... irq's registers in MTL are in the root tile.

However, In a multi-gt point of view all the "gt" functions need
to be iterated over all the GT's... maybe to have things cleaner
we might need some dedicated mtl_irq_reset and
mtl_irq_postinstall wrappers.

Thanks! (again :-))

Andi
