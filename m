Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE7373D79
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 16:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716E26E4D2;
	Wed,  5 May 2021 14:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F365C6E4D2;
 Wed,  5 May 2021 14:18:33 +0000 (UTC)
IronPort-SDR: 4pEWoPpIVvj6ScnuvI7B8qMhjuZTh0t9OlPFeqIRii/hxLwCauHlnbNDJwjZcHNMzsymEKivpr
 9wzeswheGeBg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="198300704"
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="198300704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 07:18:32 -0700
IronPort-SDR: apCK1f8IckvQj/iY7x4zdix/DloYZp/Dfw1r6bCUH+UcW1bo8/dJsQrYtYJHAd8sZymPYiwTEj
 oQEe++VLK8nw==
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="463911329"
Received: from tassilo.jf.intel.com ([10.54.74.11])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 07:18:32 -0700
Date: Wed, 5 May 2021 07:18:30 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] i915: Increase *_latency array size
Message-ID: <20210505141830.GP4032392@tassilo.jf.intel.com>
References: <20210505033737.1282652-1-ak@linux.intel.com>
 <87r1ily9k5.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1ily9k5.fsf@intel.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Kleen <andi@firstfloor.org>,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Increase all the latency fields to 8 members, which is enough for SKL.
> >
> > I don't know if they are correctly initialized upto 8, but dev_priv
> > should start out as zero, so presumably they will be zero.
> 
> Thanks, the warning should be fixed by commit
> 
> c6deb5e97ded ("drm/i915/pm: Make the wm parameter of print_wm_latency a pointer")
> 
> in drm-intel-next.

That's just hiding the problem.

> 
> There doesn't actually seem to be a bug here,

Can you explain that please?

This is the loop in question

 max_level = ilk_wm_max_level(dev_priv);

        for (level = 0; level <= max_level; level++) {
                unsigned int latency = wm[level];

                if (latency == 0) {
                        drm_dbg_kms(&dev_priv->drm,
                                    "%s WM%d latency not provided\n",
                                    name, level);
                        continue;
                }

		...
	}

(no other loop termination condition)

and ilk_wm_max_level is

int ilk_wm_max_level(const struct drm_i915_private *dev_priv)
{
        /* how many WM levels are we expecting */
        if (INTEL_GEN(dev_priv) >= 9)
                return 7;
        else if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
                return 4;
        else if (INTEL_GEN(dev_priv) >= 6)
                return 3;
        else
                return 2;
}

There is no loop termination in the loop above, it will always read
every member through the max level reported. And on GEN>=9 it will be 7, while
the input array for several of the cases has only 5 members.

So it will read beyond the array and gcc is correct in complaining.

What do I miss when you say there is no bug?

-Andi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
