Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3525C56A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 17:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF15A6E1E5;
	Thu,  3 Sep 2020 15:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797536E1E5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE5D6AD60;
 Thu,  3 Sep 2020 15:30:09 +0000 (UTC)
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b1713f26-8202-ac1e-c18a-4989312219b9@suse.com>
Date: Thu, 3 Sep 2020 17:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901083326.21264-4-roger.pau@citrix.com>
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
 David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMDkuMjAgMTA6MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBUbyBiZSB1c2VkIGlu
IG9yZGVyIHRvIGNyZWF0ZSBmb3JlaWduIG1hcHBpbmdzLiBUaGlzIGlzIGJhc2VkIG9uIHRoZQo+
IFpPTkVfREVWSUNFIGZhY2lsaXR5IHdoaWNoIGlzIHVzZWQgYnkgcGVyc2lzdGVudCBtZW1vcnkg
ZGV2aWNlcyBpbgo+IG9yZGVyIHRvIGNyZWF0ZSBzdHJ1Y3QgcGFnZXMgYW5kIGtlcm5lbCB2aXJ0
dWFsIG1hcHBpbmdzIGZvciB0aGUgSU9NRU0KPiBhcmVhcyBvZiBzdWNoIGRldmljZXMuIE5vdGUg
dGhhdCBvbiBrZXJuZWxzIHdpdGhvdXQgc3VwcG9ydCBmb3IKPiBaT05FX0RFVklDRSBYZW4gd2ls
bCBmYWxsYmFjayB0byB1c2UgYmFsbG9vbmVkIHBhZ2VzIGluIG9yZGVyIHRvCj4gY3JlYXRlIGZv
cmVpZ24gbWFwcGluZ3MuCj4gCj4gVGhlIG5ld2x5IGFkZGVkIGhlbHBlcnMgdXNlIHRoZSBzYW1l
IHBhcmFtZXRlcnMgYXMgdGhlIGV4aXN0aW5nCj4ge2FsbG9jL2ZyZWV9X3hlbmJhbGxvb25lZF9w
YWdlcyBmdW5jdGlvbnMsIHdoaWNoIGFsbG93cyBmb3IgaW4tcGxhY2UKPiByZXBsYWNlbWVudCBv
ZiB0aGUgY2FsbGVycy4gT25jZSBhIG1lbW9yeSByZWdpb24gaGFzIGJlZW4gYWRkZWQgdG8gYmUK
PiB1c2VkIGFzIHNjcmF0Y2ggbWFwcGluZyBzcGFjZSBpdCB3aWxsIG5vIGxvbmdlciBiZSByZWxl
YXNlZCwgYW5kIHBhZ2VzCj4gcmV0dXJuZWQgYXJlIGtlcHQgaW4gYSBsaW5rZWQgbGlzdC4gVGhp
cyBhbGxvd3MgdG8gaGF2ZSBhIGJ1ZmZlciBvZgo+IHBhZ2VzIGFuZCBwcmV2ZW50cyByZXNvcnRp
bmcgdG8gZnJlcXVlbnQgYWRkaXRpb25zIGFuZCByZW1vdmFscyBvZgo+IHJlZ2lvbnMuCj4gCj4g
SWYgZW5hYmxlZCAoYmVjYXVzZSBaT05FX0RFVklDRSBpcyBzdXBwb3J0ZWQpIHRoZSB1c2FnZSBv
ZiB0aGUgbmV3Cj4gZnVuY3Rpb25hbGl0eSB1bnRhbmdsZXMgWGVuIGJhbGxvb24gYW5kIFJBTSBo
b3RwbHVnIGZyb20gdGhlIHVzYWdlIG9mCj4gdW5wb3B1bGF0ZWQgcGh5c2ljYWwgbWVtb3J5IHJh
bmdlcyB0byBtYXAgZm9yZWlnbiBwYWdlcywgd2hpY2ggaXMgdGhlCj4gY29ycmVjdCB0aGluZyB0
byBkbyBpbiBvcmRlciB0byBhdm9pZCBtYXBwaW5ncyBvZiBmb3JlaWduIHBhZ2VzIGRlcGVuZAo+
IG9uIG1lbW9yeSBob3RwbHVnLgo+IAo+IE5vdGUgdGhlIGRyaXZlciBpcyBjdXJyZW50bHkgbm90
IGVuYWJsZWQgb24gQXJtIHBsYXRmb3JtcyBiZWNhdXNlIGl0Cj4gd291bGQgaW50ZXJmZXJlIHdp
dGggdGhlIGlkZW50aXR5IG1hcHBpbmcgcmVxdWlyZWQgb24gc29tZSBwbGF0Zm9ybXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpT
b3JyeSwgSSBqdXN0IGdvdCBhIGJ1aWxkIGVycm9yIGZvciB4ODYgMzItYml0IGJ1aWxkOgoKV0FS
TklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgWk9ORV9ERVZJQ0UK
ICAgRGVwZW5kcyBvbiBbbl06IE1FTU9SWV9IT1RQTFVHIFs9bl0gJiYgTUVNT1JZX0hPVFJFTU9W
RSBbPW5dICYmIApTUEFSU0VNRU1fVk1FTU1BUCBbPW5dICYmIEFSQ0hfSEFTX1BURV9ERVZNQVAg
Wz1uXQogICBTZWxlY3RlZCBieSBbeV06CiAgIC0gWEVOX1VOUE9QVUxBVEVEX0FMTE9DIFs9eV0g
JiYgWEVOIFs9eV0gJiYgWDg2IFs9eV0KICAgR0VOICAgICBNYWtlZmlsZQogICBDQyAgICAgIGtl
cm5lbC9ib3VuZHMucwogICBDQUxMICAgIC9ob21lL2dyb3NzL2tvcmcvc3JjL3NjcmlwdHMvYXRv
bWljL2NoZWNrLWF0b21pY3Muc2gKICAgVVBEICAgICBpbmNsdWRlL2dlbmVyYXRlZC9ib3VuZHMu
aAogICBDQyAgICAgIGFyY2gveDg2L2tlcm5lbC9hc20tb2Zmc2V0cy5zCkluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAvaG9tZS9ncm9zcy9rb3JnL3NyYy9pbmNsdWRlL2xpbnV4L21tem9uZS5oOjE5OjAs
CiAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvZ3Jvc3Mva29yZy9zcmMvaW5jbHVkZS9saW51
eC9nZnAuaDo2LAogICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2dyb3NzL2tvcmcvc3JjL2lu
Y2x1ZGUvbGludXgvc2xhYi5oOjE1LAogICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2dyb3Nz
L2tvcmcvc3JjL2luY2x1ZGUvbGludXgvY3J5cHRvLmg6MTksCiAgICAgICAgICAgICAgICAgIGZy
b20gL2hvbWUvZ3Jvc3Mva29yZy9zcmMvYXJjaC94ODYva2VybmVsL2FzbS1vZmZzZXRzLmM6OToK
L2hvbWUvZ3Jvc3Mva29yZy9zcmMvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLWxheW91dC5oOjk1
OjI6IGVycm9yOiAKI2Vycm9yICJOb3QgZW5vdWdoIGJpdHMgaW4gcGFnZSBmbGFncyIKICAjZXJy
b3IgIk5vdCBlbm91Z2ggYml0cyBpbiBwYWdlIGZsYWdzIgogICBefn5+fgptYWtlWzJdOiAqKiog
Wy9ob21lL2dyb3NzL2tvcmcvc3JjL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MTE0OiAKYXJjaC94
ODYva2VybmVsL2FzbS1vZmZzZXRzLnNdIEVycm9yIDEKbWFrZVsxXTogKioqIFsvaG9tZS9ncm9z
cy9rb3JnL3NyYy9NYWtlZmlsZToxMTc1OiBwcmVwYXJlMF0gRXJyb3IgMgptYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeSAnL2hvbWUvZ3Jvc3Mva29yZy94ODYzMicKbWFrZTogKioqIFtNYWtlZmls
ZToxODU6IF9fc3ViLW1ha2VdIEVycm9yIDIKCgpKdWVyZ2VuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
