Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E859A49C8CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5E310E8AC;
	Wed, 26 Jan 2022 11:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189CC10E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:38:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E5C36193E;
 Wed, 26 Jan 2022 11:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35675C340E3;
 Wed, 26 Jan 2022 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643197093;
 bh=NbMdEef+dcTCJiNJcepcY4CmtP6BmSIKQx1yeExMhiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6wWv+faQ+JhOlf+PE7InekCywG5iOeJhvsC9nqP2DRExDvzqxnm18/VhZeqk0hzA
 G3NUFehT0e/PvRl33jxB72CrpusuMJuo3DMYZXpLy2Df22kFc8elPB1FnAkQ0iiwoa
 RbRr2OuRUXTY6Q6v2D+RocHjfBrFqiV3+mv3djBM=
Date: Wed, 26 Jan 2022 12:38:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfEyo2xxfFyl2ADI@kroah.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:31:21PM +0100, Helge Deller wrote:
> On 1/26/22 12:18, Javier Martinez Canillas wrote:
> > On 1/26/22 11:59, Helge Deller wrote:
> >> On 1/26/22 11:02, Andy Shevchenko wrote:
> >
> > [snip]
> >
> >>> P.S. For the record, I will personally NAK any attempts to remove that
> >>> driver from the kernel. And this is another point why it's better not
> >>> to be under the staging.
> >>
> >> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> >> features or even attempting to remove fbdev altogether (unless all
> >> relevant drivers are ported to DRM).
> >>
> >
> > But that will never happen if we keep moving the goal post.
> >
> > At some point new fbdev drivers should not be added anymore, otherwise
> > the number of existing drivers that need conversion will keep growing.
> 
> Good point, and yes you are right!
> 
> I think the rule should be something like:
> 
> New graphics devices (e.g. max. 3 years old from now) usually are
> capable to be ported to DRM.
> For those graphics cards we should put a hard stop and not include them
> as new driver into the fbdev framework. Inclusion for those will only
> happen as DRM driver.

We made this rule 6 years ago already.

thanks,

greg k-h
