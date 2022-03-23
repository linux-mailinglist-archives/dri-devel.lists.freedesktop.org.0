Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1CD4E5437
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2262D10E761;
	Wed, 23 Mar 2022 14:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4CF10E75E;
 Wed, 23 Mar 2022 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648045610; x=1679581610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k/ljExPLhr/iCvWHx4Y7ER0bjNCsw3LGgldpOUp4+P0=;
 b=bD9hksCIStab16KFlKZnJvFrwklnKucofdenc/UnRdKsNMVOyPidrA6o
 paVWXYylKdrQCx+bjdiYCT2598K+g/CEpW0UOcyn0ZQSAmzi3nQCASIvP
 dBRi0Fh1L7fV36DM/6SRXrA8/u3MoMRXOOnaZAKaVxr0HHcl9AdOakjV4
 l0FuGaxNsD4LBiUysrDD1ydNIk/8i6OFqZtvz76ZIXwfqhift6lbYpa5o
 gPYbjxqS5PBWjA+WCvrtban748hzaRoAn+ZJLklRuoj9FKOZ3P7eZX7HL
 Kh8ep//8eU4t6lQmTJaRb1TigQ8zqc5O44167E7N7h77u9KKxk8qjjKQx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240284139"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="240284139"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 07:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="515794054"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga002.jf.intel.com with SMTP; 23 Mar 2022 07:26:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 16:26:45 +0200
Date: Wed, 23 Mar 2022 16:26:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [v8 3/5] drm/edid: read HF-EEODB ext block
Message-ID: <YjsuJQvJme6sxLAo@intel.com>
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
 <20220317124202.14189-4-shawn.c.lee@intel.com>
 <8735j9j7vd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735j9j7vd.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 12:11:50PM +0200, Jani Nikula wrote:
> On Thu, 17 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> > According to HDMI 2.1 spec.
> >
> > "The HDMI Forum EDID Extension Override Data Block (HF-EEODB)
> > is utilized by Sink Devices to provide an alternate method to
> > indicate an EDID Extension Block count larger than 1, while
> > avoiding the need to present a VESA Block Map in the first
> > E-EDID Extension Block."
> >
> > It is a mandatory for HDMI 2.1 protocol compliance as well.
> > This patch help to know how many HF_EEODB blocks report by sink
> > and read allo HF_EEODB blocks back.
> 
> It still just boggles my mind that they've implemented something like
> this. They cite avoiding the EDID Block Map as the rationale... but it's
> been optional since E-EDID structure v1.4, published in 2006. 15+ years
> ago.
> 
> Can anyone tell me a sane reason for this? What does it provide that
> E-EDID 1.4 does not? Do they want to use E-EDID v1.3 with this? Why?

Looks to be pretty much the same approach as the DPCD extended
receiver cap mess we already have to deal with.

So I presume this is a hack to avoid breaking some garbage source
devices that explode when they see too many extension blocks,
or something along those lines.

-- 
Ville Syrjälä
Intel
