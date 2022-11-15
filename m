Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07F62A488
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 22:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B810E42B;
	Tue, 15 Nov 2022 21:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6B10E42B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668549228; x=1700085228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5cXoYxY6tk0OONXgWwedOoyQFBR4n66h9w7Y7fusmyk=;
 b=GNSkebCIAOqXCtcfHpG2tvQHrFOPLsTs1TVhQwSKTytJvhA7gTXc/Dkf
 z+F98hBFmtO3EWpSxl3CMTtaxTECL4rfaTukLUbgHKYY8iNRnk2j0pGs7
 iEpMha45xm7hI/7Gnomf9M6W2J5tjm0cT62fdVJdLrJg8amDoLZaETf4A
 o2ZweSQJP7in6W9uEGj2DD0+JmsiaDuihY2ZTl7SFP9CgRQ1ECPdb8ih0
 8+uJBxHX1nn5EdVgU6fdAroRQSHn9+TKk012QU7qIqoDHeBYMRii0VTpu
 j6FzMFezQbcGfhLcwgciAsLntkIs/85Gyy+KZV9qeZUWoPmZ/3SN6MCjI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292768647"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="292768647"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 13:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="728115039"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="728115039"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 15 Nov 2022 13:53:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Nov 2022 23:53:35 +0200
Date: Tue, 15 Nov 2022 23:53:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/display: Don't assume dual mode adaptors support
 i2c sub-addressing
Message-ID: <Y3QKX6f0P/3G+6SS@intel.com>
References: <20221006113314.41101987@computer> <Yz7wKZnJeUzbz4Dw@intel.com>
 <Y0BbKr10gUO/xjZ/@intel.com> <87fsek2n8c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsek2n8c.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 06:31:31PM +0200, Jani Nikula wrote:
> On Fri, 07 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Oct 06, 2022 at 06:11:37PM +0300, Ville Syrjälä wrote:
> >> On Thu, Oct 06, 2022 at 11:33:14AM +0200, Simon Rettberg wrote:
> >> > Current dual mode adaptor ("DP++") detection code assumes that all
> >> > adaptors support i2c sub-addressing for read operations from the
> >> > DP-HDMI adaptor ID buffer.  It has been observed that multiple
> >> > adaptors do not in fact support this, and always return data starting
> >> > at register 0.  On affected adaptors, the code fails to read the proper
> >> > registers that would identify the device as a type 2 adaptor, and
> >> > handles those as type 1, limiting the TMDS clock to 165MHz, even if
> >> > the according register would announce a higher TMDS clock.
> >> > Fix this by always reading the ID buffer starting from offset 0, and
> >> > discarding any bytes before the actual offset of interest.
> >> > 
> >> > We tried finding authoritative documentation on whether or not this is
> >> > allowed behaviour, but since all the official VESA docs are paywalled,
> >> > the best we could come up with was the spec sheet for Texas Instruments'
> >> > SNx5DP149 chip family.[1]  It explicitly mentions that sub-addressing is
> >> > supported for register writes, but *not* for reads (See NOTE in
> >> > section 8.5.3).  Unless TI openly decided to violate the VESA spec, one
> >> > could take that as a hint that sub-addressing is in fact not mandated
> >> > by VESA.
> >> > The other two adaptors affected used the PS8409(A) and the LT8611,
> >> > according to the data returned from their ID buffers.
> >> > 
> >> > [1] https://www.ti.com/lit/ds/symlink/sn75dp149.pdf
> >> > 
> >> > Signed-off-by: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
> >> > Reviewed-by: Rafael Gieschke <rafael.gieschke@rz.uni-freiburg.de>
> >> > ---
> >> > 
> >> > v2 changes form last submission's feedback (thanks for taking the time):
> >> > - Added a shortened version of our "background story" to the commit message
> >> > - Only use tmpbuf if the read offset is != 0
> >> 
> >> Bounced to intel-gfx to get the i915 CI to check it...
> >
> > CI didn't blow up, and I also gave this a quick smoking on my end
> > with both type 1 HDMI and type 2 HDMI adaptors. 
> >
> > I'm thinking we want a cc:stable on this? I can slap that on
> > when pushing if there are no objections?
> 
> I guess this fell between the cracks? :(

I think I just got stuck waiting for people to say
something about the cc:stable idea. But presumbly
since no one objected everyone is happy with it.

> 
> Ville, r-b? Going to push?

Pushed to drm-misc-fixes now, with cc:stable.
Thanks for the patch.

-- 
Ville Syrjälä
Intel
