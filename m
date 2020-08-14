Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16768245D2D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D59A6E4B6;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367896E090
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597409254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vqjMOLWnURMtkyVmLKBVLJihqVbQncODXADZyEOQvAk=;
 b=PJtz4UOpB6clDELaDb6ZI6pYZdOgQbLMZWb/nkw1XwxImClpjYmCfjXE
 6R7meuerV1AUV+yh5JrImShIDtGXjalFHi+m4cRsl0aAXPNj/Dmt02nMF
 J4uayLnDgKXIq0jTr69nHXixg/2CMpAv7pB4XRKDFg/olz7S0TC4Wuuda Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: w0A6Vy4ueaWrF7WgfuyBrSR1ACS+hknjc95m+9zhN7fc2SAsmovKRsi3m41T/jo7eaFuu78C7Z
 S5MTDLXuflc0oQ1pEQ7/9xHjpo5CwxYh3w/78O9M19ZBSjqnsDO5hTI/QpYfLCVTsqY3rO+TdA
 lbC/WWyTBQbMerqZS+yaBvI3Y+TDQgr/7/ffkMR3MsIWS/vtCi8ou01AxoCZ+/N/T1DSOpRv+J
 GZhylUerYrKxWKmzDSfQJlY510XRbTKxifOc5UaGesqqi1ipL3B/WtYRbgtGC/JNVtACLQ8jDM
 CR0=
X-SBRS: 2.7
X-MesageID: 24855572
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24855572"
Date: Fri, 14 Aug 2020 14:47:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200814124724.GK975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org>
 <20200814095629.GJ975@Air-de-Roger>
 <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTQsIDIwMjAgYXQgMTI6Mjc6MzJQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNC4wOC4yMCAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgQXVnIDE0LCAyMDIwIGF0IDA4OjI5OjIwQU0gKzAxMDAsIENocmlzdG9waCBIZWxsd2ln
IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwOTo1NDoyMEFNICswMjAwLCBS
b2dlciBQYXUgTW9ubj8/IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgQXVnIDEzLCAyMDIwIGF0IDA4
OjMzOjM3QU0gKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiA+ID4gT24gVHVl
LCBBdWcgMTEsIDIwMjAgYXQgMTE6NDQ6NDdBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBJZiBlbmFibGVkIChiZWNhdXNlIFpPTkVfREVWSUNFIGlzIHN1cHBvcnRl
ZCkgdGhlIHVzYWdlIG9mIHRoZSBuZXcKPiA+ID4gPiA+ID4gZnVuY3Rpb25hbGl0eSB1bnRhbmds
ZXMgWGVuIGJhbGxvb24gYW5kIFJBTSBob3RwbHVnIGZyb20gdGhlIHVzYWdlIG9mCj4gPiA+ID4g
PiA+IHVucG9wdWxhdGVkIHBoeXNpY2FsIG1lbW9yeSByYW5nZXMgdG8gbWFwIGZvcmVpZ24gcGFn
ZXMsIHdoaWNoIGlzIHRoZQo+ID4gPiA+ID4gPiBjb3JyZWN0IHRoaW5nIHRvIGRvIGluIG9yZGVy
IHRvIGF2b2lkIG1hcHBpbmdzIG9mIGZvcmVpZ24gcGFnZXMgZGVwZW5kCj4gPiA+ID4gPiA+IG9u
IG1lbW9yeSBob3RwbHVnLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTbyBwbGVhc2UganVzdCBzZWxl
Y3QgWk9ORV9ERVZJQ0UgaWYgdGhpcyBpcyBzbyBtdWNoIGJldHRlciByYXRoZXIKPiA+ID4gPiA+
IHRoYW4gbWFpbnRhaW5pbmcgdHdvIHZhcmlhbnRzLgo+ID4gPiA+IAo+ID4gPiA+IFdlIHN0aWxs
IG5lZWQgdG8gb3RoZXIgdmFyaWFudCBmb3IgQXJtIGF0IGxlYXN0LCBzbyBib3RoIG5lZWQgdG8g
YmUKPiA+ID4gPiBtYWludGFpbmVkIGFueXdheSwgZXZlbiBpZiB3ZSBmb3JjZSBaT05FX0RFVklD
RSBvbiB4ODYuCj4gPiA+IAo+ID4gPiBXZWxsLCBpdCBzdGlsbCByZWFsbHkgaGVscHMgcmVwcm9k
dWNhYmlsaXR5IGlmIHlvdSBzdGljayB0byBvbmUKPiA+ID4gaW1wbGVtZW50YXRpb24gb2YgeDg2
Lgo+ID4gPiAKPiA+ID4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIGFuIGV4cGxpY2l0IGNvbmZp
ZyBvcHRpb24gdG8gb3B0IGludG8gaXQsCj4gPiA+IGJ1dCBqdXN0IGdldHRpbmcgYSBkaWZmZXJl
bnQgaW1wbGVtZW50YXRpb24gYmFzZWQgb24gYSByYW5kb20KPiA+ID4ga2VybmVsIG9wdGlvbiBp
cyBzdHJhbmdlLgo+ID4gCj4gPiBXb3VsZCBhZGRpbmcgc29tZXRoaW5nIGxpa2UgdGhlIGNodW5r
IGJlbG93IHRvIHRoZSBwYXRjaCBiZSBPSz8KPiA+IAo+ID4gLS0tODwtLS0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwo+ID4gaW5kZXgg
MDE4MDIwYjkxYmFhLi41ZjMyMWExMzE5ZTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3hlbi9L
Y29uZmlnCj4gPiArKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4gPiBAQCAtMzI4LDcgKzMyOCwx
NCBAQCBjb25maWcgWEVOX0ZST05UX1BHRElSX1NIQlVGCj4gPiAgIAl0cmlzdGF0ZQo+ID4gICBj
b25maWcgWEVOX1VOUE9QVUxBVEVEX0FMTE9DCj4gPiAtCWJvb2wKPiA+IC0JZGVmYXVsdCB5IGlm
IFpPTkVfREVWSUNFICYmICFBUk0gJiYgIUFSTTY0Cj4gPiArCWJvb2wgIlVzZSB1bnBvcHVsYXRl
ZCBtZW1vcnkgcmFuZ2VzIGZvciBndWVzdCBtYXBwaW5ncyIKPiA+ICsJZGVwZW5kcyBvbiBYODYK
PiA+ICsJc2VsZWN0IFpPTkVfREVWSUNFCj4gPiArCWRlZmF1bHQgeQo+IAo+IEknZCByYXRoZXIg
dXNlICJkZWZhdWx0IFhFTl9CQUNLRU5EIiBoZXJlLCBhcyBtYXBwaW5ncyBvZiBvdGhlciBndWVz
dCdzCj4gbWVtb3J5IGlzIHJhcmVseSB1c2VkIGZvciBub24tYmFja2VuZCBndWVzdHMuCgpUaGVy
ZSdzIGFsc28gdGhlIHByaXZjbWQgYW5kIGdudCBkZXZpY2VzIHdoaWNoIG1ha2UgaGVhdnkgdXNl
IG9mIHRoaXMsCnNvIEknbSBub3Qgc3VyZSBvbmx5IHNlbGVjdGluZyBieSBkZWZhdWx0IG9uIFhF
Tl9CQUNLRU5EIGlzIHRoZSBiZXN0Cm9wdGlvbi4KClRoYW5rcywgUm9nZXIuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
