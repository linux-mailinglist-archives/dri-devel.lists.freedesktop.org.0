Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E413479B7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767DE6EA03;
	Wed, 24 Mar 2021 13:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D806EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 13:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D27823F306;
 Wed, 24 Mar 2021 14:35:43 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="jLDwV+Er";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCCawRD9HjzC; Wed, 24 Mar 2021 14:35:42 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5BC633F240;
 Wed, 24 Mar 2021 14:35:41 +0100 (CET)
Received: from [10.249.254.166] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1094F3605CC;
 Wed, 24 Mar 2021 14:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616592940; bh=xXXPaXg/ez/sdT5QhHcHgxfrUBmPliIL2wIReLDhQjg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jLDwV+ErQCFc9TDEXXtEKVz3UmVZeq8QhPHnWwi1TirvzsnfI9q3YDlRhzlQo9Jdb
 rk12O2Ix72T/YIQT+f5qDz1zPAUTO3Clcf4MPsp8s7O6hWzwRbI+Kta7xrDj1SWjL8
 yytllN4Da6Ny67AVboYIif4JsFGznBS98kkmWoeY=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local> <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
Date: Wed, 24 Mar 2021 14:35:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324124127.GY2356281@nvidia.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgMTo0MSBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDI0LCAyMDIxIGF0IDAxOjM1OjE3UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IE9uIDMvMjQvMjEgMToyNCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4g
T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMTA6NTY6NDNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPj4+PiBPbiBUdWUsIE1hciAyMywgMjAyMSBhdCAwNjowNjo1M1BNICswMTAwLCBUaG9t
YXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Pj4+PiBPbiAzLzIzLzIxIDU6MzcgUE0sIEph
c29uIEd1bnRob3JwZSB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwgTWFyIDIzLCAyMDIxIGF0IDA1OjM0
OjUxUE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pj4+Pgo+Pj4+
Pj4+Pj4gQEAgLTIxMCw2ICsyMTEsMjAgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2lu
c2VydF9odWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+Pj4+Pj4+Pj4gICAgICAJaWYgKChwZm4g
JiAoZmF1bHRfcGFnZV9zaXplIC0gMSkpICE9IDApCj4+Pj4+Pj4+PiAgICAgIAkJZ290byBvdXRf
ZmFsbGJhY2s7Cj4+Pj4+Pj4+PiArCS8qCj4+Pj4+Pj4+PiArCSAqIEh1Z2UgZW50cmllcyBtdXN0
IGJlIHNwZWNpYWwsIHRoYXQgaXMgbWFya2luZyB0aGVtIGFzIGRldm1hcAo+Pj4+Pj4+Pj4gKwkg
KiB3aXRoIG5vIGJhY2tpbmcgZGV2aWNlIG1hcCByYW5nZS4gSWYgdGhlcmUgaXMgYSBiYWNraW5n
Cj4+Pj4+Pj4+PiArCSAqIHJhbmdlLCBEb24ndCBpbnNlcnQgYSBodWdlIGVudHJ5Lgo+Pj4+Pj4+
Pj4gKwkgKiBJZiB0aGlzIGNoZWNrIHR1cm5zIG91dCB0byBiZSB0b28gbXVjaCBvZiBhIHBlcmZv
cm1hbmNlIGhpdCwKPj4+Pj4+Pj4+ICsJICogd2UgY2FuIGluc3RlYWQgaGF2ZSBkcml2ZXJzIGlu
ZGljYXRlIHdoZXRoZXIgdGhleSBtYXkgaGF2ZQo+Pj4+Pj4+Pj4gKwkgKiBiYWNraW5nIGRldmlj
ZSBtYXAgcmFuZ2VzIGFuZCBpZiBub3QsIHNraXAgdGhpcyBsb29rdXAuCj4+Pj4+Pj4+PiArCSAq
Lwo+Pj4+Pj4+PiBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIHN0YXRpY2FsbHk6Cj4+Pj4+Pj4+IC0g
aWYgaXQncyBzeXN0ZW0gbWVtb3J5IHdlIGtub3cgdGhlcmUncyBubyBkZXZtYXAgZm9yIGl0LCBh
bmQgd2UgZG8gdGhlCj4+Pj4+Pj4+ICAgICAgIHRyaWNrIHRvIGJsb2NrIGd1cF9mYXN0Cj4+Pj4+
Pj4gWWVzLCB0aGF0IHNob3VsZCB3b3JrLgo+Pj4+Pj4+PiAtIGlmIGl0J3MgaW9tZW0sIHdlIGtu
b3cgZ3VwX2Zhc3Qgd29udCB3b3JrIGFueXdheSBpZiBkb24ndCBzZXQgUEZOX0RFViwKPj4+Pj4+
Pj4gICAgICAgc28gbWlnaHQgYXMgd2VsbCBub3QgZG8gdGhhdAo+Pj4+Pj4+IEkgdGhpbmsgZ3Vw
X2Zhc3Qgd2lsbCB1bmZvcnR1bmF0ZWx5IG1pc3Rha2UgYSBodWdlIGlvbWVtIHBhZ2UgZm9yIGFu
Cj4+Pj4+Pj4gb3JkaW5hcnkgcGFnZSBhbmQgdHJ5IHRvIGFjY2VzcyBhIG5vbi1leGlzdGFudCBz
dHJ1Y3QgcGFnZSBmb3IgaXQsIHVubGVzcyB3ZQo+Pj4+Pj4+IGRvIHRoZSBkZXZtYXAgdHJpY2su
Cj4+Pj4+Pj4KPj4+Pj4+PiBBbmQgdGhlIGxvb2t1cCB3b3VsZCB0aGVuIGJlIGZvciB0aGUgcmFy
ZSBjYXNlIHdoZXJlIGEgZHJpdmVyIHdvdWxkIGhhdmUKPj4+Pj4+PiBhbHJlYWR5IHJlZ2lzdGVy
ZWQgYSBkZXZfcGFnZW1hcCBmb3IgYW4gaW9tZW0gYXJlYSB3aGljaCBtYXkgYWxzbyBiZSBtYXBw
ZWQKPj4+Pj4+PiB0aHJvdWdoIFRUTSAobGlrZSB0aGUgcGF0Y2ggZnJvbSBGZWxpeCBhIGNvdXBs
ZSBvZiB3ZWVrcyBhZ28pLiBJZiBhIGRyaXZlcgo+Pj4+Pj4+IGNhbiBwcm9taXNlIG5vdCB0byBk
byB0aGF0LCB0aGVuIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRoZSBsb29rdXAuCj4+Pj4+PiBJc24n
dCB0aGUgZGV2bWFwIFBURSBmbGFnIGFyY2ggb3B0aW9uYWw/IERvZXMgdGhpcyBmYWxsIGJhY2sg
dG8gbm90Cj4+Pj4+PiB1c2luZyBodWdlIHBhZ2VzIG9uIGFyY2hlcyB0aGF0IGRvbid0IHN1cHBv
cnQgaXQ/Cj4+Pj4+IEdvb2QgcG9pbnQuIE5vLCBjdXJyZW50bHkgaXQncyBvbmx5IGNvbmRpdGlv
bmVkIG9uIHRyYW5zaHVnZSBwYWdlIHN1cHBvcnQuCj4+Pj4+IE5lZWQgdG8gY29uZGl0aW9uIGl0
IG9uIGFsc28gZGV2bWFwIHN1cHBvcnQuCj4+Pj4+Cj4+Pj4+PiBBbHNvLCBJIGZlZWwgbGlrZSB0
aGlzIGNvZGUgdG8gaW5zdGFsbCAicHRlX3NwZWNpYWwiIGh1Z2UgcGFnZXMgZG9lcwo+Pj4+Pj4g
bm90IGJlbG9uZyBpbiB0aGUgZHJtIHN1YnN5c3RlbS4uCj4+Pj4+IEkgY291bGQgYWRkIGhlbHBl
cnMgaW4gaHVnZV9tZW1vcnkuYzoKPj4+Pj4KPj4+Pj4gdm1mX2luc2VydF9wZm5fcG1kX3Byb3Rf
c3BlY2lhbCgpIGFuZAo+Pj4+PiB2bWZfaW5zZXJ0X3Bmbl9wdWRfcHJvdF9zcGVjaWFsKCkKPj4+
PiBUaGUgc29tZXdoYXQgYW5ub3lpbmcgdGhpbmcgaXMgdGhhdCB3ZSdkIG5lZWQgYW4gZXJyb3Ig
Y29kZSBzbyB3ZSBmYWxsCj4+Pj4gYmFjayB0byBwdGUgZmF1bHQgaGFuZGxpbmcuIFRoYXQncyBh
dCBsZWFzdCBteSB1bmRlcnN0YW5kaW5nIG9mIGhvdwo+Pj4+IHB1ZC9wbWQgZmF1bHQgaGFuZGxp
bmcgd29ya3MuIE5vdCBzdXJlIGhvdyBhd2t3YXJkIHRoYXQgaXMgZ29pbmcgdG8gYmUKPj4+PiB3
aXRoIHRoZSBvdmVyYWxsIGZhdWx0IGhhbmRsaW5nIGZsb3cuCj4+Pj4KPj4+PiBCdXQgYXNpZGUg
ZnJvbSB0aGF0IEkgdGhpbmsgdGhpcyBtYWtlcyB0b25zIG9mIHNlbnNlLgo+Pj4gV2h5IHNob3Vs
ZCB0aGUgZHJpdmVyIGJlIHNvIHNwZWNpZmljPwo+Pj4KPj4+IHZtZl9pbnNlcnRfcGZuX3Jhbmdl
X1hYWCgpCj4+Pgo+Pj4gQW5kIGl0IHdpbGwgZmlndXJlIG91dCB0aGUgb3B0aW1hbCB3YXkgdG8g
YnVpbGQgdGhlIHBhZ2UgdGFibGVzLgo+Pj4KPj4+IERyaXZlciBzaG91bGQgcHJvdmlkZSB0aGUg
bGFyZ2VzdCBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgcmFuZ2UgaXQgY2FuCj4+IEkgZmlndXJlIHRo
YXQgd291bGQgcHJvYmFibHkgd29yaywgYnV0IHNpbmNlIHRoZSBodWdlX2ZhdWx0KCkgaW50ZXJm
YWNlIGlzCj4+IGFscmVhZHkgcHJvdmlkaW5nIHRoZSBzaXplIG9mIHRoZSBmYXVsdCBiYXNlZCBv
biBob3cgdGhlIHBhZ2V0YWJsZSBpcwo+PiBjdXJyZW50bHkgcG9wdWxhdGVkIEkgZmlndXJlIHRo
YXQgd291bGQgaGF2ZSB0byBtb3ZlIGEgbG90IG9mIHRoYXQgbG9naWMKPj4gaW50byB0aGF0IGhl
bHBlci4uLgo+IEJ1dCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91dCB0aGUgc2l6ZSBvZiB0aGUg
ZmF1bHQgd2hlbiB3ZSBzdHVmZiB0aGUKPiBwZm5zLgo+Cj4gVGhlIGRldmljZSBtaWdodCB1c2Ug
aXQgd2hlbiBoYW5kbGluZyB0aGUgZmF1bHQsIGJ1dCBvbmNlIHRoZSBmYXVsdCBpcwo+IGhhbmRs
ZWQgdGhlIGRldmljZSBrbm93cyB3aGF0IHRoZSBjb250aWd1b3VzIHBmbiByYW5nZSBpcyB0aGF0
IGl0IGhhcwo+IGF2YWlsYWJsZSB0byBzdHVmZiBpbnRvIHRoZSBwYWdlIHRhYmxlcywgaXQganVz
dCB0ZWxscyB0aGUgdm1mX2luc2VydAo+IHdoYXQgaXQgd2FzIGFibGUgdG8gY3JlYXRlLCBhbmQg
aXQgY3JlYXRlcyB0aGUgbmVjZXNzYXJ5IHBhZ2UgdGFibGUKPiBzdHJ1Y3R1cmUuCj4KPiBUaGUg
c2l6ZSBvZiB0aGUgaG9sZSBpbiB0aGUgcGFnZSB0YWJsZSBpcyByZWFsbHkgb25seSBhZHZpc29y
eSwgdGhlCj4gZGV2aWNlIG1heSBub3Qgd2FudCB0byBtYWtlIGEgMk0gb3IgMUcgcGFnZSBlbnRy
eSBhbmQgbWF5IHByZWZlciB0bwo+IG9ubHkgY3JlYXRlIDRrLgo+Cj4gSW4gYW4gaWRlYWwgd29y
bGQgdGhlIGNyZWF0aW9uL2Rlc3RydWN0aW9uIG9mIHBhZ2UgdGFibGUgbGV2ZWxzIHdvdWxkCj4g
YnkgZHluYW1pYyBhdCB0aGlzIHBvaW50LCBsaWtlIFRIUC4KCkhtbSwgYnV0IEknbSBub3Qgc3Vy
ZSB3aGF0IHByb2JsZW0gd2UncmUgdHJ5aW5nIHRvIHNvbHZlIGJ5IGNoYW5naW5nIHRoZSAKaW50
ZXJmYWNlIGluIHRoaXMgd2F5PwoKQ3VycmVudGx5IGlmIHRoZSBjb3JlIHZtIHJlcXVlc3RzIGEg
aHVnZSBwdWQsIHdlIGdpdmUgaXQgb25lLCBhbmQgaWYgd2UgCmNhbid0IG9yIGRvbid0IHdhbnQg
dG8gKGJlY2F1c2Ugb2YgZGlydHktdHJhY2tpbmcsIGZvciBleGFtcGxlLCB3aGljaCBpcyAKYWx3
YXlzIGRvbmUgb24gNEsgcGFnZS1sZXZlbCkgd2UganVzdCByZXR1cm4gVk1fRkFVTFRfRkFMTEJB
Q0ssIGFuZCB0aGUgCmZhdWx0IGlzIHJldHJpZWQgYXQgYSBsb3dlciBsZXZlbC4gQWxzbywgZGV0
ZXJtaW5pbmcgd2hldGhlciB3ZSBoYXZlIGEgCmNvbnRpZ291cyByYW5nZSBpcyBub3QgZnJlZSwg
c28gd2XCoCBkb24ndCB3YW50IHRvIGRvIHRoYXQgdW5uZWNlc3NhcmlseS4KCi9UaG9tYXMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
