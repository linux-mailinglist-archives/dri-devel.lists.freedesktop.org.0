Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26657145E78
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 23:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233A6F91C;
	Wed, 22 Jan 2020 22:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83C36F91C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 22:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B1EB03FAC2;
 Wed, 22 Jan 2020 23:23:58 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=mni8ERxr; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2CEO6-a3GMQ; Wed, 22 Jan 2020 23:23:54 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0F0693F9A3;
 Wed, 22 Jan 2020 23:23:52 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 49AD8360057;
 Wed, 22 Jan 2020 23:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579731832; bh=KBnnEy4+mqkvgMutng5IFBJWda7jJHzqxz+JFAKWvsg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mni8ERxrz4DSpS+23Nfe0vR8PoSmedfN1V55URPPU7S4eZ6/BEDNun9YSTWO2Jy31
 ZdmVXdzL3G9L1ULp/Uj774MS+pVR1v/27bWPUrpkCyFPfkTs7nZQiAu28G7/eRsSJy
 YCxyeN03F02Fe3EmSTPkVCPdXPUdLivJAw3O2xR8=
Subject: Re: [PATCH] drm: Release filp before global lock
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200122155637.496291-1-chris@chris-wilson.co.uk>
 <d5facf06-14d6-0203-f43c-22400588ab70@shipmail.org>
 <157973043337.15024.17688241519297504558@skylake-alporthouse-com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <50e74be7-20dc-b4b3-1e1b-eae68f5d05f3@shipmail.org>
Date: Wed, 22 Jan 2020 23:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <157973043337.15024.17688241519297504558@skylake-alporthouse-com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yMi8yMCAxMTowMCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgVGhvbWFz
IEhlbGxzdHLDtm0gKFZNd2FyZSkgKDIwMjAtMDEtMjIgMjE6NTI6MjMpCj4+IEhpLCBDaHJpcywK
Pj4KPj4gT24gMS8yMi8yMCA0OjU2IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBUaGUgZmls
ZSBpcyBub3QgcGFydCBvZiB0aGUgZ2xvYmFsIGRybSByZXNvdXJjZSBhbmQgY2FuIGJlIHJlbGVh
c2VkCj4+PiBwcmlvciB0byB0YWtlIHRoZSBnbG9iYWwgbXV0ZXggdG8gZHJvcCB0aGUgb3Blbl9j
b3VudCAoYW5kIHBvdGVudGlhbGx5Cj4+PiBjbG9zZSkgdGhlIGRybSBkZXZpY2UuCj4+Pgo+Pj4g
SG93ZXZlciwgaW5zaWRlIGRybV9jbG9zZV9oZWxwZXIoKSB0aGVyZSBhcmUgYSBudW1iZXIgb2Yg
ZGV2LT5kcml2ZXIKPj4+IGNhbGxiYWNrcyB0aGF0IHRha2UgdGhlIGRybV9kZXZpY2UgYXMgdGhl
IGZpcnN0IHBhcmFtZXRlci4uLiBXb3JyeWluZ2x5Cj4+PiBzb21lIG9mIHRob3NlIGNhbGxiYWNr
cyBtYXkgYmUgKGltcGxpY2l0bHkpIGRlcGVuZGluZyBvbiB0aGUgZ2xvYmFsCj4+PiBtdXRleC4K
Pj4gSSByZWFkIHRoaXMgYXMgeW91IHN1c3BlY3QgdGhhdCB0aGVyZSBhcmUgZHJpdmVyIGNhbGxi
YWNrcyBpbnNpZGUKPj4gZHJtX2Nsb3NlX2hlbHBlcigpIHRoYXQgbWlnaHQgbmVlZCB0aGUgZ2xv
YmFsIG11dGV4IGhlbGQ/IEJ1dCB0aGVuIGl0Cj4+IHdvdWxkbid0IGJlIHNhZmUgdG8gbW92ZSB0
aGUgbG9jaz8gSXMgdGhlcmUgYSBzdHJvbmcgbW90aXZhdGlvbiBmb3IKPj4gbW92aW5nIHRoZSBs
b2NraW5nIGluIHRoZSBmaXJzdCBwbGFjZT8gQWxzbyBhIG1pbm9yIG5pdCBiZWxvdzoKPiBUaGUg
bnVtYmVyIG9mIHByb2Nlc3NlcyBzdHVjayBvbiAnRCcgZHVlIHRvIG11dGV4X2xvY2soJmdsb2Jh
bCkgY2F1Z2h0IG15Cj4gYXR0ZW50aW9uIHdoaWxlIHRoZXkgd2VyZSBjbGVhbmluZyB1cCBmaWxl
cy4gSSB0aGluayBldmVyeW9uZSBlbHNlIHdpbGwKPiBiZSBsZXNzIGltcHJlc3NlZCBpZiB0aGVp
ciBkcml2ZXIgd2FzIHN0dWNrIGJlY2F1c2UgaTkxNSB3YXMgZnJlZWluZyBhCj4gdXNlcidzIGZp
bHAuCgpVbmRlcnN0b29kLiBQZXJoYXBzIGEgc2hvcnQgbW90aXZhdGlvbiBpbiB0aGUgbG9nIG1l
c3NhZ2U/Cgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIHwgNCAr
Ky0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+PiBpbmRleCA5MmQxNjcyNGY5NDkuLjg0ZWQzMTNlZTJl
OSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4gQEAgLTQzOCwxMiArNDM4LDEyIEBAIGludCBk
cm1fcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlscCkKPj4+ICAg
ICAgICBzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IGZpbGVfcHJpdi0+bWlub3I7Cj4+PiAgICAg
ICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1pbm9yLT5kZXY7Cj4+PiAgICAKPj4+IC0gICAg
IG11dGV4X2xvY2soJmRybV9nbG9iYWxfbXV0ZXgpOwo+Pj4gLQo+Pj4gICAgICAgIERSTV9ERUJV
Rygib3Blbl9jb3VudCA9ICVkXG4iLCBkZXYtPm9wZW5fY291bnQpOwo+PiBUaGUgcmVhZCBvZiBk
ZXYtPm9wZW5fY291bnQgc2hvdWxkIHN0aWxsIGJlIGluc2lkZSB0aGUgbG9jayB0byBiZQo+PiBj
b25zaXN0ZW50IHdpdGggdGhlIHZhbHVlIHRoYXQgaXMgZGVjcmVtZW50ZWQgYmVsb3cuIFBlcmhh
cHMgbW92ZSB0aGUKPj4gRFJNX0RFQlVHKCk/Cj4gU3VyZS4gSXMgaXQgZXZlbiB3b3J0aCBhIGRl
YnVnPwoKUHJvYmFibHkgYW4gb2xkIHJlbGljLiBJJ20gZmluZSB3aXRoIGxldHRpbmcgaXQgZ28u
CgpUaGFua3MsCgpUaG9tYXMKCgoKPiAtQ2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
