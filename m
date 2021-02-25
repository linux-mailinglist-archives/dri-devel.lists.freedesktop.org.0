Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B7324CC4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D56EC6F;
	Thu, 25 Feb 2021 09:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF49E6EC6F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wxvgBttwLRXKiBtnuQuBExpUbktoMEcQOfPPhDTJ7cU=; b=teQ8aAgWBf6GcNDSf8iHMBQ9PG
 IaiwWq66vJCUGaB8VbBFtvx3wCmDQTHNRCfex0npW/uviNMlrAl5c15jzsxzvF2Eh0+AZeYCrJXzn
 Jb7xNxW8npEKp2rRPti6sBYprw2MJe0AgaGniwBkBZEo3AccuA3Z4V2bSLY0cCg0HeQqytrgbinnJ
 GF+mnjpL7OK+4tVaPFBur+M/TnpojFeGeiQqTZw0/KK7fNQgvDRdTSXa9Hv8wbMPfbeuCEY06xd20
 tBV59zDWZ8iTHJAK84ZLHmRFX4j8bOsO4EggDRyd43EElz42doo+NgTT7ICBul/Z5pPLkY/2lBHRP
 ce13YBoA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62132
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lFCu8-0000dv-MZ; Thu, 25 Feb 2021 10:25:52 +0100
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <980dd782-f921-c4af-5507-b23f3cca4f79@tronnes.org>
Date: Thu, 25 Feb 2021 10:25:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjUuMDIuMjAyMSAwOS4xMiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gSGkKPiAK
PiBBbSAyNC4wMi4yMSB1bSAxODoxNCBzY2hyaWViIE5vcmFsZiBUcsO4bm5lczoKPj4KPj4KPj4g
RGVuIDE5LjAyLjIwMjEgMTQuNTQsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5uOgo+Pj4gSGkKPj4+
Cj4+PiBBbSAxOS4wMi4yMSB1bSAxMzoyMiBzY2hyaWViIE5vcmFsZiBUcsO4bm5lczoKPj4+PiBk
bWEtYnVmIGltcG9ydGluZyB3YXMgcmV3b3JrZWQgaW4gY29tbWl0IDdkMmNkNzJhOWFhMwo+Pj4+
ICgiZHJtL3NobWVtLWhlbHBlcnM6IFNpbXBsaWZ5IGRtYS1idWYgaW1wb3J0aW5nIikuIEJlZm9y
ZSB0aGF0IGNvbW1pdAo+Pj4+IGRybV9nZW1fc2htZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkg
ZGlkIHNldCAtPnBhZ2VzX3VzZV9jb3VudD0xIGFuZAo+Pj4+IGRybV9nZW1fc2htZW1fdnVubWFw
X2xvY2tlZCgpIGNvdWxkIGNhbGwgZHJtX2dlbV9zaG1lbV9wdXRfcGFnZXMoKQo+Pj4+IHVuY29u
ZGl0aW9uYWxseS4gTm93IHdpdGhvdXQgdGhlIHVzZSBjb3VudCBzZXQsIHB1dCBwYWdlcyBpcyBj
YWxsZWQKPj4+PiBhbHNvCj4+Pj4gb24gZG1hLWJ1ZnMuIEZpeCB0aGlzIGJ5IG9ubHkgcHV0dGlu
ZyBwYWdlcyBpZiBpdCdzIG5vdCBpbXBvcnRlZC4KPj4+Pgo+Pj4+IEZpeGVzOiA3ZDJjZDcyYTlh
YTMgKCJkcm0vc2htZW0taGVscGVyczogU2ltcGxpZnkgZG1hLWJ1ZiBpbXBvcnRpbmciKQo+Pj4+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+Pj4+IENjOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBO
b3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Cj4+PiBKdXN0IHdoZW4gSSBz
YXcgdGhlIGVycm9yLiBOaWNlLiA6KQo+Pj4KPj4+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+IFRlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+Pgo+Pgo+PiBTaG91bGQgSSBhcHBseSB0aGlzIHRvIGRy
bS1taXNjLWZpeGVzPwo+IAo+IEkgdGhpbmsgc28uIFBpbmcgbWUgaWYgeW91IHdhbnQgbWUgdG8g
YWRkIGl0Lgo+IAoKSSdkIGFwcHJlY2lhdGUgaWYgeW91IGNvdWxkIGRvIGl0LiBJIGhhdmVuJ3Qg
YXBwbGllZCBhIHBhdGNoIGluIGFsbW9zdCBhCnllYXIgbm93IGFuZCBuZWVkIHRvIGRpZyBvdXQg
bXkgbm90ZXMgb24gaG93IEkgZG8gaXQuIC1maXhlcyBzdHVmZiBpcwpmb3IgbWUgYSAiaG9sZCBt
eSBicmVhdGggYW5kIGhvcGUgSSBkb24ndCBzY3JldyB1cCBhbnl0aGluZyIgZXhlcmNpc2UuClN0
cmVzc2Z1bCA6LwoKT25lIGRheSBpbiB0aGUgZnV0dXJlIEkgaG9wZSB0aGVyZSdzIGEgZ3JlZW4g
YnV0dG9uIEkgY2FuIHB1c2ggdGhhdApzYXlzOiBNZXJnZSBwYXRjaCB0byAtZml4ZXMgYW5kIG1h
a2Ugc3VyZSBldmVyeXRoaW5nIGlzIE9LLiBUaGF0IHdvdWxkCmJlIG5pY2UgOikKClRoYW5rcywK
Tm9yYWxmLgoKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPj4KPj4gTm9yYWxmLgo+Pgo+Pj4g
Rm9yIHRlc3RpbmcgdGhlIEdVRCBkcml2ZXIsIHlvdSBtYXkgYWxzbyB3YW50IHRvIGtlZXAgYW4g
ZXllIGF0IFsxXQo+Pj4KPj4+IEJlc3QgcmVnYXJkcwo+Pj4gVGhvbWFzCj4+Pgo+Pj4gWzFdCj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMDJhNDVjMTEtZmM3My0xZTVhLTM4
MzktMzBiMDgwOTUwYWY4QGFtZC5jb20vVC8jdAo+Pj4KPj4+Cj4+Pgo+Pj4+IC0tLQo+Pj4+IMKg
wqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCA3ICsrKystLS0KPj4+
PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4+Pj4gaW5k
ZXggOTgyNWMzNzhkZmE2Li5jOGE2NTQ3YTE3NTcgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+Pj4+IEBAIC0zNTcsMTMgKzM1NywxNCBAQCBzdGF0aWMg
dm9pZCBkcm1fZ2VtX3NobWVtX3Z1bm1hcF9sb2NrZWQoc3RydWN0Cj4+Pj4gZHJtX2dlbV9zaG1l
bV9vYmplY3QgKnNobWVtLAo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoLS1zaG1lbS0+dm1hcF91c2Vf
Y291bnQgPiAwKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+PiDCoMKgIC3C
oMKgwqAgaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPj4+PiArwqDCoMKgIGlmIChvYmotPmltcG9y
dF9hdHRhY2gpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX3Z1bm1hcChvYmot
PmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgbWFwKTsKPj4+PiAtwqDCoMKgIGVsc2UKPj4+PiArwqDC
oMKgIH0gZWxzZSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnVubWFwKHNobWVtLT52YWRk
cik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNobWVtKTsK
Pj4+PiArwqDCoMKgIH0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgc2htZW0tPnZhZGRyID0gTlVMTDsK
Pj4+PiAtwqDCoMKgIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNobWVtKTsKPj4+PiDCoMKgIH0K
Pj4+PiDCoMKgIMKgIC8qCj4+Pj4KPj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
