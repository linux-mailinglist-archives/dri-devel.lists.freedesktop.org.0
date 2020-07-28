Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03E2312BD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44DC6E2F3;
	Tue, 28 Jul 2020 19:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jul 2020 17:51:43 UTC
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE546E221
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595958703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eHsq7Ta01QmeqnE9DLs8/mBiesJkCYGnL9YfXoA2X4o=;
 b=ghjgoMwJbmHdLVvyzLMdqWSkgamrHrQGW5WwSidYNTJEPP5zlS7Zze0I
 C1GZTrUkkQhHaZgNLeq+sc4CxBSTxBSb8YEjis+g4J0aBZBUswRZ5NhYk
 jwObQvxhHnXoxanZrOMH/Uo/iOE30yioAErzqGXHy6e2WsPTGVA5GcHVr 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2RdrO/AnzZYrb9zj19qTPY0bAooeEOHP1ELFiUghgXaTqNYu/IsfAaeOofDt0adaNBw2Xa0AC6
 t6lHyuGC5gkUWy/N7rzG8yB31qUpk6aKp4puI4SGJ8w7qoXEtqg8F+J/doKRdiBkCkcVvIxcwR
 q9J9cBAZhRCwaqR6vQaMZgUwvDwO9y4NebuTt/KmXt2MRQWqepK8FGyJefexjYCWZrVGObAaI8
 Yw/nTGNLt85irvc409hapDt3JL5ro6jwcrTY4qUVugZVoEP/hHQ79mpfhww2W8LLw7sXFLWMwl
 r/U=
X-SBRS: 2.7
X-MesageID: 23704211
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23704211"
Date: Tue, 28 Jul 2020 19:44:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200728174429.GC7191@Air-de-Roger>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
 <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDY6MTI6NDZQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDI4LzA3LzIwMjAgMTc6NTksIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAyOCwgMjAyMCBhdCAwNTo0ODoyM1BNICswMTAwLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gT24gMjcvMDcvMjAyMCAx
MDoxMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiA+IFRvIGJlIHVzZWQgaW4gb3JkZXIg
dG8gY3JlYXRlIGZvcmVpZ24gbWFwcGluZ3MuIFRoaXMgaXMgYmFzZWQgb24gdGhlCj4gPiA+ID4g
Wk9ORV9ERVZJQ0UgZmFjaWxpdHkgd2hpY2ggaXMgdXNlZCBieSBwZXJzaXN0ZW50IG1lbW9yeSBk
ZXZpY2VzIGluCj4gPiA+ID4gb3JkZXIgdG8gY3JlYXRlIHN0cnVjdCBwYWdlcyBhbmQga2VybmVs
IHZpcnR1YWwgbWFwcGluZ3MgZm9yIHRoZSBJT01FTQo+ID4gPiA+IGFyZWFzIG9mIHN1Y2ggZGV2
aWNlcy4gTm90ZSB0aGF0IG9uIGtlcm5lbHMgd2l0aG91dCBzdXBwb3J0IGZvcgo+ID4gPiA+IFpP
TkVfREVWSUNFIFhlbiB3aWxsIGZhbGxiYWNrIHRvIHVzZSBiYWxsb29uZWQgcGFnZXMgaW4gb3Jk
ZXIgdG8KPiA+ID4gPiBjcmVhdGUgZm9yZWlnbiBtYXBwaW5ncy4KPiA+ID4gPiAKPiA+ID4gPiBU
aGUgbmV3bHkgYWRkZWQgaGVscGVycyB1c2UgdGhlIHNhbWUgcGFyYW1ldGVycyBhcyB0aGUgZXhp
c3RpbmcKPiA+ID4gPiB7YWxsb2MvZnJlZX1feGVuYmFsbG9vbmVkX3BhZ2VzIGZ1bmN0aW9ucywg
d2hpY2ggYWxsb3dzIGZvciBpbi1wbGFjZQo+ID4gPiA+IHJlcGxhY2VtZW50IG9mIHRoZSBjYWxs
ZXJzLiBPbmNlIGEgbWVtb3J5IHJlZ2lvbiBoYXMgYmVlbiBhZGRlZCB0byBiZQo+ID4gPiA+IHVz
ZWQgYXMgc2NyYXRjaCBtYXBwaW5nIHNwYWNlIGl0IHdpbGwgbm8gbG9uZ2VyIGJlIHJlbGVhc2Vk
LCBhbmQgcGFnZXMKPiA+ID4gPiByZXR1cm5lZCBhcmUga2VwdCBpbiBhIGxpbmtlZCBsaXN0LiBU
aGlzIGFsbG93cyB0byBoYXZlIGEgYnVmZmVyIG9mCj4gPiA+ID4gcGFnZXMgYW5kIHByZXZlbnRz
IHJlc29ydGluZyB0byBmcmVxdWVudCBhZGRpdGlvbnMgYW5kIHJlbW92YWxzIG9mCj4gPiA+ID4g
cmVnaW9ucy4KPiA+ID4gPiAKPiA+ID4gPiBJZiBlbmFibGVkIChiZWNhdXNlIFpPTkVfREVWSUNF
IGlzIHN1cHBvcnRlZCkgdGhlIHVzYWdlIG9mIHRoZSBuZXcKPiA+ID4gPiBmdW5jdGlvbmFsaXR5
IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhvdHBsdWcgZnJvbSB0aGUgdXNhZ2Ugb2YK
PiA+ID4gPiB1bnBvcHVsYXRlZCBwaHlzaWNhbCBtZW1vcnkgcmFuZ2VzIHRvIG1hcCBmb3JlaWdu
IHBhZ2VzLCB3aGljaCBpcyB0aGUKPiA+ID4gPiBjb3JyZWN0IHRoaW5nIHRvIGRvIGluIG9yZGVy
IHRvIGF2b2lkIG1hcHBpbmdzIG9mIGZvcmVpZ24gcGFnZXMgZGVwZW5kCj4gPiA+ID4gb24gbWVt
b3J5IGhvdHBsdWcuCj4gPiA+IEkgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBicmVhayBEb20wIG9u
IEFybSBpZiB0aGUga2VybmVsIGhhcyBiZWVuIGJ1aWx0IHdpdGgKPiA+ID4gaG90cGx1Zy4gVGhp
cyBpcyBiZWNhdXNlIHlvdSBtYXkgZW5kIHVwIHRvIHJlLXVzZSByZWdpb24gdGhhdCB3aWxsIGJl
IHVzZWQKPiA+ID4gZm9yIHRoZSAxOjEgbWFwcGluZyBvZiBhIGZvcmVpZ24gbWFwLgo+ID4gPiAK
PiA+ID4gTm90ZSB0aGF0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGhvdHBsdWcgaGFzIGJlZW4gdGVz
dGVkIG9uIFhlbiBvbiBBcm0geWV0LiBTbwo+ID4gPiBpdCBtaWdodCBiZSBwb3NzaWJsZSB0byBi
ZSBhbHJlYWR5IGJyb2tlbi4KPiA+ID4gCj4gPiA+IE1lYW53aGlsZSwgbXkgc3VnZ2VzdGlvbiB3
b3VsZCBiZSB0byBtYWtlIHRoZSB1c2Ugb2YgaG90cGx1ZyBpbiB0aGUgYmFsbG9vbgo+ID4gPiBj
b2RlIGNvbmRpdGlvbmFsIChtYXliZSB1c2luZyBDT05GSUdfQVJNNjQgYW5kIENPTkZJR19BUk0p
Pwo+ID4gCj4gPiBSaWdodCwgdGhpcyBmZWF0dXJlIChhbGxvY2F0aW9uIG9mIHVucG9wdWxhdGVk
IG1lbW9yeSBzZXBhcmF0ZWQgZnJvbQo+ID4gdGhlIGJhbGxvb24gZHJpdmVyKSBpcyBjdXJyZW50
bHkgZ2F0ZWQgb24gQ09ORklHX1pPTkVfREVWSUNFLCB3aGljaCBJCj4gPiB0aGluayBjb3VsZCBi
ZSB1c2VkIG9uIEFybS4KPiA+IAo+ID4gSU1PIHRoZSByaWdodCBzb2x1dGlvbiBzZWVtcyB0byBi
ZSB0byBzdWJ0cmFjdCB0aGUgcGh5c2ljYWwgbWVtb3J5Cj4gPiByZWdpb25zIHRoYXQgY2FuIGJl
IHVzZWQgZm9yIHRoZSBpZGVudGl0eSBtYXBwaW5ncyBvZiBmb3JlaWduIHBhZ2VzCj4gPiAoYWxs
IFJBTSBvbiB0aGUgc3lzdGVtIEFGQUlDVCkgZnJvbSBpb21lbV9yZXNvdXJjZSwgYXMgdGhhdCB3
b3VsZCBtYWtlCj4gPiB0aGlzIGFuZCB0aGUgbWVtb3J5IGhvdHBsdWcgZG9uZSBpbiB0aGUgYmFs
bG9vbiBkcml2ZXIgc2FmZT8KPiAKPiBEb20wIGRvZXNuJ3Qga25vdyB0aGUgcmVnaW9ucyB1c2Vk
IGZvciB0aGUgaWRlbnRpdHkgbWFwcGluZ3MgYXMgdGhpcyBpcyBvbmx5Cj4gbWFuYWdlZCBieSBY
ZW4uIFNvIHRoZXJlIGlzIG5vdGhpbmcgeW91IGNhbiByZWFsbHkgZG8gaGVyZS4KCk9LLCBJIHdp
bGwgYWRkIHRoZSBndWFyZHMgdG8gcHJldmVudCB0aGlzIGJlaW5nIGJ1aWx0IG9uIEFybS4KCj4g
QnV0IGRvbid0IHlvdSBoYXZlIHRoZSBzYW1lIGlzc3VlIG9uIHg4NiB3aXRoICJtYWdpYyBwYWdl
cyI/CgpUaG9zZSBhcmUgbWFya2VkIGFzIHJlc2VydmVkIG9uIHRoZSBtZW1vcnkgbWFwLCBhbmQg
aGVuY2UgSSB3b3VsZApleHBlY3QgdGhlbSB0byBuZXZlciBlbmQgdXAgaW4gaW9tZW1fcmVzb3Vy
Y2UuCgpUaGFua3MsIFJvZ2VyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
