Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56903F3A07
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 22:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A489F6F7C7;
	Thu,  7 Nov 2019 21:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855E26F7C7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 21:04:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-5mTC5mxRONi9JJNT1c4IYQ-1; Thu, 07 Nov 2019 16:04:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CED1005500;
 Thu,  7 Nov 2019 21:04:14 +0000 (UTC)
Received: from redhat.com (ovpn-122-19.rdu2.redhat.com [10.10.122.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E81285C548;
 Thu,  7 Nov 2019 21:04:10 +0000 (UTC)
Date: Thu, 7 Nov 2019 16:04:08 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Message-ID: <20191107210408.GA4716@redhat.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107020807.GA747656@redhat.com>
 <20191107201102.GC21728@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191107201102.GC21728@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5mTC5mxRONi9JJNT1c4IYQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573160663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/OUHbhjqmo/2b88pcHR1Lly3F7Wmo3w1j9CIvENsK0=;
 b=NDeEeK3qbUyoAUkRsr3UXwzZV5PS5ToJzW06SWyKnMFjiacGhE9K+j2OldUN0lnFI+t/pn
 Do4hh5UQ+2NCgavjXOZkVM7bMp0SB787fiVF6dEmkNGpr+9Jx061HIyc5kPc2D8geB846j
 zDNlIya1I86FWfqYL8qiz9AUG1ORDN4=
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6MTE6MDZQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDA5OjA4OjA3UE0gLTA1MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gCj4gPiA+IAo+ID4gPiBFeHRyYSBjcmVkaXQ6IElNSE8sIHRoaXMg
Y2xlYXJseSBkZXNlcnZlcyB0byBhbGwgYmUgaW4gYSBuZXcgbW11X3JhbmdlX25vdGlmaWVyLmgK
PiA+ID4gaGVhZGVyIGZpbGUsIGJ1dCBJIGtub3cgdGhhdCdzIGV4dHJhIHdvcmsuIE1heWJlIGxh
dGVyIGFzIGEgZm9sbG93LXVwIHBhdGNoLAo+ID4gPiBpZiBhbnlvbmUgaGFzIHRoZSB0aW1lLgo+
ID4gCj4gPiBUaGUgcmFuZ2Ugbm90aWZpZXIgc2hvdWxkIGdldCB0aGUgZXZlbnQgdG9vLCBpdCB3
b3VsZCBiZSBhIHdhc3RlLCBpIHRoaW5rIGl0IGlzCj4gPiBhbiBvdmVyc2lnaHQgaGVyZS4gVGhl
IHJlbGVhc2UgZXZlbnQgaXMgZmluZSBzbyBOQUsgdG8geW91IHNlcGFyYXRlIGV2ZW50LiBFdmVu
dAo+ID4gaXMgcmVhbGx5IGFuIGhlbHBlciBmb3Igbm90aWZpZXIgaSBoYWQgYSBzZXQgb2YgcGF0
Y2ggZm9yIG5vdXZlYXUgdG8gbGV2ZXJhZ2UKPiA+IHRoaXMgaSBuZWVkIHRvIHJlc3VjaXRlIHRo
ZW0uIFNvIG5vIG5lZWQgdG8gc3BsaXQgdGhpbmcsIGkgd291bGQganVzdCBmb3J3YXJkCj4gPiB0
aGUgZXZlbnQgaWUgYWRkIGV2ZW50IHRvIG1tdV9yYW5nZV9ub3RpZmllcl9vcHMuaW52YWxpZGF0
ZSgpIGkgZmFpbGVkIHRvIGNhdGNoCj4gPiB0aGF0IGluIHYxIHNvcnJ5Lgo+IAo+IEkgdGhpbmsg
d2hhdCB5b3UgbWVhbiBpcyBhbHJlYWR5IGRvbmU/Cj4gCj4gc3RydWN0IG1tdV9yYW5nZV9ub3Rp
Zmllcl9vcHMgewo+IAlib29sICgqaW52YWxpZGF0ZSkoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmll
ciAqbXJuLAo+IAkJCSAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlLAo+
IAkJCSAgIHVuc2lnbmVkIGxvbmcgY3VyX3NlcSk7CgpZZXMgaXQgaXMgc29ycnksIGkgZ290IGNv
bmZ1c2Ugd2l0aCBtbXVfcmFuZ2Vfbm90aWZpZXIgYW5kIG1tdV9ub3RpZmllcl9yYW5nZSA6KQpJ
dCBpcyBhbG1vc3QgYSBwYWx5bmRyb21lIHN0cnVjdHVyZSA7KQoKPiAKPiA+IE5vIGl0IGlzIGFs
d2F5cyBvZGQsIHlvdSBtdXN0IGNhbGwgbW11X3JhbmdlX3NldF9zZXEoKSBvbmx5IGZyb20gdGhl
Cj4gPiBvcC0+aW52YWxpZGF0ZV9yYW5nZSgpIGNhbGxiYWNrIGF0IHdoaWNoIHBvaW50IHRoZSBz
ZXEgaXMgb2RkLiBBcyB3ZWxsCj4gPiB3aGVuIG1ybiBpcyBhZGRlZCBhbmQgaXRzIHNlcSBmaXJz
dCBzZXQgaXQgaXMgc2V0IHRvIGFuIG9kZCB2YWx1ZQo+ID4gYWx3YXlzLiBNYXliZSB0aGUgY29t
bWVudCwgc2hvdWxkIHJlYWQ6Cj4gPiAKPiA+ICAqIG1ybi0+aW52YWxpZGF0ZV9zZXEgaXMgYWx3
YXlzLCB5ZXMgYWx3YXlzLCBzZXQgdG8gYW4gb2RkIHZhbHVlLiBUaGlzIGVuc3VyZXMKPiA+IAo+
ID4gVG8gc3RyZXNzIHRoYXQgaXQgaXMgbm90IGFuIGVycm9yLgo+IAo+IEkgd2VudCB3aXRoIHRo
aXM6Cj4gCj4gCS8qCj4gCSAqIG1ybi0+aW52YWxpZGF0ZV9zZXEgbXVzdCBhbHdheXMgYmUgc2V0
IHRvIGFuIG9kZCB2YWx1ZSB2aWEKPiAJICogbW11X3JhbmdlX3NldF9zZXEoKSB1c2luZyB0aGUg
cHJvdmlkZWQgY3VyX3NlcSBmcm9tCj4gCSAqIG1uX2l0cmVlX2ludl9zdGFydF9yYW5nZSgpLiBU
aGlzIGVuc3VyZXMgdGhhdCBpZiBzZXEgZG9lcyB3cmFwIHdlCj4gCSAqIHdpbGwgYWx3YXlzIGNs
ZWFyIHRoZSBiZWxvdyBzbGVlcCBpbiBzb21lIHJlYXNvbmFibGUgdGltZSBhcwo+IAkgKiBtbW5f
bW0tPmludmFsaWRhdGVfc2VxIGlzIGV2ZW4gaW4gdGhlIGlkbGUgc3RhdGUuCj4gCSAqLwoKWWVz
IGZpbmUgd2l0aCBtZS4KClsuLi5dCgo+ID4gPiA+ICsJbWlnaHRfbG9jaygmbW0tPm1tYXBfc2Vt
KTsKPiA+ID4gPiArCj4gPiA+ID4gKwltbW5fbW0gPSBzbXBfbG9hZF9hY3F1aXJlKCZtbS0+bW11
X25vdGlmaWVyX21tKTsKPiA+ID4gCj4gPiA+IFdoYXQgZG9lcyB0aGUgYWJvdmUgcGFpciB3aXRo
PyBTaG91bGQgaGF2ZSBhIGNvbW1lbnQgdGhhdCBzcGVjaWZpZXMgdGhhdC4KPiA+IAo+ID4gSXQg
d2FzIGRpc2N1c3NlZCBpbiB2MSBidXQgbWF5YmUgYSBjb21tZW50IG9mIHdoYXQgd2FzIHNhaWQg
YmFjayB0aGVuIHdvdWxkCj4gPiBiZSBoZWxwZnVsLiBTb21ldGhpbmcgbGlrZToKPiA+IAo+ID4g
LyoKPiA+ICAqIFdlIG5lZWQgdG8gaW5zdXJlIHRoYXQgYWxsIHdyaXRlcyB0byBtbS0+bW11X25v
dGlmaWVyX21tIGFyZSB2aXNpYmxlIGJlZm9yZQo+ID4gICogYW55IGNoZWNrcyB3ZSBkbyBvbiBt
bW5fbW0gYmVsb3cgYXMgb3RoZXJ3aXNlIENQVSBtaWdodCByZS1vcmRlciB3cml0ZSBkb25lCj4g
PiAgKiBieSBhbm90aGVyIENQVSBjb3JlIHRvIG1tLT5tbXVfbm90aWZpZXJfbW0gc3RydWN0dXJl
IGZpZWxkcyBhZnRlciB0aGUgcmVhZAo+ID4gICogYmVsb3dzLgo+ID4gICovCj4gCj4gVGhpcyBj
b21tZW50IG1hZGUgaXQsIGp1c3QgYXQgdGhlIHN0b3JlIHNpZGU6Cj4gCj4gCS8qCj4gCSAqIFNl
cmlhbGl6ZSB0aGUgdXBkYXRlIGFnYWluc3QgbW11X25vdGlmaWVyX3VucmVnaXN0ZXIuIEEKPiAJ
ICogc2lkZSBub3RlOiBtbXVfbm90aWZpZXJfcmVsZWFzZSBjYW4ndCBydW4gY29uY3VycmVudGx5
IHdpdGgKPiAJICogdXMgYmVjYXVzZSB3ZSBob2xkIHRoZSBtbV91c2VycyBwaW4gKGVpdGhlciBp
bXBsaWNpdGx5IGFzCj4gCSAqIGN1cnJlbnQtPm1tIG9yIGV4cGxpY2l0bHkgd2l0aCBnZXRfdGFz
a19tbSgpIG9yIHNpbWlsYXIpLgo+IAkgKiBXZSBjYW4ndCByYWNlIGFnYWluc3QgYW55IG90aGVy
IG1tdSBub3RpZmllciBtZXRob2QgZWl0aGVyCj4gCSAqIHRoYW5rcyB0byBtbV90YWtlX2FsbF9s
b2NrcygpLgo+IAkgKgo+IAkgKiByZWxlYXNlIHNlbWFudGljcyBvbiB0aGUgaW5pdGlhbGl6YXRp
b24gb2YgdGhlIG1tdV9ub3RpZmllcl9tbSdzCj4gICAgICAgICAgKiBjb250ZW50cyBhcmUgcHJv
dmlkZWQgZm9yIHVubG9ja2VkIHJlYWRlcnMuICBhY3F1aXJlIGNhbiBvbmx5IGJlCj4gICAgICAg
ICAgKiB1c2VkIHdoaWxlIGhvbGRpbmcgdGhlIG1tZ3JhYiBvciBtbWdldCwgYW5kIGlzIHNhZmUg
YmVjYXVzZSBvbmNlCj4gICAgICAgICAgKiBjcmVhdGVkIHRoZSBtbXVfbm90aWZpZmVyX21tIGlz
IG5vdCBmcmVlZCB1bnRpbCB0aGUgbW0gaXMKPiAgICAgICAgICAqIGRlc3Ryb3llZC4gIEFzIGFi
b3ZlLCB1c2VycyBob2xkaW5nIHRoZSBtbWFwX3NlbSBvciBvbmUgb2YgdGhlCj4gICAgICAgICAg
KiBtbV90YWtlX2FsbF9sb2NrcygpIGRvIG5vdCBuZWVkIHRvIHVzZSBhY3F1aXJlIHNlbWFudGlj
cy4KPiAJICovCj4gCWlmIChtbXVfbm90aWZpZXJfbW0pCj4gCQlzbXBfc3RvcmVfcmVsZWFzZSgm
bW0tPm1tdV9ub3RpZmllcl9tbSwgbW11X25vdGlmaWVyX21tKTsKPiAKPiBXaGljaCBJIHRoaW5r
IGlzIHJlYWxseSBvdmVybHkgYmVsYWJvcmluZyB0aGUgdHlwaWNhbCBzbXAKPiBzdG9yZS9yZWxl
YXNlIHBhdHRlcm4sIGJ1dCBwZW9wbGUgZG8gc2VlbSB1bmZhbWlsaWFyIHdpdGggdGhlbS4uLgoK
UGVyZmVjdCB3aXRoIG1lLiBJIHRoaW5rIGFsc28gc29tZXRpbWVzIHlvdSBmb3Jnb3Qgd2hhdCBt
ZW1vcnkgbW9kZWwgaXMKYW5kIHRodXMgc3RvcmUvcmVsZWFzZSBwYXR0ZXJuIGRvLCBpIGtub3cg
aSBkbyBhbmQgaSBuZWVkIHRvIHJlZnJlc2ggbXkKbWluZC4KCkNoZWVycywKSsOpcsO0bWUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
