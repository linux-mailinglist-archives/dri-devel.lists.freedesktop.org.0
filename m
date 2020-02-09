Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9B156A28
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 13:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3AD6E7DA;
	Sun,  9 Feb 2020 12:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A3B6E7DA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 12:50:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 019CoDv0038674;
 Sun, 9 Feb 2020 06:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581252613;
 bh=c2RnNKi59rtyNTLbDCaKnXeA58gwQV54Vu4tUFTBnho=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MhF+iSf88VmsPBXMoB6nmspvXwwqzOxjrx8hDpZ5AgTeQmXNEKuzicZaiqEsPMhNj
 fUtdRDNtkKTgijWa6eFt10wr9IqoNUzsVWjxNEu4mhYdMztPqQWVUBMV6vFviAhBSA
 aETf/fnWRdUXfseQc5WNq/Co0JUZQA+i9pJjoJ0w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 019CoCIZ126161
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 9 Feb 2020 06:50:13 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 9 Feb
 2020 06:50:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 9 Feb 2020 06:50:12 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 019CoAEv006956;
 Sun, 9 Feb 2020 06:50:10 -0600
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
Date: Sun, 9 Feb 2020 14:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200207184545.GQ13686@intel.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDIvMjAyMCAyMDo0NSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIEZyaSwgRmVi
IDA3LCAyMDIwIGF0IDA4OjI2OjE3UE0gKzAyMDAsIEp5cmkgU2FyaGEgd3JvdGU6Cj4+IE9uIDA3
LzAyLzIwMjAgMjA6MTgsIEp5cmkgU2FyaGEgd3JvdGU6Cj4+PiBUaGUgb2xkIGltcGxlbWVudGF0
aW9uIG9mIHBsYWNpbmcgcGxhbmVzIG9uIHRoZSBDUlRDIHdoaWxlIGNvbmZpZ3VyaW5nCj4+PiB0
aGUgcGxhbmVzIHdhcyBuYWl2ZSBhbmQgcmVsaWVkIG9uIHRoZSBvcmRlciBpbiB3aGljaCB0aGUg
cGxhbmVzIHdlcmUKPj4+IGNvbmZpZ3VyZWQsIGVuYWJsZWQsIGFuZCBkaXNhYmxlZC4gVGhlIHNp
dHVhdGlvbiB3aGVyZSBhIHBsYW5lJ3MgenBvcwo+Pj4gd2FzIGNoYW5nZWQgb24gdGhlIGZseSB3
YXMgY29tcGxldGVseSBicm9rZW4uIFRoZSB1c3VhbCBzeW1wdG9tcyBvZgo+Pj4gdGhpcyBwcm9i
bGVtIHdhcyBzY3JhbWJsZWQgZGlzcGxheSBhbmQgYSBmbG9vZCBvZiBzeW5jIGxvc3QgZXJyb3Jz
LAo+Pj4gd2hlbiBhIHBsYW5lIHdhcyBhY3RpdmUgaW4gdHdvIGxheWVycyBhdCB0aGUgc2FtZSB0
aW1lLCBvciBhIG1pc3NpbmcKPj4+IHBsYW5lLCBpbiBjYXNlIHdoZW4gYSBsYXllciB3YXMgYWNj
aWRlbnRhbGx5IGRpc2FibGVkLgo+Pj4KPj4+IFRoZSByZXdyaXRlIHRha2VzIGEgbW9yZSBzdHJh
aWdodCBmb3J3YXJkIGFwcHJvYWNoIHdoZW4gd2hlbiBIVyBpcwo+Pj4gY29uY2VybmVkLiBUaGUg
cGxhbmUgcG9zaXRpb25pbmcgcmVnaXN0ZXJzIGFyZSBpbiB0aGUgQ1JUQyAob3IKPj4+IGFjdHVh
bGx5IE9WUikgcmVnaXN0ZXIgc3BhY2UgYW5kIGl0IGlzIG1vcmUgbmF0dXJhbCB0byBjb25maWd1
cmUgdGhlbQo+Pj4gaW4gYSBvbmUgZ28gd2hlbiBjb25maWd1cmluZyB0aGUgQ1JUQy4gVGhpcyBp
cyBlYXN5IHNpbmNlIHdlIGhhdmUKPj4+IGFjY2VzcyB0byB0aGUgd2hvbGUgYXRvbWljIHN0YXRl
IHdoZW4gdXBkYXRpbmcgdGhlIENSVEMgY29uZmlndXJhdGlvbi4KPj4+Cj4+Cj4+IFdoaWxlIGlt
cGxlbWVudGluZyB0aGlzIGZpeCBpdCBjYXVnaHQgbWUgYnkgc3VycHJpc2UgdGhhdAo+PiBjcnRj
LT5zdGF0ZS0+c3RhdGUgKHBvaW50ZXIgdXAgdG8gZnVsbCBhdG9taWMgc3RhdGUpIGlzIE5VTEwg
d2hlbgo+PiBjcnRjX2VuYWJsZSgpIG9yIC1mbHVzaCgpIGlzIGNhbGxlZC4gU28gSSB0YWtlIHRo
ZSBwbGFuZS1zdGF0ZSBkaXJlY3RseQo+PiBmcm9tIHRoZSBwbGFuZS0+c3RhdGUgYW5kIGp1c3Qg
YXNzdW1lIHRoYXQgaXQgaXMgcG9pbnRpbmcgdG8gdGhlIHNhbWUKPj4gYXRvbWljIHN0YXRlIHdp
dGggdGhlIGNydGMgc3RhdGUgSSBhbSBoYXZpbmcuIEkgdGhhdCBhbHJhaWdodD8KPiAKPiBJTU8g
eW91IHNob3VsZCBuZXZlciB1c2UgcGxhbmUtPnN0YXRlIGV0Yy4gQmV0dGVyIHBhc3MgZG93biB0
aGUKPiBmdWxsIGF0b21pYyBzdGF0ZSBldmVyeXdoZXJlLiBPdGhlcndpc2UgeW91IGNhbiBuZXZl
ciBldmVuIGNvbnNpZGVyCj4gaW5jcmVhc2luZyB0aGUgY29tbWl0IHF1ZXVlIGRlcHRoIHNpbmNl
IHlvdSdkIGVuZCB1cCBhY2Nlc3NpbmcgdGhlCj4gd3Jvbmcgc3RhdGUuCj4KCk9rLiBJIGRpZCBl
eHBsb3JlIHRoaXMgYSBiaXQgYW5kIGl0IHN0YXJ0cyB0byBsb29rIGxpa2UgdGhhdCBJIGhhdmUg
dG8Kc3RvcmUgdGhlIHBsYW5lcycgenBvcyB2YWx1ZXMgaW4gdGhlIGRyaXZlciBhZnRlciBhbGwu
IE9ubHkgdGhlIGNoYW5nZXMKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZHJtX2F0b21pY19zdGF0ZSBi
ZWluZyBjb21taXRlZCBzbyBJIGhhdmUgdG8KbWFpbnRhaW4gdGhlIGZ1bGwgc3RhdGUgbXlzZWxm
LiBUaGF0IGlzIGlmIEkgc2hvdWxkIG5vdCB1c2UgcGxhbmUtPnN0YXRlCmluIGNydGNfZW5hYmxl
KCkgb3IgLWZsdXNoKCkuCgo+Pgo+PiBXaHkgaXMgdGhlIGNydGMtPnN0YXRlLT5zdGF0ZSBOVUxM
PyBJcyBpdCBhIGJ1ZyBvciBpcyB0aGVyZSBzb21lIHJlYXNvbgo+PiB0byBpdD8KPiAKPiBDdXJy
ZW50bHkgc3dhcF9zdGF0ZSgpIG1vdmVzIHRoYXQgc3RhdGUgcG9pbnRlciBmcm9tIHRoZSBuZXcg
b2JqIHN0YXRlCj4gdG8gdGhlIG9sZCBvYmogc3RhdGUsIGFuZCBjbGVhcnMgdGhlIG9uZSBpbiB0
aGUgbmV3IG9iaiBzdGF0ZS4gTm90IGVudGlyZWx5Cj4gc3VyZSB3aHksIGJ1dCBtYXliZSBqdXN0
IHNvIHRoZXJlIGlzbid0IGEgc3RhbGUgLT5zdGF0ZSBwb2ludGVyIGhhbmdpbmcgCj4gYXJvdW5k
IGluIHRoZSBvYmotPnN0YXRlIGFmdGVyIHRoZSBzd2FwPwo+IAo+IEkgdGhpbmsgYSBiZXR0ZXIg
d2F5IGNvdWxkIGJlIHRvIG5vdCBjbG9iYmVyIHRoZSBvbGQgb2JqIHN0YXRlIGF0Cj4gYWxsLCBs
ZWF2ZSB0aGUgbmV3X29ial9zdGF0ZS0+c3RhdGUgYWxvbmUsIGFuZCBqdXN0IGNsZWFyIHRoZSAt
PnN0YXRlCj4gcG9pbnRlciAuZHVwbGljYXRlX3N0YXRlKCkuIEJ1dCB0aGF0IHdvdWxkIHJlcXVp
cmUgcmV2aWV3aW5nIGEgYnVuY2gKPiBvZiBjb2RlIHRvIGZpbmQgYWxsIHRoZSBwbGFjZXMgd2hl
cmUgb2xkX29ial9zdGF0ZS0+c3RhdGUgZ2V0cyB1c2VkCj4gZHVyaW5nIHRoZSBjb21taXQuCj4g
CgpJIHRoaW5rIHRob3NlIHBsYWNlcyBhcmUgbWFueSwgc2luY2UgYXQgbGVhc3QgSSBkaWQgbm90
IGZpZ3VyZSBvdXQgYW55Cm90aGVyIHdheSB0byBhY2Nlc3MgdGhlIGZ1bGwgY29tbWl0IGJlaGlu
ZCB0aGUgYXRvbWljIGhlbHBlcnMuCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAw
NjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
