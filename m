Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B18244A02
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 14:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55DE6EB33;
	Fri, 14 Aug 2020 12:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7C6EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 12:54:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF0B4B039;
 Fri, 14 Aug 2020 12:55:02 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org> <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org> <20200814095629.GJ975@Air-de-Roger>
 <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
 <20200814124724.GK975@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fc10d3a5-fe79-335e-353a-1bf480af7c7c@suse.com>
Date: Fri, 14 Aug 2020 14:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814124724.GK975@Air-de-Roger>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQuMDguMjAgMTQ6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MTQsIDIwMjAgYXQgMTI6Mjc6MzJQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTQuMDguMjAgMTE6NTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBGcmksIEF1ZyAx
NCwgMjAyMCBhdCAwODoyOToyMEFNICswMTAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+
PiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwOTo1NDoyMEFNICswMjAwLCBSb2dlciBQYXUgTW9u
bj8/IHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwODozMzozN0FNICswMTAw
LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0
IDExOjQ0OjQ3QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+PiBJZiBlbmFi
bGVkIChiZWNhdXNlIFpPTkVfREVWSUNFIGlzIHN1cHBvcnRlZCkgdGhlIHVzYWdlIG9mIHRoZSBu
ZXcKPj4+Pj4+PiBmdW5jdGlvbmFsaXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhv
dHBsdWcgZnJvbSB0aGUgdXNhZ2Ugb2YKPj4+Pj4+PiB1bnBvcHVsYXRlZCBwaHlzaWNhbCBtZW1v
cnkgcmFuZ2VzIHRvIG1hcCBmb3JlaWduIHBhZ2VzLCB3aGljaCBpcyB0aGUKPj4+Pj4+PiBjb3Jy
ZWN0IHRoaW5nIHRvIGRvIGluIG9yZGVyIHRvIGF2b2lkIG1hcHBpbmdzIG9mIGZvcmVpZ24gcGFn
ZXMgZGVwZW5kCj4+Pj4+Pj4gb24gbWVtb3J5IGhvdHBsdWcuCj4+Pj4+Pgo+Pj4+Pj4gU28gcGxl
YXNlIGp1c3Qgc2VsZWN0IFpPTkVfREVWSUNFIGlmIHRoaXMgaXMgc28gbXVjaCBiZXR0ZXIgcmF0
aGVyCj4+Pj4+PiB0aGFuIG1haW50YWluaW5nIHR3byB2YXJpYW50cy4KPj4+Pj4KPj4+Pj4gV2Ug
c3RpbGwgbmVlZCB0byBvdGhlciB2YXJpYW50IGZvciBBcm0gYXQgbGVhc3QsIHNvIGJvdGggbmVl
ZCB0byBiZQo+Pj4+PiBtYWludGFpbmVkIGFueXdheSwgZXZlbiBpZiB3ZSBmb3JjZSBaT05FX0RF
VklDRSBvbiB4ODYuCj4+Pj4KPj4+PiBXZWxsLCBpdCBzdGlsbCByZWFsbHkgaGVscHMgcmVwcm9k
dWNhYmlsaXR5IGlmIHlvdSBzdGljayB0byBvbmUKPj4+PiBpbXBsZW1lbnRhdGlvbiBvZiB4ODYu
Cj4+Pj4KPj4+PiBUaGUgYWx0ZXJuYXRpdmUgd291bGQgYmUgYW4gZXhwbGljaXQgY29uZmlnIG9w
dGlvbiB0byBvcHQgaW50byBpdCwKPj4+PiBidXQganVzdCBnZXR0aW5nIGEgZGlmZmVyZW50IGlt
cGxlbWVudGF0aW9uIGJhc2VkIG9uIGEgcmFuZG9tCj4+Pj4ga2VybmVsIG9wdGlvbiBpcyBzdHJh
bmdlLgo+Pj4KPj4+IFdvdWxkIGFkZGluZyBzb21ldGhpbmcgbGlrZSB0aGUgY2h1bmsgYmVsb3cg
dG8gdGhlIHBhdGNoIGJlIE9LPwo+Pj4KPj4+IC0tLTg8LS0tCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMveGVuL0tjb25maWcKPj4+IGluZGV4IDAxODAyMGI5
MWJhYS4uNWYzMjFhMTMxOWU2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vS2NvbmZpZwo+
Pj4gKysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZwo+Pj4gQEAgLTMyOCw3ICszMjgsMTQgQEAgY29u
ZmlnIFhFTl9GUk9OVF9QR0RJUl9TSEJVRgo+Pj4gICAgCXRyaXN0YXRlCj4+PiAgICBjb25maWcg
WEVOX1VOUE9QVUxBVEVEX0FMTE9DCj4+PiAtCWJvb2wKPj4+IC0JZGVmYXVsdCB5IGlmIFpPTkVf
REVWSUNFICYmICFBUk0gJiYgIUFSTTY0Cj4+PiArCWJvb2wgIlVzZSB1bnBvcHVsYXRlZCBtZW1v
cnkgcmFuZ2VzIGZvciBndWVzdCBtYXBwaW5ncyIKPj4+ICsJZGVwZW5kcyBvbiBYODYKPj4+ICsJ
c2VsZWN0IFpPTkVfREVWSUNFCj4+PiArCWRlZmF1bHQgeQo+Pgo+PiBJJ2QgcmF0aGVyIHVzZSAi
ZGVmYXVsdCBYRU5fQkFDS0VORCIgaGVyZSwgYXMgbWFwcGluZ3Mgb2Ygb3RoZXIgZ3Vlc3Qncwo+
PiBtZW1vcnkgaXMgcmFyZWx5IHVzZWQgZm9yIG5vbi1iYWNrZW5kIGd1ZXN0cy4KPiAKPiBUaGVy
ZSdzIGFsc28gdGhlIHByaXZjbWQgYW5kIGdudCBkZXZpY2VzIHdoaWNoIG1ha2UgaGVhdnkgdXNl
IG9mIHRoaXMsCj4gc28gSSdtIG5vdCBzdXJlIG9ubHkgc2VsZWN0aW5nIGJ5IGRlZmF1bHQgb24g
WEVOX0JBQ0tFTkQgaXMgdGhlIGJlc3QKPiBvcHRpb24uCgpJIGp1c3Qgd2FudCB0byBhdm9pZCB0
aGF0IGtlcm5lbHMgYnVpbHQgZm9yIHJ1bm5pbmcgYXMgWGVuIGd1ZXN0LCBidXQKbm90IGFzIGRv
bTAsIHdpbGwgYmUgZm9yY2VkIHRvIHNlbGVjdCBaT05FX0RFVklDRS4KCkFzIHByaXZjbWQgaXMg
ZG9tMC1vbmx5LCB0aGlzIGlzIG5vIHByb2JsZW0uCgpJbiBjYXNlIHlvdSBhcmUgd29ycnlpbmcg
YWJvdXQgZ250IGRldmljZXMsIEknZCBiZSBmaW5lIHRvIHN3aXRjaCB0bwoKZGVmYXVsdCBYRU5f
QkFDS0VORCB8fCBYRU5fR05UREVWCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
