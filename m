Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFE5B2ED3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EA010EBE9;
	Fri,  9 Sep 2022 06:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3268210EBE9;
 Fri,  9 Sep 2022 06:25:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7E57B822BD;
 Fri,  9 Sep 2022 06:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B33C433D6;
 Fri,  9 Sep 2022 06:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662704740;
 bh=4WjE31cxBmiTabwQ55nrs3CzXAouxrPHBYa/PhsMuRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IqzSIwjy9W4o2/f8RAf7QRlC0ajsgpLgB9I8OhmZzPWetoTTB66DmLrSrtRfHJral
 95UiLLB8DPrCeV67CNBA5hjLzg1LZ0tKlej3N1T4TkbTcO6NkNRe5qQEUbDAo4SBFY
 hLBKyYsPbk/+sAGsHgLcJ3COrcQAVKqYaykBQpUc=
Date: Fri, 9 Sep 2022 08:25:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v3 02/15] mei: add support to GSC extended header
Message-ID: <YxrcYaj9TRqumw6Z@kroah.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-3-daniele.ceraolospurio@intel.com>
 <YxDKk++n5mbaqYAx@kroah.com>
 <MN2PR11MB409393DBFB080257B0667E8BE5409@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrUhlCxm/vo7tG8@kroah.com>
 <MN2PR11MB409398930CFBB975F10AF65AE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB409398930CFBB975F10AF65AE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 06:21:10AM +0000, Winkler, Tomas wrote:
> > > >
> > > > On Fri, Aug 19, 2022 at 03:53:22PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > --- a/drivers/misc/mei/hw-me.c
> > > > > +++ b/drivers/misc/mei/hw-me.c
> > > > > @@ -590,7 +590,10 @@ static int mei_me_hbuf_write(struct
> > > > > mei_device
> > > > *dev,
> > > > >  	u32 dw_cnt;
> > > > >  	int empty_slots;
> > > > >
> > > > > -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> > > > > +	if (WARN_ON(!hdr || hdr_len & 0x3))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (WARN_ON(!data && data_len))
> > > >
> > > > Do not add more WARN_ON() calls, please just handle this properly
> > > > and do not reboot people's machines for a coding error :(
> > >
> > > As far as I understand WARN_ON()  will produce solely a backtrace ,
> > 
> > Except when you have panic_on_warn() enabled in your systems, as many
> > do :(
> Was not aware, thanks for bringing to my attention. 
> 
> > > This particular condition should never ever happen in theory,
> > 
> > Then don't check it!
> In theory :)
> > > anyhow we can use dev_err() here as well.
> >
> > That would be best.
> That how it was resolved in the V4 series that Daniele has sent,  will be glad if you can review.

Already done.
