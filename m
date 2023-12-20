Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D58195F5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 01:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EE110E221;
	Wed, 20 Dec 2023 00:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE7110E221
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 00:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703033552; x=1734569552;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ihFJyqQ2ix/Npm5ZpqxasGwhfpg78Kg+weGzieTxe8=;
 b=bBBmiye1yvRHYiub56ro6tgKDOUyWX7P7zgq6QSuhFoSOZ8G4HzrW8RD
 ndJd7bx34hIFXqPNek1qV0RA2UfZwW4ifqAGkPpoOW+vh5LE8Bqf/hV/X
 paSe+rwJGK9Bn4UZ22Y1glWEgLZoc/jZzvN30Wo+C1fTA4qtFcJDXQWjj
 07x9cr7k5qPwxF2rWfRkXwNEiChQB7fd3RLujpRTN3v0w1fVQWHyDRKve
 2l+PiTHJDk5Vuo0V5NA3EnjlEYTn0O2Y9xKZlNUNXaMiW1Bjar3UU0F+I
 6NAI9XWqEC2axBuA5atKCMuFJCBibMPYHoX8vZtffgP4WEi27YD3eX1H+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2566081"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2566081"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 16:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="842073028"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="842073028"
Received: from lveltman-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.33.252])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 16:51:59 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 9AD0310A43B; Wed, 20 Dec 2023 03:51:56 +0300 (+03)
Date: Wed, 20 Dec 2023 03:51:56 +0300
From: kirill.shutemov@linux.intel.com
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v3 2/6] x86/vmware: Introduce vmware_hypercall API
Message-ID: <20231220005156.2rymnxu5bv6wdwlx@box.shutemov.name>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-3-alexey.makhalov@broadcom.com>
 <20231219232023.u4dyuvbzbh565grk@box.shutemov.name>
 <75eed318-2d22-429d-ab95-80610ba82934@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75eed318-2d22-429d-ab95-80610ba82934@broadcom.com>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 airlied@gmail.com, timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 04:17:40PM -0800, Alexey Makhalov wrote:
> 
> 
> On 12/19/23 3:20 PM, kirill.shutemov@linux.intel.com wrote:
> > On Tue, Dec 19, 2023 at 01:57:47PM -0800, Alexey Makhalov wrote:
> > > +static inline
> > > +unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
> > ...
> > > +static inline
> > > +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> > > +				uint32_t *out1, uint32_t *out2)
> > ...
> > > +static inline
> > > +unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
> > > +				uint32_t *out1, uint32_t *out2,
> > > +				uint32_t *out3)
> > ...
> > > +static inline
> > > +unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
> > > +				unsigned long in3, unsigned long in4,
> > > +				unsigned long in5, uint32_t *out2)
> > ...
> > > +static inline
> > > +unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
> > > +				unsigned long in3, uint32_t *out2,
> > > +				uint32_t *out3, uint32_t *out4,
> > > +				uint32_t *out5)
> > ...
> > > +static inline
> > > +unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
> > > +				unsigned long in3, unsigned long in4,
> > > +				unsigned long in5, uint32_t *out1,
> > > +				uint32_t *out2, uint32_t *out3)
> > 
> > Naming is weird. The number in the name doesn't help much as there seems
> > no system on how many of the parameters are ins and outs.
> 
> There was internal discussion on hypercall API naming. One of proposals was
> using 2 digits - number of input and number of output arguments.
> And it definitely looked weird. So, we agreed to have just single number  -
> total number of arguments excluding cmd.

Have you considered naming them by number of input parameters? Number of
output parameters as demanded by users.

So vmware_hypercall4() will become vmware_hypercall1() and current
vmware_hypercall1() and vmware_hypercall3() will go away.

It is still awful, but /maybe/ better that this, I donno.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
