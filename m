Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6415AF5A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A611C6E0DA;
	Wed, 12 Feb 2020 18:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3DE6E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:01:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CI1bZQ120157;
 Wed, 12 Feb 2020 12:01:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581530497;
 bh=SRBZDpjYYSWwXNbKLAUOB7cCxYrebZqY4i5t2tPJm54=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=q7tEmfaSniIAtvo5+kdv3GDaRbeMuuHDSUbRhBkqH5doIykWO6icfhghVn9vsWo3C
 FS+h2UT+yyeTcO4qWbMQK7VtnDQ6Txdi9HSERVQHcYaLkB8u3D5QsxO/eDstohitpP
 UpXbotFfSUg30q1WWMYsJVo7ciXdJt4ubzi2+How=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CI1bJZ127673
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Feb 2020 12:01:37 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 12:01:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 12:01:37 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CI1Ycv121737;
 Wed, 12 Feb 2020 12:01:35 -0600
Subject: Re: [PATCH v2] drm/tidss: dispc: Rewrite naive plane positioning code
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200212135936.31326-1-jsarha@ti.com>
 <397e6686-40de-4205-e958-8592b1c3cc6e@ti.com>
 <20200212143354.GC13686@intel.com>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8095e3f1-640e-5136-6419-ce2c57f24820@ti.com>
