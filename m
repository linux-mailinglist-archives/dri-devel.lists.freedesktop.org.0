Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1D22F37B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 17:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188C89BC2;
	Mon, 27 Jul 2020 15:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C4F89BC2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 15:09:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88571B71A;
 Mon, 27 Jul 2020 15:09:19 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <06e21488-25a6-1c9f-366b-3c2ab63e4632@suse.com>
Date: Mon, 27 Jul 2020 17:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727091342.52325-5-roger.pau@citrix.com>
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

T24gMjcuMDcuMjAgMTE6MTMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBUbyBiZSB1c2VkIGlu
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
IG9uIG1lbW9yeSBob3RwbHVnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IEkndmUgbm90IGFkZGVkIGEgbmV3IG1lbW9y
eV90eXBlIHR5cGUgYW5kIGp1c3QgdXNlZAo+IE1FTU9SWV9ERVZJQ0VfREVWREFYIHdoaWNoIHNl
ZW1zIHRvIGJlIHdoYXQgd2Ugd2FudCBmb3Igc3VjaCBtZW1vcnkKPiByZWdpb25zLiBJJ20gdW5z
dXJlIHdoZXRoZXIgYWJ1c2luZyB0aGlzIHR5cGUgaXMgZmluZSwgb3IgaWYgSSBzaG91bGQKPiBp
bnN0ZWFkIGFkZCBhIHNwZWNpZmljIHR5cGUsIG1heWJlIE1FTU9SWV9ERVZJQ0VfR0VORVJJQz8g
SSBkb24ndAo+IHRoaW5rIHdlIHNob3VsZCBiZSB1c2luZyBhIHNwZWNpZmljIFhlbiB0eXBlIGF0
IGFsbC4KCldoYXQgYWJvdXQgaW50cm9kdWNpbmcgTUVNT1JZX0RFVklDRV9WSVJUPyBUaGUgY29t
bWVudCBmb3IKTUVNT1JZX0RFVklDRV9ERVZEQVggZG9lc24ndCByZWFsbHkgZml0LCBhcyB0aGVy
ZSBpcyBubyBjaGFyYWN0ZXIgZGV2aWNlCmludm9sdmVkLgoKSW4gdGhlIGVuZCBpdHMgdGhlIG1l
bW9yeSBtYW5hZ2VtZW50IG1haW50YWluZXJzIHRvIGRlY2lkZSB0aGF0LgoKT3RoZXIgdGhhbiB0
aGF0IHlvdSBjYW4gaGF2ZSBteQoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCgpKdWVyZ2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
