Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4AAB46A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 10:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737D76E1F7;
	Fri,  6 Sep 2019 08:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43226E1F5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 08:52:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CED10AD14;
 Fri,  6 Sep 2019 08:52:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net, kraxel@redhat.com
Subject: [PATCH v3 0/3] Implement lazy unmapping for GEM VRAM buffers
Date: Fri,  6 Sep 2019 10:52:11 +0200
Message-Id: <20190906085214.11677-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KHdhczogYXN0LCBtZ2FnMjAwOiBNYXAgY29uc29sZSBCTyB3aGlsZSBpdCdzIGJlaW5nIGRpc3Bs
YXllZCkKCkdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIG1hcHMgYW5kIHVubWFwcyB0aGUgY29uc29s
ZSBCTyBmb3IgdXBkYXRpbmcgaXQncwpjb250ZW50IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuIElm
IHRoaXMgaW52b2x2ZXMgYW4gYWN0dWFsIG1hcHBpbmcKb3BlcmF0aW9uIChpbnN0ZWFkIG9mIHJl
dXNpbmcgYW4gZXhpc3RpbmcgbWFwcGluZyksIGxvdHMgb2YgZGVidWcgbWVzc2FnZXMKbWF5IGJl
IHByaW50ZWQsIHN1Y2ggYXMKCiAgeDg2L1BBVDogT3ZlcmxhcCBhdCAweGQwMDAwMDAwLTB4ZDEw
MDAwMDAKICB4ODYvUEFUOiByZXNlcnZlX21lbXR5cGUgYWRkZWQgW21lbSAweGQwMDAwMDAwLTB4
ZDAyZmZmZmZdLCB0cmFjayB3cml0ZS1jb21iaW5pbmcsIHJlcSB3cml0ZS1jb21iaW5pbmcsIHJl
dCB3cml0ZS1jb21iaW5pbmcKICB4ODYvUEFUOiBmcmVlX21lbXR5cGUgcmVxdWVzdCBbbWVtIDB4
ZDAwMDAwMDAtMHhkMDJmZmZmZl0KCmFzIHJlcG9ydGVkIGF0IFsxXS4gRHJpdmVycyB1c2luZyBW
UkFNIGhlbHBlcnMgbWF5IGFsc28gc2VlIHJlZHVjZWQKcGVyZm9ybWFuY2UgYXMgdGhlIG1hcHBp
bmcgb3BlcmF0aW9ucyBjYW4gY3JlYXRlIG92ZXJoZWFkLgoKSW4gdjMgb2YgdGhlIHBhdGNoIHNl
dCwgdGhpcyBwcm9ibGVtIGlzIGJlaW5nIHNvbHZlZCBieSBsYXp5bHkgdW5tYXBwaW5nCnRoZSBi
dWZmZXIgYXMgc3VnZ2VzdGVkIGJ5IEdlcmQuIFVubWFwcGluZyB3aXRoIGRybV9nZW1fdnJhbV9r
dW5tYXAoKSBvbmx5CmNoYW5nZXMgYSByZWZlcmVuY2UgY291bnRlci4gVlJBTSBoZWxwZXJzIG9u
bHkgcGVyZm9ybSB0aGUgdW5tYXBwaW5nCm9wZXJhdGlvbiB3aGVuIFRUTSBldmljdHMgdGhlIGJ1
ZmZlciBvYmplY3QgZnJvbSBpdHMgY3VycmVudCBsb2NhdGlvbi4gSWYKdGhlIGJ1ZmZlciBpcyBu
ZXZlciBldmljdGVkLCB0aGUgZXhpc3RpbmcgbWFwcGluZyBpcyByZXVzZWQgYnkgbGF0ZXIgY2Fs
bHMKdG8gZHJtX2dlbV92cmFtX2ttYXAoKS4KCnYzOgoJKiBpbXBsZW1lbnQgbGF6eSB1bm1hcHBp
bmcKdjI6CiAgICAgIAkqIGZpeGVkIGNvbW1lbnQgdHlwb3MKClsxXSBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1TZXB0ZW1iZXIvMjM0MzA4Lmh0
bWwKClRob21hcyBaaW1tZXJtYW5uICgzKToKICBkcm0vdnJhbTogQWRkIGttYXAgcmVmLWNvdW50
aW5nIHRvIEdFTSBWUkFNIG9iamVjdHMKICBkcm0vdnJhbTogQWRkIGluZnJhc3RydWN0dXJlIGZv
ciBtb3ZlX25vdGlmeSgpCiAgZHJtL3ZyYW06IEltcGxlbWVudCBsYXp5IHVubWFwcGluZyBmb3Ig
R0VNIFZSQU0gYnVmZmVycwoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
fCAxMTIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdnJh
bV9tbV9oZWxwZXIuYyAgfCAgMTIgKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmggICAgIHwgIDIzICsrKysrKwogaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggICAg
ICB8ICAgNCArCiA0IGZpbGVzIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
