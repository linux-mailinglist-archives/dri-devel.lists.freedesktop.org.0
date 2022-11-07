Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0061F974
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026F10E492;
	Mon,  7 Nov 2022 16:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B810E492
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BgdLKn51MHlz22SyEjHwV09QoO0gl+24rNf4NSfnXOM=; b=mlghPPiWpPuGNtAjaxMjLpmTTc
 v2EFCRL1iFfOoE5yJrG39Am6ii4/G/jCiMqF7lQo/JZFdgNVKa6ODH85ABvTG8dRgquf5sPBjfTfQ
 r5t/D2c1I8Rioz3M+qX7xNzzTVqU7l/3YttgKyT7+kZ1yCO/oTXuSplgVOabYYNHtVWUrHpLEDleG
 yd5a2DjsYrJMwA1sbE60s4dMswTOaERUXYed5RJzWv3UMMDGq7CyU6+27JFHH9iXWUy4BmKOz71Sk
 xZoOST8/HjTOmp2gpPdQWcLsedFFzGBwZmFR3GRW8kXE2SsUSKvWeVgW+K95VEiXLxLtjV1ej6sTu
 ic5sB9sQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1os4sP-009Ut4-Uj; Mon, 07 Nov 2022 16:21:33 +0000
Date: Mon, 7 Nov 2022 16:21:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [RFC PATCH v3 0/3] new subsystem for compute accelerator devices
Message-ID: <Y2kwjawUuFGDvr20@casper.infradead.org>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <6f756dec-b386-a822-5f52-c121c00525b4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f756dec-b386-a822-5f52-c121c00525b4@quicinc.com>
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
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 09:07:28AM -0700, Jeffrey Hugo wrote:
> > Another important change is that I have reverted back to use IDR for minor
> > handling instead of xarray. This is because I have found that xarray doesn't
> > handle well the scenario where you allocate a NULL entry and then exchange it
> > with a real pointer. It appears xarray still considers that entry a "zero"
> > entry. This is unfortunate because DRM works that way (first allocates a NULL
> > entry and then replaces the entry with a real pointer).
> > 
> > I decided to revert to IDR because I don't want to hold up these patches,
> > as many people are blocked until the support for accel is merged. The xarray
> > issue should be fixed as a separate patch by either fixing the xarray code or
> > changing how DRM + ACCEL do minor id handling.
> 
> This sounds sane to me.  However, this appears to be something that Matthew
> Wilcox should be aware of (added for visibility).  Perhaps he has a very
> quick solution.  If not, at-least he might have ideas on how to best address
> in the future.

Thanks for cc'ing me.  I wasn't aware of this problem because I hadn't
seen Oded's email yet.  The "problem" is simply a mis-use of the API.
