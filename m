Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A85B5C25
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7210E4D3;
	Mon, 12 Sep 2022 14:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184710E4D3;
 Mon, 12 Sep 2022 14:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AEDEB80D29;
 Mon, 12 Sep 2022 14:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93EAC433D6;
 Mon, 12 Sep 2022 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662992705;
 bh=kOw5OmZ7q9/B/nqy9XHlE0smcAt1jA/6Zk6OY8bdTm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9T4jmSPATYiQDGo+NMMsZRcdvJDjho1zStbnpmV1K6c8p9twy3MUvmsWUZBC/1FK
 GGTuCDIZiiDxnenZOpeBx3dqxOq88c281B5k2QR2S2NwjqQUSLa5bmCALM9Pl0Q+Cy
 6UGfQm+kneiGK9tT3Y4A/ZFkRUq1vM8f+MnWkIMk=
Date: Mon, 12 Sep 2022 16:25:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Message-ID: <Yx9BWV2FArpBxJ3v@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
 <YxrZqW2l7cNF5OTI@kroah.com>
 <MN2PR11MB409371E657AFC2777F8BEF0BE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrgQNbz2wvWz7Yy@kroah.com>
 <MN2PR11MB40932A4EFF78CF62E97EDDBBE5449@MN2PR11MB4093.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB40932A4EFF78CF62E97EDDBBE5449@MN2PR11MB4093.namprd11.prod.outlook.com>
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 09:59:45AM +0000, Winkler, Tomas wrote:
> > 
> > On Fri, Sep 09, 2022 at 06:38:33AM +0000, Winkler, Tomas wrote:
> > > >
> > > > On Thu, Sep 08, 2022 at 05:16:02PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > +static ssize_t mei_pxp_gsc_command(struct device *dev, u8
> > > > > +client_id,
> > > > u32 fence_id,
> > > > > +				   struct scatterlist *sg_in, size_t total_in_len,
> > > > > +				   struct scatterlist *sg_out) {
> > > > > +	struct mei_cl_device *cldev;
> > > > > +
> > > > > +	if (!dev || !sg_in || !sg_out)
> > > > > +		return -EINVAL;
> > > >
> > > > How can these ever be NULL?  Doesn't the core control this, so why
> > > > would that happen?
> > > This is any interface function between modules, I think it is not
> > > healthy to take assumptions here about how caller behaves, this is not an
> > inner functions. This is important even for catching programmatical mistakes.
> > 
> > It is a static function being called from a framework.  Enforce this in the
> > framework, don't sprinkle this stuff everywhere, the kernel is NOT defensive
> > about internal users like this otherwise it will overwhelm every function call.
> 
> I'm not sure, this is the case here.  The function is passed to  i915 (other driver) driver via struct i915_pxp_component_op.
> This is outside of the component framework. 

Then pass in the real mei structure please.  Don't force someone else to
"find" it in the device tree like you are currently trying to do.

thanks,

greg k-h
