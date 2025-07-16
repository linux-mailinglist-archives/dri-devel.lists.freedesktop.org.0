Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020FB0786D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0DF10E7BF;
	Wed, 16 Jul 2025 14:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vtgwqkmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4148810E7BF;
 Wed, 16 Jul 2025 14:45:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF9F744AEA;
 Wed, 16 Jul 2025 14:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41021C4CEE7;
 Wed, 16 Jul 2025 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752677135;
 bh=nHbkOPQThJAUcbsBsK/Y+mJAiUxpmcKEzvzLu/ss+WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VtgwqkmuF7QRE0w2Tbk4VxeG8fUwHFknE2cGEUSTjp7oKwV+MYkABHgHkUTW9eIO2
 Pr14N/jpdoXC/SXZN0xr89HZfiGZYiQiGWJKZ2RA9iaHSYo64rbdAdXci/PMNu3KBi
 uplbb2kA8XaR6Gk7qinoFa02kVtDhVi7aZSca+AA=
Date: Wed, 16 Jul 2025 16:45:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
Message-ID: <2025071619-sterile-skiing-e64b@gregkh>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-13-rodrigo.vivi@intel.com>
 <2025071611-decode-hastiness-df63@gregkh>
 <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071603-guide-definite-70e3@gregkh>
 <CY5PR11MB636646E936C800D689BFBEEBED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636646E936C800D689BFBEEBED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 16, 2025 at 02:26:26PM +0000, Usyskin, Alexander wrote:
> > > > > +	if (bytes < sizeof(rsp)) {
> > > > > +		dev_err(dev, "bad response from the firmware: size %zd <
> > > > %zu\n",
> > > > > +			bytes, sizeof(rsp));
> > > > > +		ret = -EPROTO;
> > > > > +		goto end;
> > > > > +	}
> > > >
> > > > Why not check this above when you check against the size of the header?
> > > > You only need one size check, not 2.
> > > Firmware may return only header with result field set without the data.
> > 
> > Then the firmware is broken :)
> > 
> > > We are parsing the header first and then starting to parse data.
> > > If we check for whole message size at the beginning we'll miss the result
> > data.
> > 
> > You mean you will make it harder to debug the firmware, as you will not
> > be printing out the header information?  Or something else?  The
> > bytes variable HAS to match the full structure size, not just the header
> > size, according to this code.  So just test for that and be done with
> > it!
> 
> The CSME firmware returns only command header if, like, command is not recognised.
> This may happen because of firmware bug or for firmware is configured/compiled
> that way.
> This seems reasonable for the complex protocols where firmware may not be
> aware of this particular command at all and have no idea what the data size it
> should send in reply.
> Printing result from the header will allow us to understand either this is the firmware
> problem or driver sent something wrong.

Then make it obvious in your checking and in your error messages as to
what you are doing here.  Checking the size of the buffer in two
different places, with different values is very odd, and deserves a lot
of explaination.

thanks,

greg k-h
