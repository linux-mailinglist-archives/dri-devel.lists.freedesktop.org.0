Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9F52FF9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 12:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AFF6E0D6;
	Tue, 25 Jun 2019 10:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5696E0D0;
 Tue, 25 Jun 2019 10:35:09 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfimX-0008Ce-Ev; Tue, 25 Jun 2019 10:34:33 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 11FC12063D031; Tue, 25 Jun 2019 12:34:30 +0200 (CEST)
Date: Tue, 25 Jun 2019 12:34:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
Message-ID: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udd2XNj0YQOu5KwyPQP6GFnOEKmvMvFG7ADPEjU+Kkg=; b=WTUrhABTI+04Ecv/wTwMGFqws
 h83jvImwQjRmpyswq4BLoUHmZ/DO4bIEFAWliQdhwR/IO5JwBpD6O9oUE9Yt3/EcpTG5W4F2mq7SF
 c7WS4oVyW9z145U5z78har86EvY1kK6Lil5ieALtK5onJber42zkPbtfhiair4Re5myMU3gel2cqN
 uf9du978Erbf8539T8MoEAoS+G4wKslSYBqFobc7ljDTEpU1p7Mn56HfucBU9QbV6NE5dRj+JG3Ud
 4UM2Y/FCVMBrsWlW8F5U1zQyfO9PgP1dZ1yVWXeHngUJ2VaQczuyJ2JukZNJjtMD8Unmum78t1eK+
 pqthdEtBg==;
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTE6MTk6MzVBTSArMDIwMCwgQW5kcmVhcyBHcnVlbmJh
Y2hlciB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9mcy9nZnMyL2dsb3BzLmMgYi9mcy9nZnMyL2ds
b3BzLmMKPiA+IGluZGV4IGNmNGM3NjcwMDViMS4uNjY2NjI5ZWE1ZGE3IDEwMDY0NAo+ID4gLS0t
IGEvZnMvZ2ZzMi9nbG9wcy5jCj4gPiArKysgYi9mcy9nZnMyL2dsb3BzLmMKPiA+IEBAIC0yMjcs
NiArMjI3LDcgQEAgc3RhdGljIHZvaWQgZ2ZzMl9jbGVhcl9nbG9wX3BlbmRpbmcoc3RydWN0IGdm
czJfaW5vZGUgKmlwKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICAg
IGNsZWFyX2JpdF91bmxvY2soR0lGX0dMT1BfUEVORElORywgJmlwLT5pX2ZsYWdzKTsKPiA+ICsg
ICAgICAgc21wX21iX19hZnRlcl9hdG9taWMoKTsKPiA+ICAgICAgICAgd2FrZV91cF9iaXQoJmlw
LT5pX2ZsYWdzLCBHSUZfR0xPUF9QRU5ESU5HKTsKPiAKPiBUaGlzIHNob3VsZCBiZWNvbWUgY2xl
YXJfYW5kX3dha2VfdXBfYml0IGFzIHdlbGwsIHJpZ2h0PyBUaGVyZSBhcmUKPiBzZXZlcmFsIG1v
cmUgaW5zdGFuY2VzIG9mIHRoZSBzYW1lIHBhdHRlcm4uCgpPbmx5IGlmIHdlIGRvIGFzIERhdmlk
IHN1Z2dlc3RlZCBhbmQgbWFrZSBjbGVhbl9hbmRfd2FrZV91cF9iaXQoKQpwcm92aWRlIHRoZSBS
RUxFQVNFIGJhcnJpZXIuCgpUaGF0IGlzLCBjdXJyZW50bHkgY2xlYXJfYW5kX3dha2VfdXBfYml0
KCkgaXMKCgljbGVhcl9iaXQoKQoJc21wX21iX19hZnRlcl9hdG9taWMoKTsKCXdha2VfdXBfYml0
KCk7CgpCdXQgdGhlIGFib3ZlIGlzOgoKCWNsZWFyX2JpdF91bmxvY2soKTsKCXNtcF9tYl9fYWZ0
ZXJfYXRvbWljKCk7Cgl3YWtlX3VwX2JpdCgpCgp0aGUgZGlmZmVyZW5jZSBpcyB0aGF0IF91bmxv
Y2soKSB1c2VzIFJFTEVBU0Ugc2VtYW50aWNzLCB3aGVyZQpjbGVhcl9iaXQoKSBkb2VzIG5vdC4K
ClRoZSBkaWZmZXJlbmNlIGlzIGlsbHVzdHJhdGVkIHdpdGggc29tZXRoaW5nIGxpa2U6CgoJY29u
ZCA9IHRydWU7CgljbGVhcl9iaXQoKQoJc21wX21iX19hZnRlcl9hdG9taWMoKTsKCXdha2VfdXBf
Yml0KCk7CgpJbiB0aGlzIGNhc2UsIGEgcmVtb3RlIENQVSBjYW4gZmlyc3Qgb2JzZXJ2ZSB0aGUg
Y2xlYXJfYml0KCkgYW5kIHRoZW4KdGhlICdjb25kID0gdHJ1ZScgc3RvcmUuIFdoZW4gd2UgdXNl
IGNsZWFyX2JpdF91bmxvY2soKSB0aGlzIGlzIG5vdApwb3NzaWJsZSwgYmVjYXVzZSB0aGUgUkVM
RUFTRSBiYXJyaWVyIGVuc3VyZXMgdGhhdCBldmVyeXRoaW5nIGJlZm9yZSwKc3RheXMgYmVmb3Jl
LgoKPiA+ICB9Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
