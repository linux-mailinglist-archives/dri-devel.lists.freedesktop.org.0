Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583C371FAB
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70F6E907;
	Mon,  3 May 2021 18:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7516E8F0;
 Mon,  3 May 2021 18:29:23 +0000 (UTC)
IronPort-SDR: iU6VAZlf99gtZ17LMptMZ6dd7wH7OpSybvUquPUbec/6puaS0OTt2CmaExPwDvbRilh4fDZtjJ
 NziVKjHhSQbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197865501"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="197865501"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 11:29:19 -0700
IronPort-SDR: w4sprYtaZTbT8FEZ+lnmmBvzGtxmtqNVhd/TBi0Fz1s5PINrPPOoNkw2X6HsqcjPbMjljMRrXc
 D26roez9UeAA==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="530654273"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 11:29:18 -0700
Date: Mon, 3 May 2021 11:29:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/1] i915/query: Correlate engine and cpu timestamps with
 better accuracy
Message-ID: <20210503182914.GB50683@orsosgc001.ra.intel.com>
References: <20210429003410.69754-1-umesh.nerlige.ramappa@intel.com>
 <20210429003410.69754-2-umesh.nerlige.ramappa@intel.com>
 <CAOFGe95O_Q09p4c5Sru0_5E-tBG3DFGm+f-uX-_YHx-UHLOBUA@mail.gmail.com>
 <20210430222609.GC38093@orsosgc001.ra.intel.com>
 <87czubbco1.wl-ashutosh.dixit@intel.com>
 <179255a3b48.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <20210501021959.GA50683@orsosgc001.ra.intel.com>
 <878s4zayqh.wl-ashutosh.dixit@intel.com>
 <179288a4d58.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179288a4d58.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMDEsIDIwMjEgYXQgMTA6Mjc6MDNBTSAtMDUwMCwgSmFzb24gRWtzdHJhbmQg
