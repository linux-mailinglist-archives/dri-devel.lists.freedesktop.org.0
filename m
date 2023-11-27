Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5507F9B64
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46A710E1BB;
	Mon, 27 Nov 2023 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A694310E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AhS+IOdw6kZ/pQHX+37zeloXZrDy8eZYO6ALBvmHMmU=; b=M67Lzxlmtg6dZhkX5EQqfoSJUg
 BE4uRujj6y2gXwGLlNjibjtmM7rzBg+QIVz+V0HzqyGTFJMjtNGLKJQ8jmtfV5SUY4sLnSQaylfRk
 A/wKAgXCSTyqT6ZhAtlAmvnh5H7ruXLTR1N0N3H74pD+wxXVHMfKxJlCieBvLtaQt1SpMAya78zvs
 7Xhdrhrt8O8awgO1ZU3kKaDivyeQXAxJEMI2/HI0Nc483F+on/aSOof6KWZks7oYXjFTS+cKUviN4
 vsPo3hqdp6VEK8xnDEg60Dt08LXNcGhOcAUoqZ8mvVTaOF68yUaNfQ+OAy/XEKGhlGrazj70weJg/
 DClEtyjA==;
Received: from 21.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.21]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7WjU-007UtW-0j; Mon, 27 Nov 2023 09:12:44 +0100
Message-ID: <cc668d3f010e0dbc8076c9bdc8d6dc66c4d7f579.camel@igalia.com>
Subject: Re: [PATCH v2 06/17] drm/v3d: Decouple job allocation from job
 initiation
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 27 Nov 2023 09:12:43 +0100
In-Reply-To: <20231124012548.772095-7-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
 <20231124012548.772095-7-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RWwganVlLCAyMy0xMS0yMDIzIGEgbGFzIDIxOjQ3IC0wMzAwLCBNYcOtcmEgQ2FuYWwgZXNjcmli
acOzOgo+IFdlIHdhbnQgdG8gYWxsb3cgdGhlIElPQ1RMcyB0byBhbGxvY2F0ZSB0aGUgam9iIHdp
dGhvdXQgaW5pdGlhdGluZwo+IGl0Lgo+IFRoaXMgd2lsbCBiZSB1c2VmdWwgZm9yIHRoZSBDUFUg
am9iIHN1Ym1pc3Npb24gSU9DVEwsIGFzIHRoZSBDUFUgam9iCj4gaGFzCj4gdGhlIG5lZWQgdG8g
dXNlIGluZm9ybWF0aW9uIGZyb20gdGhlIHVzZXIgZXh0ZW5zaW9ucy4gQ3VycmVudGx5LCB0aGUK
PiB1c2VyIGV4dGVuc2lvbnMgYXJlIHBhcnNlZCBiZWZvcmUgdGhlIGpvYiBhbGxvY2F0aW9uLCBt
YWtpbmcgaXQKPiBpbXBvc3NpYmxlIHRvIGZpbGwgdGhlIENQVSBqb2Igd2hlbiBwYXJzaW5nIHRo
ZSB1c2VyIGV4dGVuc2lvbnMuCj4gVGhlcmVmb3JlLCBkZWNvdXBsZSB0aGUgam9iIGFsbG9jYXRp
b24gZnJvbSB0aGUgam9iIGluaXRpYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWHDrXJhIENh
bmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS92M2QvdjNk
X3N1Ym1pdC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdjNkL3YzZF9zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rf
c3VibWl0LmMKPiBpbmRleCBmZTQ2ZGQzMTZjYTAuLmVkMWEzMTBiYmQyZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zdWJtaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92M2QvdjNkX3N1Ym1pdC5jCj4gQEAgLTEzNSw2ICsxMzUsMjEgQEAgdm9pZCB2M2Rfam9iX3B1
dChzdHJ1Y3QgdjNkX2pvYiAqam9iKQo+IMKgwqDCoMKgwqDCoMKgwqBrcmVmX3B1dCgmam9iLT5y
ZWZjb3VudCwgam9iLT5mcmVlKTsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgaW50Cj4gK3YzZF9qb2Jf
YWxsb2NhdGUodm9pZCAqKmNvbnRhaW5lciwgc2l6ZV90IHNpemUpCj4gK3sKPiArwqDCoMKgwqDC
oMKgwqBpZiAoKmNvbnRhaW5lcikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7CgpNbW0uLi4gaXMgdGhpcyByZWFsbHkgd2hhdCB3ZSB3YW50PyBBdCBsZWFzdCByaWdo
dCBub3cgd2UgZXhwZWN0CnYzZF9qb2JfYWxsb2NhdGUgdG8gYWx3YXlzIGFsbG9jYXRlIG1lbW9y
eSwgaXMgdGhlcmUgYW55IHNjZW5hcmlvIGluCndoaWNoIHdlIHdvdWxkIGV4cGVjdCB0byBjYWxs
IHRoaXMgd2l0aCBhbiBhbHJlYWR5IGFsbG9jYXRlZCBjb250YWluZXI/CgpJYWdvCgo+ICsKPiAr
wqDCoMKgwqDCoMKgwqAqY29udGFpbmVyID0ga2NhbGxvYygxLCBzaXplLCBHRlBfS0VSTkVMKTsK
PiArwqDCoMKgwqDCoMKgwqBpZiAoISpjb250YWluZXIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgRFJNX0VSUk9SKCJDYW5ub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBWM0Qgam9i
LlxuIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+
ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gwqBzdGF0aWMgaW50Cj4gwqB2M2Rfam9iX2luaXQoc3RydWN0IHYzZF9kZXYgKnYzZCwgc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQg
Kipjb250YWluZXIsIHNpemVfdCBzaXplLCB2b2lkICgqZnJlZSkoc3RydWN0IGtyZWYKPiAqcmVm
KSwKPiBAQCAtMTQ1LDExICsxNjAsOSBAQCB2M2Rfam9iX2luaXQoc3RydWN0IHYzZF9kZXYgKnYz
ZCwgc3RydWN0Cj4gZHJtX2ZpbGUgKmZpbGVfcHJpdiwKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBo
YXNfbXVsdGlzeW5jID0gc2UgJiYgKHNlLT5mbGFncyAmCj4gRFJNX1YzRF9FWFRfSURfTVVMVElf
U1lOQyk7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQsIGk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKg
wqAqY29udGFpbmVyID0ga2NhbGxvYygxLCBzaXplLCBHRlBfS0VSTkVMKTsKPiAtwqDCoMKgwqDC
oMKgwqBpZiAoISpjb250YWluZXIpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
RFJNX0VSUk9SKCJDYW5ub3QgYWxsb2NhdGUgbWVtb3J5IGZvciB2M2Qgam9iLiIpOwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiAtwqDCoMKgwqDCoMKg
wqB9Cj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gdjNkX2pvYl9hbGxvY2F0ZShjb250YWluZXIsIHNp
emUpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiByZXQ7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgam9iID0gKmNvbnRhaW5l
cjsKPiDCoMKgwqDCoMKgwqDCoMKgam9iLT52M2QgPSB2M2Q7Cgo=

