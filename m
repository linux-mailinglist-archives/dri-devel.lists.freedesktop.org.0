Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B765317B54
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 16:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E548941E;
	Wed,  8 May 2019 14:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534838941E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 14:08:47 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61879
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hONFV-0002YE-Gp; Wed, 08 May 2019 16:08:45 +0200
Subject: Re: [PATCH] drm/cma-helper: Fix drm_gem_cma_free_object()
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20190426124753.53722-1-noralf@tronnes.org>
 <67fc69cc-7db3-968e-2492-acd01dc3def5@tronnes.org>
 <1816a2c7-d409-09f5-964e-ebe7d4b91d1d@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d1f983a0-fa3d-f3e1-707b-3412becc109e@tronnes.org>
Date: Wed, 8 May 2019 16:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1816a2c7-d409-09f5-964e-ebe7d4b91d1d@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=OXWL9yM5oSKvXY+Sc7sNvmmV1lIcFuLOw5jmcfOW6rc=; 
 b=C11pfppLtMrgZB4cdv4b181Uat0VLWF7YT6O5JXLMFO/XBN+xchN+ebE9yvTJw5yRIISfd1FRaNIJieIMEDm2JmQCTXKhJANlb0ABNeipCn3FmhSFuNMSSLruKv7UL1OZSigptel6JhQfBhw0cOjsXRZcEMs+6I61qCBgJBlpF+dBAI7HXMdkaVjSSk2ZEKmIcumfjOzvh7o2B2tFVHq9hb4q4b73FRM7adc8eLkBlU0ZXGvSGGC8pk2Zr9xoB0FXFbAAhQns7fQcBmSopbKyH0E1E4FV8dRau7vFjqVIn7Vusxbrr9Cv43QbDbSh+G00FrYxfybxAwvbkDYr+dvLA==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Tingqian" <tingqian.li@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDguMDUuMjAxOSAwOC4zMywgc2tyZXYgT2xla3NhbmRyIEFuZHJ1c2hjaGVua286Cj4g
T24gNS83LzE5IDc6MDQgUE0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gSGksCj4+Cj4+IENv
dWxkIHNvbWVvbmUgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgb25lPwo+Pgo+PiBOb3JhbGYu
Cj4+Cj4+IERlbiAyNi4wNC4yMDE5IDE0LjQ3LCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4+PiBU
aGUgbG9naWMgZm9yIGZyZWVpbmcgYW4gaW1wb3J0ZWQgYnVmZmVyIHdpdGggYSB2aXJ0dWFsIGFk
ZHJlc3MgaXMKPj4+IGJyb2tlbi4gSXQgd2lsbCBmcmVlIHRoZSBidWZmZXIgaW5zdGVhZCBvZiB1
bm1hcHBpbmcgdGhlIGRtYSBidWYuCj4+PiBGaXggYnkgcmV2ZXJzaW5nIHRoZSBpZiBsYWRkZXIg
YW5kIGZpcnN0IGNoZWNrIGlmIHRoZSBidWZmZXIgaXMKPj4+IGltcG9ydGVkLgo+Pj4KPj4+IEZp
eGVzOiBiOTA2OGNkZTUxZWUgKCJkcm0vY21hLWhlbHBlcjogQWRkIERSTV9HRU1fQ01BX1ZNQVBf
RFJJVkVSX09QUyIpCj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+Pj4gUmVwb3J0ZWQt
Ynk6ICJMaSwgVGluZ3FpYW4iIDx0aW5ncWlhbi5saUBpbnRlbC5jb20+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBSZXZpZXdlZC1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhhbmtzIE9sZWtzYW5kciwgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LWZpeGVzLgoKTm9y
YWxmLgoKPj4+IC0tLQo+Pj4KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxw
ZXIuYyB8IDggKysrKy0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX2NtYV9oZWxwZXIuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmMKPj4+IGluZGV4IGNjMjY2MjViNGIzMy4uZTAxY2VlZDA5ZTY3IDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMKPj4+IEBAIC0xODYsMTMgKzE4NiwxMyBAQCB2b2lk
IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0KHN0cnVjdAo+Pj4gZHJtX2dlbV9vYmplY3QgKmdlbV9v
YmopCj4+PiDCoCDCoMKgwqDCoMKgIGNtYV9vYmogPSB0b19kcm1fZ2VtX2NtYV9vYmooZ2VtX29i
aik7Cj4+PiDCoCAtwqDCoMKgIGlmIChjbWFfb2JqLT52YWRkcikgewo+Pj4gLcKgwqDCoMKgwqDC
oMKgIGRtYV9mcmVlX3djKGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5iYXNlLnNpemUsCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2Jq
LT5wYWRkcik7Cj4+PiAtwqDCoMKgIH0gZWxzZSBpZiAoZ2VtX29iai0+aW1wb3J0X2F0dGFjaCkg
ewo+Pj4gK8KgwqDCoCBpZiAoZ2VtX29iai0+aW1wb3J0X2F0dGFjaCkgewo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChjbWFfb2JqLT52YWRkcikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRtYV9idWZfdnVubWFwKGdlbV9vYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwKPj4+IGNt
YV9vYmotPnZhZGRyKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fcHJpbWVfZ2VtX2Rlc3Ry
b3koZ2VtX29iaiwgY21hX29iai0+c2d0KTsKPj4+ICvCoMKgwqAgfSBlbHNlIGlmIChjbWFfb2Jq
LT52YWRkcikgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9mcmVlX3djKGdlbV9vYmotPmRldi0+
ZGV2LCBjbWFfb2JqLT5iYXNlLnNpemUsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2JqLT5wYWRkcik7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+
IMKgIMKgwqDCoMKgwqAgZHJtX2dlbV9vYmplY3RfcmVsZWFzZShnZW1fb2JqKTsKPj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
