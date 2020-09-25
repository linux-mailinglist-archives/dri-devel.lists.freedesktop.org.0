Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40F278A0B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006956E489;
	Fri, 25 Sep 2020 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DA46E489;
 Fri, 25 Sep 2020 13:54:46 +0000 (UTC)
IronPort-SDR: Gy/tFrByITJXxGRCce/xNj3AX0AXfb30+MD3xFXVEztdkrv3IBwABJCoFo65wyjqGsP2ebTB2T
 IMoWJ2igS8gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158879208"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="158879208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:54:45 -0700
IronPort-SDR: dk03fEEi9qPyhqM7EwMAHy0s+gOrBDoBRLjKg62nh1DCt22erA2Hjz2fGiIdaCN+F1Vla5tS05
 r4RnbuAL/0xQ==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455841547"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:54:41 -0700
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add support
 in dynamic allocation of SG table from pages
To: Maor Gottlieb <maorg@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal> <20200925115544.GY9475@nvidia.com>
 <65ca566b-7a5e-620f-13a4-c59eb836345a@nvidia.com>
 <33942b10-8eef-9180-44c5-b7379b92b824@linux.intel.com>
 <9d69d68d-7868-609b-c703-dfe9fec93a0f@nvidia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <45919218-9a73-e3e3-cc03-5255a227f341@linux.intel.com>
