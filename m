Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA099756CCB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A410E2AF;
	Mon, 17 Jul 2023 19:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816B910E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689620918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHz5V5lwxUlduWSVUZLKGbl1lWEkFIrU74CIU+5Jsd8=;
 b=NHDTXwnr5ysRcESlBRY78yGRPK2qhSMfDppJuSvwIi95dDaRneh8CnKZtxmoZ6O0wA7h82
 rMNSPX3SZxb3e5IL/GsCs3Yz8L0B2bSWcxTjBfknrlXZ/7IxkyLmGg6+c3xdmLXXNwBFuq
 qG6Dql9v8S9HzAub2p9P6r+WDvXESsI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-li2lNEVmPx2sCxjyIyr-pw-1; Mon, 17 Jul 2023 15:08:37 -0400
X-MC-Unique: li2lNEVmPx2sCxjyIyr-pw-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-34650d1dfd4so30501395ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 12:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689620914; x=1692212914;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ir1J/k3wLKNYp7LI2ijvFBF6ZKrDfOA6Drq2a2Jon50=;
 b=b5b01VmbwJtn438X1zBmW1cKcuiH+4yMtqLOmGYs0suq270xXRrLDxLn7nCYrxHdWx
 zr6NONMZb3gvCO7h064wfsZUrPNvJLerxUhQUseYIPwQhupGCLk1T849NSvFIihZKszv
 MIOqEPmw8UAgUw//hU1t8m4NcBr6jgEq8FCo8hX9so+spJIiATMqDIz0AgU9KNTSz9Dy
 01m0sPUADqSykhpE3+FtlnXuk//Kx2aqXUiqfM0/c3zn1lpF8IKE9nU8ekFXQv8xT2pr
 3xEvbun6rLeO9jrWFKzeJYCyNovUmgJXeBPtZiqblgBNl99Mb0PrbdsaBEuqUebtXyZ7
 DePQ==
X-Gm-Message-State: ABy/qLYYEQ11Yk/mGdLcK7KvXt7XS0qymNyX27yYnd+Fc5514FyZQESl
 Jd0b2bpV5w/QVNGMvfamV+80KcKRHukm2sal30EXBx3j/Lm78kmBuo639akfisgLDalBtgm6qzm
 ZBGYmI2ddZMn2CPQX00345Xzu2+mu
X-Received: by 2002:a05:6e02:1a8b:b0:348:8542:a673 with SMTP id
 k11-20020a056e021a8b00b003488542a673mr578084ilv.22.1689620914136; 
 Mon, 17 Jul 2023 12:08:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH8IAKDk/Qq0r0DbEq84CfbH5y70uroq/83Nyu0gFtjM6u4GlatJgupAE/Bg/5ujaAlXs4PMg==
X-Received: by 2002:a05:6e02:1a8b:b0:348:8542:a673 with SMTP id
 k11-20020a056e021a8b00b003488542a673mr578040ilv.22.1689620913830; 
 Mon, 17 Jul 2023 12:08:33 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92dac9000000b003460b456030sm129837ilq.60.2023.07.17.12.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 12:08:33 -0700 (PDT)
Date: Mon, 17 Jul 2023 13:08:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <20230717130831.0f18381a.alex.williamson@redhat.com>
In-Reply-To: <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Dominik Behr <dbehr@chromium.org>, Moritz Fischer <mdf@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Xu Yilun <yilun.xu@intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Benjamin LaHaise <bcrl@kvack.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 10:29:34 +0200
Grzegorz Jaszczyk <jaz@semihalf.com> wrote:

> pt., 14 lip 2023 o 09:05 Christian Brauner <brauner@kernel.org> napisa=C5=
=82(a):
> >
> > On Thu, Jul 13, 2023 at 11:10:54AM -0600, Alex Williamson wrote: =20
> > > On Thu, 13 Jul 2023 12:05:36 +0200
> > > Christian Brauner <brauner@kernel.org> wrote:
> > > =20
> > > > Hey everyone,
> > > >
> > > > This simplifies the eventfd_signal() and eventfd_signal_mask() help=
ers
> > > > by removing the count argument which is effectively unused. =20
> > >
> > > We have a patch under review which does in fact make use of the
> > > signaling value:
> > >
> > > https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com=
/ =20
> >
> > Huh, thanks for the link.
> >
> > Quoting from
> > https://patchwork.kernel.org/project/kvm/patch/20230307220553.631069-1-=
jaz@semihalf.com/#25266856
> > =20
> > > Reading an eventfd returns an 8-byte value, we generally only use it
> > > as a counter, but it's been discussed previously and IIRC, it's possi=
ble
> > > to use that value as a notification value. =20
> >
> > So the goal is to pipe a specific value through eventfd? But it is
> > explicitly a counter. The whole thing is written around a counter and
> > each write and signal adds to the counter.
> >
> > The consequences are pretty well described in the cover letter of
> > v6 https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.co=
m/
> > =20
> > > Since the eventfd counter is used as ACPI notification value
> > > placeholder, the eventfd signaling needs to be serialized in order to
> > > not end up with notification values being coalesced. Therefore ACPI
> > > notification values are buffered and signalized one by one, when the
> > > previous notification value has been consumed. =20
> >
> > But isn't this a good indication that you really don't want an eventfd
> > but something that's explicitly designed to associate specific data wit=
h
> > a notification? Using eventfd in that manner requires serialization,
> > buffering, and enforces ordering.

What would that mechanism be?  We've been iterating on getting the
serialization and buffering correct, but I don't know of another means
that combines the notification with a value, so we'd likely end up with
an eventfd only for notification and a separate ring buffer for
notification values.

As this series demonstrates, the current in-kernel users only increment
the counter and most userspace likely discards the counter value, which
makes the counter largely a waste.  While perhaps unconventional,
there's no requirement that the counter may only be incremented by one,
nor any restriction that I see in how userspace must interpret the
counter value.

As I understand the ACPI notification proposal that Grzegorz links
below, a notification with an interpreted value allows for a more
direct userspace implementation when dealing with a series of discrete
notification with value events.  Thanks,

Alex

> > I have no skin in the game aside from having to drop this conversion
> > which I'm fine to do if there are actually users for this btu really,
> > that looks a lot like abusing an api that really wasn't designed for
> > this. =20
>=20
> https://patchwork.kernel.org/project/kvm/patch/20230307220553.631069-1-ja=
z@semihalf.com/
> was posted at the beginig of March and one of the main things we've
> discussed was the mechanism for propagating acpi notification value.
> We've endup with eventfd as the best mechanism and have actually been
> using it from v2. I really do not want to waste this effort, I think
> we are quite advanced with v6 now. Additionally we didn't actually
> modify any part of eventfd support that was in place, we only used it
> in a specific (and discussed beforehand) way.

