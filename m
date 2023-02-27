Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75796A4597
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C510E421;
	Mon, 27 Feb 2023 15:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5510E421;
 Mon, 27 Feb 2023 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677510460; x=1709046460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IC025GuM7fKwMHhIKiLdUR9EVWuO+Kj2b/D7IjMVrKA=;
 b=NUKl2MAaJgU3D807IsAbsV1ZOyxRgDUJdZ1A1iL1R9tyZdZ0qWZQfgj+
 iXPfyn766Va2tevMOcq7zxa0vGmViZzPuJFmk2SNpzDfkbpdFfUhcOzyG
 Pw3osEJnYk913BJAuoCr9oAg/vdElXFEOo3rawh/rrk+ED/FIxDtRBsBU
 1u4Y9ZM66RfymboaySNl73kyF6vu7uEr+6Rzcip8vl48JyfhYzZaHxyxv
 FjfvT9RKQH8znhhaLHpJxZQwS6AZ4xFJI5hPtMe+yvMEvKCV9xXHA4vVU
 Irn7ZS7R1m3MGM6JewsZ1sXOVBbuTOTCKUTqxVNk2YJdkJY5NHfI1148I Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420141544"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="420141544"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 07:07:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="675910897"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="675910897"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 07:07:37 -0800
Date: Mon, 27 Feb 2023 16:07:36 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
Message-ID: <20230227150736.GE3547587@linux.intel.com>
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
 <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
 <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
 <CAFCwf12vw56v64Pa=5VhAiVBf=Km9_sOWxOczSFNvLi0eL_VeQ@mail.gmail.com>
 <42b04315-182d-227d-b2a8-cc09bcbe3ac3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42b04315-182d-227d-b2a8-cc09bcbe3ac3@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 09:09:14AM +0100, Thomas Hellström wrote:
> Hi, Oded.
> 
> On 2/26/23 19:56, Oded Gabbay wrote:
> > On Thu, Feb 23, 2023 at 8:50 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > On Thu, Feb 23, 2023 at 10:03 AM Thomas Hellström
> > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > Hi, Daniel,
> > > > 
> > > > On 2/16/23 21:18, Daniel Vetter wrote:
> > > > > On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellström wrote:
> > > > > > A slightly unusual cover letter for a single patch.
> > > > > > 
> > > > > > The page table walker is currently used by the xe driver only,
> > > > > > but the code is generic so we can be good citizens and add it to drm
> > > > > > as a helper, for possible use by other drivers,
> > > > > > If so we can merge the commit when we merge the xe driver.
> > > > > > 
> > > > > > The question raised here is
> > > > > > *) Should it be a generic drm helper or xe-specific with changed
> > > > > >      prefixes?
> > > > > I think if there's some other drivers interested in using this, then this
> > > > > sounds like a good idea. Maybe more useful if it's also integrated into
> > > > > the vm/vma helpers that are being discussed as an optional part?
> > > > > 
> > > > > Maybe some good old sales pitching here to convince people would be good.
> > > > > 
> > > > > Maybe one of the new accel drivers is interested in this too?
> > Hi,
> > As the habanalabs driver is not really a new driver, I currently don't
> > see the benefit of moving
> > to this code. Our pgt code is quite mature and was tested extensively
> > in deployment in the
> > past couple of years.
> > 
> > Nevertheless, I'll try to offer this code for any new/future driver
> > that will want to join accel.
> > 
> > Stanislaw, I'm adding you here in case you missed this. Might be of an
> > interest to you.

Rewrite table walk will not give the ivpu driver much, perhaps one function
would be smaller. Nothing that would justify the effort IMO.

> Thanks for taking a look. Yes, as also mentioned to Alex, I think we'll keep
> this in xe for now.

Sounds good :-)

Regards
Stanislaw
