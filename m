Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17523129B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C3F6E39B;
	Tue, 28 Jul 2020 19:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAFB6E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595958171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bm6xpS3UPlSHgrr/AwBHxbllr8iQgva7zYaEqmfywQE=;
 b=c68YZvbKM6yvoUYtaO8IeJCtT59yKXQfAbftBGBAgv5t8N64G6o8mzin
 lVSp8DnDsNOj/zhB9GuaLMIwhXuAx28UsPzTr1QyEhGfXWgOTEHvPytbb
 +ai8cfgaATyb/S1REt4RFvd7Enw9aFAL8gRMWzQFChhpu4bU8WEL+ZGih Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tqfc4/1PrubWMv5ewSP0LHdTujHFP8U+m86/9kdKUf1uh2GxSqdRLKvvIjL7M7hl/BUVdvDraQ
 7xWgR+boyI9h5kdqmKdL4Un2zB12iUpSymGIbUEEQ7O8Hw5Bf2EayFOnHW8bDGV9iixxNVgLOC
 ohHW/uZUKSlMasSdB5PVjkQ2CjgPz8+aAB4j7j0KQdWkgHS/AF8C2gxIr9YIlD7LejhmX4/3f6
 NuNWHo6AupAExmeZCKgns9LBWBBDJcckRANyYzThzC0R8PZACty0nlqgJXI7DofDVY/yjkEeEd
 sT0=
