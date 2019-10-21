Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDADF639
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 21:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1A6E241;
	Mon, 21 Oct 2019 19:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2866E241
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 19:47:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-tvVLh5QnNemqg5-Lf0njnA-1; Mon, 21 Oct 2019 15:47:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C07800D41;
 Mon, 21 Oct 2019 19:47:50 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9105C219;
 Mon, 21 Oct 2019 19:47:49 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:47:48 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 02/15] mm/mmu_notifier: add an interval tree notifier
Message-ID: <20191021194748.GA5644@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-3-jgg@ziepe.ca>
 <20191021183056.GA3177@redhat.com>
 <20191021185421.GG6285@mellanox.com>
 <20191021191157.GA5208@redhat.com>
 <20191021192448.GK6285@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191021192448.GK6285@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tvVLh5QnNemqg5-Lf0njnA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571687275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61Nnku0I+13ll91wxHp2GCqWsterOpYjidrMjRQ6FOk=;
 b=FgXx8MPj2E5264FKUKvWQbruJp1cI/6JkRubU1VJQfFvoubEx+GLp/4P4dgRAKSQ/omar4
 T6vDwlwnUHe6jTlViX5l/cqIB4V2yaJvOMZf6PbtjnZ8+uV5Ccx+CWIh9f/GjiISwr9mtF
 E5+Ghp2essq6A+MdDcmipjIu6p0BDv0=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDc6MjQ6NTNQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAzOjExOjU3UE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+IFNpbmNlIHRoYXQgcmVhZGVyIGlzIG5vdCBsb2NrZWQgd2Ug
bmVlZCByZWxlYXNlIHNlbWFudGljcyBoZXJlIHRvCj4gPiA+IGVuc3VyZSB0aGUgdW5sb2NrZWQg
cmVhZGVyIHNlZXMgYSBmdWxseSBpbml0aW5hbGl6ZWQgbW11X25vdGlmaWVyX21tCj4gPiA+IHN0
cnVjdHVyZSB3aGVuIGl0IG9ic2VydmVzIHRoZSBwb2ludGVyLgo+ID4gCj4gPiBJIHRob3VnaHQg
dGhlIG1tX3Rha2VfYWxsX2xvY2tzKCkgd291bGQgaGF2ZSBoYWQgYSBiYXJyaWVyIGFuZCB0aHVz
Cj4gPiB0aGF0IHlvdSBjb3VsZCBub3Qgc2VlIG1tdV9ub3RpZmllciBzdHJ1Y3QgcGFydGlhbHkg
aW5pdGlhbGl6ZWQuIAo+IAo+IE5vdCBzdXJlLCB1c3VhbGx5IGEgbG9jayBhY3F1aXJlIGRvZXNu
J3QgaGF2ZSBhIHN0b3JlIGJhcnJpZXI/CgpZZWFoIGxpa2VseS4KCj4gCj4gRXZlbiBpZiBpdCBk
aWQsIHdlIHdvdWxkIHN0aWxsIG5lZWQgc29tZSBwYWlyaW5nIHJlYWQgYmFycmllci4uCj4gCj4g
PiBoYXZpbmcgdGhlIGFjcXVpcmUvcmVsZWFzZSBhcyBzYWZldHkgbmV0IGRvZXMgbm90IGh1cnQu
IE1heWJlIGFkZCBhCj4gPiBjb21tZW50IGFib3V0IHRoZSBzdHJ1Y3QgaW5pdGlhbGl6YXRpb24g
bmVlZGluZyB0byBiZSB2aXNpYmxlIGJlZm9yZQo+ID4gcG9pbnRlciBpcyBzZXQuCj4gCj4gSXMg
dGhpcyBjbGVhcj8KPiAKPiAgICAgICAgICAqIHJlbGVhc2Ugc2VtYW50aWNzIG9uIHRoZSBpbml0
aWFsaXphdGlvbiBvZiB0aGUKPiAgICAgICAgICAqIG1tdV9ub3RpZmllcl9tbSdzIGNvbnRlbnRz
IGFyZSBwcm92aWRlZCBmb3IgdW5sb2NrZWQgcmVhZGVycy4KPiAJICogYWNxdWlyZSBjYW4gb25s
eSBiZSB1c2VkIHdoaWxlIGhvbGRpbmcgdGhlCj4gICAgICAgICAgKiBtbWdyYWIgb3IgbW1nZXQs
IGFuZCBpcyBzYWZlIGJlY2F1c2Ugb25jZSBjcmVhdGVkIHRoZQo+ICAgICAgICAgICogbW11X25v
dGlmaWZlcl9tbSBpcyBub3QgZnJlZWQgdW50aWwgdGhlIG1tIGlzIGRlc3Ryb3llZC4KPiAgICAg
ICAgICAqIFVzZXJzIGhvbGRpbmcgdGhlIG1tYXBfc2VtIG9yIG9uZSBvZiB0aGUKPiAJICogbW1f
dGFrZV9hbGxfbG9ja3MoKSBkbyBub3QgbmVlZCB0byB1c2UgYWNxdWlyZSBzZW1hbnRpY3MuCj4g
Cj4gSXQgYWxzbyBoZWxwcyBleHBsYWluIHdoeSB0aGVyZSBpcyBubyBsb2NraW5nIGFyb3VuZCB0
aGUgb3RoZXIKPiByZWFkZXJzLCB3aGljaCBoYXMgcHV6emxlZCBtZSBpbiB0aGUgcGFzdCBhdCBs
ZWFzdC4KClBlcmZlY3QuCgpKw6lyw7RtZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
