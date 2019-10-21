Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AFBDF5D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 21:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D46E22A;
	Mon, 21 Oct 2019 19:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6F6E229
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 19:19:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-pucvyFZ9O-qowyYJDMXeyA-1; Mon, 21 Oct 2019 15:19:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2FE47B;
 Mon, 21 Oct 2019 19:19:24 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A55836012D;
 Mon, 21 Oct 2019 19:19:23 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:19:22 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 15/15] mm/hmm: remove hmm_mirror and related
Message-ID: <20191021191922.GB5208@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-16-jgg@ziepe.ca>
 <20191021183824.GE3177@redhat.com>
 <20191021185738.GH6285@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191021185738.GH6285@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: pucvyFZ9O-qowyYJDMXeyA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571685569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvQMWms2Ef0GKQbYBZu3QSp4iD5UdUfpEnyzpzRVcdo=;
 b=iPuerWb/WuXX7/GXllntnTOlArtQiCIFfCMJJfxuPgWQtij0VmMkWaAi1wHuP0lZB+KOL6
 cHoPgWHDPyWZeQW7NZR49DeZ+0l6uaGfMlNBtjOreBE0LX0eFuw/MxMLBuQMBrVAuKu8Mk
 7cK8Pma1YPJ1uFi9cK26hMd7HsGtb4o=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDY6NTc6NDJQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAyOjM4OjI0UE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwMzoxMjo0MlBNIC0w
MzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IEZyb206IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KPiA+ID4gCj4gPiA+IFRoZSBvbmx5IHR3byB1c2VycyBvZiB0aGlz
IGFyZSBub3cgY29udmVydGVkIHRvIHVzZSBtbXVfcmFuZ2Vfbm90aWZpZXIsCj4gPiA+IGRlbGV0
ZSBhbGwgdGhlIGNvZGUgYW5kIHVwZGF0ZSBobW0ucnN0Lgo+ID4gCj4gPiBJIGd1ZXNzIGkgc2hv
dWxkIHBvaW50IG91dCB0aGF0IHRoZSByZWFzb25zIGZvciBobW1fbWlycm9yIGFuZCBobW0KPiA+
IHdhcyBmb3I6Cj4gPiAgICAgMSkgTWF5YmUgZGVmaW5lIGEgY29tbW9uIEFQSSBmb3IgdXNlcnNw
YWNlIHRvIHByb3ZpZGUgbWVtb3J5Cj4gPiAgICAgICAgcGxhY2VtZW50IGhpbnRzIChOVU1BIGZv
ciBHUFUpCj4gCj4gRG8geW91IHRoaW5rIHRoaXMgbmVlZHMgc3BlY2lhbCBjb2RlIGluIHRoZSBu
b3RpZmllcnM/CgpKdXN0IG5lZWQgYSBwbGFjZSB3aGVyZSB0byBoYW5nIHVzZXJzcGFjZSBwb2xp
Y3kgaGludCB0aGUgaG1tX3JhbmdlCndhcyB0aGUgcHJpbWUgc3VzcGVjdC4gSSBuZWVkIHRvIHJl
dmlzaXQgdGhpcyBvbmNlIHRoZSBub3V2ZWF1IHVzZXIKc3BhY2UgaXMgaW4gYmV0dGVyIHNoYXBl
LgoKPiAKPiA+ICAgICAyKSBtdWx0aS1kZXZpY2VzIHNoYXJpbmcgc2FtZSBtaXJyb3IgcGFnZSB0
YWJsZQo+IAo+IE9oIG5lYXQsIGJ1dCBJIHRoaW5rIHRoaXMganVzdCBtZWFucyB0aGUgR1BVIGRy
aXZlciBoYXMgdG8gcmVnaXN0ZXIgYQo+IHNpbmdsZSBub3RpZmllciBmb3IgbXVsdGlwbGUgR1BV
cz8/CgpZZXMgdGhhdCB3YXMgdGhlIGlkZWEgYSBzaW5nbGUgbm90aWZpZXIgd2l0aCBzaGFyZSBw
YWdlIHRhYmxlLCBidXQKYXQgdGhpcyB0aW1lIHRoaXMgaXMgbm9uIGV4aXN0ZW50IGNvZGUgc28g
bm8gbmVlZCB0byBoaW5kZXIgY2hhbmdlCmp1c3QgZm9yIHRoZSBzYWtlIG9mIGl0LgoKPiAKPiA+
IEJ1dCBzdXBwb3J0IGZvciBtdWx0aS1HUFUgaW4gbm91dmVhdSBpcyB3YXkgYmVoaW5kIGFuZCBp
IGd1ZXNzIHN1Y2gKPiA+IG9wdGltaXphdGlvbiB3aWxsIGhhdmUgdG8gcmUtbWF0ZXJpYWxpemUg
d2hhdCBpcyBuZWNlc3Nhcnkgb25jZSB0aGF0Cj4gPiBoYXBwZW5zLgo+IAo+IFN1cmUsIGl0IHdp
bGwgYmUgZWFzaWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyBuZWVkZWQgd2l0aCBhIGJpdCBvZgo+
IGNvZGUhCj4gCj4gPiBOb3RlIHRoaXMgcGF0Y2ggc2hvdWxkIGFsc28gdXBkYXRlIGtlcm5lbC9m
b3JrLmMgYW5kIHRoZSBtbV9zdHJ1Y3QKPiA+IGRlZmluaXRpb24gQUZBSUNULiBXaXRoIHRob3Nl
IGNoYW5nZXMgeW91IGNhbiBhZGQgbXk6Cj4gCj4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlIHdo
YXQgdXBkYXRlcyB5b3UgbWVhbj8gSSdtIG5vdCBzdXJlLiAKPiAKPiBNYXliZSBJIGFscmVhZHkg
Z290IHRoZSB0aGluZ3MgeW91IGFyZSB0aGlua2luZyBvZiB3aXRoIHRoZSBnZXQvcHV0Cj4gY2hh
bmdlcz8KCk9oIGkgZm9yZ290IHRoaXMgd2FzIGFscmVhZHkgdGFrZW4gY2FyZSBvZiBieSB0aGlz
LiBTbyB5ZXMgYWxsIGlzCmZpbmU6CgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