X-SBRS: 2.7
X-MesageID: 23367204
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23367204"
Date: Tue, 28 Jul 2020 19:42:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200728174242.GB7191@Air-de-Roger>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
 <cb1790b3-2ad0-2c1b-a632-e4fea4b6bcfa@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb1790b3-2ad0-2c1b-a632-e4fea4b6bcfa@citrix.com>
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
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Oleksandr
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

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDY6MDY6MjVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wNy8yMDIwIDE3OjU5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDU6NDg6MjNQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ID4+IEhpLAo+ID4+Cj4gPj4gT24gMjcvMDcvMjAyMCAxMDoxMywgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOgo+ID4+PiBUbyBiZSB1c2VkIGluIG9yZGVyIHRvIGNyZWF0ZSBmb3JlaWduIG1h
cHBpbmdzLiBUaGlzIGlzIGJhc2VkIG9uIHRoZQo+ID4+PiBaT05FX0RFVklDRSBmYWNpbGl0eSB3
aGljaCBpcyB1c2VkIGJ5IHBlcnNpc3RlbnQgbWVtb3J5IGRldmljZXMgaW4KPiA+Pj4gb3JkZXIg
dG8gY3JlYXRlIHN0cnVjdCBwYWdlcyBhbmQga2VybmVsIHZpcnR1YWwgbWFwcGluZ3MgZm9yIHRo
ZSBJT01FTQo+ID4+PiBhcmVhcyBvZiBzdWNoIGRldmljZXMuIE5vdGUgdGhhdCBvbiBrZXJuZWxz
IHdpdGhvdXQgc3VwcG9ydCBmb3IKPiA+Pj4gWk9ORV9ERVZJQ0UgWGVuIHdpbGwgZmFsbGJhY2sg
dG8gdXNlIGJhbGxvb25lZCBwYWdlcyBpbiBvcmRlciB0bwo+ID4+PiBjcmVhdGUgZm9yZWlnbiBt
YXBwaW5ncy4KPiA+Pj4KPiA+Pj4gVGhlIG5ld2x5IGFkZGVkIGhlbHBlcnMgdXNlIHRoZSBzYW1l
IHBhcmFtZXRlcnMgYXMgdGhlIGV4aXN0aW5nCj4gPj4+IHthbGxvYy9mcmVlfV94ZW5iYWxsb29u
ZWRfcGFnZXMgZnVuY3Rpb25zLCB3aGljaCBhbGxvd3MgZm9yIGluLXBsYWNlCj4gPj4+IHJlcGxh
Y2VtZW50IG9mIHRoZSBjYWxsZXJzLiBPbmNlIGEgbWVtb3J5IHJlZ2lvbiBoYXMgYmVlbiBhZGRl
ZCB0byBiZQo+ID4+PiB1c2VkIGFzIHNjcmF0Y2ggbWFwcGluZyBzcGFjZSBpdCB3aWxsIG5vIGxv
bmdlciBiZSByZWxlYXNlZCwgYW5kIHBhZ2VzCj4gPj4+IHJldHVybmVkIGFyZSBrZXB0IGluIGEg
bGlua2VkIGxpc3QuIFRoaXMgYWxsb3dzIHRvIGhhdmUgYSBidWZmZXIgb2YKPiA+Pj4gcGFnZXMg
YW5kIHByZXZlbnRzIHJlc29ydGluZyB0byBmcmVxdWVudCBhZGRpdGlvbnMgYW5kIHJlbW92YWxz
IG9mCj4gPj4+IHJlZ2lvbnMuCj4gPj4+Cj4gPj4+IElmIGVuYWJsZWQgKGJlY2F1c2UgWk9ORV9E
RVZJQ0UgaXMgc3VwcG9ydGVkKSB0aGUgdXNhZ2Ugb2YgdGhlIG5ldwo+ID4+PiBmdW5jdGlvbmFs
aXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhvdHBsdWcgZnJvbSB0aGUgdXNhZ2Ug
b2YKPiA+Pj4gdW5wb3B1bGF0ZWQgcGh5c2ljYWwgbWVtb3J5IHJhbmdlcyB0byBtYXAgZm9yZWln
biBwYWdlcywgd2hpY2ggaXMgdGhlCj4gPj4+IGNvcnJlY3QgdGhpbmcgdG8gZG8gaW4gb3JkZXIg
dG8gYXZvaWQgbWFwcGluZ3Mgb2YgZm9yZWlnbiBwYWdlcyBkZXBlbmQKPiA+Pj4gb24gbWVtb3J5
IGhvdHBsdWcuCj4gPj4gSSB0aGluayB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIERvbTAgb24gQXJt
IGlmIHRoZSBrZXJuZWwgaGFzIGJlZW4gYnVpbHQgd2l0aAo+ID4+IGhvdHBsdWcuIFRoaXMgaXMg
YmVjYXVzZSB5b3UgbWF5IGVuZCB1cCB0byByZS11c2UgcmVnaW9uIHRoYXQgd2lsbCBiZSB1c2Vk
Cj4gPj4gZm9yIHRoZSAxOjEgbWFwcGluZyBvZiBhIGZvcmVpZ24gbWFwLgo+ID4+Cj4gPj4gTm90
ZSB0aGF0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGhvdHBsdWcgaGFzIGJlZW4gdGVzdGVkIG9uIFhl
biBvbiBBcm0geWV0LiBTbwo+ID4+IGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGJlIGFscmVhZHkg
YnJva2VuLgo+ID4+Cj4gPj4gTWVhbndoaWxlLCBteSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIG1h
a2UgdGhlIHVzZSBvZiBob3RwbHVnIGluIHRoZSBiYWxsb29uCj4gPj4gY29kZSBjb25kaXRpb25h
bCAobWF5YmUgdXNpbmcgQ09ORklHX0FSTTY0IGFuZCBDT05GSUdfQVJNKT8KPiA+IFJpZ2h0LCB0
aGlzIGZlYXR1cmUgKGFsbG9jYXRpb24gb2YgdW5wb3B1bGF0ZWQgbWVtb3J5IHNlcGFyYXRlZCBm
cm9tCj4gPiB0aGUgYmFsbG9vbiBkcml2ZXIpIGlzIGN1cnJlbnRseSBnYXRlZCBvbiBDT05GSUdf
Wk9ORV9ERVZJQ0UsIHdoaWNoIEkKPiA+IHRoaW5rIGNvdWxkIGJlIHVzZWQgb24gQXJtLgo+ID4K
PiA+IElNTyB0aGUgcmlnaHQgc29sdXRpb24gc2VlbXMgdG8gYmUgdG8gc3VidHJhY3QgdGhlIHBo
eXNpY2FsIG1lbW9yeQo+ID4gcmVnaW9ucyB0aGF0IGNhbiBiZSB1c2VkIGZvciB0aGUgaWRlbnRp
dHkgbWFwcGluZ3Mgb2YgZm9yZWlnbiBwYWdlcwo+ID4gKGFsbCBSQU0gb24gdGhlIHN5c3RlbSBB
RkFJQ1QpIGZyb20gaW9tZW1fcmVzb3VyY2UsIGFzIHRoYXQgd291bGQgbWFrZQo+ID4gdGhpcyBh
bmQgdGhlIG1lbW9yeSBob3RwbHVnIGRvbmUgaW4gdGhlIGJhbGxvb24gZHJpdmVyIHNhZmU/Cj4g
Cj4gVGhlIHJpZ2h0IHNvbHV0aW9uIGlzIGEgbWVjaGFuaXNtIGZvciB0cmFuc2xhdGVkIGd1ZXN0
cyB0byBxdWVyeSBYZW4gdG8KPiBmaW5kIHJlZ2lvbnMgb2YgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVz
cyBzcGFjZSB3aGljaCBhcmUgdW51c2VkLCBhbmQgY2FuCj4gYmUgc2FmZWx5IGJlIHVzZWQgZm9y
IGZvcmVpZ24vZ3JhbnQvb3RoZXLCoCBtYXBwaW5ncy4KPiAKPiBQbGVhc2UgZG9uJ3Qgd2FzdGUg
YW55IG1vcmUgdGltZSBhcHBseWluZyBtb3JlIGR1Y3QgdGFwZSB0byBhIGJyb2tlbgo+IHN5c3Rl
bSwgYW5kIGluc3RlYWQgc3BlbmQgdGhlIHRpbWUgb3JnYW5pc2luZyBzb21lIHByb3BlciBmb3Vu
ZGF0aW9ucy4KClRoZSBwaWVjZSBhZGRlZCBoZXJlICh1c2luZyBaT05FX0RFVklDRSkgd2lsbCBi
ZSByZWxldmFudCB3aGVuIFhlbiBjYW4KcHJvdmlkZSB0aGUgc3BhY2UgdG8gbWFwIGZvcmVpZ24g
cGFnZXMsIGl0J3MganVzdCB0aGF0IHJpZ2h0IG5vdyBpdApyZWxpZXMgb24gaW9tZW1fcmVzb3Vy
Y2UgaW5zdGVhZCBvZiBhIFhlbiBzcGVjaWZpYyByZXNvdXJjZSBtYXAgdGhhdApzaG91bGQgYmUg
cHJvdmlkZWQgYnkgdGhlIGh5cGVydmlzb3IuIEl0IHNob3VsZCBpbmRlZWQgYmUgZml4ZWQsIGJ1
dApyaWdodCBub3cgdGhpcyBwYXRjaCBzaG91bGQgYWxsb3cgYSBQVkggZG9tMCB0byB3b3JrIHNs
aWdodGx5IGJldHRlci4KV2hlbiBYZW4gcHJvdmlkZXMgc3VjaCBhcmVhcyBMaW51eCBqdXN0IG5l
ZWRzIHRvIHBvcHVsYXRlIGEgY3VzdG9tIFhlbgpyZXNvdXJjZSB3aXRoIHRoZW0gYW5kIHVzZSBp
dCBpbnN0ZWFkIG9mIGlvbWVtX3Jlc3VyY2UuCgpUaGUgQXJtIHN0dWZmIEknbSBjZXJ0YWlubHkg
bm90IGZhbWlsaWFyIHdpdGgsIGFuZCBjYW4ndCBwcm92aWRlIG11Y2gKaW5zaWdodCBvbiB0aGF0
LiBJZiBpdCdzIGJlc3QgdG8ganVzdCBkaXNhYmxlIGl0IGFuZCBjb250aW51ZSB0byByZWx5Cm9u
IGJhbGxvb25lZCBvdXQgcGFnZXMgdGhhdCdzIGZpbmUuCgpSb2dlci4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
