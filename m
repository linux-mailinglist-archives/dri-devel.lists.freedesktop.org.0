Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3424DF1
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1BD892BE;
	Tue, 21 May 2019 11:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96AE892BE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 11:34:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LBYbd6012090;
 Tue, 21 May 2019 06:34:37 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LBYbOW000751
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2019 06:34:37 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 06:34:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 06:34:36 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4LBYYg1076314;
 Tue, 21 May 2019 06:34:34 -0500
Subject: Re: [PATCHv3 22/23] drm/bridge: tc358767: add IRQ and HPD support
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123143epcas1p3e660a6578d5a6261e7885928db6cba8f@epcas1p3.samsung.com>
 <20190503122949.12266-23-tomi.valkeinen@ti.com>
 <93a0800e-ab83-e2f3-32d8-eb9e5ef8c5f1@samsung.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1ea932c7-a6d6-e4fc-bad4-ea9519656018@ti.com>
Date: Tue, 21 May 2019 14:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <93a0800e-ab83-e2f3-32d8-eb9e5ef8c5f1@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558438477;
 bh=dka4fbszKlUsgnpRe6tNoOZtvZQPBFxY28bfjqDCYbw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=hkGbBaRVTY7GlMBXVr9pFvwnBl6QvWzo4sf7cJ202OLJ0moSgMelX3IsbeVLdrZXO
 rA4ugXXD0ZyuTy7eunPfVUL9HrwLQLMXQMXRQwNG+ewkcuhWJI3YQ/iK0j3onx/AMl
 IKsQ2Wew0hwEpP9mlR+tbtgIzC2yP+4yt/Yqc8EU=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDUvMjAxOSAxMDowNywgQW5kcnplaiBIYWpkYSB3cm90ZToKCj4+IEBAIC0xMjE0LDE5
