Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5F78CC40
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393810E47D;
	Tue, 29 Aug 2023 18:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E1E10E47E;
 Tue, 29 Aug 2023 18:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=A0/MJXP1OnWmTMBb5k+hfze8PHPxSXpimewIOMnBllI=; b=UsUba5JYR97HMZyAIQFbkj9HK6
 GPrchLEU2ydiMjesPkTwHluqA6VPM2tgGG379ew0JGOizACls4k7vvvF2PFQ/ZIQ/YuksG4NuYO+6
 k/b5tktzkjZ/goRh80XF9zWb3DNKgDeVUIcJB3Z+qukO/oXoDqt0Ty2Vhd98m77QeM0mjYmWB/p0k
 N4yecpU1VY+bqoJ0KappXWrlUtnG5qBgUZu31aGz2itU3MIJLdrXTjXD9/jr9GsbZKXtrxmC9BpFL
 XebH2YN8kM7xTyIVr0RUI4luxFfWzRDkyZB5yecHb3J3e8WiimKi23k56Jamn4x7uRLgQJlOqaOxX
 WrNbGYiw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qb3aW-008861-3P; Tue, 29 Aug 2023 18:37:16 +0000
Date: Tue, 29 Aug 2023 19:37:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Zhu <jamesz@amd.com>
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Message-ID: <ZO463CUKB3QIHDAu@casper.infradead.org>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
 <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
 <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
 <bcbfe6d5-da87-fa2b-c05a-8bea6e0004fb@amd.com>
 <ZO459g+fCBxbwTAF@casper.infradead.org>
 <f18bb070-9767-3b5c-8a40-3c95d5740e1d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f18bb070-9767-3b5c-8a40-3c95d5740e1d@amd.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 02:35:34PM -0400, James Zhu wrote:
> 
> On 2023-08-29 14:33, Matthew Wilcox wrote:
> > On Tue, Aug 29, 2023 at 01:34:22PM -0400, James Zhu wrote:
> > > > > > @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
> > > > > >     	unregister_chrdev(DRM_MAJOR, "drm");
> > > > > >     	debugfs_remove(drm_debugfs_root);
> > > > > >     	drm_sysfs_destroy();
> > > > > > -	idr_destroy(&drm_minors_idr);
> > > > > [JZ] Should we call xa_destroy instead here?
> > > > We could, if we expect the xarray to potentially not be empty.
> > > >   From what I understand - all minors should be released at this point.
> > > [JZ] In practice,  adding destroy here will be better.
> > Why do you say that?
> [JZ] In case, the future, INIT adds something, need DESTROY to free
> completely.

That isn't going to happen.
