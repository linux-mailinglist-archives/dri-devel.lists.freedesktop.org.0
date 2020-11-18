Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AA2B7A6A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 10:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5B16E372;
	Wed, 18 Nov 2020 09:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6016E372
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 09:31:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a65so2050308wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 01:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rIT1mFbEat++q/fOI2Mz1b9yVpWkTzwwX++pQ7a41t8=;
 b=XULLOt0NWZRqTU4PxJnk1h/H5NQIrOTWIYF8bpnHtnXC0JRyJTGjW4jG0j7NyDLPX7
 GRqWpEZHOo77FCL/gW9OWwISs7HwYoCKNwSJ51Jg0aBasGEJK4BxnNIzZiMdjZz3equB
 vth68Rbwu4DQZDg9S4viaDCwOhwpogXbXGCMzDq+WquSF+JeI4SWeTAD/toYtixwkI+w
 UgajXu2CYVTdQuYUk2G3M357M9VAolU83SlTrtRNhBABCmFCJ8T5WLkwvGzZ7OVObeTo
 JfQyDmG/4Y8DWHpFGMJHa6RlVTe5SJ3asDwtxRzASB02+/NkATDQtHDJFX1Esuje0gpY
 hPFw==
X-Gm-Message-State: AOAM530ivPDAsP9bXeNXkj1c+SJkwCL/YijQrvLWKzSEH31hR54K9XO6
 531ySu+YbTjEGTKZzUEnoO5+ETEaA58=
X-Google-Smtp-Source: ABdhPJx2K36WgvCbE0rT3AXDKI70J2JUbIej7Sa2W/fRnT4BajF39d19YBEBpwCnCNy0FXjSk+qGcw==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3302058wmj.169.1605691915142; 
 Wed, 18 Nov 2020 01:31:55 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d63sm2799773wmd.12.2020.11.18.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 01:31:54 -0800 (PST)
Date: Wed, 18 Nov 2020 09:31:53 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH] video: hyperv_fb: Fix the cache type when mapping the VRAM
Message-ID: <20201118093153.irs3i342nskkbuil@liuwe-devbox-debian-v2>
References: <20201118000305.24797-1-decui@microsoft.com>
 <MW2PR2101MB105243C3AD5106B2ABEDBAB5D7E10@MW2PR2101MB1052.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW2PR2101MB105243C3AD5106B2ABEDBAB5D7E10@MW2PR2101MB1052.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 12:20:11AM +0000, Michael Kelley wrote:
> From: Dexuan Cui <decui@microsoft.com> Sent: Tuesday, November 17, 2020 4:03 PM
> > 
> > x86 Hyper-V used to essentially always overwrite the effective cache type
> > of guest memory accesses to WB. This was problematic in cases where there
> > is a physical device assigned to the VM, since that often requires that
> > the VM should have control over cache types. Thus, on newer Hyper-V since
> > 2018, Hyper-V always honors the VM's cache type, but unexpectedly Linux VM
> > users start to complain that Linux VM's VRAM becomes very slow, and it
> > turns out that Linux VM should not map the VRAM uncacheable by ioremap().
> > Fix this slowness issue by using ioremap_cache().
> > 
> > On ARM64, ioremap_cache() is also required as the host also maps the VRAM
> > cacheable, otherwise VM Connect can't display properly with ioremap() or
> > ioremap_wc().
> > 
> > With this change, the VRAM on new Hyper-V is as fast as regular RAM, so
> > it's no longer necessary to use the hacks we added to mitigate the
> > slowness, i.e. we no longer need to allocate physical memory and use
> > it to back up the VRAM in Generation-1 VM, and we also no longer need to
> > allocate physical memory to back up the framebuffer in a Generation-2 VM
> > and copy the framebuffer to the real VRAM. A further big change will
> > address these for v5.11.
> > 
> > Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Buffer Driver")
> > Tested-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Dexuan Cui <decui@microsoft.com>
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
> 

Applied to hyperv-fixes. Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
