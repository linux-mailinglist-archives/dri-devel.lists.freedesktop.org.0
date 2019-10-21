Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C3DF540
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 20:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F836E1F6;
	Mon, 21 Oct 2019 18:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461616E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:40:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-dWRvfgUUMJusTnloWWIPiA-1; Mon, 21 Oct 2019 14:40:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 884DA107AD31;
 Mon, 21 Oct 2019 18:40:44 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77EF25D6A5;
 Mon, 21 Oct 2019 18:40:43 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:40:41 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Message-ID: <20191021184041.GF3177@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: dWRvfgUUMJusTnloWWIPiA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571683251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXfaOQYdFL8ye7vXAhaZ8e6i+RwRJU+ydkb4i4rvdUQ=;
 b=Tcrd9eMNbh+5QZ/SJ/X27J+/42zsx8KiHecxPU/x1aNcSzA/BTpvxS2hnMkXVwsmCF8JeU
 0zavPw8I2yZGHtTqEExTLwJ2s/Gnr/lR+evcP3Q3nZIwGWbzJD+yvmF0WCNa+V/T4I4oHD
 j5CxvKOy/4bGjDGvXQsM42/sRDkL4fg=
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
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDM6MTI6MjdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiA4
IG9mIHRoZSBtbXVfbm90aWZpZXIgdXNpbmcgZHJpdmVycyAoaTkxNV9nZW0sIHJhZGVvbl9tbiwg
dW1lbV9vZHAsIGhmaTEsCj4gc2NpZl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkgZHJpdmVycyBh
cmUgdXNpbmcgYSBjb21tb24gcGF0dGVybiB3aGVyZQo+IHRoZXkgb25seSB1c2UgaW52YWxpZGF0
ZV9yYW5nZV9zdGFydC9lbmQgYW5kIGltbWVkaWF0ZWx5IGNoZWNrIHRoZQo+IGludmFsaWRhdGlu
ZyByYW5nZSBhZ2FpbnN0IHNvbWUgZHJpdmVyIGRhdGEgc3RydWN0dXJlIHRvIHRlbGwgaWYgdGhl
Cj4gZHJpdmVyIGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhlbSB1c2UgYW4gaW50ZXJ2YWxfdHJl
ZSwgdGhlIG90aGVycyBhcmUKPiBzaW1wbGUgbGluZWFyIHNlYXJjaCBsaXN0cy4KPiAKPiBPZiB0
aGUgb25lcyBJIGNoZWNrZWQgdGhleSBsYXJnZWx5IHNlZW0gdG8gaGF2ZSB2YXJpb3VzIGtpbmRz
IG9mIHJhY2VzLAo+IGJ1Z3MgYW5kIHBvb3IgaW1wbGVtZW50YXRpb24uIFRoaXMgaXMgYSByZXN1
bHQgb2YgdGhlIGNvbXBsZXhpdHkgaW4gaG93Cj4gdGhlIG5vdGlmaWVyIGludGVyYWN0cyB3aXRo
IGdldF91c2VyX3BhZ2VzKCkuIEl0IGlzIGV4dHJlbWVseSBkaWZmaWN1bHQgdG8KPiB1c2UgaXQg
Y29ycmVjdGx5Lgo+IAo+IENvbnNvbGlkYXRlIGFsbCBvZiB0aGlzIGNvZGUgdG9nZXRoZXIgaW50
byB0aGUgY29yZSBtbXVfbm90aWZpZXIgYW5kCj4gcHJvdmlkZSBhIGxvY2tpbmcgc2NoZW1lIHNp
bWlsYXIgdG8gaG1tX21pcnJvciB0aGF0IGFsbG93cyB0aGUgdXNlciB0bwo+IHNhZmVseSB1c2Ug
Z2V0X3VzZXJfcGFnZXMoKSBhbmQgcmVsaWFibHkga25vdyBpZiB0aGUgcGFnZSBsaXN0IHN0aWxs
Cj4gbWF0Y2hlcyB0aGUgbW0uCj4gCj4gVGhpcyBuZXcgYXJyYW5nbWVudCBwbGF5cyBuaWNlbHkg
d2l0aCB0aGUgIWJsb2NrYWJsZSBtb2RlIGZvcgo+IE9PTS4gU2Nhbm5pbmcgdGhlIGludGVydmFs
IHRyZWUgaXMgZG9uZSBzdWNoIHRoYXQgdGhlIGludGVyc2VjdGlvbiB0ZXN0Cj4gd2lsbCBhbHdh
eXMgc3VjY2VlZCwgYW5kIHNpbmNlIHRoZXJlIGlzIG5vIGludmFsaWRhdGVfcmFuZ2VfZW5kIGV4
cG9zZWQgdG8KPiBkcml2ZXJzIHRoZSBzY2hlbWUgc2FmZWx5IGFsbG93cyBtdWx0aXBsZSBkcml2
ZXJzIHRvIGJlIHN1YnNjcmliZWQuCj4gCj4gRm91ciBwbGFjZXMgYXJlIGNvbnZlcnRlZCBhcyBh
biBleGFtcGxlIG9mIGhvdyB0aGUgbmV3IEFQSSBpcyB1c2VkLgo+IEZvdXIgYXJlIGxlZnQgZm9y
IGZ1dHVyZSBwYXRjaGVzOgo+ICAtIGk5MTVfZ2VtIGhhcyBjb21wbGV4IGxvY2tpbmcgYXJvdW5k
IGRlc3RydWN0aW9uIG9mIGEgcmVnaXN0cmF0aW9uLAo+ICAgIG5lZWRzIG1vcmUgc3R1ZHkKPiAg
LSBoZmkxICgybmQgdXNlcikgbmVlZHMgYWNjZXNzIHRvIHRoZSByYnRyZWUKPiAgLSBzY2lmX2Rt
YSBoYXMgYSBjb21wbGljYXRlZCBsb2dpYyBmbG93Cj4gIC0gdmhvc3QncyBtbXUgbm90aWZpZXJz
IGFyZSBhbHJlYWR5IGJlaW5nIHJld3JpdHRlbgo+IAo+IFRoaXMgaXMgc3RpbGwgYmVpbmcgdGVz
dGVkLCBidXQgSSBmaWd1cmVkIHRvIHNlbmQgaXQgdG8gc3RhcnQgZ2V0dGluZyBoZWxwCj4gZnJv
bSB0aGUgeGVuLCBhbWQgYW5kIGhmaSBkcml2ZXJzIHdoaWNoIEkgY2Fubm90IHRlc3QgaGVyZS4K
Ckl0IG1pZ2h0IGJlIGEgZ29vZCBvcG9ydHVuaXR5IHRvIGFsc28gc3dpdGNoIHRob3NlIHVzZXJz
IHRvCmhtbV9yYW5nZV9mYXVsdCgpIGluc3RlYWQgb2YgR1VQIGFzIEdVUCBpcyBwb2ludGxlc3Mg
Zm9yIHRob3NlCnVzZXJzLiBJbiBmYWN0IHRoZSBHVVAgaXMgYW4gaW1wZWRpbWVudCB0byBub3Jt
YWwgbW0gb3BlcmF0aW9ucy4KCkkgd2lsbCB0ZXN0IG9uIG5vdXZlYXUuCgpDaGVlcnMsCkrDqXLD
tG1lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
