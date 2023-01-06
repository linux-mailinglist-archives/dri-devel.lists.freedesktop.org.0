Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A992660122
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 14:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C1610E158;
	Fri,  6 Jan 2023 13:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B316110E158
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673011380; x=1704547380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MTdnqyGqT9SNKO9eM7ei0EMIQUw4NRmEJ8Pv91ty3uA=;
 b=IkrHhacMCVc1drWss7hlnarHK6wkGJyhN7cFAz8uSY/iJfHpDIfl9w7V
 8cYLBmHhr0CuExhviJg7UZNpXmhEPmjtttxuU5T60WNNkmsFIJAEKY9Xc
 jdHhgyjnsPZ6fKU0MZPQ2sPquNy7icz9UPjUS4XDbOp+9l+BlnfImIwjj
 y6q8VqubUguaCWsxEIOL4yLlfHUE1yloGdVF7q8NiJGX9Udq4cey5u+LS
 YlzjySW48YufpIiu1eqKaBoPpTMK3F4j6QrSXOd+yuLeZGTtwbOfcpbSl
 dCmcNfPe7PzvMXkdTCgzy9F0NOViuziDAJRAY7mjGAzjdcSA4NKt4dbPG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="302173950"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="302173950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:22:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="688304359"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="688304359"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:22:57 -0800
Date: Fri, 6 Jan 2023 14:22:55 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
Message-ID: <20230106132255.GD1586324@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <Y7f83SKldf9uaTi3@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7f83SKldf9uaTi3@phenom.ffwll.local>
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 11:50:05AM +0100, Daniel Vetter wrote:
> On Thu, Dec 08, 2022 at 12:07:29PM +0100, Jacek Lawrynowicz wrote:
> > Adds four types of GEM-based BOs for the VPU:
> >   - shmem
> >   - userptr
> >   - internal
> 
> Uh what do you need this for? Usually the way we do these is just alloce a
> normal bo, and then pin them.

I think we do alloc/pin this way, but all our bo's are GEM based.
For those bo's we use internally and other non-shmem we create them
with drm_gem_private_object_init(). I think this way is simpler than
have separate code for non-GEM and GEM bo's ...

> Also, gem shmem helpers should be able to mostly cover you here, why not
> use those? Might need some work to push basic userptr to them, but we have
> enough drivers reinventing that wheel to justify that work.
> 
> Can I guess also be done after merging.

... but if not, we can add this to TODO.

Regards
Stanislaw
