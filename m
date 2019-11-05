Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE24F05F2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738E96EB5B;
	Tue,  5 Nov 2019 19:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7C26E0C2;
 Tue,  5 Nov 2019 14:44:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80C58AF3E;
 Tue,  5 Nov 2019 14:44:03 +0000 (UTC)
Subject: Re: [PATCH v2 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-9-jgg@ziepe.ca> <20191101182611.GA31478@ziepe.ca>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <66b50cf6-89ac-81c8-e29a-b34f7f38633e@suse.com>
Date: Tue, 5 Nov 2019 15:44:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191101182611.GA31478@ziepe.ca>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMTEuMTkgMTk6MjYsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBNb24sIE9jdCAy
OCwgMjAxOSBhdCAwNToxMDoyNVBNIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+IEZy
b206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4KPj4gRE1BX1NIQVJFRF9C
VUZGRVIgY2FuIG5vdCBiZSBlbmFibGVkIGJ5IHRoZSB1c2VyIChpdCByZXByZXNlbnRzIGEgbGli
cmFyeQo+PiBzZXQgaW4gdGhlIGtlcm5lbCkuIFRoZSBrY29uZmlnIGNvbnZlbnRpb24gaXMgdG8g
dXNlIHNlbGVjdCBmb3Igc3VjaAo+PiBzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5lZCBvbiBpbXBs
aWNpdGx5IHdoZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcKPj4gdGhhdCBuZWVkcyB0aGVt
Lgo+Pgo+PiBPdGhlcndpc2UgdGhlIFhFTl9HTlRERVZfRE1BQlVGIGtjb25maWcgaXMgb3Zlcmx5
IGRpZmZpY3VsdCB0byBlbmFibGUuCj4+Cj4+IEZpeGVzOiA5MzJkNjU2MjE3OWUgKCJ4ZW4vZ250
ZGV2OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBkbWEtYnVmIFVBUEkiKQo+PiBDYzogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+PiBD
YzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4gQ2M6IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+PiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBS
ZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMveGVuL0tjb25maWcgfCAzICsrLQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBKdWVyZ2Vu
L09sZWtzYW5kci9YZW4gTWFpbnRhaW5lcnM6Cj4gCj4gV291bGQgeW91IHRha2UgdGhpcyBwYXRj
aCB0aHJvdWdoIGEgeGVuIHJlbGF0ZWQgdHJlZT8gVGhlIG9ubHkgcmVhc29uCj4gSSBoYWQgaW4g
dGhpcyBzZXJpZXMgaXMgdG8gbWFrZSBpdCBlYXNpZXIgdG8gY29tcGlsZS10ZXN0IHRoZSBnbnRk
ZXYKPiBjaGFuZ2VzLgoKWWVzLCBJIGNhbiB0YWtlIGl0IGZvciA1LjUuCgoKSnVlcmdlbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
