Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B2315874
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C36E102;
	Tue,  9 Feb 2021 21:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E736E102
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612905468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uskw3PbEX7wEnO/ex/Xsz3m8Nxa2KyupOaIbM7L2BOs=;
 b=BegMcU4upFfy/x7lQ26gH0dqJYdLJGyiPXlwDKCsVvII61nOQV+aj/KCLVd/L0eqqGnp+0
 enm2P392cRsW36ex2iODDJyOX3fAIZX5YEk3XjBH2erMRfOhHqZhVc/TmM9vH5vGe4ITMU
 aXejcl/sqZQ1oR2skkUDv3jKNRxm9YM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-k2Jf9BXbPxKvPSd8tNYV6w-1; Tue, 09 Feb 2021 16:17:45 -0500
X-MC-Unique: k2Jf9BXbPxKvPSd8tNYV6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB8F192CC44;
 Tue,  9 Feb 2021 21:17:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-63.rdu2.redhat.com [10.10.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE56A60D11;
 Tue,  9 Feb 2021 21:17:40 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:17:38 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <20210209211738.GA834106@redhat.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian> <20210209133520.GB4718@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209133520.GB4718@ziepe.ca>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 09:35:20AM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 09, 2021 at 11:57:28PM +1100, Alistair Popple wrote:
> > On Tuesday, 9 February 2021 9:27:05 PM AEDT Daniel Vetter wrote:
> > > >
> > > > Recent changes to pin_user_pages() prevent the creation of pinned p=
ages in
> > > > ZONE_MOVABLE. This series allows pinned pages to be created in =

> > ZONE_MOVABLE
> > > > as attempts to migrate may fail which would be fatal to userspace.
> > > >
> > > > In this case migration of the pinned page is unnecessary as the pag=
e can =

> > be
> > > > unpinned at anytime by having the driver revoke atomic permission a=
s it
> > > > does for the migrate_to_ram() callback. However a method of calling=
 this
> > > > when memory needs to be moved has yet to be resolved so any discuss=
ion is
> > > > welcome.
> > > =

> > > Why do we need to pin for gpu atomics? You still have the callback for
> > > cpu faults, so you
> > > can move the page as needed, and hence a long-term pin sounds like the
> > > wrong approach.
> > =

> > Technically a real long term unmoveable pin isn't required, because as =
you say =

> > the page can be moved as needed at any time. However I needed some way =
of =

> > stopping the CPU page from being freed once the userspace mappings for =
it had =

> > been removed. =

> =

> The issue is you took the page out of the PTE it belongs to, which
> makes it orphaned and unlocatable by the rest of the mm?
> =

> Ideally this would leave the PTE in place so everything continues to
> work, just disable CPU access to it.
> =

> Maybe some kind of special swap entry?
> =

> I also don't much like the use of ZONE_DEVICE here, that should only
> be used for actual device memory, not as a temporary proxy for CPU
> pages.. Having two struct pages refer to the same physical memory is
> pretty ugly.
> =

> > The normal solution of registering an MMU notifier to unpin the page wh=
en it =

> > needs to be moved also doesn't work as the CPU page tables now point to=
 the
> > device-private page and hence the migration code won't call any invalid=
ate =

> > notifiers for the CPU page.
> =

> The fact the page is lost from the MM seems to be the main issue here.
> =

> > Yes, I would like to avoid the long term pin constraints as well if pos=
sible I =

> > just haven't found a solution yet. Are you suggesting it might be possi=
ble to =

> > add a callback in the page migration logic to specially deal with movin=
g these =

> > pages?
> =

> How would migration even find the page?

Migration can scan memory from physical address (isolate_migratepages_range=
())
So the CPU mapping is not the only path to get to a page.

Cheers,
J=E9r=F4me

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
