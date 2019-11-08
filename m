Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D5F4D66
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 14:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFD36F98F;
	Fri,  8 Nov 2019 13:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF06F994
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 13:43:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Rd7IsiSjOY2MUWNuakLiow-1; Fri, 08 Nov 2019 08:43:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69BA41800D7B;
 Fri,  8 Nov 2019 13:43:33 +0000 (UTC)
Received: from redhat.com (ovpn-123-175.rdu2.redhat.com [10.10.123.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C09196AE;
 Fri,  8 Nov 2019 13:43:30 +0000 (UTC)
Date: Fri, 8 Nov 2019 08:43:28 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Message-ID: <20191108134328.GA4456@redhat.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107200604.GB21728@mellanox.com>
 <20191108063302.GA18778@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20191108063302.GA18778@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Rd7IsiSjOY2MUWNuakLiow-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573220620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2GiDgurLDTLnKDD84ZeRHZfEMXgwhDnYu1U65URo2k=;
 b=X5L1L1Dvt2VD4wgLd2ThvFRorrC8z5//fvXQ9/D1v1E/2zDmfPkj32me7SDxMbtG0L4sQn
 CWXx1Nib6/EE+M5vWD+6/6K4N0sYzAxoqKyEz2zyI467tQ0pjwgXzk4nv99/lpjOMppzID
 zGpLW6xlhs2eIVVkQm7VD/4jFld+RT8=
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
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTA6MzM6MDJQTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6MDY6MDhQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiAKPiA+ID4gZW51bSBtbXVfcmFuZ2Vfbm90aWZpZXJf
ZXZlbnQgewo+ID4gPiAJTU1VX05PVElGWV9SRUxFQVNFLAo+ID4gPiB9Owo+ID4gPiAKPiA+ID4g
Li4uYXNzdW1pbmcgdGhhdCB3ZSBzdGF5IHdpdGggIm1tdV9yYW5nZV9ub3RpZmllciIgYXMgYSBj
b3JlIG5hbWUgZm9yIHRoaXMgCj4gPiA+IHdob2xlIHRoaW5nLgo+ID4gPiAKPiA+ID4gQWxzbywg
aXQgaXMgYmVzdCBtb3ZlZCBkb3duIHRvIGJlIG5leHQgdG8gdGhlIG5ldyBNTlIgc3RydWN0cywg
c28gdGhhdCBhbGwgdGhlCj4gPiA+IE1OUiBzdHVmZiBpcyBpbiBvbmUgZ3JvdXAuCj4gPiAKPiA+
IEkgYWdyZWUgd2l0aCBKZXJvbWUsIHRoaXMgZW51bSBpcyBwYXJ0IG9mIHRoZSAnc3RydWN0Cj4g
PiBtbXVfbm90aWZpZXJfcmFuZ2UnIChpZSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIGludmFsaWRh
dGlvbikgYW5kIGl0Cj4gPiBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgdGhhdCBvbmx5IHRoZXNlIG5l
dyBub3RpZmllcnMgY2FuIGJlIGNhbGxlZCB3aXRoCj4gPiB0aGlzIHR5cGUsIGl0IGlzIHN0aWxs
IHBhcnQgb2YgdGhlIG1tdV9ub3RpZmllcl9yYW5nZS4KPiA+IAo+ID4gVGhlIGNvbW1lbnQgYWxy
ZWFkeSBzYXlzIGl0IG9ubHkgYXBwbGllcyB0byB0aGUgbW11X3JhbmdlX25vdGlmaWVyCj4gPiBz
Y2hlbWUuLgo+IAo+IEluIGZhY3QgdGhlIGVudW0gaXMgZW50aXJlbHkgdW51c2VkLiAgV2UgbWln
aHQgYXMgd2VsbCBqdXN0IGtpbGwgaXQgb2ZmCj4gZW50aXJlbHkuCgpJIGhhZCBwYXRjaGVzIHRv
IHVzZSBpdCwgaSBuZWVkIHRvIHJlLXBvc3QgdGhlbS4gSSBwb3N0ZWQgdGhlbSBsb25nIGFnbwph
bmQgaSBkcm9wZWQgdGhlIGJhbGwuIEkgd2lsbCByZS1zcGluIGFmdGVyIHRoaXMuCgpDaGVlcnMs
CkrDqXLDtG1lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
