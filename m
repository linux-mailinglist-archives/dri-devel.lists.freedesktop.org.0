Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084A245D1C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3DB6E487;
	Mon, 17 Aug 2020 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770396EB45
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597412148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vhg2qIv0Jz5uNB1to7SsFv5hNsQzCGoy7ntsgX816ME=;
 b=TLc1cqw15qToByJG6AJzQj0svWZ0ZO3jDO9z94iz5uiOHnIseUimN3FF
 Q6G8Z2t+7FfcMtSC/C2WnSRFwmzm3Kqs9B9Ha0Eo03/SQvJ+equNExiCv
 zXrQdW8nl/eNsPHfa0AqN1y8apAfHpitXznqwGW097sk/U372toWjXm25 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3kOFJD7N60ERtsB74qGJI3XB6PL0hrH37iAm0pbM5PNV/FQ6T6jmbeXASasblAXIeXQLqwqf0n
 B/Da4GKHV9G6vOYMwD44IXUGCJ3cYZz2PgjkPj0Fu8FehPYFdfIA/yqX5Wl/Wi5AdwnNtqOBNq
 40Ye7b7xVui+0ZvJub15TmF7cyPT3T+Bh7pUD91DG/xaiMgJ/3oxy9ZFN8COrkdaJsAjZEg4WX
 mmGqnJVZd3jJ/pY7wNa7/8pzAw/ZVX0QKpqU1zHC70psBGvrmWKbneBDww7mnmZg+X4dW6syS7
 mIA=
X-SBRS: 2.7
X-MesageID: 24880445
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24880445"
Date: Fri, 14 Aug 2020 15:35:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200814133536.GL975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org>
 <20200814095629.GJ975@Air-de-Roger>
 <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
 <20200814124724.GK975@Air-de-Roger>
 <fc10d3a5-fe79-335e-353a-1bf480af7c7c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc10d3a5-fe79-335e-353a-1bf480af7c7c@suse.com>
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

