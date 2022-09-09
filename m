Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C65B2F34
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E210E4C8;
	Fri,  9 Sep 2022 06:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0FD10E422;
 Fri,  9 Sep 2022 06:42:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E41AB61E57;
 Fri,  9 Sep 2022 06:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED877C433C1;
 Fri,  9 Sep 2022 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662705731;
 bh=++xznS1nBkmvicv1/ui2g1o12ZcNq1ryyoqF5tbCGSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=07uNW1IQVUhhjfs8AZE+0ZcLOBlPkYbprpu7KFHx1/Py1y0lZqX/NDnects5ZAUTa
 LPkDjlxnMKdh4IL982cWLylkcrlz9t7NHaJ2deJSsZl0fJfdhahpCj8gJ2TXX+l/fm
 ycTYeoeu3G5eIbVPIhd14kz1r49NveC1PgiV/YYE=
Date: Fri, 9 Sep 2022 08:42:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Message-ID: <YxrgQNbz2wvWz7Yy@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
 <YxrZqW2l7cNF5OTI@kroah.com>
 <MN2PR11MB409371E657AFC2777F8BEF0BE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB409371E657AFC2777F8BEF0BE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
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

On Fri, Sep 09, 2022 at 06:38:33AM +0000, Winkler, Tomas wrote:
> > 
> > On Thu, Sep 08, 2022 at 05:16:02PM -0700, Daniele Ceraolo Spurio wrote:
> > > +static ssize_t mei_pxp_gsc_command(struct device *dev, u8 client_id,
> > u32 fence_id,
> > > +				   struct scatterlist *sg_in, size_t total_in_len,
> > > +				   struct scatterlist *sg_out)
> > > +{
> > > +	struct mei_cl_device *cldev;
> > > +
> > > +	if (!dev || !sg_in || !sg_out)
> > > +		return -EINVAL;
> > 
> > How can these ever be NULL?  Doesn't the core control this, so why would
> > that happen?
> This is any interface function between modules, I think it is not healthy to take assumptions here about how caller
> behaves, this is not an inner functions. This is important even for catching programmatical mistakes. 

It is a static function being called from a framework.  Enforce this in
the framework, don't sprinkle this stuff everywhere, the kernel is NOT
defensive about internal users like this otherwise it will overwhelm
every function call.

thanks,

greg k-h
