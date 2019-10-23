Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42ADE248D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 22:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A656EB8B;
	Wed, 23 Oct 2019 20:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C76EB83
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 20:26:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Mi54ZwgNMmyd4SWvphQ_uA-1; Wed, 23 Oct 2019 16:26:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01D3C800D5A;
 Wed, 23 Oct 2019 20:26:17 +0000 (UTC)
Received: from redhat.com (ovpn-123-188.rdu2.redhat.com [10.10.123.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A79610027A4;
 Wed, 23 Oct 2019 20:26:15 +0000 (UTC)
Date: Wed, 23 Oct 2019 16:26:13 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Message-ID: <20191023202539.GA3200@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191021184041.GF3177@redhat.com>
 <20191021190556.GI6285@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191021190556.GI6285@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Mi54ZwgNMmyd4SWvphQ_uA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571862381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1XeLbQwzCck5Lma54SyUL7NHxZOnECT3DsLOWtBh4k=;
 b=flLdISb/pLQJ0TRAqBSa1m3RAYv04lBBYV4NjaKYxYdXmPi1gpyKN+bEe/XAR8Bu1Oppyu
 mesM6VI4bkJcoUCAc6kDo9rBvBANy5tMwiBNlfzYYVdBo/5Q04KNz3AZnL2zNMAQPb9DXs
 9I8NYjuvwyGPwFE79GWfyY0+9b6gPLQ=
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDc6MDY6MDBQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAyOjQwOjQxUE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwMzoxMjoyN1BNIC0w
MzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IEZyb206IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KPiA+ID4gCj4gPiA+IDggb2YgdGhlIG1tdV9ub3RpZmllciB1c2lu
ZyBkcml2ZXJzIChpOTE1X2dlbSwgcmFkZW9uX21uLCB1bWVtX29kcCwgaGZpMSwKPiA+ID4gc2Np
Zl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkgZHJpdmVycyBhcmUgdXNpbmcgYSBjb21tb24gcGF0
dGVybiB3aGVyZQo+ID4gPiB0aGV5IG9ubHkgdXNlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5k
IGFuZCBpbW1lZGlhdGVseSBjaGVjayB0aGUKPiA+ID4gaW52YWxpZGF0aW5nIHJhbmdlIGFnYWlu
c3Qgc29tZSBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUgdG8gdGVsbCBpZiB0aGUKPiA+ID4gZHJpdmVy
IGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhlbSB1c2UgYW4gaW50ZXJ2YWxfdHJlZSwgdGhlIG90
aGVycyBhcmUKPiA+ID4gc2ltcGxlIGxpbmVhciBzZWFyY2ggbGlzdHMuCj4gPiA+IAo+ID4gPiBP
ZiB0aGUgb25lcyBJIGNoZWNrZWQgdGhleSBsYXJnZWx5IHNlZW0gdG8gaGF2ZSB2YXJpb3VzIGtp
bmRzIG9mIHJhY2VzLAo+ID4gPiBidWdzIGFuZCBwb29yIGltcGxlbWVudGF0aW9uLiBUaGlzIGlz
IGEgcmVzdWx0IG9mIHRoZSBjb21wbGV4aXR5IGluIGhvdwo+ID4gPiB0aGUgbm90aWZpZXIgaW50
ZXJhY3RzIHdpdGggZ2V0X3VzZXJfcGFnZXMoKS4gSXQgaXMgZXh0cmVtZWx5IGRpZmZpY3VsdCB0
bwo+ID4gPiB1c2UgaXQgY29ycmVjdGx5Lgo+ID4gPiAKPiA+ID4gQ29uc29saWRhdGUgYWxsIG9m
IHRoaXMgY29kZSB0b2dldGhlciBpbnRvIHRoZSBjb3JlIG1tdV9ub3RpZmllciBhbmQKPiA+ID4g
cHJvdmlkZSBhIGxvY2tpbmcgc2NoZW1lIHNpbWlsYXIgdG8gaG1tX21pcnJvciB0aGF0IGFsbG93
cyB0aGUgdXNlciB0bwo+ID4gPiBzYWZlbHkgdXNlIGdldF91c2VyX3BhZ2VzKCkgYW5kIHJlbGlh
Ymx5IGtub3cgaWYgdGhlIHBhZ2UgbGlzdCBzdGlsbAo+ID4gPiBtYXRjaGVzIHRoZSBtbS4KPiA+
ID4gCj4gPiA+IFRoaXMgbmV3IGFycmFuZ21lbnQgcGxheXMgbmljZWx5IHdpdGggdGhlICFibG9j
a2FibGUgbW9kZSBmb3IKPiA+ID4gT09NLiBTY2FubmluZyB0aGUgaW50ZXJ2YWwgdHJlZSBpcyBk
b25lIHN1Y2ggdGhhdCB0aGUgaW50ZXJzZWN0aW9uIHRlc3QKPiA+ID4gd2lsbCBhbHdheXMgc3Vj
Y2VlZCwgYW5kIHNpbmNlIHRoZXJlIGlzIG5vIGludmFsaWRhdGVfcmFuZ2VfZW5kIGV4cG9zZWQg
dG8KPiA+ID4gZHJpdmVycyB0aGUgc2NoZW1lIHNhZmVseSBhbGxvd3MgbXVsdGlwbGUgZHJpdmVy
cyB0byBiZSBzdWJzY3JpYmVkLgo+ID4gPiAKPiA+ID4gRm91ciBwbGFjZXMgYXJlIGNvbnZlcnRl
ZCBhcyBhbiBleGFtcGxlIG9mIGhvdyB0aGUgbmV3IEFQSSBpcyB1c2VkLgo+ID4gPiBGb3VyIGFy
ZSBsZWZ0IGZvciBmdXR1cmUgcGF0Y2hlczoKPiA+ID4gIC0gaTkxNV9nZW0gaGFzIGNvbXBsZXgg
bG9ja2luZyBhcm91bmQgZGVzdHJ1Y3Rpb24gb2YgYSByZWdpc3RyYXRpb24sCj4gPiA+ICAgIG5l
ZWRzIG1vcmUgc3R1ZHkKPiA+ID4gIC0gaGZpMSAoMm5kIHVzZXIpIG5lZWRzIGFjY2VzcyB0byB0
aGUgcmJ0cmVlCj4gPiA+ICAtIHNjaWZfZG1hIGhhcyBhIGNvbXBsaWNhdGVkIGxvZ2ljIGZsb3cK
PiA+ID4gIC0gdmhvc3QncyBtbXUgbm90aWZpZXJzIGFyZSBhbHJlYWR5IGJlaW5nIHJld3JpdHRl
bgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBzdGlsbCBiZWluZyB0ZXN0ZWQsIGJ1dCBJIGZpZ3VyZWQg
dG8gc2VuZCBpdCB0byBzdGFydCBnZXR0aW5nIGhlbHAKPiA+ID4gZnJvbSB0aGUgeGVuLCBhbWQg
YW5kIGhmaSBkcml2ZXJzIHdoaWNoIEkgY2Fubm90IHRlc3QgaGVyZS4KPiA+IAo+ID4gSXQgbWln
aHQgYmUgYSBnb29kIG9wb3J0dW5pdHkgdG8gYWxzbyBzd2l0Y2ggdGhvc2UgdXNlcnMgdG8KPiA+
IGhtbV9yYW5nZV9mYXVsdCgpIGluc3RlYWQgb2YgR1VQIGFzIEdVUCBpcyBwb2ludGxlc3MgZm9y
IHRob3NlCj4gPiB1c2Vycy4gSW4gZmFjdCB0aGUgR1VQIGlzIGFuIGltcGVkaW1lbnQgdG8gbm9y
bWFsIG1tIG9wZXJhdGlvbnMuCj4gCj4gSSB0aGluayB2aG9zdCBjYW4gdXNlIGhtbV9yYW5nZV9m
YXVsdAo+IAo+IGhmaTEgZG9lcyBhY3R1YWxseSBuZWVkIHRvIGhhdmUgdGhlIHBhZ2UgcGluLCBp
dCBkb2Vzbid0IGZlbmNlIERNQQo+IGR1cmluZyBpbnZhbGlkYXRlLgo+IAo+IGk5MTVfZ2VtIGZl
ZWxzIGFsb3QgbGlrZSBhbWRncHUsIHNvIHByb2JhYmx5IGl0IHdvdWxkIGJlbmVmaXQKPiAKPiBO
byBpZGVhIGFib3V0IHNjaWZfZG1hCj4gCj4gPiBJIHdpbGwgdGVzdCBvbiBub3V2ZWF1Lgo+IAo+
IFRoYW5rcywgaG9wZWZ1bGx5IGl0IHN0aWxsIHdvcmtzLCBJIHRoaW5rIFJhbHBoIHdhcyBhYmxl
IHRvIGRvIHNvbWUKPiBiYXNpYyBjaGVja3MuIEJ1dCBpdCBpcyBhIHByZXR0eSBjb21wbGljYXRl
ZCBzZXJpZXMsIEkgcHJvYmFibHkgbWFkZQo+IHNvbWUgbWlzdGFrZXMuCgpTbyBpdCBzZWVtcyB0
byB3b3JrIG9rIHdpdGggbm91dmVhdSwgd2lsbCBsZXQgdGVzdHMgcnVuIGluIGxvb3AgdGhvdWdo
dAp0aGVyZSBhcmUgbm90IHZlcnkgYWR2YW5jZSB0ZXN0LgoKPiAKPiBGV0lXLCBJIGtub3cgdGhh
dCBub3V2ZWF1IGdldHMgYSBsb2NrZGVwIHNwbGF0IG5vdyBmcm9tIERhbmllbAo+IFZldHRlcidz
IHJlY2VudCBjaGFuZ2VzLCBpdCB0cmllcyB0byBkbyBHRlBfS0VSRU5FTCBhbGxvY2F0aW9ucyB1
bmRlcgo+IGEgbG9jayBhbHNvIGhlbGQgYnkgdGhlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgcGF0
aC4KCkkgaGF2ZSBub3Qgc2VlbiBhbnkgc3BsYXQgc28gZmFyLCBpcyBpdCB0aHJvdWdodCBzb21l
IG5ldyBrZXJuZWwgY29uZmlnID8KCkNoZWVycywKSsOpcsO0bWUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
