Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B8280DC5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E18892ED;
	Fri,  2 Oct 2020 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E366E15E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 14:49:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601563763; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2kvF58kigGFmHtXjNh7v0zXrE9xY+Y5LVaWwGb72IkM=;
 b=bukmGZbtLYY3mEcxRZn04h6zPKoJx307UiLg59Y8fsF7jdTW60FTuGEgyRLcvr06QgybWW8r
 MAWes8wLDALR8pshyzq2uJiBgHMWfT8eAMHm0XE6kLj61gThFVKyFnx7hryJsulxxjxTfihj
 p7rOVq/FKtxwL8pd4/1XmXFv4bU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f75ec6bd1b9b502ce8b1d89 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 14:49:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 94839C433FF; Thu,  1 Oct 2020 14:49:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cgoldswo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F37BC433CA;
 Thu,  1 Oct 2020 14:49:14 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 07:49:14 -0700
From: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 5/6] dma-buf: system_heap: Add pagepool support to
 system heap
In-Reply-To: <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
 <20200926042453.67517-6-john.stultz@linaro.org>
 <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
Message-ID: <ef00c83a9be572a1f9319b818de71266@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0yOSAyMTo0NiwgQ2hyaXMgR29sZHN3b3J0aHkgd3JvdGU6Cj4gT24gMjAyMC0w
OS0yNSAyMToyNCwgSm9obiBTdHVsdHogd3JvdGU6Cj4+IFJldXNlL2FidXNlIHRoZSBwYWdlcG9v
bCBjb2RlIGZyb20gdGhlIG5ldHdvcmsgY29kZSB0byBzcGVlZAo+PiB1cCBhbGxvY2F0aW9uIHBl
cmZvcm1hbmNlLgo+PiAKPj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBJT04gcGFnZXBvb2wgdXNh
Z2UsIGJ1dCB0cmllcyB0bwo+PiB1dGlsaXplIGdlbmVyaWMgY29kZSBpbnN0ZWFkIG9mIGEgY3Vz
dG9tIGltcGxlbWVudGF0aW9uLgo+PiAKPj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+Cj4+IENjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgo+PiBD
YzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+Cj4+IENjOiBCcmlhbiBTdGFya2V5
IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFA
Z29vZ2xlLmNvbT4KPj4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+
Cj4+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+Cj4+IENjOiDDmHJqYW4g
RWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgo+PiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4KPj4gQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNv
bT4KPj4gQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPj4gQ2M6IEphbWVzIEpv
bmVzIDxqYWpvbmVzQG52aWRpYS5jb20+Cj4+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gU2lnbmVkLW9mZi1i
eTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL0tjb25maWcgICAgICAgfCAgMSArCj4+ICBkcml2ZXJzL2RtYS1idWYv
aGVhcHMvc3lzdGVtX2hlYXAuYyB8IDMyIAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnIAo+PiBiL2Ry
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnCj4+IGluZGV4IGE1ZWVmMDZjNDIyNi4uZjEzY2Rl
NDMyMWIxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZwo+PiAr
KysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZwo+PiBAQCAtMSw2ICsxLDcgQEAKPj4g
IGNvbmZpZyBETUFCVUZfSEVBUFNfU1lTVEVNCj4+ICAJYm9vbCAiRE1BLUJVRiBTeXN0ZW0gSGVh
cCIKPj4gIAlkZXBlbmRzIG9uIERNQUJVRl9IRUFQUwo+PiArCXNlbGVjdCBQQUdFX1BPT0wKPj4g
IAloZWxwCj4+ICAJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gZW5hYmxlIHRoZSBzeXN0ZW0gZG1h
YnVmIGhlYXAuIFRoZSBzeXN0ZW0gCj4+IGhlYXAKPj4gIAkgIGlzIGJhY2tlZCBieSBwYWdlcyBm
cm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIElmIGluIGRvdWJ0LCBzYXkgWS4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4+IGIvZHJpdmVycy9kbWEt
YnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKPj4gaW5kZXggODgyYTYzMmU5YmI3Li45ZjU3YjRjOGFl
NjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4+
ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4+IEBAIC0yMCw2ICsy
MCw3IEBACj4+ICAjaW5jbHVkZSA8bGludXgvc2NhdHRlcmxpc3QuaD4KPj4gICNpbmNsdWRlIDxs
aW51eC9zbGFiLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+PiArI2luY2x1ZGUg
PG5ldC9wYWdlX3Bvb2wuaD4KPj4gCj4+ICBzdHJ1Y3QgZG1hX2hlYXAgKnN5c19oZWFwOwo+PiAK
Pj4gQEAgLTQ2LDYgKzQ3LDcgQEAgc3RydWN0IGRtYV9oZWFwX2F0dGFjaG1lbnQgewo+PiAgc3Rh
dGljIGdmcF90IG9yZGVyX2ZsYWdzW10gPSB7SElHSF9PUkRFUl9HRlAsIExPV19PUkRFUl9HRlAs
IAo+PiBMT1dfT1JERVJfR0ZQfTsKPj4gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgb3JkZXJz
W10gPSB7OCwgNCwgMH07Cj4+ICAjZGVmaW5lIE5VTV9PUkRFUlMgQVJSQVlfU0laRShvcmRlcnMp
Cj4+ICtzdHJ1Y3QgcGFnZV9wb29sICpwb29sc1tOVU1fT1JERVJTXTsKPj4gCj4+ICBzdGF0aWMg
c3RydWN0IHNnX3RhYmxlICpkdXBfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxlICp0YWJsZSkKPj4g
IHsKPj4gQEAgLTI2NCwxMyArMjY2LDE3IEBAIHN0YXRpYyB2b2lkIHN5c3RlbV9oZWFwX2RtYV9i
dWZfcmVsZWFzZShzdHJ1Y3QKPj4gZG1hX2J1ZiAqZG1hYnVmKQo+PiAgCXN0cnVjdCBzeXN0ZW1f
aGVhcF9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKPj4gIAlzdHJ1Y3Qgc2dfdGFibGUg
KnRhYmxlOwo+PiAgCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4+IC0JaW50IGk7Cj4+ICsJaW50
IGksIGo7Cj4+IAo+PiAgCXRhYmxlID0gJmJ1ZmZlci0+c2dfdGFibGU7Cj4+ICAJZm9yX2VhY2hf
c2codGFibGUtPnNnbCwgc2csIHRhYmxlLT5uZW50cywgaSkgewo+PiAgCQlzdHJ1Y3QgcGFnZSAq
cGFnZSA9IHNnX3BhZ2Uoc2cpOwo+PiAKPj4gLQkJX19mcmVlX3BhZ2VzKHBhZ2UsIGNvbXBvdW5k
X29yZGVyKHBhZ2UpKTsKPj4gKwkJZm9yIChqID0gMDsgaiA8IE5VTV9PUkRFUlM7IGorKykgewo+
PiArCQkJaWYgKGNvbXBvdW5kX29yZGVyKHBhZ2UpID09IG9yZGVyc1tqXSkKPj4gKwkJCQlicmVh
azsKPj4gKwkJfQo+PiArCQlwYWdlX3Bvb2xfcHV0X2Z1bGxfcGFnZShwb29sc1tqXSwgcGFnZSwg
ZmFsc2UpOwo+PiAgCX0KPj4gIAlzZ19mcmVlX3RhYmxlKHRhYmxlKTsKPj4gIAlrZnJlZShidWZm
ZXIpOwo+PiBAQCAtMzAwLDggKzMwNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZQo+PiAqYWxsb2Nf
bGFyZ2VzdF9hdmFpbGFibGUodW5zaWduZWQgbG9uZyBzaXplLAo+PiAgCQkJY29udGludWU7Cj4+
ICAJCWlmIChtYXhfb3JkZXIgPCBvcmRlcnNbaV0pCj4+ICAJCQljb250aW51ZTsKPj4gLQo+PiAt
CQlwYWdlID0gYWxsb2NfcGFnZXMob3JkZXJfZmxhZ3NbaV0sIG9yZGVyc1tpXSk7Cj4+ICsJCXBh
Z2UgPSBwYWdlX3Bvb2xfYWxsb2NfcGFnZXMocG9vbHNbaV0sIG9yZGVyX2ZsYWdzW2ldKTsKPj4g
IAkJaWYgKCFwYWdlKQo+PiAgCQkJY29udGludWU7Cj4+ICAJCXJldHVybiBwYWdlOwo+PiBAQCAt
NDA2LDYgKzQxMSwyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9oZWFwX29wcyBzeXN0ZW1f
aGVhcF9vcHMgCj4+ID0gewo+PiAgc3RhdGljIGludCBzeXN0ZW1faGVhcF9jcmVhdGUodm9pZCkK
Pj4gIHsKPj4gIAlzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2luZm8gZXhwX2luZm87Cj4+ICsJaW50
IGk7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgTlVNX09SREVSUzsgaSsrKSB7Cj4+ICsJCXN0
cnVjdCBwYWdlX3Bvb2xfcGFyYW1zIHBwOwo+PiArCj4+ICsJCW1lbXNldCgmcHAsIDAsIHNpemVv
ZihwcCkpOwo+PiArCQlwcC5vcmRlciA9IG9yZGVyc1tpXTsKPj4gKwkJcHAuZG1hX2RpciA9IERN
QV9CSURJUkVDVElPTkFMOwoKSGV5IEpvaG4sCgpDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0
IEkgdGhpbmsgdGhhdCBpbiBvcmRlciBmb3IgcHAuZG1hX2RpciB0byBiZSAKdXNlZCBpbiBlaXRo
ZXIgcGFnZV9wb29sX2FsbG9jX3BhZ2VzKCkgb3IgcGFnZV9wb29sX3B1dF9mdWxsX3BhZ2UoKSwg
d2UgCm5lZWQgdG8gYXQgbGVhc3QgaGF2ZSBQUF9GTEFHX0RNQV9NQVAgc2V0ICh0byBoYXZlIApw
YWdlX3Bvb2xfZG1hX3N5bmNfZm9yX2RldmljZSgpIGNhbGxlZCwgUFBfRkxBR19ETUFfU1lOQ19E
RVYgc2hvdWxkIGFsc28gCmJlIHNldCBJIHRoaW5rKS4gIEkgdGhpbmsgeW91J2QgYWxzbyBuZWVk
IHRvIHRvIGhhdmUgcHAtPmRldiBzZXQuICBBcmUgCndlIHNldHRpbmcgZG1hX2RpciB3aXRoIHRo
ZSBpbnRlbnRpb24gb2YgZG9pbmcgdGhlIG5lY2Vzc2FyeSBDTU9zIGJlZm9yZSAKd2Ugc3RhcnQg
dXNpbmcgdGhlIHBhZ2U/CgpUaGFua3MsCgpDaHJpcy4KCj4+ICsJCXBvb2xzW2ldID0gcGFnZV9w
b29sX2NyZWF0ZSgmcHApOwo+PiArCj4+ICsJCWlmIChJU19FUlIocG9vbHNbaV0pKSB7Cj4+ICsJ
CQlpbnQgajsKPj4gKwo+PiArCQkJcHJfZXJyKCIlczogcGFnZSBwb29sIGNyZWF0aW9uIGZhaWxl
ZCFcbiIsIF9fZnVuY19fKTsKPj4gKwkJCWZvciAoaiA9IDA7IGogPCBpOyBqKyspCj4+ICsJCQkJ
cGFnZV9wb29sX2Rlc3Ryb3kocG9vbHNbal0pOwo+PiArCQkJcmV0dXJuIFBUUl9FUlIocG9vbHNb
aV0pOwo+PiArCQl9Cj4+ICsJfQo+PiAKPj4gIAlleHBfaW5mby5uYW1lID0gInN5c3RlbSI7Cj4+
ICAJZXhwX2luZm8ub3BzID0gJnN5c3RlbV9oZWFwX29wczsKPiAKPiBUaGlzIGlzIGNvb2wsIEkg
ZGlkbid0IGtub3cgYWJvdXQgdGhpcyBwb29saW5nIGNvZGUgdW5kZXIgL25ldC9jb3JlLgo+IE5p
Y2UgYW5kIGNvbXBhY3QuCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMu
ClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUg
Q29kZSBBdXJvcmEgCkZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9q
ZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