Date: Fri, 25 Sep 2020 14:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9d69d68d-7868-609b-c703-dfe9fec93a0f@nvidia.com>
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI1LzA5LzIwMjAgMTQ6MzksIE1hb3IgR290dGxpZWIgd3JvdGU6Cj4gCj4gT24gOS8yNS8y
MDIwIDM6MzMgUE0sIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+Pgo+PiBPbiAyNS8wOS8yMDIwIDEz
OjE4LCBNYW9yIEdvdHRsaWViIHdyb3RlOgo+Pj4gT24gOS8yNS8yMDIwIDI6NTUgUE0sIEphc29u
IEd1bnRob3JwZSB3cm90ZToKPj4+PiBPbiBGcmksIFNlcCAyNSwgMjAyMCBhdCAxMDoxMzozMEFN
ICswMzAwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2NhdHRlcmxpc3QvbWFpbi5jIAo+Pj4+Pj4+IGIvdG9vbHMvdGVzdGluZy9zY2F0
dGVybGlzdC9tYWluLmMKPj4+Pj4+PiBpbmRleCAwYTE0NjQxODEyMjYuLjQ4OTkzNTlhMzFhYyAx
MDA2NDQKPj4+Pj4+PiArKysgYi90b29scy90ZXN0aW5nL3NjYXR0ZXJsaXN0L21haW4uYwo+Pj4+
Pj4+IEBAIC01NSwxNCArNTUsMTMgQEAgaW50IG1haW4odm9pZCkKPj4+Pj4+PiDCoMKgwqDCoMKg
wqAgZm9yIChpID0gMCwgdGVzdCA9IHRlc3RzOyB0ZXN0LT5leHBlY3RlZF9zZWdtZW50czsgdGVz
dCsrLCAKPj4+Pj4+PiBpKyspIHsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
cGFnZSAqcGFnZXNbTUFYX1BBR0VTXTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3Qgc2dfdGFibGUgc3Q7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4+Pj4+Pj4KPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfcGFnZXMocGFnZXMsIHRlc3QtPnBmbiwgdGVzdC0+bnVt
X3BhZ2VzKTsKPj4+Pj4+Pgo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBfX3NnX2FsbG9j
X3RhYmxlX2Zyb21fcGFnZXMoJnN0LCBwYWdlcywgCj4+Pj4+Pj4gdGVzdC0+bnVtX3BhZ2VzLAo+
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAwLCB0ZXN0LT5zaXplLCB0ZXN0LT5tYXhfc2VnLAo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqAgYXNzZXJ0KHJldCA9PSB0ZXN0LT5hbGxvY19yZXQpOwo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBzZyA9IF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcygmc3QsIHBhZ2Vz
LCAKPj4+Pj4+PiB0ZXN0LT5udW1fcGFnZXMsIDAsCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0ZXN0LT5zaXplLCB0ZXN0LT5tYXhfc2VnLCBOVUxMLCAwLCBHRlBfS0VS
TkVMKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXNzZXJ0KFBUUl9FUlJfT1JfWkVSTyhzZykg
PT0gdGVzdC0+YWxsb2NfcmV0KTsKPj4+Pj4+IFNvbWUgdGVzdCBjb3ZlcmFnZSBmb3IgcmVsYXRp
dmVseSBjb21wbGV4IGNvZGUgd291bGQgYmUgdmVyeSAKPj4+Pj4+IHdlbGNvbWVkLiBTaW5jZQo+
Pj4+Pj4gdGhlIHRlc3RpbmcgZnJhbWV3b3JrIGlzIGFscmVhZHkgdGhlcmUsIGV2ZW4gaWYgaXQg
Yml0LXJvdHRlZCBhIAo+Pj4+Pj4gYml0LCBidXQKPj4+Pj4+IHNob3VsZG4ndCBiZSBoYXJkIHRv
IGZpeC4KPj4+Pj4+Cj4+Pj4+PiBBIGZldyB0ZXN0cyB0byBjaGVjayBhcHBlbmQvZ3JvdyB3b3Jr
cyBhcyBleHBlY3RlZCwgaW4gdGVybXMgb2YgCj4+Pj4+PiBob3cgdGhlIGVuZAo+Pj4+Pj4gdGFi
bGUgbG9va3MgbGlrZSBnaXZlbiB0aGUgaW5pdGlhbCBzdGF0ZSBhbmQgc29tZSBkaWZmZXJlbnQg
cGFnZSAKPj4+Pj4+IHBhdHRlcm5zCj4+Pj4+PiBhZGRlZCB0byBpdC4gQW5kIGJvdGggY3Jvc3Np
bmcgYW5kIG5vdCBjcm9zc2luZyBpbnRvIHNnIGNoYWluaW5nIAo+Pj4+Pj4gc2NlbmFyaW9zLgo+
Pj4+PiBUaGlzIGZ1bmN0aW9uIGlzIGJhc2ljIGZvciBhbGwgUkRNQSBkZXZpY2VzIGFuZCB3ZSBh
cmUgcHJldHR5IAo+Pj4+PiBjb25maWRlbnQKPj4+Pj4gdGhhdCB0aGUgb2xkIGFuZCBuZXcgZmxv
d3MgYXJlIHRlc3RlZCB0aG9yb3VnaGx5Lgo+Pj4+IFdlbGwsIHNpbmNlIDAtZGF5IGlzIHJlcG9y
dGluZyB0aGF0IF9faTkxNV9nZW1fdXNlcnB0cl9hbGxvY19wYWdlcyBpcwo+Pj4+IGNyYXNoaW5n
IG9uIHRoaXMsIGl0IHByb2JhYmx5IGRvZXMgbmVlZCBzb21lIHRlc3RzIDpcCj4+Pj4KPj4+PiBK
YXNvbgo+Pj4KPj4+IEl0IGlzIGNyYXNoaW5nIGluIHRoZSByZWd1bGFyIG9sZCBmbG93IHdoaWNo
IGFscmVhZHkgdGVzdGVkLgo+Pj4gSG93ZXZlciwgSSB3aWxsIGFkZCBtb3JlIHRlc3RzLgo+Pgo+
PiBEbyB5b3Ugd2FudCB0byB0YWtlIHNvbWUgb2YgdGhlIGNvbW1pdHMgZnJvbSAKPj4gZ2l0Oi8v
cGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+dHVyc3VsaW4vZHJtLWludGVsIHNndGVzdD8gSXQgd291
bGQgYmUgCj4+IGZpbmUgYnkgbWUuIEkgY2FuIGNsZWFuIHVwIHRoZSBjb21taXQgbWVzc2FnZXMg
aWYgeW91IHdhbnQuCj4gCj4gSSB3aWxsIHZlcnkgYXBwcmVjaWF0ZSBpdC4gVGhhbmtzCgpJJ3Zl
IHB1c2hlZCBhIGJyYW5jaCB3aXRoIHRpZGllZCBjb21taXQgbWVzc2FnZXMgYW5kIGEgYml0IHJl
LW9yZGVyZWQgdG8gCnRoZSBzYW1lIGxvY2F0aW9uLiBZb3UgY2FuIHB1bGwgYW5kIGluY2x1ZGUg
aW4geW91ciBzZXJpZXM6CgogIHRvb2xzL3Rlc3Rpbmcvc2NhdHRlcmxpc3Q6IFJlanV2ZW5hdGUg
Yml0LXJvdHRlbiB0ZXN0CiAgdG9vbHMvdGVzdGluZy9zY2F0dGVybGlzdDogU2hvdyBlcnJvcnMg
aW4gaHVtYW4gcmVhZGFibGUgZm9ybQoKQW5kICJ0ZXN0IGZpeGVzIGZvciBzZyBhcHBlbmQiIHlv
dSBjYW4gc3F1YXNoIChtaW51cyB0aGUgc2dfdGFibGUgCnplcm9pbmcpIGludG8geW91ciBwYXRj
aC4KCklmIHRoaXMgcGxhbiBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIEkgY2FuIHNlbmQgdHdvIG9m
IG15IHBhdGNoZXMgdG8gbGttbCAKaW5kZXBlbmRlbnRseS4gV2hhdCBldmVyIHlvdSBwcmVmZXIu
CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
