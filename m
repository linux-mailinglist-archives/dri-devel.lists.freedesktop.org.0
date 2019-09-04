Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CDBA818C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F08995F;
	Wed,  4 Sep 2019 11:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FD9898ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:56:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0BB3AC31;
 Wed,  4 Sep 2019 11:56:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net
Subject: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being displayed
Date: Wed,  4 Sep 2019 13:56:41 +0200
Message-Id: <20190904115644.7620-1-tzimmermann@suse.de>
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

KHdhczogZHJtL3ZyYW0taGVscGVyOiBGaXggcGVyZm9ybWFuY2UgcmVncmVzc2lvbiBpbiBmYmRl
dikKCkdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIG1hcHMgYW5kIHVubWFwcyB0aGUgY29uc29sZSBC
TyBmb3IgdXBkYXRpbmcgaXQncwpjb250ZW50IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuIElmIHRo
aXMgaW52b2x2ZXMgYW4gYWN0dWFsIG1hcHBpbmcKb3BlcmF0aW9uIChpbnN0ZWFkIG9mIHJldXNp
bmcgYW4gZXhpc3RpbmcgbWFwcGluZyksIGxvdHMgb2YgZGVidWcgbWVzc2FnZXMKbWF5IGJlIHBy
aW50ZWQsIHN1Y2ggYXMKCiAgeDg2L1BBVDogT3ZlcmxhcCBhdCAweGQwMDAwMDAwLTB4ZDEwMDAw
MDAKICB4ODYvUEFUOiByZXNlcnZlX21lbXR5cGUgYWRkZWQgW21lbSAweGQwMDAwMDAwLTB4ZDAy
ZmZmZmZdLCB0cmFjayB3cml0ZS1jb21iaW5pbmcsIHJlcSB3cml0ZS1jb21iaW5pbmcsIHJldCB3
cml0ZS1jb21iaW5pbmcKICB4ODYvUEFUOiBmcmVlX21lbXR5cGUgcmVxdWVzdCBbbWVtIDB4ZDAw
MDAwMDAtMHhkMDJmZmZmZl0KCmFzIHJlcG9ydGVkIGF0IFsxXS4gRHJpdmVycyB1c2luZyBWUkFN
IGhlbHBlcnMgbWF5IGFsc28gc2VlIHJlZHVjZWQKcGVyZm9ybWFuY2UgYXMgdGhlIG1hcHBpbmcg
b3BlcmF0aW9ucyBjYW4gY3JlYXRlIG92ZXJoZWFkLgoKVGhpcyBwYXRjaCBzZXQgZml4ZXMgdGhl
IHByb2JsZW0gYnkgYWRkaW5nIGEgcmVmIGNvdW50ZXIgdG8gdGhlIEdFTQpWUkFNIGJ1ZmZlcnMn
IGttYXAgb3BlcmF0aW9uLCBhbmQga2VlcGluZyB0aGUgZmJkZXYncyBjb25zb2xlIGJ1ZmZlcgpt
YXBwZWQgd2hpbGUgdGhlIGNvbnNvbGUgaXMgYmVpbmcgZGlzcGxheWVkLiBUaGVzZSBjaGFuZ2Vz
IGF2b2lkIHRoZQpmcmVxdWVudCBtYXBwaW5ncyBpbiB0aGUgZmJkZXYgY29kZS4gVGhlIGRyaXZl
cnMsIGFzdCBhbmQgbWdhZzIwMCwKbWFwIHRoZSBjb25zb2xlJ3MgYnVmZmVyIHdoZW4gaXQgYmVj
b21lcyB2aXNpYmxlIGFuZCB0aGUgZmJkZXYgY29kZQpyZXVzZXMgdGhpcyBtYXBwaW5nLiBUaGUg
b3JpZ2luYWwgZmJkZXYgY29kZSBpbiBhc3QgYW5kIG1nYWcyMDAgdXNlZAp0aGUgc2FtZSBzdHJh
dGVneS4KClsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2
ZWwvMjAxOS1TZXB0ZW1iZXIvMjM0MzA4Lmh0bWwKCnYyOgoJKiBmaXhlZCBjb21tZW50IHR5cG9z
CgpUaG9tYXMgWmltbWVybWFubiAoMyk6CiAgZHJtL3ZyYW06IEFkZCBrbWFwIHJlZi1jb3VudGlu
ZyB0byBHRU0gVlJBTSBvYmplY3RzCiAgZHJtL2FzdDogTWFwIGZiZGV2IGZyYW1lYnVmZmVyIHdo
aWxlIGl0J3MgYmVpbmcgZGlzcGxheWVkCiAgZHJtL21nYWcyMDA6IE1hcCBmYmRldiBmcmFtZWJ1
ZmZlciB3aGlsZSBpdCdzIGJlaW5nIGRpc3BsYXllZAoKIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYyAgICAgICAgIHwgMTkgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyAgfCA3NCArKysrKysrKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCAyMCArKysrKysrCiBpbmNsdWRlL2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmggICAgICB8IDE5ICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTE0
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
