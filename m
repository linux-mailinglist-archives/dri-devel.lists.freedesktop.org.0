Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA04724DB8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A7B10E3A8;
	Tue,  6 Jun 2023 20:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7910E3A8;
 Tue,  6 Jun 2023 20:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686082296; x=1717618296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iST53EeWESSyZs6/Yu9CUdgSpaOfr7pDrXOwm1E1krg=;
 b=TBhzwv7L80CGIJ5FBbzqbKvFoRKWEIHT8WZiVwCciTq2jeY0/zrFbkMR
 /fSyFZetJvpLDaQurlzy6VPJ2s/W5qoYDq76cam56sFCy9b3XrjaW5yh5
 m61Sx0v0Smv3VsvNQyvXuA69vukq7O9d97kRB7MjZUGCuP+HCQTPuE2zk
 7iFpG4mxo192H0XnuXP6a0jSzesizKx+/1A5K6ubOBGMIiuPGpMQljU1J
 Cfebm4R3mvo+p0zhcg1wlu/UMDRRmKWkVduoNNUnA/m5VkN0YW0LyJ1MH
 jTbCV5SrMmhhfozzZJl3piqAX060GZ/V5Cq6wey9JT+cc3sKew+YwUen9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354284082"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354284082"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883485018"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="883485018"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:11:31 -0700
Date: Tue, 6 Jun 2023 22:11:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Fix a VMA UAF for multi-gt platform
Message-ID: <ZH+S7KLiQns+yH9d@ashyti-mobl2.lan>
References: <20230605201021.13928-1-nirmoy.das@intel.com>
 <ZH5FJAkm98WSonA/@ashyti-mobl2.lan>
 <9095b403-5330-84ac-be97-75f0ae88bead@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9095b403-5330-84ac-be97-75f0ae88bead@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

> >   MTL is a
> > weird multi-gt platform and, indeed, you can't shut down GT0
> > without affecting GT1.
> > 
> > For now it's OK, though, as to test it.
> 
> Looking forward to that. I did test it extensively and ChromeOS team as
> well.

great job, Nirmoy! I haven't been able to reproduce the issue.
This is a great news!

Tested-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
