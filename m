Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C348B4FFACD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 17:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5CE10E295;
	Wed, 13 Apr 2022 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA01410E24C;
 Wed, 13 Apr 2022 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649865535; x=1681401535;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JnWL7ROdxTxxwnskrbDlqVPcD3G/D03X59HpmS6dpuE=;
 b=F2bWO29R2qboyBJS8JqL8mKUZPmYnDpD6qEgs51cdaKSQdYNCRFnUFeS
 xzLiD5XQTr52yHDTyar0pg932zlS1ZsqvwNrhj+rohXoHkd3x/6DOhFLm
 SB4a4gQvdI/OUAMnsik9BkddonLi2k/zeMHz54MhdF/MJL3nRsZkTQTqg
 HfKn2C/GSVrn63zStPuPCF/CI4jBGG7H27Dl7valvn+rHteTHATj+qz3I
 SXoJCdRqTB/1b7dm8udQZpqE7ljEV7yzXbTTwDJeNcIazRhB9sMHysaUd
 AbhPeWT2cDd9a6sLy80XP+OsoEZNFQArlV6l7XHABghEaha+n4M1RuvEa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262884510"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="262884510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 08:58:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="573329667"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 08:58:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
In-Reply-To: <20220413154642.GA28095@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de>
Date: Wed, 13 Apr 2022 18:58:47 +0300
Message-ID: <871qy1geko.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022, Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Apr 13, 2022 at 01:47:05PM +0000, Wang, Zhi A wrote:
>> > the GVT code in the i915 is a bit of a mess right now due to strange
>> > abstractions and lots of indirect calls.  This series refactors various
>> > bits to clean that up.  The main user visible change is that almost all
>> > of the GVT code moves out of the main i915 driver and into the kvmgt
>> > module.
>> 
>> Hi Christoph:
>> 
>> Do you want me to merge the GVT-g patches in this series? Or you want them to get merged from your side?
>
> The two option here are drm tree via gvt and i915 trees or the vfio
> tree, neither of which really is my tree.
>
> We already have a fair bit of vfio changes at the tail end of the series,
> and Jason has some more that should sit on top of it, and I have some
> more that I haven't sent yet.
>
> So if we could get the MMIO table and Makefile cleanups into a topic
> branch that we could pull into the vfio tree and merge it through that
> that would seem easiest to me, assuming that is ok with the i915, drm
> and vfio maintainers.

AFAICS the changes are mostly to gvt/, and at least I'm fine with the
minor changes to i915 (in this series and in my two patches) being
merged via whichever tree you all see fit.

Acked-by: Jani Nikula <jani.nikula@intel.com>

Joonas, Tvrtko, Rodrigo, chime in now if you have any issues with that.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
