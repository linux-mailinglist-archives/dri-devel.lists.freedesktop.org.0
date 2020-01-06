Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D92130F16
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 10:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75489D8E;
	Mon,  6 Jan 2020 09:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5C689D8E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:01:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2328B027;
 Mon,  6 Jan 2020 09:01:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 821931E0B47; Mon,  6 Jan 2020 10:01:47 +0100 (CET)
Date: Mon, 6 Jan 2020 10:01:47 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
Message-ID: <20200106090147.GA9176@quack2.suse.cz>
References: <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
 <20191222132357.GF13335@unreal>
 <49d57efe-85e1-6910-baf5-c18df1382206@nvidia.com>
 <20191225052612.GA212002@unreal>
 <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
 <612aa292-ec45-295c-b56c-c622876620fa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <612aa292-ec45-295c-b56c-c622876620fa@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Ran Rozenstein <ranro@mellanox.com>, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat 28-12-19 20:33:32, John Hubbard wrote:
> On 12/27/19 1:56 PM, John Hubbard wrote:
> ...
> >> It is ancient verification test (~10y) which is not an easy task to
> >> make it understandable and standalone :).
> >>
> > =

> > Is this the only test that fails, btw? No other test failures or hints =
of
> > problems?
> > =

> > (Also, maybe hopeless, but can *anyone* on the RDMA list provide some
> > characterization of the test, such as how many pins per page, what page
> > sizes are used? I'm still hoping to write a test to trigger something
> > close to this...)
> > =

> > I do have a couple more ideas for test runs:
> > =

> > 1. Reduce GUP_PIN_COUNTING_BIAS to 1. That would turn the whole overrid=
e of
> > page->_refcount into a no-op, and so if all is well (it may not be!) wi=
th the
> > rest of the patch, then we'd expect this problem to not reappear.
> > =

> > 2. Active /proc/vmstat *foll_pin* statistics unconditionally (just for =
these
> > tests, of course), so we can see if there is a get/put mismatch. Howeve=
r, that
> > will change the timing, and so it must be attempted independently of (1=
), in
> > order to see if it ends up hiding the repro.
> > =

> > I've updated this branch to implement (1), but not (2), hoping you can =
give
> > this one a spin?
> > =

> > =A0=A0=A0 git@github.com:johnhubbard/linux.git=A0 pin_user_pages_tracki=
ng_v11_with_diags
> > =

> > =

> =

> Also, looking ahead:
> =

> a) if the problem disappears with the latest above test, then we likely h=
ave
>    a huge page refcount overflow, and there are a couple of different way=
s to
>    fix it. =

> =

> b) if it still reproduces with the above, then it's some other random mis=
take,
>    and in that case I'd be inclined to do a sort of guided (or classic, u=
nguided)
>    git bisect of the series. Because it could be any of several patches.
> =

>    If that's too much trouble, then I'd have to fall back to submitting a=
 few
>    patches at a time and working my way up to the tracking patch...

It could also be that an ordinary page reference is dropped with 'unpin'
thus underflowing the page refcount...

								Honza

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
