Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234844DC4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED02B89024;
	Thu, 13 Jun 2019 20:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3499C89024;
 Thu, 13 Jun 2019 20:48:33 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B3942133D;
 Thu, 13 Jun 2019 20:48:32 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:48:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: dev_pagemap related cleanups
Message-Id: <20190613134831.a7ecb1b422a732bff156ec50@linux-foundation.org>
In-Reply-To: <d0da4c86-ef52-b981-06af-b37e3e0515ee@deltatee.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
 <CAPcyv4hx=ng3SxzAWd8s_8VtAfoiiWhiA5kodi9KPc=jGmnejg@mail.gmail.com>
 <d0da4c86-ef52-b981-06af-b37e3e0515ee@deltatee.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560458913;
 bh=QBKFiYL+IE6QfIxDxWONJrMHcfZVbZUqMyER/iI/i+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W8RFMGE2XEBfIMgZiJVLDJlgDCfrRRk8a5YMGm6NJWq3iOW7BFqDgEcE3jR3EzuxH
 6mecnfow3Qth0X+c0FNOd8EU7Tgs7NtIzjtvm3fET+fi8GtnZHvccohCORja+Kjvbx
 qMyCzCY6jdHR6rPl/G9MUU/Sgsma/isYN3+x1ZvE=
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBKdW4gMjAxOSAxNDoyNDoyMCAtMDYwMCBMb2dhbiBHdW50aG9ycGUgPGxvZ2Fu
Z0BkZWx0YXRlZS5jb20+IHdyb3RlOgoKPiAKPiAKPiBPbiAyMDE5LTA2LTEzIDI6MjEgcC5tLiwg
RGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMToxOCBQTSBM
b2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+
Pgo+ID4+IE9uIDIwMTktMDYtMTMgMTI6MjcgcC5tLiwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4+
PiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAyOjQzIEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBIaSBEYW4sIErDqXLDtG1lIGFuZCBKYXNvbiwK
PiA+Pj4+Cj4gPj4+PiBiZWxvdyBpcyBhIHNlcmllcyB0aGF0IGNsZWFucyB1cCB0aGUgZGV2X3Bh
Z2VtYXAgaW50ZXJmYWNlIHNvIHRoYXQKPiA+Pj4+IGl0IGlzIG1vcmUgZWFzaWx5IHVzYWJsZSwg
d2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3cmFwIGl0IGluIGhtbQo+ID4+Pj4gYW5kIHRodXMg
YWxsb3dpbmcgdG8ga2lsbCBhIGxvdCBvZiBjb2RlCj4gPj4+Pgo+ID4+Pj4gRGlmZnN0YXQ6Cj4g
Pj4+Pgo+ID4+Pj4gIDIyIGZpbGVzIGNoYW5nZWQsIDI0NSBpbnNlcnRpb25zKCspLCA4MDIgZGVs
ZXRpb25zKC0pCj4gPj4+Cj4gPj4+IEhvb3JheSEKPiA+Pj4KPiA+Pj4+IEdpdCB0cmVlOgo+ID4+
Pj4KPiA+Pj4+ICAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQg
aG1tLWRldm1lbS1jbGVhbnVwCj4gPj4+Cj4gPj4+IEkganVzdCByZWFsaXplZCB0aGlzIGNvbGxp
ZGVzIHdpdGggdGhlIGRldl9wYWdlbWFwIHJlbGVhc2UgcmV3b3JrIGluCj4gPj4+IEFuZHJldydz
IHRyZWUgKGNvbW1pdCBpZHMgYmVsb3cgYXJlIGZyb20gbmV4dC5naXQgYW5kIGFyZSBub3Qgc3Rh
YmxlKQo+ID4+Pgo+ID4+PiA0NDIyZWU4NDc2ZjAgbW0vZGV2bV9tZW1yZW1hcF9wYWdlczogZml4
IGZpbmFsIHBhZ2UgcHV0IHJhY2UKPiA+Pj4gNzcxZjA3MTRkMGRjIFBDSS9QMlBETUE6IHRyYWNr
IHBnbWFwIHJlZmVyZW5jZXMgcGVyIHJlc291cmNlLCBub3QgZ2xvYmFsbHkKPiA+Pj4gYWYzNzA4
NWRlOTA2IGxpYi9nZW5hbGxvYzogaW50cm9kdWNlIGNodW5rIG93bmVycwo+ID4+PiBlMDA0N2Zm
OGFhNzcgUENJL1AyUERNQTogZml4IHRoZSBnZW5fcG9vbF9hZGRfdmlydCgpIGZhaWx1cmUgcGF0
aAo+ID4+PiAwMzE1ZDQ3ZDZhZTkgbW0vZGV2bV9tZW1yZW1hcF9wYWdlczogaW50cm9kdWNlIGRl
dm1fbWVtdW5tYXBfcGFnZXMKPiA+Pj4gMjE2NDc1YzdlYWE4IGRyaXZlcnMvYmFzZS9kZXZyZXM6
IGludHJvZHVjZSBkZXZtX3JlbGVhc2VfYWN0aW9uKCkKPiA+Pj4KPiA+Pj4gQ09ORkxJQ1QgKGNv
bnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiB0b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFw
LmMKPiA+Pj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBtbS9obW0uYwo+
ID4+PiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGtlcm5lbC9tZW1yZW1h
cC5jCj4gPj4+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gaW5jbHVkZS9s
aW51eC9tZW1yZW1hcC5oCj4gPj4+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3Qg
aW4gZHJpdmVycy9wY2kvcDJwZG1hLmMKPiA+Pj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBj
b25mbGljdCBpbiBkcml2ZXJzL252ZGltbS9wbWVtLmMKPiA+Pj4gQ09ORkxJQ1QgKGNvbnRlbnQp
OiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL2RheC9kZXZpY2UuYwo+ID4+PiBDT05GTElDVCAo
Y29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvZGF4L2RheC1wcml2YXRlLmgKPiA+
Pj4KPiA+Pj4gUGVyaGFwcyB3ZSBzaG91bGQgcHVsbCB0aG9zZSBvdXQgYW5kIHJlc2VuZCB0aGVt
IHRocm91Z2ggaG1tLmdpdD8KPiA+Pgo+ID4+IEhtbSwgSSd2ZSBiZWVuIHdhaXRpbmcgZm9yIHRo
b3NlIHBhdGNoZXMgdG8gZ2V0IGluIGZvciBhIGxpdHRsZSB3aGlsZSBub3cgOygKPiA+IAo+ID4g
VW5sZXNzIEFuZHJldyB3YXMgZ29pbmcgdG8gc3VibWl0IGFzIHY1LjItcmMgZml4ZXMgSSB0aGlu
ayBJIHNob3VsZAo+ID4gcmViYXNlIC8gc3VibWl0IHRoZW0gb24gY3VycmVudCBobW0uZ2l0IGFu
ZCB0aGVuIHRocm93IHRoZXNlIGNsZWFudXBzCj4gPiBmcm9tIENocmlzdG9waCBvbiB0b3A/Cj4g
Cj4gV2hhdGV2ZXIgeW91IGZlZWwgaXMgYmVzdC4gSSdtIGp1c3QgaG9waW5nIHRoZXkgZ2V0IGlu
IHNvb25lciByYXRoZXIKPiB0aGFuIGxhdGVyLiBUaGV5IGRvIGZpeCBhIGJ1ZyBhZnRlciBhbGwu
IExldCBtZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvCj4gcmV0ZXN0IHRoZSBQMlBETUEgc3R1ZmYg
YWZ0ZXIgdGhlIHJlYmFzZS4KCkkgaGFkIHRoZW0gZG93biBmb3IgNS4zLXJjMS4gIEknbGwgc2Vu
ZCB0aGVtIGFsb25nIGZvciA1LjItcmM1IGluc3RlYWQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
