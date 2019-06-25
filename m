Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37ED55056
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 15:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1689F69;
	Tue, 25 Jun 2019 13:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5531589F63;
 Tue, 25 Jun 2019 13:28:21 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hflU2-0000AO-GD; Tue, 25 Jun 2019 13:27:38 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ED4AC209FCA10; Tue, 25 Jun 2019 15:27:36 +0200 (CEST)
Date: Tue, 25 Jun 2019 15:27:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
Message-ID: <20190625132736.GZ3419@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
 <20190625103430.GW3402@hirez.programming.kicks-ass.net>
 <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vCL2IOPiHU9kJW2bBZYOqxawmR17SekCCFnRDcOOjFE=; b=g0ITzi4aEbR6lSdnqiy2ElfSg
 g779gyAaI7Ux0091eXAVoKggjsFo/t+M6NWIocT8AMgHmAAh0yh80ypR6Qbrn/+LZz95Bc5tDvCen
 z4EMW1PvzMzmn7ebko6NG+ty+dz11z5vxAH09EtqjAX8ydZyEpvMqdktJcGUrgc2Dgx66WDRoalDB
 qnMzX1ROanw2yW2oUXHPcEvjQ3b3DC0dOeSFFur1rAygN3R9e1t4x90/HNJodZAxXJkupMEfn77Fm
 hpkVJrCMUlq/fbnIZCSHsL7NRYfw+QRUFFHQvO2QCLXRHQbEJ1FO9NQzzkv9ouNrzplrkLdnx7Roh
 OV0fobmDw==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
 David Airlie <airlied@linux.ie>,
 samba-technical <samba-technical@lists.samba.org>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-afs@lists.infradead.org, Alasdair Kergon <agk@redhat.com>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 James Morris <jmorris@namei.org>, cluster-devel <cluster-devel@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul McKenney <paulmck@linux.vnet.ibm.com>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 MauroCarvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, "J. Bruce Fields" <bfields@fieldses.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
 linux-bluetooth@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>,
 Benjamin LaHaise <bcrl@kvack.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-media@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDI6MTI6MjJQTSArMDIwMCwgQW5kcmVhcyBHcnVlbmJh
Y2hlciB3cm90ZToKCj4gPiBPbmx5IGlmIHdlIGRvIGFzIERhdmlkIHN1Z2dlc3RlZCBhbmQgbWFr
ZSBjbGVhbl9hbmRfd2FrZV91cF9iaXQoKQo+ID4gcHJvdmlkZSB0aGUgUkVMRUFTRSBiYXJyaWVy
Lgo+IAo+IChJdCdzIGNsZWFyX2FuZF93YWtlX3VwX2JpdCwgbm90IGNsZWFuX2FuZF93YWtlX3Vw
X2JpdC4pCgpZZXMsIHR5cGluZyBoYXJkLgoKPiA+IFRoYXQgaXMsIGN1cnJlbnRseSBjbGVhcl9h
bmRfd2FrZV91cF9iaXQoKSBpcwo+ID4KPiA+ICAgICAgICAgY2xlYXJfYml0KCkKPiA+ICAgICAg
ICAgc21wX21iX19hZnRlcl9hdG9taWMoKTsKPiA+ICAgICAgICAgd2FrZV91cF9iaXQoKTsKPiA+
Cgo+IE5vdyBJJ20gY29uZnVzZWQgYmVjYXVzZSBjbGVhcl9hbmRfd2FrZV91cF9iaXQoKSBpbiBt
YWlubGluZSBkb2VzIHVzZQo+IGNsZWFyX2JpdF91bmxvY2soKSwgc28gaXQncyB0aGUgZXhhY3Qg
b3Bwb3NpdGUgb2Ygd2hhdCB5b3UganVzdCBzYWlkLgoKQXJnaDsgY2xlYXJseSBJIGNvdWxkbid0
IHJlYWQuIEFuZCB0aGVuIHllcywgeW91J3JlIHJpZ2h0LgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