T24gRnJpLCBBdWcgMTQsIDIwMjAgYXQgMDI6NTQ6MzhQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNC4wOC4yMCAxNDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgQXVnIDE0LCAyMDIwIGF0IDEyOjI3OjMyUE0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+IE9uIDE0LjA4LjIwIDExOjU2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiA+IE9uIEZyaSwgQXVnIDE0LCAyMDIwIGF0IDA4OjI5OjIwQU0gKzAxMDAsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMDk6NTQ6MjBB
TSArMDIwMCwgUm9nZXIgUGF1IE1vbm4/PyB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCBBdWcg
MTMsIDIwMjAgYXQgMDg6MzM6MzdBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gT24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMTE6NDQ6NDdBTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gSWYgZW5hYmxlZCAoYmVjYXVzZSBa
T05FX0RFVklDRSBpcyBzdXBwb3J0ZWQpIHRoZSB1c2FnZSBvZiB0aGUgbmV3Cj4gPiA+ID4gPiA+
ID4gPiBmdW5jdGlvbmFsaXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhvdHBsdWcg
ZnJvbSB0aGUgdXNhZ2Ugb2YKPiA+ID4gPiA+ID4gPiA+IHVucG9wdWxhdGVkIHBoeXNpY2FsIG1l
bW9yeSByYW5nZXMgdG8gbWFwIGZvcmVpZ24gcGFnZXMsIHdoaWNoIGlzIHRoZQo+ID4gPiA+ID4g
PiA+ID4gY29ycmVjdCB0aGluZyB0byBkbyBpbiBvcmRlciB0byBhdm9pZCBtYXBwaW5ncyBvZiBm
b3JlaWduIHBhZ2VzIGRlcGVuZAo+ID4gPiA+ID4gPiA+ID4gb24gbWVtb3J5IGhvdHBsdWcuCj4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gU28gcGxlYXNlIGp1c3Qgc2VsZWN0IFpPTkVfREVW
SUNFIGlmIHRoaXMgaXMgc28gbXVjaCBiZXR0ZXIgcmF0aGVyCj4gPiA+ID4gPiA+ID4gdGhhbiBt
YWludGFpbmluZyB0d28gdmFyaWFudHMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBXZSBzdGls
bCBuZWVkIHRvIG90aGVyIHZhcmlhbnQgZm9yIEFybSBhdCBsZWFzdCwgc28gYm90aCBuZWVkIHRv
IGJlCj4gPiA+ID4gPiA+IG1haW50YWluZWQgYW55d2F5LCBldmVuIGlmIHdlIGZvcmNlIFpPTkVf
REVWSUNFIG9uIHg4Ni4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gV2VsbCwgaXQgc3RpbGwgcmVhbGx5
IGhlbHBzIHJlcHJvZHVjYWJpbGl0eSBpZiB5b3Ugc3RpY2sgdG8gb25lCj4gPiA+ID4gPiBpbXBs
ZW1lbnRhdGlvbiBvZiB4ODYuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBhbHRlcm5hdGl2ZSB3
b3VsZCBiZSBhbiBleHBsaWNpdCBjb25maWcgb3B0aW9uIHRvIG9wdCBpbnRvIGl0LAo+ID4gPiA+
ID4gYnV0IGp1c3QgZ2V0dGluZyBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBiYXNlZCBvbiBh
IHJhbmRvbQo+ID4gPiA+ID4ga2VybmVsIG9wdGlvbiBpcyBzdHJhbmdlLgo+ID4gPiA+IAo+ID4g
PiA+IFdvdWxkIGFkZGluZyBzb21ldGhpbmcgbGlrZSB0aGUgY2h1bmsgYmVsb3cgdG8gdGhlIHBh
dGNoIGJlIE9LPwo+ID4gPiA+IAo+ID4gPiA+IC0tLTg8LS0tCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL0tjb25maWcgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4gPiA+ID4gaW5kZXgg
MDE4MDIwYjkxYmFhLi41ZjMyMWExMzE5ZTYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy94
ZW4vS2NvbmZpZwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcKPiA+ID4gPiBAQCAt
MzI4LDcgKzMyOCwxNCBAQCBjb25maWcgWEVOX0ZST05UX1BHRElSX1NIQlVGCj4gPiA+ID4gICAg
CXRyaXN0YXRlCj4gPiA+ID4gICAgY29uZmlnIFhFTl9VTlBPUFVMQVRFRF9BTExPQwo+ID4gPiA+
IC0JYm9vbAo+ID4gPiA+IC0JZGVmYXVsdCB5IGlmIFpPTkVfREVWSUNFICYmICFBUk0gJiYgIUFS
TTY0Cj4gPiA+ID4gKwlib29sICJVc2UgdW5wb3B1bGF0ZWQgbWVtb3J5IHJhbmdlcyBmb3IgZ3Vl
c3QgbWFwcGluZ3MiCj4gPiA+ID4gKwlkZXBlbmRzIG9uIFg4Ngo+ID4gPiA+ICsJc2VsZWN0IFpP
TkVfREVWSUNFCj4gPiA+ID4gKwlkZWZhdWx0IHkKPiA+ID4gCj4gPiA+IEknZCByYXRoZXIgdXNl
ICJkZWZhdWx0IFhFTl9CQUNLRU5EIiBoZXJlLCBhcyBtYXBwaW5ncyBvZiBvdGhlciBndWVzdCdz
Cj4gPiA+IG1lbW9yeSBpcyByYXJlbHkgdXNlZCBmb3Igbm9uLWJhY2tlbmQgZ3Vlc3RzLgo+ID4g
Cj4gPiBUaGVyZSdzIGFsc28gdGhlIHByaXZjbWQgYW5kIGdudCBkZXZpY2VzIHdoaWNoIG1ha2Ug
aGVhdnkgdXNlIG9mIHRoaXMsCj4gPiBzbyBJJ20gbm90IHN1cmUgb25seSBzZWxlY3RpbmcgYnkg
ZGVmYXVsdCBvbiBYRU5fQkFDS0VORCBpcyB0aGUgYmVzdAo+ID4gb3B0aW9uLgo+IAo+IEkganVz
dCB3YW50IHRvIGF2b2lkIHRoYXQga2VybmVscyBidWlsdCBmb3IgcnVubmluZyBhcyBYZW4gZ3Vl
c3QsIGJ1dAo+IG5vdCBhcyBkb20wLCB3aWxsIGJlIGZvcmNlZCB0byBzZWxlY3QgWk9ORV9ERVZJ
Q0UuCj4gCj4gQXMgcHJpdmNtZCBpcyBkb20wLW9ubHksIHRoaXMgaXMgbm8gcHJvYmxlbS4KCk9o
LCBkaWRuJ3Qga25vdyB0aGF0LCBJIHNvbWVob3cgYXNzdW1lZCBwcml2Y21kIHdvdWxkIGJlIGF2
YWlsYWJsZSB0bwphbGwgWGVuIGd1ZXN0cyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgZG9tMCBzdXBw
b3J0IHdhcyBzZWxlY3RlZC4KCj4gSW4gY2FzZSB5b3UgYXJlIHdvcnJ5aW5nIGFib3V0IGdudCBk
ZXZpY2VzLCBJJ2QgYmUgZmluZSB0byBzd2l0Y2ggdG8KPiAKPiBkZWZhdWx0IFhFTl9CQUNLRU5E
IHx8IFhFTl9HTlRERVYKClN1cmUuIG1heWJlIGV2ZW46CgpkZWZhdWx0IFhFTl9CQUNLRU5EIHx8
IFhFTl9HTlRERVYgfHwgWEVOX0RPTTAKCkRvIHlvdSB3YW50IG1lIHRvIHJlc2VuZCB3aXRoIHRo
aXMgY2hhbmdlZCBvciBhcmUgeW91IGhhcHB5IHRvIGZpeHVwCmlmIHRoZXJlIGFyZSBubyBmdXJ0
aGVyIGNvbW1lbnRzPwoKVGhhbmtzLCBSb2dlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
