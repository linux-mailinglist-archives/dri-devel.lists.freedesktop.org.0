Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FCB7107E7
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D854A10E827;
	Thu, 25 May 2023 08:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05C810E827
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685004659; x=1716540659;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9ZzzeKYeY4Z4piWm+Y3C/bPWaEt3140XssUhCzZ/YB4=;
 b=X8LHCNLFSy5crze03kdWZjtRM3D6PCjPvHmNbq+XevsSqxb+CN4wCUKo
 a564Vc3nmrVBoCnk1LR515c4gZgrwoRtJ+GMgej+KV+3TwEUSEQlkGETS
 jRpSAybtkEc/Ay2uIOc5B3XlVtNk/DEbLsEkSvQSFQwz6b8zXiJsy1V6b
 ruvVeUtkjE5BlCgpP5z3sbxEQhmBdGtaNe42LyzvawcrEZNwpc3XrhE2Q
 EenSupFqMvj8fu3wHLuZGHA6gBJKhI9lgA7BpgmSKNP0/QQ4czonn+Yf/
 heoSaEn7CWOq423hHsYfC5IdiNobKkvwTYRaZSm2idMKKtk9kiBwy0nm+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352673605"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="352673605"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="735483774"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="735483774"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.42.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:50:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, Alan Liu <HaoPing.Liu@amd.com>
Subject: Re: [PATCH 0/7] Secure display with new CRTC properties
In-Reply-To: <sNSf9ou1krQ0UJcBpR8Lr5KKfdOBllnwV5x6jNoCT8h9T-zSA2x0ouGg_RMKDACyrgm_MXIvh-kgpCJ4taEa1V3OyfWYekbSDPMX3KswZGw=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
 <sNSf9ou1krQ0UJcBpR8Lr5KKfdOBllnwV5x6jNoCT8h9T-zSA2x0ouGg_RMKDACyrgm_MXIvh-kgpCJ4taEa1V3OyfWYekbSDPMX3KswZGw=@emersion.fr>
Date: Thu, 25 May 2023 11:50:54 +0300
Message-ID: <87cz2okd5d.fsf@intel.com>
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
Cc: wayne.lin@amd.com, dri-devel@lists.freedesktop.org, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023, Simon Ser <contact@emersion.fr> wrote:
> On Tuesday, May 16th, 2023 at 07:39, Alan Liu <HaoPing.Liu@amd.com> wrote:
>
>> To address this problem, since modern display control hardware is able to
>> calculate the CRC checksum of the display content, we are thinking of a
>> feature to let userspace specify a region of interest (ROI) on display, and
>> we can utilize the hardware to calculate the CRC checksum as frames scanned
>> out, and finally, provide the checksum for userspace for validation purpose.
>> In this case, since the icons themselves are often fixed over static
>> backgrounds, the CRC of the ROI pixels can be known in advance. So one of the
>> usage of ROI and corresponding CRC result is that as users know the CRC
>> checksum of the tell-tales in advance, at runtime they can retrieve the CRC
>> value from kernel for validation as frames are scanned out.
>> 
>> We implement this feature and call it secure display.
>
> I's strongly advise *not* using the word "secure" here. "Secure" is over-loaded
> with so many different meanings, as a result it's super-unclear what a KMS
> property name "SECURE_FOO" would do. As an example, some people use "secure" to
> refer to Digital Restrictions Management. Something like "CHECKSUM_REGION"
> would much better describe the feature you want to implement IMHO.

Agreed.

On naming, I also think "ROI" is confusing. Nobody's going to know what
it means without looking it up. I think just "region" is much better,
and "of interest" goes without saying. (Why would you specify a region
unless it was "of interest"?)

> Also, please note that IGT already extracts CRCs for testing purposes. Maybe
> there's an opportunity to use the same uAPI here.

It's debugfs, so probably not suitable for uAPI, but there's already a
bunch of crtc infrastructure in drm level to make that happen. Would
seem odd to add two different ways to gather CRCs with no common code.

Just checking, we're talking about CRCs computed at some stage of the
display pipeline in the source, not on the sink, right?

What's the algorithm for the CRCs? Vendor specific? Is the idea that the
userspace is able to compute it and compare, or snapshot multiple CRCs
from kernel and compare them against each other? If the former, then I
assume the userspace is going to be vendor specific too.

What about limitations in the dimensions/location of the region? What
about future compatibility, e.g. if you're interested in *a* region,
surely you might be interested in multiple regions in the future...?
(Not saying this should be implemented now, but would be nice to have
some vague idea how to extend this.)


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
