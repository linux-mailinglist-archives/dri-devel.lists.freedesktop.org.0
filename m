Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A442447F7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 12:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2536EB27;
	Fri, 14 Aug 2020 10:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E0C6EB27
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:27:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DBB0AF8F;
 Fri, 14 Aug 2020 10:27:56 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christoph Hellwig <hch@infradead.org>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org> <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org> <20200814095629.GJ975@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
Date: Fri, 14 Aug 2020 12:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814095629.GJ975@Air-de-Roger>
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
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQuMDguMjAgMTE6NTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MTQsIDIwMjAgYXQgMDg6Mjk6MjBBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+
IE9uIFRodSwgQXVnIDEzLCAyMDIwIGF0IDA5OjU0OjIwQU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25u
Pz8gd3JvdGU6Cj4+PiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwODozMzozN0FNICswMTAwLCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+PiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAxMTo0
NDo0N0FNICswMjAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+IElmIGVuYWJsZWQgKGJl
Y2F1c2UgWk9ORV9ERVZJQ0UgaXMgc3VwcG9ydGVkKSB0aGUgdXNhZ2Ugb2YgdGhlIG5ldwo+Pj4+
PiBmdW5jdGlvbmFsaXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhvdHBsdWcgZnJv
bSB0aGUgdXNhZ2Ugb2YKPj4+Pj4gdW5wb3B1bGF0ZWQgcGh5c2ljYWwgbWVtb3J5IHJhbmdlcyB0
byBtYXAgZm9yZWlnbiBwYWdlcywgd2hpY2ggaXMgdGhlCj4+Pj4+IGNvcnJlY3QgdGhpbmcgdG8g
ZG8gaW4gb3JkZXIgdG8gYXZvaWQgbWFwcGluZ3Mgb2YgZm9yZWlnbiBwYWdlcyBkZXBlbmQKPj4+
Pj4gb24gbWVtb3J5IGhvdHBsdWcuCj4+Pj4KPj4+PiBTbyBwbGVhc2UganVzdCBzZWxlY3QgWk9O
RV9ERVZJQ0UgaWYgdGhpcyBpcyBzbyBtdWNoIGJldHRlciByYXRoZXIKPj4+PiB0aGFuIG1haW50
YWluaW5nIHR3byB2YXJpYW50cy4KPj4+Cj4+PiBXZSBzdGlsbCBuZWVkIHRvIG90aGVyIHZhcmlh
bnQgZm9yIEFybSBhdCBsZWFzdCwgc28gYm90aCBuZWVkIHRvIGJlCj4+PiBtYWludGFpbmVkIGFu
eXdheSwgZXZlbiBpZiB3ZSBmb3JjZSBaT05FX0RFVklDRSBvbiB4ODYuCj4+Cj4+IFdlbGwsIGl0
IHN0aWxsIHJlYWxseSBoZWxwcyByZXByb2R1Y2FiaWxpdHkgaWYgeW91IHN0aWNrIHRvIG9uZQo+
PiBpbXBsZW1lbnRhdGlvbiBvZiB4ODYuCj4+Cj4+IFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSBh
biBleHBsaWNpdCBjb25maWcgb3B0aW9uIHRvIG9wdCBpbnRvIGl0LAo+PiBidXQganVzdCBnZXR0
aW5nIGEgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIGJhc2VkIG9uIGEgcmFuZG9tCj4+IGtlcm5l
bCBvcHRpb24gaXMgc3RyYW5nZS4KPiAKPiBXb3VsZCBhZGRpbmcgc29tZXRoaW5nIGxpa2UgdGhl
IGNodW5rIGJlbG93IHRvIHRoZSBwYXRjaCBiZSBPSz8KPiAKPiAtLS04PC0tLQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwo+IGluZGV4IDAx
ODAyMGI5MWJhYS4uNWYzMjFhMTMxOWU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4gQEAgLTMyOCw3ICszMjgsMTQgQEAgY29u
ZmlnIFhFTl9GUk9OVF9QR0RJUl9TSEJVRgo+ICAgCXRyaXN0YXRlCj4gICAKPiAgIGNvbmZpZyBY
RU5fVU5QT1BVTEFURURfQUxMT0MKPiAtCWJvb2wKPiAtCWRlZmF1bHQgeSBpZiBaT05FX0RFVklD
RSAmJiAhQVJNICYmICFBUk02NAo+ICsJYm9vbCAiVXNlIHVucG9wdWxhdGVkIG1lbW9yeSByYW5n
ZXMgZm9yIGd1ZXN0IG1hcHBpbmdzIgo+ICsJZGVwZW5kcyBvbiBYODYKPiArCXNlbGVjdCBaT05F
X0RFVklDRQo+ICsJZGVmYXVsdCB5CgpJJ2QgcmF0aGVyIHVzZSAiZGVmYXVsdCBYRU5fQkFDS0VO
RCIgaGVyZSwgYXMgbWFwcGluZ3Mgb2Ygb3RoZXIgZ3Vlc3QncwptZW1vcnkgaXMgcmFyZWx5IHVz
ZWQgZm9yIG5vbi1iYWNrZW5kIGd1ZXN0cy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
