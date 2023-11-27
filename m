Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F87F9B3A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 08:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B603810E1B9;
	Mon, 27 Nov 2023 07:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7CF10E1B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TpNVw6TsfZR+hDl5Dj3Zf/qba0k8ZGfXVQVYwFJnpSk=; b=IM8indB1wcL9RKilKPCH4fECgq
 vc7A5qw9LpCK0J+nDawm8byQwDCpdFAZ/e8lr1ZdGiXncj1XxPcWrVFQ4EI8vN8/DVrRZ8HCPW0jE
 trDBeRUzoZr+76GIjR9vLIG20homVZr7djE7kOTcRr2vBClqMgcerQrOcvYULh6XHTKmLJRszqeCn
 5k2swGgulIS7OoD1rIi1/Lh+dSbXDvP/br4YTcEJ12KmBPM/JEgmQ2K1t8m1GKKleNu6rUU0T+OPO
 ptwrFwv1fBJX3YdQekASN2LmsfI2oJys6f0onYk3/19HES3BUviNoGGeiEj2wcQ034G5LzkYB8419
 EAzxJ+IA==;
Received: from 21.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.21]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7WUe-007Ud3-E1; Mon, 27 Nov 2023 08:57:24 +0100
Message-ID: <06d5c4537c9e4119bf87bd95f66a213e25e65f32.camel@igalia.com>
Subject: Re: [PATCH v2 04/17] drm/v3d: Simplify job refcount handling
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 27 Nov 2023 08:57:23 +0100
In-Reply-To: <20231124012548.772095-5-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
 <20231124012548.772095-5-mcanal@igalia.com>
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
acOzOgo+IEZyb206IE1lbGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+Cj4gCj4gSW5zdGVhZCBv
ZiBjaGVja2luZyBpZiB0aGUgam9iIGlzIE5VTEwgZXZlcnkgdGltZSB3ZSBjYWxsIHRoZQo+IGZ1
bmN0aW9uLAo+IGNoZWNrIGl0IGluc2lkZSB0aGUgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWVsaXNzYSBXZW4gPG13ZW5AaWdhbGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYcOtcmEg
Q2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3YzZC92
M2Rfc3VibWl0LmMgfCAxNSArKysrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92M2QvdjNkX3N1Ym1pdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zdWJtaXQu
Ywo+IGluZGV4IGYzNjIxNDAwMmYzNy4uZTE4ZTdjOTYzODg0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX3N1Ym1pdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92
M2Rfc3VibWl0LmMKPiBAQCAtMTI5LDYgKzEyOSw5IEBAIHZvaWQgdjNkX2pvYl9jbGVhbnVwKHN0
cnVjdCB2M2Rfam9iICpqb2IpCj4gwqAKPiDCoHZvaWQgdjNkX2pvYl9wdXQoc3RydWN0IHYzZF9q
b2IgKmpvYikKPiDCoHsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWpvYikKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKga3JlZl9wdXQo
JmpvYi0+cmVmY291bnQsIGpvYi0+ZnJlZSk7Cj4gwqB9Cj4gwqAKPiBAQCAtNTE3LDExICs1MjAs
OSBAQCB2M2Rfc3VibWl0X2NsX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQKPiAq
ZGF0YSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnNlLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0X2pvYi0KPiA+ZG9uZV9m
ZW5jZSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoYmluKQo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB2M2Rfam9iX3B1dCgmYmluLT5iYXNlKTsKPiAtwqDCoMKgwqDCoMKgwqB2
M2Rfam9iX3B1dCgmcmVuZGVyLT5iYXNlKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoY2xlYW5fam9i
KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2M2Rfam9iX3B1dChjbGVhbl9qb2Ip
Owo+ICvCoMKgwqDCoMKgwqDCoHYzZF9qb2JfcHV0KCh2b2lkICopYmluKTsKPiArwqDCoMKgwqDC
oMKgwqB2M2Rfam9iX3B1dCgodm9pZCAqKXJlbmRlcik7Cj4gK8KgwqDCoMKgwqDCoMKgdjNkX2pv
Yl9wdXQoKHZvaWQgKiljbGVhbl9qb2IpOwoKUGVyc29uYWxseSwgSSBhbSBub3QgYSBiaWcgZmFu
IG9mIGNhc3RpbmcgdG8gdm9pZCogaW5zdGVhZCBvZiB1c2luZwomam9iLT5iYXNlIGZvciBhbGwg
dGhlIHYzZF9qb2JfcHV0IGNhbGxzIGluIHRoaXMgcGF0Y2guCgpJYWdvCgo+IMKgCj4gwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAwOwo+IMKgCj4gQEAgLTYyMSw3ICs2MjIsNyBAQCB2M2Rfc3VibWl0
X3RmdV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkCj4gKmRhdGEsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZzZSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgam9iLQo+ID5iYXNlLmRvbmVfZmVuY2UpOwo+IMKgCj4g
LcKgwqDCoMKgwqDCoMKgdjNkX2pvYl9wdXQoJmpvYi0+YmFzZSk7Cj4gK8KgwqDCoMKgwqDCoMKg
djNkX2pvYl9wdXQoKHZvaWQgKilqb2IpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAw
Owo+IMKgCj4gQEAgLTcyNSw3ICs3MjYsNyBAQCB2M2Rfc3VibWl0X2NzZF9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkCj4gKmRhdGEsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICZzZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY2xlYW5fam9iLQo+ID5kb25lX2ZlbmNlKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHYz
ZF9qb2JfcHV0KCZqb2ItPmJhc2UpOwo+ICvCoMKgwqDCoMKgwqDCoHYzZF9qb2JfcHV0KCh2b2lk
ICopam9iKTsKPiDCoMKgwqDCoMKgwqDCoMKgdjNkX2pvYl9wdXQoY2xlYW5fam9iKTsKPiDCoAo+
IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKCg==