d3JvdGU6Cj4gICBPbiBBcHJpbCAzMCwgMjAyMSAyMzowMTo0NCAiRGl4aXQsIEFzaHV0b3NoIiA8
YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPgo+ICAgd3JvdGU6Cj4KPiAgICAgT24gRnJpLCAzMCBB
cHIgMjAyMSAxOToxOTo1OSAtMDcwMCwgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3RlOgo+Cj4g
ICAgICAgT24gRnJpLCBBcHIgMzAsIDIwMjEgYXQgMDc6MzU6NDFQTSAtMDUwMCwgSmFzb24gRWtz
dHJhbmQgd3JvdGU6Cj4KPiAgICAgICAgIE9uIEFwcmlsIDMwLCAyMDIxIDE4OjAwOjU4ICJEaXhp
dCwgQXNodXRvc2giCj4gICAgICAgICA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPgo+ICAgICAg
ICAgd3JvdGU6Cj4gICAgICAgICBPbiBGcmksIDMwIEFwciAyMDIxIDE1OjI2OjA5IC0wNzAwLCBV
bWVzaCBOZXJsaWdlIFJhbWFwcGEgd3JvdGU6Cj4gICAgICAgICBMb29rcyBsaWtlIHRoZSBlbmdp
bmUgY2FuIGJlIGRyb3BwZWQgc2luY2UgYWxsIHRpbWVzdGFtcHMgYXJlIGluCj4gICAgICAgICBz
eW5jLgo+ICAgICAgICAgSQo+ICAgICAgICAganVzdCBoYXZlIG9uZSBtb3JlIHF1ZXN0aW9uIGhl
cmUuIFRoZSB0aW1lc3RhbXAgaXRzZWxmIGlzIDM2IGJpdHMuCj4gICAgICAgICDCoFNob3VsZAo+
ICAgICAgICAgdGhlIHVhcGkgYWxzbyByZXBvcnQgdGhlIHRpbWVzdGFtcCB3aWR0aCB0byB0aGUg
dXNlciBPUiBzaG91bGQgSQo+ICAgICAgICAganVzdAo+ICAgICAgICAgcmV0dXJuIHRoZSBsb3dl
ciAzMiBiaXRzIG9mIHRoZSB0aW1lc3RhbXA/Cj4gICAgICAgICBZZWFoLCBJIHRoaW5rIHJlcG9y
dGluZyB0aGUgdGltZXN0YW1wIHdpZHRoIGlzIGEgZ29vZCBpZGVhIHNpbmNlCj4gICAgICAgICB3
ZSdyZQo+ICAgICAgICAgcmVwb3J0aW5nIHRoZSBwZXJpb2QvZnJlcXVlbmN5IGhlcmUuCj4KPiAg
ICAgICBBY3R1YWxseSwgSSBmb3Jnb3QgdGhhdCB3ZSBhcmUgaGFuZGxpbmcgdGhlIG92ZXJmbG93
IGJlZm9yZSByZXR1cm5pbmcKPiAgICAgICB0aGUKPiAgICAgICBjc19jeWNsZXMgdG8gdGhlIHVz
ZXIgYW5kIG92ZXJmbG93IGhhbmRsaW5nIHdhcyB0aGUgb25seSByZWFzb24gSQo+ICAgICAgIHRo
b3VnaHQKPiAgICAgICB1c2VyIHNob3VsZCBrbm93IHRoZSB3aWR0aC4gV291bGQgeW91IHN0aWwg
cmVjb21tZW5kIHJldHVybmluZyB0aGUKPiAgICAgICB3aWR0aCBpbgo+ICAgICAgIHRoZSB1YXBp
Pwo+Cj4gICAgIFRoZSB3aWR0aCBpcyBuZWVkZWQgZm9yIHVzZXJzcGFjZSB0byBmaWd1cmUgb3V0
IGlmIG92ZXJmbG93IGhhcyBvY2N1cmVkCj4gICAgIGJldHdlZW4gdHdvIHN1Y2Nlc3NpdmUgcXVl
cnkgY2FsbHMuIEkgZG9uJ3QgdGhpbmsgSSBzZWUgdGhpcyBoYXBwZW5pbmcKPiAgICAgaW4KPiAg
ICAgdGhlIGNvZGUuCj4KPiAgIFJpZ2h0Li4uIFdlIChVTURzKSBjdXJyZW50bHkganVzdCBoYXJk
LWNvZGUgaXQgdG8gMzYgYml0cyBiZWNhdXNlIHRoYXQncwo+ICAgd2hhdCB3ZSd2ZSBoYWQgb24g
YWxsIHBsYXRmb3JtcyBzaW5jZSBjbG9zZSBlbm91Z2ggdG8gZm9yZXZlci4gV2UgYmFrZSBpbgo+
ICAgdGhlIGZyZXF1ZW5jeSBiYXNlZCBvbiBQQ0kgSUQuIFJldHVybmluZyB0aGUgbnVtYmVyIG9m
IGJpdHMsIGxpa2UgSSBzYWlkLAo+ICAgZ29lcyBuaWNlbHkgd2l0aCB0aGUgZnJlcXVlbmN5LiBJ
dCdzIG5vdCBuZWNlc3NhcnksIGFzc3VtaW5nIHN1ZmZpY2llbnRseQo+ICAgc21hcnQgdXNlcnNw
YWNlIChuZWl0aGVyIGlzIGZyZXF1ZW5jeSksIGJ1dCBpdCBzZWVtcyB0byBnbyB3aXRoIGl0LiBJ
Cj4gICBndWVzcyBJIGRvbid0IGNhcmUgbXVjaCBlaXRoZXIgd2F5Lgo+ICAgQ29taW5nIGJhY2sg
dG8gdGhlIG11bHRpLXRpbGUgaXNzdWUgd2UgZGlzY3Vzc2VkIGludGVybmFsbHksIEkgdGhpbmsg
dGhhdAo+ICAgaXMgc29tZXRoaW5nIHdlIHNob3VsZCBjYXJlIGFib3V0LiBTaW5jZSB0aGlzIHdv
cmtzIGJ5IHJlYWRpbmcgdGhlCj4gICB0aW1lc3RhbXAgcmVnaXN0ZXIgb24gYW4gZW5naW5lLCBJ
IHRoaW5rIGxlYXZpbmcgdGhlIGVuZ2luZSBzcGVjaWZpZXIgaW4KPiAgIHRoZXJlIGlzIGZpbmUu
IFVzZXJzcGFjZSBzaG91bGQga25vdyB0aGF0IHRoZXJlJ3MgYWN0dWFsbHkgb25seSBvbmUgY2xv
Y2sKPiAgIGFuZCBqdXN0IHF1ZXJ5IG9uZSBvZiB0aGVtIChwcm9iYWJseSBSQ1MpLiBGb3IgY3Jh
enkgbXVsdGktZGV2aWNlIGNhc2VzLAo+ICAgd2UnbGwgZWl0aGVyIHF1ZXJ5IHBlciBsb2dpY2Fs
IGRldmljZSAocmVhZCB0aWxlKSBvciB3ZSdsbCBoYXZlIHRvIG1ha2UKPiAgIHRoZW0gbG9vayBs
aWtlIGEgc2luZ2xlIGRldmljZSBhbmQgc3luYyB0aGUgdGltZXN0YW1wcyBzb21laG93IGluIHRo
ZSBVTUQKPiAgIGJ5IGNhcnJ5aW5nIGFyb3VuZCBhbiBvZmZzZXQgZmFjdG9yLgo+ICAgQXMgaXMs
IHRoaXMgcGF0Y2ggaXMKPiAgIFJldmlld2VkLWJ5OiBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxl
a3N0cmFuZC5uZXQ+CgpUaGFua3MsIEkgd2lsbCBhZGQgdGhlIHdpZHRoIGhlcmUgYW5kIHBvc3Qg
dGhlIGZpbmFsIHZlcnNpb24uCgpSZWdhcmRzLApVbWVzaAoKCj4gICBJIHN0aWxsIG5lZWQgdG8g
cmV2aWV3IHRoZSBBTlYgcGF0Y2ggYmVmb3JlIHdlIGNhbiBsYW5kIHRoaXMgdGhvdWdoLgo+ICAg
LS1KYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