ICsxMjM0LDQzIEBAIHN0YXRpYyBpbnQgdGNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+PiAgIAlyZXR1cm4gY291bnQ7Cj4+ICAgfQo+PiAgIAo+
PiAtc3RhdGljIHZvaWQgdGNfY29ubmVjdG9yX3NldF9wb2xsaW5nKHN0cnVjdCB0Y19kYXRhICp0
YywKPj4gLQkJCQkgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4+IC17Cj4+
IC0JLyogVE9ETzogYWRkIHN1cHBvcnQgZm9yIEhQRCAqLwo+PiAtCWNvbm5lY3Rvci0+cG9sbGVk
ID0gRFJNX0NPTk5FQ1RPUl9QT0xMX0NPTk5FQ1QgfAo+PiAtCQkJICAgIERSTV9DT05ORUNUT1Jf
UE9MTF9ESVNDT05ORUNUOwo+PiAtfQo+PiAtCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y29ubmVjdG9yX2hlbHBlcl9mdW5jcyB0Y19jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewo+PiAg
IAkuZ2V0X21vZGVzID0gdGNfY29ubmVjdG9yX2dldF9tb2RlcywKPj4gICB9Owo+PiAgIAo+PiAr
c3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgdGNfY29ubmVjdG9yX2RldGVjdChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+PiArCQkJCQkJICAgICBib29sIGZvcmNlKQo+
PiArewo+PiArCXN0cnVjdCB0Y19kYXRhICp0YyA9IGNvbm5lY3Rvcl90b190Yyhjb25uZWN0b3Ip
Owo+PiArCWJvb2wgY29ubjsKPj4gKwl1MzIgdmFsOwo+PiArCWludCByZXQ7Cj4gdW51c2VkIHZh
cgoKTmVlZGVkIGZvciB0Y193cml0ZS9yZWFkLi4uID0oIENsZWFuaW5nIHRoZXNlIHVwIHdpbGwg
YmUgdGhlIG5leHQgc3RlcC4KCj4+ICsKPj4gKwlpZiAodGMtPmhwZF9waW4gPCAwKSB7Cj4+ICsJ
CWlmICghdGMtPnBhbmVsKQo+PiArCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93bjsK
Pj4gKwo+PiArCQljb25uID0gdHJ1ZTsKPj4gKwl9IGVsc2Ugewo+PiArCQl0Y19yZWFkKEdQSU9J
LCAmdmFsKTsKPj4gKwo+PiArCQljb25uID0gdmFsICYgQklUKHRjLT5ocGRfcGluKTsKPj4gKwl9
Cj4+ICsKPj4gKwlpZiAoZm9yY2UgJiYgY29ubikKPj4gKwkJdGNfZ2V0X2Rpc3BsYXlfcHJvcHMo
dGMpOwo+IAo+IAo+IFdoeSBkbyB5b3UgY2FsbCB0Y19nZXRfZGlzcGxheV9wcm9wcyBoZXJlPyBJ
dCBpcyBjYWxsZWQgYWxyZWFkeSBpbiAuZW5hYmxlLgo+IAo+IElmIHlvdSBuZWVkIGl0IGZvciBn
ZXRfbW9kZXMgeW91IGNhbiBjYWxsIGl0IHRoZXJlLiBIZXJlIGl0IGxvb2tzIHVucmVsYXRlZC4K
ClllcywgaXQncyBuZWVkZWQgZm9yIGdldF9tb2Rlcy4gT3IgbW9yZSBzcGVjaWZpY2FsbHksIGZv
ciB0Y19tb2RlX3ZhbGlkLiBJIGFncmVlIGl0IApkb2Vzbid0IHF1aXRlIGZlZWwgcmlnaHQsIGJ1
dCBJIHdvdWxkbid0IHNheSBpdCdzIHVucmVsYXRlZCwgb3IgdGhhdCB0aGlzIGlzIGEgd3Jvbmcg
cGxhY2UuCgpBZmFpY3MsIHdlIG5lZWQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMgaW4gYnJpZGdlX2Vu
YWJsZSwgZm9yIHRoZSBjYXNlIHdoZXJlIHdlIGRvbid0IGhhdmUgCmhwZC4gV2UgY291bGQgY2Fs
bCB0Y19nZXRfZGlzcGxheV9wcm9wcyBpbiBnZXRfbW9kZXMsIGJ1dCBJIGRvbid0IGtub3cgaWYg
d2UgYWx3YXlzIGdldCBhIApnZXRfbW9kZXMgY2FsbC4gT3IgbWF5YmUgd2UgZ2V0IG11bHRpcGxl
IGdldF9tb2RlcyBjYWxscywgYW5kIHdlIGRvIHVubmVjZXNzYXJ5IAp0Y19nZXRfZGlzcGxheV9w
cm9wcyBjYWxscy4KCk5vdyB0aGF0IEkgd3JvdGUgdGhlIGFib3ZlLCBpdCBtYWtlcyBtZSB3b25k
ZXIgd2hldGhlciB0aGUgZ2V0X21vZGVzIHdvcmtzIGluIHRoZSBjdXJyZW50IApwYXRjaGVzIGlm
IHdlIGRvbid0IGhhdmUgaHBkLi4uCgpXZSBjb3VsZCBjYWNoZSB0Y19nZXRfZGlzcGxheV9wcm9w
cyByZXN1bHRzLCB0b28sIGJ1dCBJJ20gbm90IHN1cmUgd2hlbiB0byBjbGVhciB0aGUgCmNhY2hl
LCBlc3BlY2lhbGx5IGlmIHdlIGRvbid0IGhhdmUgaHBkLgoKRGlzcGxheVBvcnQgc3BlYyB0YWxr
cyBhYm91dCBkb2luZyB0aGUgZGlzcGxheS1wcm9wcyByZWFkaW5nIGFuZCBFRElEIHJlYWRpbmcg
d2hlbiAKaGFuZGxpbmcgSFBELgoKSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGNoYW5nZSB0
aGUgY29kZSBzbyB0aGF0IHdlIHJlYWQgZGlzcGxheSBwcm9wcyBhbmQgRURJRCBpbiBIUEQsIApi
dXQgc28gdGhhdCB3ZSBhbHNvIGNhbiByZWFkIHRoZW0gbGF0ZXIgKHdoZW4gbmVlZGVkLCBwcm9i
YWJseSBicmlkZ2UgZW5hYmxlIGFuZCAKZ2V0X21vZGVzKSBpZiB3ZSBoYXZlbid0IGRvbmUgdGhl
IHJlYWRzIGFscmVhZHkuIEkndmUgaGFkIHRoaXMgaW4gbWluZCBzaW5jZSBJIHN0YXJ0ZWQgdGhl
IApzZXJpZXMsIGJ1dCBhcyBpdCBkaWRuJ3QgZmVlbCBsaWtlIGEgc2ltcGxlIGNoYW5nZSwgSSBs
ZWZ0IGl0IGZvciBsYXRlci4KCj4gUmVtb3ZpbmcgdGhlIGNhbGwgZnJvbSBoZXJlIHNob3VsZCBh
bHNvIHNpbXBsaWZ5IGZ1bmN0aW9uIGZsb3c6Cj4gCj4gIMKgwqDCoCBpZiAodGMtPmhwZF9waW4g
PCAwKQo+IAo+ICDCoMKgwqAgwqDCoMKgIHJldHVybiB0Yy0+cGFuZWwgPyBjb25uZWN0b3Jfc3Rh
dHVzX2Nvbm5lY3RlZCA6Cj4gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Cj4gCj4gIMKg
wqDCoCB0Y19yZWFkKEdQSU9JLCAmdmFsKTsKPiAKPiAgwqDCoMKgIHJldHVybiAodmFsICYgQklU
KHRjLT5ocGRfcGluKSk/ID8gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgOgo+IGNvbm5lY3Rv
cl9zdGF0dXNfZGlzY29ubmVjdGVkOwo+IAo+IAo+PiArCj4+ICsJaWYgKGNvbm4pCj4+ICsJCXJl
dHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKPj4gKwllbHNlCj4+ICsJCXJldHVybiBj
b25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsKPj4gKwo+PiArZXJyOgo+IAo+IAo+IHVudXNl
ZCBsYWJlbC9jb2RlPwoKTmVlZGVkIGZvciB0Y193cml0ZS9yZWFkIHRvby4KCj4+IEBAIC0xMjQ5
LDYgKzEyOTMsMTUgQEAgc3RhdGljIGludCB0Y19icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UpCj4+ICAgCWlmIChyZXQpCj4+ICAgCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiAr
CS8qIERvbid0IHBvbGwgaWYgZG9uJ3QgaGF2ZSBIUEQgY29ubmVjdGVkICovCj4+ICsJaWYgKHRj
LT5ocGRfcGluID49IDApIHsKPj4gKwkJaWYgKHRjLT5oYXZlX2lycSkKPj4gKwkJCXRjLT5jb25u
ZWN0b3IucG9sbGVkID0gRFJNX0NPTk5FQ1RPUl9QT0xMX0hQRDsKPj4gKwkJZWxzZQo+PiArCQkJ
dGMtPmNvbm5lY3Rvci5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfQ09OTkVDVCB8Cj4+ICsJ
CQkJCSAgICAgICBEUk1fQ09OTkVDVE9SX1BPTExfRElTQ09OTkVDVDsKPiAKPiAKPiBCaWtlc2hl
ZGRpbmc6IHdvdWxkbid0IGJlIG1vcmUgY2xlYXIgdG8gdXNlID86wqAgb3BlcmF0b3I/CgpEZXBl
bmRzIG9uIHRoZSByZWFkZXIsIEkgZ3Vlc3MuIEkgbGlrZSA/OiB3aGVuIHRoZSBwYXJhbWV0ZXJz
IGFyZSByZWxhdGl2ZWx5IHNpbXBsZSAoc2F5LCAKYSBzaW5nbGUgdmFyaWFibGUpLiBIZXJlIGl0
J3MgYSBiaXQgc28tYW5kLXNvIHdpdGggdGhlIHNlY29uZCBjYXNlJ3MgYml0d2lzZS1vci4KCiAg
VG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogCjA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
