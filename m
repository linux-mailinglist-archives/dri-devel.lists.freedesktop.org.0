Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4624ABE6A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDFC10E885;
	Mon,  7 Feb 2022 12:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734710E49A;
 Mon,  7 Feb 2022 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236040; x=1675772040;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TgpvuJ0R1lB2H8FhHzTp6Ej42dRZzsbIJPbNKhwWF1s=;
 b=gKBQPAfOPbq+WYvVLpaXIFPXQqZDNwxhc1e+tGM5fDF408jLcJicsQiP
 aaeI4JOipoyBSQ4g2AHNNrRBZyxmVuyjeaDuciIT2Uq7WZg7KFr93Hn3d
 33eeXp3ydTdUgjl8JZ15hLeifTHJuhU2SBqMMADmEr5MNxFl3YRT3nG6C
 ISml/I7Vs1Z4LZeo2G5s+0iW+cw9/vSpxH9O87wQKbXu1DFxv6BE1Rz8n
 Uos76P3FV3p5X3B7Q6ocKr+ts0LeaEMLIOha+15EPwfcTQy+FuuKrbsZD
 edZAzJ1e9IaT5RwIDDfkAnKcVKdCLnc7H9A5DxNxxqNztgAdALL7WAsJz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="236104049"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="236104049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:14:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484401961"
Received: from nbaca1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.18.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:13:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to support
 VFIO new mdev API
In-Reply-To: <20220207120647.GA28851@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220207073247.GA24327@lst.de>
 <DM4PR11MB5549FE45F8098368114ADE75CA2C9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20220207083535.GA25345@lst.de> <877da7rlzr.fsf@intel.com>
 <5c916187-8a8c-323a-adb4-8bce141180cc@gmail.com>
 <20220207120647.GA28851@lst.de>
Date: Mon, 07 Feb 2022 14:13:50 +0200
Message-ID: <87v8xqri0x.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Feb 07, 2022 at 06:57:13AM -0500, Zhi Wang wrote:
>> Hi Christoph and Jani:
>>
>> Thanks for the comments. It would be nice that people can achieve a 
>> agreement. I am OK with both of the options and also moving some files into 
>> different folders doesn't needs me to do the full test run again. :)
>
> The way I understood Jani he agrees that the mmio table, which needs to
> be part of the core i915 module should not be under the gvt/ subdiretory.
> I.e. it could be drivers/gpu/drm/i915/intel_gvt_mmio_table.c.  The
> declarations could then go either into drivers/gpu/drm/i915/intel_gvt.h
> or drivers/gpu/drm/i915/intel_gvt_mmio_table.h.

Correct.

Generally I prefer to have the declarations for stuff in intel_foo.c to
be placed in intel_foo.h, and named intel_foo_*.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
