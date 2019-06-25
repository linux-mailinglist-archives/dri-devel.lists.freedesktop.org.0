Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DF54E7E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 14:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2240C6E0ED;
	Tue, 25 Jun 2019 12:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764A6E0E9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 12:12:34 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a128so12358963oib.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 05:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtX13vSVbmx57mGL/Q0hXK8kpnRo7HFPa5oOdLxipaM=;
 b=UzyjuZNk+b2sR2bsWkW0vJFUacaBlKi5g5qOkk1+LXN3O+uzyFp51Asz7e87ODb5jR
 Us+C7QQFpXEfAtoQsXPKb7U2sYFEa3DH4RG+Hhit7eaHKzm0gN2YH2vs1RdjUskIx62P
 YlrJ+V92UqlssB2sJbo3Ko/TYcZHK/kjmKoOCTA68bOskeVlrMN9c3lJx83ACoDib/Vw
 bXP48izLWEh0xISm/R2xcwFt5u8+p6CjnuPSVskP9vR0RRPKGhuTgl1+MJq78c3uUqUR
 FYvJFGDWbyWDoh7rCwvZZZspd+dO8Lcct3rdvtRMSA6z2v9FajJLGhaEJJseVijJgEm7
 IKBQ==
X-Gm-Message-State: APjAAAVV9zq6sT5pGOv3EH4Ux9O4Nak/FGn9cetX1shPJdOIy4UDxhcR
 TBB8WtsKlbzzQRDGAmz59L6hlLyEst8BtulgN/4QCQ==
X-Google-Smtp-Source: APXvYqzIF0shhnL3kTWbxYnFTIfJoQ9NWdzzlYJbdr7wT1RELz57W5jZU6ihqAiJYZbsgta0nM0Q5SDLuZyhNwwIoP0=
X-Received: by 2002:aca:b58b:: with SMTP id
 e133mr14182998oif.147.1561464753642; 
 Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
 <20190625103430.GW3402@hirez.programming.kicks-ass.net>
In-Reply-To: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 25 Jun 2019 14:12:22 +0200
Message-ID: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
To: Peter Zijlstra <peterz@infradead.org>
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

T24gVHVlLCAyNSBKdW4gMjAxOSBhdCAxMjozNiwgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAxMToxOTozNUFNICsw
MjAwLCBBbmRyZWFzIEdydWVuYmFjaGVyIHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZ2Zz
Mi9nbG9wcy5jIGIvZnMvZ2ZzMi9nbG9wcy5jCj4gPiA+IGluZGV4IGNmNGM3NjcwMDViMS4uNjY2
NjI5ZWE1ZGE3IDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9nZnMyL2dsb3BzLmMKPiA+ID4gKysrIGIv
ZnMvZ2ZzMi9nbG9wcy5jCj4gPiA+IEBAIC0yMjcsNiArMjI3LDcgQEAgc3RhdGljIHZvaWQgZ2Zz
Ml9jbGVhcl9nbG9wX3BlbmRpbmcoc3RydWN0IGdmczJfaW5vZGUgKmlwKQo+ID4gPiAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ID4gPgo+ID4gPiAgICAgICAgIGNsZWFyX2JpdF91bmxvY2soR0lG
X0dMT1BfUEVORElORywgJmlwLT5pX2ZsYWdzKTsKPiA+ID4gKyAgICAgICBzbXBfbWJfX2FmdGVy
X2F0b21pYygpOwo+ID4gPiAgICAgICAgIHdha2VfdXBfYml0KCZpcC0+aV9mbGFncywgR0lGX0dM
T1BfUEVORElORyk7Cj4gPgo+ID4gVGhpcyBzaG91bGQgYmVjb21lIGNsZWFyX2FuZF93YWtlX3Vw
X2JpdCBhcyB3ZWxsLCByaWdodD8gVGhlcmUgYXJlCj4gPiBzZXZlcmFsIG1vcmUgaW5zdGFuY2Vz
IG9mIHRoZSBzYW1lIHBhdHRlcm4uCj4KPiBPbmx5IGlmIHdlIGRvIGFzIERhdmlkIHN1Z2dlc3Rl
ZCBhbmQgbWFrZSBjbGVhbl9hbmRfd2FrZV91cF9iaXQoKQo+IHByb3ZpZGUgdGhlIFJFTEVBU0Ug
YmFycmllci4KCihJdCdzIGNsZWFyX2FuZF93YWtlX3VwX2JpdCwgbm90IGNsZWFuX2FuZF93YWtl
X3VwX2JpdC4pCgo+IFRoYXQgaXMsIGN1cnJlbnRseSBjbGVhcl9hbmRfd2FrZV91cF9iaXQoKSBp
cwo+Cj4gICAgICAgICBjbGVhcl9iaXQoKQo+ICAgICAgICAgc21wX21iX19hZnRlcl9hdG9taWMo
KTsKPiAgICAgICAgIHdha2VfdXBfYml0KCk7Cj4KPiBCdXQgdGhlIGFib3ZlIGlzOgo+Cj4gICAg
ICAgICBjbGVhcl9iaXRfdW5sb2NrKCk7Cj4gICAgICAgICBzbXBfbWJfX2FmdGVyX2F0b21pYygp
Owo+ICAgICAgICAgd2FrZV91cF9iaXQoKQo+Cj4gdGhlIGRpZmZlcmVuY2UgaXMgdGhhdCBfdW5s
b2NrKCkgdXNlcyBSRUxFQVNFIHNlbWFudGljcywgd2hlcmUKPiBjbGVhcl9iaXQoKSBkb2VzIG5v
dC4KPgo+IFRoZSBkaWZmZXJlbmNlIGlzIGlsbHVzdHJhdGVkIHdpdGggc29tZXRoaW5nIGxpa2U6
Cj4KPiAgICAgICAgIGNvbmQgPSB0cnVlOwo+ICAgICAgICAgY2xlYXJfYml0KCkKPiAgICAgICAg
IHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCk7Cj4gICAgICAgICB3YWtlX3VwX2JpdCgpOwo+Cj4gSW4g
dGhpcyBjYXNlLCBhIHJlbW90ZSBDUFUgY2FuIGZpcnN0IG9ic2VydmUgdGhlIGNsZWFyX2JpdCgp
IGFuZCB0aGVuCj4gdGhlICdjb25kID0gdHJ1ZScgc3RvcmUuIFdoZW4gd2UgdXNlIGNsZWFyX2Jp
dF91bmxvY2soKSB0aGlzIGlzIG5vdAo+IHBvc3NpYmxlLCBiZWNhdXNlIHRoZSBSRUxFQVNFIGJh
cnJpZXIgZW5zdXJlcyB0aGF0IGV2ZXJ5dGhpbmcgYmVmb3JlLAo+IHN0YXlzIGJlZm9yZS4KCk5v
dyBJJ20gY29uZnVzZWQgYmVjYXVzZSBjbGVhcl9hbmRfd2FrZV91cF9iaXQoKSBpbiBtYWlubGlu
ZSBkb2VzIHVzZQpjbGVhcl9iaXRfdW5sb2NrKCksIHNvIGl0J3MgdGhlIGV4YWN0IG9wcG9zaXRl
IG9mIHdoYXQgeW91IGp1c3Qgc2FpZC4KClRoYW5rcywKQW5kcmVhcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
