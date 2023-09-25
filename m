Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565437ADB53
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660310E278;
	Mon, 25 Sep 2023 15:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059D110E278;
 Mon, 25 Sep 2023 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695655482; x=1727191482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qyO4PNfwMebw/eFcAIrCM3ihsJw6BgZiQwL+fHg34Mw=;
 b=Yg3NFdrSgsI28vSXq9UMKEuWt5BF/6hwArP937E2Qzys0kbtKVmz251Q
 XJPfML6EcxOLkiWO5geySbebDTDcuso+6PYgYcO5iHQZFuDEgv3NQsscw
 0JG0FLaWTDMMGsIa1JgCZkBojxV+tJ4crRX64QTfR0wK9dMvw/P43muRW
 nxQtQxc+DX2KK+HyaYssHXwaXoIHAz5+PFkuye1wtFy2ijNvZsp7iSqfY
 Ypqp4OGaVqqd9Jg5rSklMSRzaHGAMqLb5hFr/IAPEX89S0HGiUEMc83oj
 /Y5p7a5F485cPoCmQR21QJZ8aPITcu9pQEnOXW9IfJW9Un2LoccqNvfyA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385113730"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="385113730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748377883"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="748377883"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:24:35 -0700
Date: Mon, 25 Sep 2023 17:24:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Message-ID: <ZRGmLlVzGfScSMR+@ashyti-mobl2.lan>
References: <20230925134938.12043-1-nirmoy.das@intel.com>
 <ZRGdXq1WOWpx271q@ashyti-mobl2.lan> <877coemg89.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877coemg89.fsf@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> >>  	struct i915_vma *vma, *next;
> >>  	unsigned long freed_pages = 0;
> >>  	intel_wakeref_t wakeref;
> >> +	struct intel_gt *gt;
> >> +	int i;
> >
> > the trend is to use 'unsigned int' here and I've seen it
> > reviewed. Personally, if I really have to express a preference, I
> > prefer 'int' because it's a bit safer, generally I don't really
> > mind :)
> 
> Always use int over unsigned int if you don't have a specific reason not
> to. ("It can't be negative" is not a good reason.)

Finally someone! I totally agree!

Andi