Date: Wed, 12 Feb 2020 20:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200212143354.GC13686@intel.com>
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
Cc: praneeth@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDIvMjAyMCAxNjozMywgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwgRmVi
IDEyLCAyMDIwIGF0IDA0OjA4OjExUE0gKzAyMDAsIEp5cmkgU2FyaGEgd3JvdGU6Cj4+IE9uIDEy
LzAyLzIwMjAgMTU6NTksIEp5cmkgU2FyaGEgd3JvdGU6Cj4+PiBUaGUgb2xkIGltcGxlbWVudGF0
aW9uIG9mIHBsYWNpbmcgcGxhbmVzIG9uIHRoZSBDUlRDIHdoaWxlIGNvbmZpZ3VyaW5nCj4+PiB0
aGUgcGxhbmVzIHdhcyBuYWl2ZSBhbmQgcmVsaWVkIG9uIHRoZSBvcmRlciBpbiB3aGljaCB0aGUg
cGxhbmVzIHdlcmUKPj4+IGNvbmZpZ3VyZWQsIGVuYWJsZWQsIGFuZCBkaXNhYmxlZC4gVGhlIHNp
dHVhdGlvbiB3aGVyZSBhIHBsYW5lJ3MgenBvcwo+Pj4gd2FzIGNoYW5nZWQgb24gdGhlIGZseSB3
YXMgY29tcGxldGVseSBicm9rZW4uIFRoZSB1c3VhbCBzeW1wdG9tcyBvZgo+Pj4gdGhpcyBwcm9i
bGVtIHdhcyBzY3JhbWJsZWQgZGlzcGxheSBhbmQgYSBmbG9vZCBvZiBzeW5jIGxvc3QgZXJyb3Jz
LAo+Pj4gd2hlbiBhIHBsYW5lIHdhcyBhY3RpdmUgaW4gdHdvIGxheWVycyBhdCB0aGUgc2FtZSB0
aW1lLCBvciBhIG1pc3NpbmcKPj4+IHBsYW5lLCBpbiBjYXNlIHdoZW4gYSBsYXllciB3YXMgYWNj
aWRlbnRhbGx5IGRpc2FibGVkLgo+Pj4KPj4+IFRoZSByZXdyaXRlIHRha2VzIGEgbW9yZSBzdHJh
aWdodCBmb3J3YXJkIGFwcHJvYWNoIHdoZW4gSFcgaXMKPj4+IGNvbmNlcm5lZC4gVGhlIHBsYW5l
IHBvc2l0aW9uaW5nIHJlZ2lzdGVycyBhcmUgaW4gdGhlIENSVEMgKGFjdHVhbGx5Cj4+PiBPVlIp
IHJlZ2lzdGVyIHNwYWNlIGFuZCBpdCBpcyBtb3JlIG5hdHVyYWwgdG8gY29uZmlndXJlIHRoZW0g
aW4gb25lIGdvCj4+PiB3aGlsZSBjb25maWd1cmluZyB0aGUgQ1JUQy4gVG8gZG8gdGhpcyB3ZSBu
ZWVkIHRvIG1ha2Ugc3VyZSB3ZSBoYXZlCj4+PiBhbGwgdGhlIHBsYW5lcyBvbiB1cGRhdGVkIENS
VENzIGluIHRoZSBuZXcgYXRvbWljIHN0YXRlIHRvIGJlCj4+PiBjb21taXR0ZWQuIFRoaXMgaXMg
ZG9uZSBieSBjYWxsaW5nIGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcygpIGluCj4+PiBj
cnRjX2F0b21pY19jaGVjaygpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpz
YXJoYUB0aS5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfY3J0
Yy5jICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+PiAgZHJpdmVycy9ncHUv
ZHJtL3RpZHNzL3RpZHNzX2Rpc3BjLmMgfCA1NSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19kaXNwYy5oIHwgIDUgKysrCj4+PiAg
MyBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2NydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS90aWRzcy90aWRzc19jcnRjLmMKPj4+IGluZGV4IDAzMmMzMWVlMjgyMC4uZjdj
NWZkMTA5NGE4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2Ny
dGMuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2NydGMuYwo+PiAuLi4K
Pj4+IEBAIC0xMDgsNyArMTEwLDU0IEBAIHN0YXRpYyBpbnQgdGlkc3NfY3J0Y19hdG9taWNfY2hl
Y2soc3RydWN0IGRybV9jcnRjICpjcnRjLAo+Pj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4+PiAgCX0K
Pj4+ICAKPj4+IC0JcmV0dXJuIGRpc3BjX3ZwX2J1c19jaGVjayhkaXNwYywgaHdfdmlkZW9wb3J0
LCBzdGF0ZSk7Cj4+PiArCXJldCA9IGRpc3BjX3ZwX2J1c19jaGVjayhkaXNwYywgaHdfdmlkZW9w
b3J0LCBzdGF0ZSk7Cj4+PiArCWlmIChyZXQpCj4+PiArCQlyZXR1cm4gcmV0Owo+Pj4gKwo+Pj4g
KwkvKiBBZGQgdW5jaGFuZ2VkIHBsYW5lcyBvbiB0aGlzIGNydGMgdG8gc3RhdGUgZm9yIHpwb3Mg
dXBkYXRlLiAqLwo+Pj4gKwlyZXR1cm4gZHJtX2F0b21pY19hZGRfYWZmZWN0ZWRfcGxhbmVzKHN0
YXRlLT5zdGF0ZSwgY3J0Yyk7Cj4+Cj4+IElzIHRoaXMgYSBjb3JyZWN0IHdheSB0byB1c2UgZHJt
X2F0b21pY19hZGRfYWZmZWN0ZWRfcGxhbmVzKCk/Cj4+Cj4+IEkgc2F3IHRoYXQgc29tZSBvdGhl
ciBkcml2ZXJzIGltcGxlbWVudCB0aGVpciBvd24gbW9kZV9jb25maWcKPj4gYXRvbWljX2NoZWNr
KCkgYW5kIGhhdmUgdGhpcyBjYWxsIHRoZXJlIGluCj4+IGZvcl9lYWNoX25ld19jcnRjX2luX3N0
YXRlKCktbG9vcCwgYnV0IEkgdGhvdWdodCBpdCBzaG91bGQgYmUgZmluZSB0bwo+PiBjYWxsIGl0
IGluIGNydGNfYXRvbWljX2NoZWNrKCkuCj4gCj4gWW91IHNlZW0gdG8gYmUgdXNpbmcgZHJtX2F0
b21pY19oZWxwZXJfY2hlY2tfcGxhbmVzKCksIHdoaWNoIG1lYW5zCj4gY3J0Yy5hdG9taWNfY2hl
Y2soKSBnZXRzIGNhbGxlZCBhZnRlciBwbGFuZS5hdG9taWNfY2hlY2soKS4gU28gdGhpcwo+IG1p
Z2h0IGJlIGdvb2Qgb3IgYmFkIGRlcGVuZGluZyBvbiB3aGV0aGVyIHlvdSdkIGxpa2UgdGhlIHBs
YW5lcyB5b3UKPiBhZGQgaGVyZSB0byBnbyB0aHJvdWdoIHRoZWlyIC5hdG9taWNfY2hlY2soKSBv
ciBub3QuCj4gCgpTaG91bGQgaGF2ZSB0aG91Z2h0IG9mIHRoYXQgbXkgc2VsZi4gRXh0cmEgcGxh
bmUuYXRvbWljX2NoZWNrKCkgY2FsbHMgZG8Kbm90IGRvIGFueSBhY3R1YWwgaGFybSwgYnV0IHRo
ZXkgYXJlIHBvdGVudGlhbGx5IGV4cGVuc2l2ZS4gVGhlIHBsYW5lcwphcmUgcmVhbGx5IG9ubHkg
bmVlZGVkIHRoZXJlIGluIHRoZSBjb21taXQgcGhhc2UgKGNydGNfZW5hYmxlKCkgb3IKZmx1c2go
KSkuIFdlbGwsIEknbGwgZG8gbXkgb3duIG1vZGVfY29uZmlnLmF0b21pY19jaGVjaygpIGFuZCBj
YWxsCmRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcygpIGluIGEgZm9yX2VhY2hfbmV3X2Ny
dGNfaW5fc3RhdGUoKS1sb29wCmFmdGVyIGFsbCB0aGUgY2hlY2tzLgoKVGhhbmtzLApKeXJpCgot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
