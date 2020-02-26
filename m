Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A214170798
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 19:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6689AEB;
	Wed, 26 Feb 2020 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107C589AEB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5038D3F99D;
 Wed, 26 Feb 2020 19:24:55 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EfstPGpZ; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id motlGi_xZ2hD; Wed, 26 Feb 2020 19:24:50 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 050CC3F971;
 Wed, 26 Feb 2020 19:24:48 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 409C8360093;
 Wed, 26 Feb 2020 19:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582741488; bh=te/8IotpQEnl0o4n3vw2nGQFI/zVy4BNRconbR+LM4o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EfstPGpZpHtME6/a9f1AtAN+w3pJUClLCPuMW8qkPq/xbXVzrWpilFsvjN7HBNE9g
 gGxQfQ6pJ0wTBXqODOLs+AENYvNgFWE/sVhbRkZXw+bmTtExcAvzX0IfO+dbWsZOFZ
 Bgn5FG1CZvdQ53+LpDE9QA513jSr16J63LLReVqo=
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
Date: Wed, 26 Feb 2020 19:24:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200226154752.24328-2-kraxel@redhat.com>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 gurchetansingh@chromium.org, tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEdlcmQsCgpXaGlsZSBsb29raW5nIGF0IHRoaXMgcGF0Y2hzZXQgSSBjYW1lIGFjcm9zcyBz
b21lIHN0dWZmIHRoYXQgc2VlbXMgCnN0cmFuZ2UgYnV0IHRoYXQgd2FzIG1lcmdlZCBpbiBhIHBy
ZXZpb3VzIHBhdGNoc2V0LgoKKHBsZWFzZSByZWZlciB0byAKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTgtU2VwdGVtYmVyLzE5MDAwMS5odG1sLiAK
Rm9yZ2l2ZSBtZSBpZiBJJ3ZlIG1pc3NlZCBhbnkgZGlzY3Vzc2lvbiBsZWFkaW5nIHVwIHRvIHRo
aXMpLgoKCk9uIDIvMjYvMjAgNDo0NyBQTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiBBZGQgbWFw
X2NhY2hlZCBib29sIHRvIGRybV9nZW1fc2htZW1fb2JqZWN0LCB0byByZXF1ZXN0IGNhY2hlZCBt
YXBwaW5ncwo+IG9uIGEgcGVyLW9iamVjdCBiYXNlLiAgQ2hlY2sgdGhlIGZsYWcgYmVmb3JlIGFk
ZGluZyB3cml0ZWNvbWJpbmUgdG8KPiBwZ3Byb3QgYml0cy4KPgo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Cj4gLS0tCj4gICBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oICAgICB8ICA1
ICsrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDE1ICsr
KysrKysrKysrLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oCj4gaW5kZXggZTM0YTdi
N2Y4NDhhLi4yOTRiMjkzMWM0Y2MgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgK
PiBAQCAtOTYsNiArOTYsMTEgQEAgc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IHsKPiAgIAkg
KiBUaGUgYWRkcmVzcyBhcmUgdW4tbWFwcGVkIHdoZW4gdGhlIGNvdW50IHJlYWNoZXMgemVyby4K
PiAgIAkgKi8KPiAgIAl1bnNpZ25lZCBpbnQgdm1hcF91c2VfY291bnQ7Cj4gKwo+ICsJLyoqCj4g
KwkgKiBAbWFwX2NhY2hlZDogbWFwIG9iamVjdCBjYWNoZWQgKGluc3RlYWQgb2YgdXNpbmcgd3Jp
dGVjb21iaW5lKS4KPiArCSAqLwo+ICsJYm9vbCBtYXBfY2FjaGVkOwo+ICAgfTsKPiAgIAo+ICAg
I2RlZmluZSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopIFwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9zaG1lbV9oZWxwZXIuYwo+IGluZGV4IGE0MjFhMmVlZDQ4YS4uYWFkOTMyNGRjZjRmIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiBAQCAtMjU0LDExICsyNTQs
MTYgQEAgc3RhdGljIHZvaWQgKmRybV9nZW1fc2htZW1fdm1hcF9sb2NrZWQoc3RydWN0IGRybV9n
ZW1fc2htZW1fb2JqZWN0ICpzaG1lbSkKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIGVycl96ZXJv
X3VzZTsKPiAgIAo+IC0JaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPiArCWlmIChvYmotPmltcG9y
dF9hdHRhY2gpIHsKPiAgIAkJc2htZW0tPnZhZGRyID0gZG1hX2J1Zl92bWFwKG9iai0+aW1wb3J0
X2F0dGFjaC0+ZG1hYnVmKTsKPiAtCWVsc2UKPiArCX0gZWxzZSB7Cj4gKwkJcGdwcm90X3QgcHJv
dCA9IFBBR0VfS0VSTkVMOwo+ICsKPiArCQlpZiAoIXNobWVtLT5tYXBfY2FjaGVkKQo+ICsJCQlw
cm90ID0gcGdwcm90X3dyaXRlY29tYmluZShwcm90KTsKPiAgIAkJc2htZW0tPnZhZGRyID0gdm1h
cChzaG1lbS0+cGFnZXMsIG9iai0+c2l6ZSA+PiBQQUdFX1NISUZULAo+IC0JCQkJICAgIFZNX01B
UCwgcGdwcm90X3dyaXRlY29tYmluZShQQUdFX0tFUk5FTCkpOwo+ICsJCQkJICAgIFZNX01BUCwg
cHJvdCkKCgpXb3VsZG4ndCBhIHZtYXAgd2l0aCBwZ3Byb3Rfd3JpdGVjb21iaW5lKCkgY3JlYXRl
IGNvbmZsaWN0aW5nIG1hcHBpbmdzIAp3aXRoIHRoZSBsaW5lYXIga2VybmVsIG1hcCB3aGljaCBp
cyBub3Qgd3JpdGUtY29tYmluZWQ/IE9yIGRvIHlvdSBjaGFuZ2UgCnRoZSBsaW5lYXIga2VybmVs
IG1hcCBvZiB0aGUgc2htZW0gcGFnZXMgc29tZXdoZXJlPyB2bWFwIGJ5cGFzc2VzcyBhdCAKbGVh
c3QgdGhlIHg4NiBQQVQgY29yZSBtYXBwaW5nIGNvbnNpc3RlbmN5IGNoZWNrIGFuZCB0aGlzIGNv
dWxkIApwb3RlbnRpYWxseSBjYXVzZSBzcHVyaW91c2x5IG92ZXJ3cml0dGVuIG1lbW9yeS4KCgo+
ICsJfQo+ICAgCj4gICAJaWYgKCFzaG1lbS0+dmFkZHIpIHsKPiAgIAkJRFJNX0RFQlVHX0tNUygi
RmFpbGVkIHRvIHZtYXAgcGFnZXNcbiIpOwo+IEBAIC01NDAsNyArNTQ1LDkgQEAgaW50IGRybV9n
ZW1fc2htZW1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpCj4gICAJfQo+ICAgCj4gICAJdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1B
UCB8IFZNX0RPTlRFWFBBTkQ7Cj4gLQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNv
bWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7Cj4gKwl2bWEtPnZtX3BhZ2Vf
cHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyk7Cj4gKwlpZiAoIXNobWVtLT5t
YXBfY2FjaGVkKQo+ICsJCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X3dyaXRlY29tYmluZSh2
bWEtPnZtX3BhZ2VfcHJvdCk7CgpTYW1lIHRoaW5nIGhlcmUuIE5vdGUgdGhhdCB2bWZfaW5zZXJ0
X3BhZ2UoKSB3aGljaCBpcyB1c2VkIGJ5IHRoZSBmYXVsdCAKaGFuZGxlciBhbHNvIGJ5cGFzc2Vz
IHRoZSB4ODYgUEFUwqAgY29uc2lzdGVuY3kgY2hlY2ssIHdoZXJlYXMgCnZtZl9pbnNlcnRfbWl4
ZWQoKSBkb2Vzbid0LgoKPiAgIAl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQo
dm1hLT52bV9wYWdlX3Byb3QpOwoKQXQgbGVhc3Qgd2l0aCBTTUUgb3IgU0VWIGVuY3J5cHRpb24s
IHdoZXJlIHNobWVtIG1lbW9yeSBoYXMgaXRzIGtlcm5lbCAKbWFwIHNldCB0byBlbmNyeXB0ZWQs
IGNyZWF0aW5nIGNvbmZsaWN0aW5nIG1hcHBpbmdzIGlzIGV4cGxpY2l0bHkgCmRpc2FsbG93ZWQu
CkJUVywgd2h5IGlzIG1tYXAgbWFwcGluZyBkZWNyeXB0ZWQgd2hpbGUgdm1hcCBpc24ndD8KCj4g
ICAJdm1hLT52bV9vcHMgPSAmZHJtX2dlbV9zaG1lbV92bV9vcHM7Cj4gICAKClRoYW5rcywKVGhv
bWFzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
