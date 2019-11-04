Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DAEE984
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D292A6E85D;
	Mon,  4 Nov 2019 20:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8190A6E85D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 20:32:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-Z6X9SXkoPpydpMlPq3lbmg-1; Mon, 04 Nov 2019 15:32:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39197477;
 Mon,  4 Nov 2019 20:32:01 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE494600C4;
 Mon,  4 Nov 2019 20:31:54 +0000 (UTC)
Date: Mon, 4 Nov 2019 15:31:53 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104203153.GB7731@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Z6X9SXkoPpydpMlPq3lbmg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572899529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0t18qmWA+5595eIOsjZ92rtvApF9YJpqwJyzz983FX4=;
 b=FVZW2lpbqvJiFchSK8aK7TQ9NwyyxRFD1Ign9yZL1JLBHWgbSbWYQ4imG4817IKAuO9etR
 /nl6nKfrBIiWIQbR79GpgQAvTmulbRXrRjjGz9NCRiFgJFzMCFLzoJXRzJ14AfAU1gsA7m
 Y73CzaOudHWDz0takN06dgWR9UrEn80=
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTI6MDk6MDVQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEphc29uLCBhIHF1ZXN0aW9uIGZvciB5b3UgYXQgdGhlIGJvdHRvbS4KPiAKPiBPbiAx
MS80LzE5IDExOjUyIEFNLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+IC4uLgo+ID4+IENBU0UgMzog
T0RQCj4gPj4gLS0tLS0tLS0tLS0KPiA+PiBSRE1BIGhhcmR3YXJlIHdpdGggcGFnZSBmYXVsdGlu
ZyBzdXBwb3J0LiBIZXJlLCBhIHdlbGwtd3JpdHRlbiBkcml2ZXIgZG9lc24ndAo+ID4gCj4gPiBD
QVNFMzogSGFyZHdhcmUgd2l0aCBwYWdlIGZhdWx0IHN1cHBvcnQKPiA+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gCj4gPiBIZXJlLCBhIHdlbGwtd3JpdHRlbiAu
Li4uCj4gPiAKPiAKPiBBaCwgT0suIFNvIGp1c3QgZHJvcCB0aGUgZmlyc3Qgc2VudGVuY2UsIHll
cy4KPiAKPiAuLi4KPiA+Pj4+Pj4gKwkgKi8KPiA+Pj4+Pj4gKwlndXBfZmxhZ3MgfD0gRk9MTF9S
RU1PVEUgfCBGT0xMX1BJTjsKPiA+Pj4+Pgo+ID4+Pj4+IFdvdWxkbid0IGl0IGJlIGJldHRlciB0
byBub3QgYWRkIHBpbl9sb25ndGVybV9wYWdlc19yZW1vdGUoKSB1bnRpbAo+ID4+Pj4+IGl0IGNh
biBiZSBwcm9wZXJseSBpbXBsZW1lbnRlZCA/Cj4gPj4+Pj4KPiA+Pj4+Cj4gPj4+PiBXZWxsLCB0
aGUgcHJvYmxlbSBpcyB0aGF0IEkgbmVlZCBlYWNoIGNhbGwgc2l0ZSB0aGF0IHJlcXVpcmVzIEZP
TExfUElOCj4gPj4+PiB0byB1c2UgYSBwcm9wZXIgd3JhcHBlci4gSXQncyB0aGUgRk9MTF9QSU4g
dGhhdCBpcyB0aGUgZm9jdXMgaGVyZSwgYmVjYXVzZQo+ID4+Pj4gdGhlcmUgaXMgYSBoYXJkLCBi
cmlnaHQgcnVsZSwgd2hpY2ggaXM6IGlmIGFuZCBvbmx5IGlmIGEgY2FsbGVyIHNldHMKPiA+Pj4+
IEZPTExfUElOLCB0aGVuIHRoZSBkbWEtcGFnZSB0cmFja2luZyBoYXBwZW5zLCBhbmQgcHV0X3Vz
ZXJfcGFnZSgpIG11c3QKPiA+Pj4+IGJlIGNhbGxlZC4KPiA+Pj4+Cj4gPj4+PiBTbyB0aGlzIGxl
YXZlcyBtZSB3aXRoIG9ubHkgdHdvIHJlYXNvbmFibGUgY2hvaWNlczoKPiA+Pj4+Cj4gPj4+PiBh
KSBDb252ZXJ0IHRoZSBjYWxsIHNpdGUgYXMgYWJvdmU6IHBpbl9sb25ndGVybV9wYWdlc19yZW1v
dGUoKSwgd2hpY2ggc2V0cwo+ID4+Pj4gRk9MTF9QSU4gKHRoZSBrZXkgcG9pbnQhKSwgYW5kIGxl
YXZlcyB0aGUgRk9MTF9MT05HVEVSTSBzaXR1YXRpb24gZXhhY3RseQo+ID4+Pj4gYXMgaXQgaGFz
IGJlZW4gc28gZmFyLiBXaGVuIHRoZSBGT0xMX0xPTkdURVJNIHNpdHVhdGlvbiBpcyBmaXhlZCwg
dGhlIGNhbGwKPiA+Pj4+IHNpdGUgKm1pZ2h0KiBub3QgbmVlZCBhbnkgY2hhbmdlcyB0byBhZG9w
dCB0aGUgd29ya2luZyBndXAuYyBjb2RlLgo+ID4+Pj4KPiA+Pj4+IGIpIENvbnZlcnQgdGhlIGNh
bGwgc2l0ZSB0byBwaW5fdXNlcl9wYWdlc19yZW1vdGUoKSwgd2hpY2ggYWxzbyBzZXRzCj4gPj4+
PiBGT0xMX1BJTiwgYW5kIGFsc28gbGVhdmVzIHRoZSBGT0xMX0xPTkdURVJNIHNpdHVhdGlvbiBl
eGFjdGx5IGFzIGJlZm9yZS4KPiA+Pj4+IFRoZXJlIHdvdWxkIGFsc28gYmUgYSBjb21tZW50IGF0
IHRoZSBjYWxsIHNpdGUsIHRvIHRoZSBlZmZlY3Qgb2YsICJ0aGlzCj4gPj4+PiBpcyB0aGUgd3Jv
bmcgY2FsbCB0byBtYWtlOiBpdCByZWFsbHkgcmVxdWlyZXMgRk9MTF9MT05HVEVSTSBiZWhhdmlv
ciIuCj4gPj4+Pgo+ID4+Pj4gV2hlbiB0aGUgRk9MTF9MT05HVEVSTSBzaXR1YXRpb24gaXMgZml4
ZWQsIHRoZSBjYWxsIHNpdGUgd2lsbCBuZWVkIHRvIGJlCj4gPj4+PiBjaGFuZ2VkIHRvIHBpbl9s
b25ndGVybV9wYWdlc19yZW1vdGUoKS4KPiA+Pj4+Cj4gPj4+PiBTbyB5b3UgY2FuIHByb2JhYmx5
IHNlZSB3aHkgSSBwaWNrZWQgKGEpLgo+ID4+Pgo+ID4+PiBCdXQgcmlnaHQgbm93IG5vYm9keSBo
YXMgRk9MTF9MT05HVEVSTSBhbmQgRk9MTF9SRU1PVEUuIFNvIHlvdSBzaG91bGQKPiA+Pj4gbmV2
ZXIgaGF2ZSB0aGUgbmVlZCBmb3IgcGluX2xvbmd0ZXJtX3BhZ2VzX3JlbW90ZSgpLiBNeSBmZWFy
IGlzIHRoYXQKPiA+Pj4gbG9uZ3Rlcm0gaGFzIGltcGxpY2F0aW9uIGFuZCBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gbm90IGRyb3AgdGhpcyBpbXBsaWNhdGlvbgo+ID4+PiBieSBhZGRpbmcgYSB3cmFw
cGVyIHRoYXQgZG9lcyBub3QgZG8gd2hhdCB0aGUgbmFtZSBzYXlzLgo+ID4+Pgo+ID4+PiBTbyBk
byBub3QgaW50cm9kdWNlIHBpbl9sb25ndGVybV9wYWdlc19yZW1vdGUoKSB1bnRpbCBpdHMgZmly
c3QgdXNlcgo+ID4+PiBoYXBwZW5zLiBUaGlzIGlzIG9wdGlvbiBjKQo+ID4+Pgo+ID4+Cj4gPj4g
QWxtb3N0IGZvcmdvdCwgdGhvdWdoOiB0aGVyZSBpcyBhbHJlYWR5IGFub3RoZXIgdXNlcjogSW5m
aW5pYmFuZDoKPiA+Pgo+ID4+IGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW1fb2RwLmM6NjQ2
OiAgICAgICAgIG5wYWdlcyA9IHBpbl9sb25ndGVybV9wYWdlc19yZW1vdGUob3duaW5nX3Byb2Nl
c3MsIG93bmluZ19tbSwKPiA+IAo+ID4gb2RwIGRvIG5vdCBuZWVkIHRoYXQsIGkgdGhvdWdodCB0
aGUgSE1NIGNvbnZlcnRpb24gd2FzIGFscmVhZHkgdXBzdHJlYW0KPiA+IGJ1dCBzZWVtcyBub3Qs
IGluIGFueSBjYXNlIG9kcCBkbyBub3QgbmVlZCB0aGUgbG9uZ3Rlcm0gY2FzZSBpdCBvbmx5Cj4g
PiBzbyBiZXN0IGlzIHRvIHJldmVydCB0aGF0IHVzZXIgdG8gZ3VwX2Zhc3Qgb3Igc29tZXRoaW5n
IHVudGlsIGl0IGdldAo+ID4gY29udmVydGVkIHRvIEhNTS4KPiA+IAo+IAo+IE5vdGUgZm9yIEph
c29uOiB0aGUgKGEpIG9yIChiKSBpdGVtcyBhcmUgdGFsa2luZyBhYm91dCB0aGUgdmZpbyBjYXNl
LCB3aGljaCBpcwo+IG9uZSBvZiB0aGUgdHdvIGNhbGwgc2l0ZXMgdGhhdCBub3cgdXNlIHBpbl9s
b25ndGVybV9wYWdlc19yZW1vdGUoKSwgYW5kIHRoZQo+IG90aGVyIG9uZSBpcyBpbmZpbmliYW5k
Ogo+IAo+IGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW1fb2RwLmM6NjQ2OiAgICAgICAgIG5w
YWdlcyA9IHBpbl9sb25ndGVybV9wYWdlc19yZW1vdGUob3duaW5nX3Byb2Nlc3MsIG93bmluZ19t
bSwKPiBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jOjM1MzogICAgICAgICAgICByZXQg
PSBwaW5fbG9uZ3Rlcm1fcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwKCnZmaW8gc2hv
dWxkIGJlIHJldmVydGVkIHVudGlsIGl0IGNhbiBiZSBwcm9wZXJseSBpbXBsZW1lbnRlZC4KVGhl
IGlzc3VlIGlzIHRoYXQgd2hlbiB5b3UgZml4IHRoZSBpbXBsZW1lbnRhdGlvbiB5b3UgbWlnaHQK
YnJlYWsgdmZpbyBleGlzdGluZyB1c2VyIGFuZCB0aHVzIHJlZ3Jlc3MgdGhlIGtlcm5lbCBmcm9t
IHVzZXIKcG9pbnQgb2Ygdmlldy4gU28gaSByYXRoZXIgaGF2ZSB0aGUgY2hhbmdlIHRvIHZmaW8g
cmV2ZXJ0ZWQsCmkgYmVsaWV2ZSBpdCB3YXMgbm90IHdlbGwgdW5kZXJzdG9vZCB3aGVuIGl0IGdv
dCB1cHN0cmVhbSwKYmV0d2VlbiBpbiBteSA1LjQgdHJlZSBpdCBpcyBzdGlsbCBndXBfcmVtb3Rl
IG5vdCBsb25ndGVybS4KCgo+IEplcm9tZSwgSmFzb246IEkgcmVhbGx5IGRvbid0IHdhbnQgdG8g
cmV2ZXJ0IHRoZSBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UoKSAKPiBjb252ZXJzaW9ucyB0
aGF0IGFyZSBhbHJlYWR5IHRocm91Z2hvdXQgdGhlIElCIGRyaXZlci0tcG9pbnRsZXNzIGNodXJu
LCByaWdodD8KPiBJJ2QgcmF0aGVyIGVpdGhlciBkZWxldGUgdGhlbSBpbiBKYXNvbidzIHRyZWUs
IG9yIGdvIHdpdGggd2hhdCBJIGhhdmUgaGVyZQo+IHdoaWxlIHdhaXRpbmcgZm9yIHRoZSBkZWxl
dGlvbi4KPiAKPiBNYXliZSB3ZSBzaG91bGQganVzdCBzZXR0bGUgb24gKGEpIG9yIChiKSwgc28g
dGhhdCB0aGUgSUIgZHJpdmVyIGVuZHMgdXAgd2l0aAo+IHRoZSB3cmFwcGVyIGZ1bmN0aW9ucz8g
SW4gZmFjdCwgaWYgaXQncyBnZXR0aW5nIGRlbGV0ZWQsIHRoZW4gSSdkIHByZWZlciBsZWF2aW5n
Cj4gaXQgYXQgKGEpLCBzaW5jZSB0aGF0J3Mgc2ltcGxlLi4uCj4gCj4gSmFzb24gc2hvdWxkIHdl
aWdoIGluIG9uIGhvdyBoZSB3YW50cyB0aGlzIHRvIGdvLCB3aXRoIHJlc3BlY3QgdG8gYnJhbmNo
aW5nCj4gYW5kIG1lcmdpbmcsIHNpbmNlIGl0IHNvdW5kcyBsaWtlIHRoYXQgd2lsbCBjb25mbGlj
dCB3aXRoIHRoZSBobW0gYnJhbmNoIAo+IChoYSwgSSdtIG92ZXJkdWUgaW4gcmV2aWV3aW5nIGhp
cyBtbXUgbm90aWZpZXIgc2VyaWVzLCB0aGF0J3Mgd2hhdCBJIGdldCBmb3IKPiBiZWluZyBsYXRl
KS4KPiAKPiB0aGFua3MsCj4gCj4gSm9obiBIdWJiYXJkCj4gTlZJRElBCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
