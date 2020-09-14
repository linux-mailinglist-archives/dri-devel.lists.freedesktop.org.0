Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E1269F41
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9556E846;
	Tue, 15 Sep 2020 07:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FB6E520;
 Mon, 14 Sep 2020 17:52:56 +0000 (UTC)
IronPort-SDR: x7MdBFrHBUknbC/OPxT1+hZlPxna33uzL3LJvbaOWmlKKCn1CT4qFEiCb9hFwFVujFN7Gd9tbe
 EMjpVa3W2Ypg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156525772"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="156525772"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:52:55 -0700
IronPort-SDR: owkOKLoIlr9KiGtykpSfPew7iJWN+Pu1/H3T1OXxyHGptzZW9MCAuUkeXb9E3OQS25+nUk3NjT
 S2U8Rq71WtMA==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="507228908"
Received: from blim7-mobl6.gar.corp.intel.com (HELO [10.213.41.6])
 ([10.213.41.6])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:52:51 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix the race between the GEM close
 and debugfs
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200914110019.18613-1-nikunj.dadhania@linux.intel.com>
 <66c99a4d-ab35-55e8-44a2-18f5c39b8b1f@linux.intel.com>
From: "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>
Message-ID: <139d811d-929f-96c3-16c3-15177fa9bd3f@linux.intel.com>
Date: Mon, 14 Sep 2020 23:22:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <66c99a4d-ab35-55e8-44a2-18f5c39b8b1f@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xNC8yMDIwIDEwOjE3IFBNLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPiAKPiBPbiAxNC8w
OS8yMDIwIDEyOjAwLCBOaWt1bmogQS4gRGFkaGFuaWEgd3JvdGU6Cj4+IEFzIHdlIGNsb3NlIEdF
TSBvYmplY3QgYW5kIHNldCBmaWxlX3ByaXYgdG8gLUVCQURGIHdoaWNoIGlzIHByb3RlY3RlZAo+
PiBieSBjdHgtPm11dGV4LCBwb3B1bGF0aW5nIHRoZSBHRU0gZGVidWdmcyBpbmZvIGlzIG5vdCBw
cm90ZWN0ZWQKPj4gYW5kIHJlc3VsdHMgaW4gdGhlIGNyYXNoIHNob3duIGJlbG93Lgo+Pgo+PiBN
YWtlIHN1cmUgdG8gcHJvdGVjdCB0aGUgYWNjZXNzIHRvIGZpbGVfcHJpdiB1c2luZyBjdHgtPm11
dGV4IHRvIGF2b2lkCj4+IHJhY2UuCj4+Cj4+IEJVRzogdW5hYmxlIHRvIGhhbmRsZSBwYWdlIGZh
dWx0IGZvciBhZGRyZXNzOiBmZmZmZmZmZmZmZmZmZmZmCj4+IFJJUDogMDAxMDppOTE1X2dlbV9v
YmplY3RfaW5mbysweDI2Yi8weDNlYgo+PiBDb2RlOiA4OSA0NCAyNCA0OCA0OCA4OSA0NCAyNCA0
MCA0OCA4OSA0NCAyNCAzOCA0OCA4OSA0NCAyNCAzMCA0OCA4OSAKPj4gNDQgMjQgMjggNDggODkg
NDQgMjQgMjAgNDkgOGIgNDYgZjAgNDggODkgNDQgMjQgMjAgNDkgOGIgNDYgYTAgPDQ4PiA4YiAK
Pj4gNTggMDggYjkgMGEgMDAgMDAgMDAgNDggYjggYWEgYWEgYWEgYWEgYWEgYWEgYWEgYWEgNDgg
OGQgYmMKPj4gUlNQOiAwMDE4OmZmZmZhYzgxYzE0Y2ZjMzAgRUZMQUdTOiAwMDAxMDI0Ngo+PiBS
QVg6IGZmZmZmZmZmZmZmZmZmZjcgUkJYOiBmZmZmOTUwOTQ0MjljMjE4IFJDWDogZmZmZjk1MDk2
NzU2Yzc0MAo+PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmZmZmZjkxOWI5M2VlIFJE
STogZmZmZjk1MDk0NDI5YzIxOAo+PiBSQlA6IGZmZmZhYzgxYzE0Y2ZkNTggUjA4OiBmZmZmOTUw
OTc0NmZhYjgwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+PiBSMTA6IDAwMDAwMDAwMDAwMDAwMDEg
UjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZjk1MDk3NTNmOGU4MAo+PiBSMTM6IGZmZmZh
YzgxYzE0Y2ZjOTggUjE0OiBmZmZmOTUwOTQ0MjljMjY4IFIxNTogZmZmZmFjODFjMTRjZmM4OAo+
PiBGUzrCoCAwMDAwN2ExYmRjZDUyOTAwKDAwMDApIEdTOmZmZmY5NTA5NzdlMDAwMDAoMDAwMCkg
Cj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPj4gQ1IyOiBmZmZmZmZmZmZmZmZmZmZmIENSMzogMDAw
MDAwMDI2YjRlMDAwMCBDUjQ6IDAwMDAwMDAwMDAzNDBlZjAKPj4gQ2FsbCBUcmFjZToKPj4gwqAg
c2VxX3JlYWQrMHgxNjIvMHgzY2EKPj4gwqAgZnVsbF9wcm94eV9yZWFkKzB4NWIvMHg4ZAo+PiDC
oCBfX3Zmc19yZWFkKzB4NDUvMHgxYjkKPj4gwqAgdmZzX3JlYWQrMHhjOS8weDE1ZQo+PiDCoCBr
c3lzX3JlYWQrMHg3ZS8weGRlCj4+IMKgIGRvX3N5c2NhbGxfNjQrMHg1NC8weDdlCj4+IMKgIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPj4gUklQOiAwMDMzOjB4N2Ex
YmRkMzRjZjAzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pa3VuaiBBLiBEYWRoYW5pYSA8bmlrdW5q
LmRhZGhhbmlhQGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZGVidWdmcy5jIHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVn
ZnMuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwo+PiBpbmRleCA3
ODQyMTk5NjIxOTMuLmVhNDY5MTY4Y2Q0NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
ZWJ1Z2ZzLmMKPj4gQEAgLTMyNiw2ICszMjYsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9jb250ZXh0
X3N0YXRzKHN0cnVjdCBzZXFfZmlsZSAqbSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGk5MTVfZ2VtX2NvbnRleHRfdW5sb2NrX2VuZ2luZXMoY3R4KTsKPj4g
K8KgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmN0eC0+bXV0ZXgpOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFJU19FUlJfT1JfTlVMTChjdHgtPmZpbGVfcHJpdikpIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGZpbGVfc3RhdHMgc3RhdHMgPSB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZtID0gcmN1X2FjY2Vzc19wb2ludGVyKGN0eC0+
dm0pLAo+PiBAQCAtMzQ2LDYgKzM0Nyw3IEBAIHN0YXRpYyB2b2lkIHByaW50X2NvbnRleHRfc3Rh
dHMoc3RydWN0IHNlcV9maWxlICptLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmlu
dF9maWxlX3N0YXRzKG0sIG5hbWUsIHN0YXRzKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4g
K8KgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmY3R4LT5tdXRleCk7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2soJmk5MTUtPmdlbS5jb250ZXh0cy5sb2NrKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGxpc3Rfc2FmZV9yZXNldF9uZXh0KGN0eCwgY24sIGxpbmspOwo+Pgo+IAo+IEZp
eCBpcyBjb3JyZWN0LCBidXQgaXQgbG9va2VkIGZhbWlsaWFyIGFuZCBpbmRlZWQgSSBmb3VuZCBh
IGZpeCBmb3IgdGhlIAo+IHNhbWUgaXNzdWVzIGJhY2sgZnJvbSBKdWx5LiBDb3BpZWQgeW91IG9u
IHRoYXQgb25lIHdoaWNoIG5vdyBoYXMgYW4gci1iLiAKClllcywgc2F3IHlvdXIgb3RoZXIgZW1h
aWwuIEJvdGggYXJlIHNhbWUsIHdoaWNoZXZlciBnZXRzIGFwcGxpZWQgaXMgZmluZS4KCj4gVGhp
cyBvbmUgY2FuIGhhdmUgaXQgYXMgd2VsbCBidXQgcGxlYXNlIGFsc28gY29weSBzdGFibGUuCgpE
byBJIG5lZWQgdG8gc2VuZCB0aGUgcGF0Y2ggYWdhaW4gd2l0aCBDQyB0byBzdGFibGU/Cgo+ICA+
IFJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoK
VGhhbmtzCk5pa3VuagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
