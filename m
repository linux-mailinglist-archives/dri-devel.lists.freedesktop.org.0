Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D696C216C7C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 14:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0C76E10D;
	Tue,  7 Jul 2020 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F4E6E10D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 453743F5B5;
 Tue,  7 Jul 2020 14:05:36 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=P4B70XG+; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeAsYneKEgqS; Tue,  7 Jul 2020 14:05:35 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 998063F4B8;
 Tue,  7 Jul 2020 14:05:33 +0200 (CEST)
Received: from Win10-IC94.SSPE.ch.intel.com (37.250.237.50.bredband.tre.se
 [37.250.237.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7C3313601D5;
 Tue,  7 Jul 2020 14:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1594123532; bh=rsPCC7TaIepIlcbgqjAOdDx24RyyuXajxDwQRgbNflk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P4B70XG+UA2ZBywVBTl15xZdYcbcC8mwkLvNDCoBU8im+5fGx0QQYnhBL8umx+HNF
 vboraZl+6QKR7RVXriAR9tZv/4YUMMKHcPwQQPPtTkBj2/ik9XAZfEAqxV4knCv8VU
 l6nM2R8sI4k1e0owVRdCy88UTfV2v5LGDNo2V3uU=
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
To: Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lepton Wu <ytht.net@gmail.com>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
 <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
 <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
 <159412007969.16814.9730037350128686915@build.alporthouse.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <a0f8e299-da40-ddc9-3c97-a348a56d3408@shipmail.org>
Date: Tue, 7 Jul 2020 14:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159412007969.16814.9730037350128686915@build.alporthouse.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNy8yMCAxOjA3IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gUXVvdGluZyBDaHJpc3Rp
YW4gS8O2bmlnICgyMDIwLTA3LTA3IDExOjU4OjI2KQo+PiBBbSAwNy4wNy4yMCB1bSAxMDo1OSBz
Y2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBUdWUsIEp1bCA3LCAyMDIwIGF0IDk6MjcgQU0g
TGVwdG9uIFd1IDx5dGh0Lm5ldEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IEZvciBwYWdlcyB3aGlj
aCBhcmUgYWxsb2NhdGVkIGluIHR0bSB3aXRoIHRyYW5zcGFyZW50IGh1Z2UgcGFnZXMsCj4+Pj4g
dGFpbCBwYWdlcyBoYXZlIHplcm8gYXMgcmVmZXJlbmNlIGNvdW50LiBUaGUgY3VycmVudCB2Z2Vt
IGNvZGUgdXNlCj4+Pj4gZ2V0X3BhZ2Ugb24gdGhlbSBhbmQgaXQgd2lsbCB0cmlnZ2VyIEJVRyB3
aGVuIHJlbGVhc2VfcGFnZXMgZ2V0IGNhbGxlZAo+Pj4+IG9uIHRob3NlIHBhZ2VzIGxhdGVyLgo+
Pj4+Cj4+Pj4gSGVyZSBJIGF0dGFjaCB0aGUgbWluaW1hbCBjb2RlIHRvIHRyaWdnZXIgdGhpcyBi
dWcgb24gYSBxZW11IFZNIHdoaWNoCj4+Pj4gZW5hYmxlcyB2aXJ0aW8gZ3B1IChjYXJkMSkgYW5k
IHZnZW0gKGNhcmQwKS4gQlRXLCBzaW5jZSB0aGUgdXBzdHJlYW0KPj4+PiB2aXJ0aW8gZ3B1IGhh
cyBjaGFuZ2VkIHRvIHVzZSBkcm0gZ2VtIGFuZCBtb3ZlZCBhd2F5IGZyb20gdHRtLiBTbyB3ZQo+
Pj4+IGhhdmUgdG8gdXNlIGFuIG9sZCBrZXJuZWwgbGlrZSA1LjQgdG8gcmVwcm9kdWNlIGl0LiBC
dXQgSSBndWVzcwo+Pj4+IHNhbWUgdGhpbmcgY291bGQgaGFwcGVuIGZvciBhIHJlYWwgR1BVIGlm
IHRoZSByZWFsIEdQVSB1c2Ugc2ltaWxhciBjb2RlCj4+Pj4gcGF0aCB0byBhbGxvY2F0ZSBwYWdl
cyBmcm9tIHR0bS4gSSBhbSBub3Qgc3VyZSBhYm91dCB0d28gdGhpbmdzOiBmaXJzdCwgZG8gd2UK
Pj4+PiBuZWVkIHRvIGZpeCB0aGlzPyB3aWxsIGEgcmVhbCBHUFUgaGl0IHRoaXMgY29kZSBwYXRo
PyBTZWNvbmQsIHN1cHBvc2UgdGhpcwo+Pj4+IG5lZWQgdG8gYmUgZml4ZWQsIHNob3VsZCB0aGlz
IGJlIGZpeGVkIGluIHR0bSBzaWRlIG9yIHZnZW0gc2lkZT8gIElmIHdlIHJlbW92ZQo+Pj4+ICJo
dWdlX2ZsYWdzICY9IH5fX0dGUF9DT01QIiBmcm9tIHR0bV9nZXRfcGFnZXMsIHRoZW4gZ2V0X3Bh
Z2UgaW4gdmdlbSB3b3Jrcwo+Pj4+IGZpbmUuIEJ1dCBpdCdzIHRoZXJlIGZvciBmaXggYW5vdGhl
ciBidWc6Cj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGYnVncy5mcmVlZGVza3RvcC5vcmclMkZzaG93X2J1Zy5jZ2kl
M0ZpZCUzRDEwMzEzOCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5j
b20lN0NmYzA4MzFiZThmZDg0OGFiZmQ4OTA4ZDgyMjU0MjY2ZCU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyOTcwOTIxMTMyMTYzNTcmYW1wO3NkYXRhPVMl
MkJ0TEp5QjhtcXl5RSUyQlNJamJmSE02RkdGdUZqcmZJNTB0YWhwYW9KM3dVJTNEJmFtcDtyZXNl
cnZlZD0wCj4+Pj4gSXQgY291bGQgYWxzbyBiZSAiZml4ZWQiIHdpdGggdGhpcyBwYXRjaC4gQnV0
IEkgYW0gcmVhbGx5IG5vdCBzdXJlIGlmIHRoaXMgaXMKPj4+PiB0aGUgd2F5IHRvIGdvLgo+Pj4g
Rm9yIGltcG9ydGVkIGRtYS1idWYgb2JqZWN0cywgdmdlbSBzaG91bGQgbm90IGhhbmRsZSB0aGlz
IGl0c2VsZiwgYnV0Cj4+PiBmb3J3YXJkIHRvIHRoZSBleHBvcnRlciB0aHJvdWdoIHRoZSBkbWFf
YnVmX21tYXAgc3R1ZmYuIFdlIGhhdmUKPj4+IGhlbHBlcnMgZm9yIHRoaXMgYWxsIG5vdywgcHJv
YmFibHkganVzdCBub3Qgd2lyZWQgdXAgY29ycmVjdGx5LiBUcnlpbmcKPj4+IHRvIGVuc3VyZSB0
aGF0IGFsbCBjb21iaW5hdGlvbnMgb2YgbW1hcCBjb2RlIGFjcm9zcyBhbGwgZHJpdmVycyB3b3Jr
Cj4+PiB0aGUgc2FtZSBkb2Vzbid0IHdvcmsuCj4+IFllcywgRGFuaWVsIGlzIHJpZ2h0IHdoYXQg
dmdlbSBkb2VzIGhlcmUgaXMgZnVuZGFtZW50YWxseSBicm9rZW4gaW4gbWFueQo+PiB3YXlzLgo+
Pgo+PiBGaXJzdCBvZiBhbGwgbm9ib2R5IHNob3VsZCBldmVyIGNhbGwgZ2V0X3BhZ2UoKSBvbiB0
aGUgcGFnZXMgVFRNIGhhcwo+PiBhbGxvY2F0ZWQuIFRob3NlIHBhZ2VzIGNvbWUgb3V0IG9mIGEg
YmxvY2sgYm94IGFuZCBzaG91bGQgbm90IGJlIHRvdWNoZWQKPj4gYnkgYW55Ym9keS4KPiBJdCBk
b2Vzbid0LiBJdCdzIG9ubHkgdXNlZCBvbiB0aGUgcGFnZXMgdmdlbSBhbGxvY2F0ZXMgKGZyb20g
c2htZW1mcykuIFNvCj4gSSdtIHJlYWxseSBjb25mdXNlZCBhcyB0byBob3cgdHRtIGdldHMgaW52
b2x2ZWQgaGVyZS4KPiAtQ2hyaXMKClNvdW5kcyBsaWtlIHZnZW0gaXMgYWxsb3dpbmcgbW1hcCBv
ZiBpbXBvcnRlZCBkbWEtYnVmcz8KCi9UaG9tYXMKCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
