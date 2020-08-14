Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FF244B05
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834A6EB5B;
	Fri, 14 Aug 2020 14:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B446EB5B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:03:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F143B167;
 Fri, 14 Aug 2020 13:53:03 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org> <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org> <20200814095629.GJ975@Air-de-Roger>
 <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
 <20200814124724.GK975@Air-de-Roger>
 <fc10d3a5-fe79-335e-353a-1bf480af7c7c@suse.com>
 <20200814133536.GL975@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2f0e2484-d4ec-adb3-4182-6db2c542c633@suse.com>
Date: Fri, 14 Aug 2020 15:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814133536.GL975@Air-de-Roger>
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

T24gMTQuMDguMjAgMTU6MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MTQsIDIwMjAgYXQgMDI6NTQ6MzhQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTQuMDguMjAgMTQ6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBGcmksIEF1ZyAx
NCwgMjAyMCBhdCAxMjoyNzozMlBNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9u
IDE0LjA4LjIwIDExOjU2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBGcmksIEF1
ZyAxNCwgMjAyMCBhdCAwODoyOToyMEFNICswMTAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
Pj4+Pj4+IE9uIFRodSwgQXVnIDEzLCAyMDIwIGF0IDA5OjU0OjIwQU0gKzAyMDAsIFJvZ2VyIFBh
dSBNb25uPz8gd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMDg6MzM6MzdB
TSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFR1ZSwgQXVnIDEx
LCAyMDIwIGF0IDExOjQ0OjQ3QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+
Pj4+IElmIGVuYWJsZWQgKGJlY2F1c2UgWk9ORV9ERVZJQ0UgaXMgc3VwcG9ydGVkKSB0aGUgdXNh
Z2Ugb2YgdGhlIG5ldwo+Pj4+Pj4+Pj4gZnVuY3Rpb25hbGl0eSB1bnRhbmdsZXMgWGVuIGJhbGxv
b24gYW5kIFJBTSBob3RwbHVnIGZyb20gdGhlIHVzYWdlIG9mCj4+Pj4+Pj4+PiB1bnBvcHVsYXRl
ZCBwaHlzaWNhbCBtZW1vcnkgcmFuZ2VzIHRvIG1hcCBmb3JlaWduIHBhZ2VzLCB3aGljaCBpcyB0
aGUKPj4+Pj4+Pj4+IGNvcnJlY3QgdGhpbmcgdG8gZG8gaW4gb3JkZXIgdG8gYXZvaWQgbWFwcGlu
Z3Mgb2YgZm9yZWlnbiBwYWdlcyBkZXBlbmQKPj4+Pj4+Pj4+IG9uIG1lbW9yeSBob3RwbHVnLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBTbyBwbGVhc2UganVzdCBzZWxlY3QgWk9ORV9ERVZJQ0UgaWYgdGhp
cyBpcyBzbyBtdWNoIGJldHRlciByYXRoZXIKPj4+Pj4+Pj4gdGhhbiBtYWludGFpbmluZyB0d28g
dmFyaWFudHMuCj4+Pj4+Pj4KPj4+Pj4+PiBXZSBzdGlsbCBuZWVkIHRvIG90aGVyIHZhcmlhbnQg
Zm9yIEFybSBhdCBsZWFzdCwgc28gYm90aCBuZWVkIHRvIGJlCj4+Pj4+Pj4gbWFpbnRhaW5lZCBh
bnl3YXksIGV2ZW4gaWYgd2UgZm9yY2UgWk9ORV9ERVZJQ0Ugb24geDg2Lgo+Pj4+Pj4KPj4+Pj4+
IFdlbGwsIGl0IHN0aWxsIHJlYWxseSBoZWxwcyByZXByb2R1Y2FiaWxpdHkgaWYgeW91IHN0aWNr
IHRvIG9uZQo+Pj4+Pj4gaW1wbGVtZW50YXRpb24gb2YgeDg2Lgo+Pj4+Pj4KPj4+Pj4+IFRoZSBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSBhbiBleHBsaWNpdCBjb25maWcgb3B0aW9uIHRvIG9wdCBpbnRv
IGl0LAo+Pj4+Pj4gYnV0IGp1c3QgZ2V0dGluZyBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBi
YXNlZCBvbiBhIHJhbmRvbQo+Pj4+Pj4ga2VybmVsIG9wdGlvbiBpcyBzdHJhbmdlLgo+Pj4+Pgo+
Pj4+PiBXb3VsZCBhZGRpbmcgc29tZXRoaW5nIGxpa2UgdGhlIGNodW5rIGJlbG93IHRvIHRoZSBw
YXRjaCBiZSBPSz8KPj4+Pj4KPj4+Pj4gLS0tODwtLS0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL0tjb25maWcgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4+Pj4+IGluZGV4IDAxODAyMGI5
MWJhYS4uNWYzMjFhMTMxOWU2IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi9LY29uZmln
Cj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcKPj4+Pj4gQEAgLTMyOCw3ICszMjgsMTQg
QEAgY29uZmlnIFhFTl9GUk9OVF9QR0RJUl9TSEJVRgo+Pj4+PiAgICAgCXRyaXN0YXRlCj4+Pj4+
ICAgICBjb25maWcgWEVOX1VOUE9QVUxBVEVEX0FMTE9DCj4+Pj4+IC0JYm9vbAo+Pj4+PiAtCWRl
ZmF1bHQgeSBpZiBaT05FX0RFVklDRSAmJiAhQVJNICYmICFBUk02NAo+Pj4+PiArCWJvb2wgIlVz
ZSB1bnBvcHVsYXRlZCBtZW1vcnkgcmFuZ2VzIGZvciBndWVzdCBtYXBwaW5ncyIKPj4+Pj4gKwlk
ZXBlbmRzIG9uIFg4Ngo+Pj4+PiArCXNlbGVjdCBaT05FX0RFVklDRQo+Pj4+PiArCWRlZmF1bHQg
eQo+Pj4+Cj4+Pj4gSSdkIHJhdGhlciB1c2UgImRlZmF1bHQgWEVOX0JBQ0tFTkQiIGhlcmUsIGFz
IG1hcHBpbmdzIG9mIG90aGVyIGd1ZXN0J3MKPj4+PiBtZW1vcnkgaXMgcmFyZWx5IHVzZWQgZm9y
IG5vbi1iYWNrZW5kIGd1ZXN0cy4KPj4+Cj4+PiBUaGVyZSdzIGFsc28gdGhlIHByaXZjbWQgYW5k
IGdudCBkZXZpY2VzIHdoaWNoIG1ha2UgaGVhdnkgdXNlIG9mIHRoaXMsCj4+PiBzbyBJJ20gbm90
IHN1cmUgb25seSBzZWxlY3RpbmcgYnkgZGVmYXVsdCBvbiBYRU5fQkFDS0VORCBpcyB0aGUgYmVz
dAo+Pj4gb3B0aW9uLgo+Pgo+PiBJIGp1c3Qgd2FudCB0byBhdm9pZCB0aGF0IGtlcm5lbHMgYnVp
bHQgZm9yIHJ1bm5pbmcgYXMgWGVuIGd1ZXN0LCBidXQKPj4gbm90IGFzIGRvbTAsIHdpbGwgYmUg
Zm9yY2VkIHRvIHNlbGVjdCBaT05FX0RFVklDRS4KPj4KPj4gQXMgcHJpdmNtZCBpcyBkb20wLW9u
bHksIHRoaXMgaXMgbm8gcHJvYmxlbS4KPiAKPiBPaCwgZGlkbid0IGtub3cgdGhhdCwgSSBzb21l
aG93IGFzc3VtZWQgcHJpdmNtZCB3b3VsZCBiZSBhdmFpbGFibGUgdG8KPiBhbGwgWGVuIGd1ZXN0
cyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgZG9tMCBzdXBwb3J0IHdhcyBzZWxlY3RlZC4KCk15IHJl
bWFyayBhYm92ZSBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgcHJlY2lzZSBpbiB0aGlzIHJlZ2FyZDoK
CnByaXZjbWQgb3BlcmF0aW9ucyBkZWFsaW5nIHdpdGggZm9yZWlnbiBtYXBwaW5ncyBhcmUgbm9y
bWFsbHkgbGltaXRlZAp0byBkb20wICh0aGVyZSBtaWdodCBiZSBzcGVjaWFsIGNhc2VzLCBsaWtl
IGxpbnV4LWJhc2VkIHN0dWJkb21zLCBidXQKdGhvc2Ugd2lsbCBiZSBjb25maWd1cmVkIGNhcmVm
dWxseSBmb3IgdGhhdCBwdXJwb3NlLCBzbyB0aGV5IGRvbid0Cm5lZWQgdG8gYmUgY29uc2lkZXJl
ZCBmb3Igc2VsZWN0aW5nIHRoZSBkZWZhdWx0IElNTykuCgo+IAo+PiBJbiBjYXNlIHlvdSBhcmUg
d29ycnlpbmcgYWJvdXQgZ250IGRldmljZXMsIEknZCBiZSBmaW5lIHRvIHN3aXRjaCB0bwo+Pgo+
PiBkZWZhdWx0IFhFTl9CQUNLRU5EIHx8IFhFTl9HTlRERVYKPiAKPiBTdXJlLiBtYXliZSBldmVu
Ogo+IAo+IGRlZmF1bHQgWEVOX0JBQ0tFTkQgfHwgWEVOX0dOVERFViB8fCBYRU5fRE9NMAoKWWVz
LgoKPiAKPiBEbyB5b3Ugd2FudCBtZSB0byByZXNlbmQgd2l0aCB0aGlzIGNoYW5nZWQgb3IgYXJl
IHlvdSBoYXBweSB0byBmaXh1cAo+IGlmIHRoZXJlIGFyZSBubyBmdXJ0aGVyIGNvbW1lbnRzPwoK
SSdkIHByZWZlciBhIHJlc2VuZCAobWF5YmUgYWZ0ZXIgUGF0Y2ggMSBoYXMgZ2FpbmVkIGl0cyBt
aXNzaW5nIEFjaywgYW5kCnRoZW4gd2l0aCBQYXRjaCAxIHNlbnQgdG8gbWUsIHRvbykuCgoKSnVl
cmdlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
