Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA08A289
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB8C6E55E;
	Mon, 12 Aug 2019 15:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03BB6E558;
 Mon, 12 Aug 2019 15:43:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17971654-1500050 
 for multiple; Mon, 12 Aug 2019 16:42:48 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/sw_sync: Synchronize signal vs syncpt free
Date: Mon, 12 Aug 2019 16:42:47 +0100
Message-Id: <20190812154247.20508-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVyaW5nIHJlbGVhc2Ugb2YgdGhlIHN5bmNwdCwgd2UgcmVtb3ZlIGl0IGZyb20gdGhlIGxpc3Qg
b2Ygc3luY3B0IGFuZAp0aGUgdHJlZSwgYnV0IG9ubHkgaWYgaXQgaXMgbm90IGFscmVhZHkgYmVl
biByZW1vdmVkLiBIb3dldmVyLCBkdXJpbmcKc2lnbmFsaW5nLCB3ZSBmaXJzdCByZW1vdmUgdGhl
IHN5bmNwdCBmcm9tIHRoZSBsaXN0LiBTbywgaWYgd2UKY29uY3VycmVudGx5IGZyZWUgYW5kIHNp
Z25hbCB0aGUgc3luY3B0LCB0aGUgZnJlZSBtYXkgZGVjaWRlIHRoYXQgaXQgaXMKbm90IHBhcnQg
b2YgdGhlIHRyZWUgYW5kIGltbWVkaWF0ZWx5IGZyZWUgaXRzZWxmIC0tIG1lYW53aGlsZSB0aGUK
c2lnbmFsZXIgZ29lcyBvbnRvIHRvIHVzZSB0aGUgbm93IGZyZWVkIGRhdGFzdHJ1Y3R1cmUuCgpJ
biBwYXJ0aWN1bGFyLCB3ZSBnZXQgc3RydWN0IGJ5IGNvbW1pdCAwZTJmNzMzYWRkYmYgKCJkbWEt
YnVmOiBtYWtlCmRtYV9mZW5jZSBzdHJ1Y3R1cmUgYSBiaXQgc21hbGxlciB2MiIpIGFzIHRoZSBj
Yl9saXN0IGlzIGltbWVkaWF0ZWx5CmNsb2JiZXJlZCBieSB0aGUga2ZyZWVfcmN1LgoKQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTM4MQpG
aXhlczogZDM4NjJlNDRkYWE3ICgiZG1hLWJ1Zi9zdy1zeW5jOiBGaXggbG9ja2luZyBhcm91bmQg
c3luY190aW1lbGluZSBsaXN0cyIpClJlZmVyZW5jZXM6IDBlMmY3MzNhZGRiZiAoImRtYS1idWY6
IG1ha2UgZG1hX2ZlbmNlIHN0cnVjdHVyZSBhIGJpdCBzbWFsbGVyIHYyIikKU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBTdW1pdCBTZW13
YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+CkNjOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+CkNjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiA8c3RhYmxlQHZn
ZXIua2VybmVsLm9yZz4gIyB2NC4xNCsKLS0tCiBkcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jIHwg
MTMgKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jIGIvZHJpdmVy
cy9kbWEtYnVmL3N3X3N5bmMuYwppbmRleCAwNTFmNmMyODczYzcuLjI3YjFkNTQ5ZWQzOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N3X3N5bmMuYworKysgYi9kcml2ZXJzL2RtYS1idWYv
c3dfc3luYy5jCkBAIC0xMzIsMTcgKzEzMiwxNCBAQCBzdGF0aWMgdm9pZCB0aW1lbGluZV9mZW5j
ZV9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQogewogCXN0cnVjdCBzeW5jX3B0ICpw
dCA9IGRtYV9mZW5jZV90b19zeW5jX3B0KGZlbmNlKTsKIAlzdHJ1Y3Qgc3luY190aW1lbGluZSAq
cGFyZW50ID0gZG1hX2ZlbmNlX3BhcmVudChmZW5jZSk7CisJdW5zaWduZWQgbG9uZyBmbGFnczsK
IAorCXNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7CiAJaWYgKCFsaXN0X2Vt
cHR5KCZwdC0+bGluaykpIHsKLQkJdW5zaWduZWQgbG9uZyBmbGFnczsKLQotCQlzcGluX2xvY2tf
aXJxc2F2ZShmZW5jZS0+bG9jaywgZmxhZ3MpOwotCQlpZiAoIWxpc3RfZW1wdHkoJnB0LT5saW5r
KSkgewotCQkJbGlzdF9kZWwoJnB0LT5saW5rKTsKLQkJCXJiX2VyYXNlKCZwdC0+bm9kZSwgJnBh
cmVudC0+cHRfdHJlZSk7Ci0JCX0KLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9j
aywgZmxhZ3MpOworCQlsaXN0X2RlbCgmcHQtPmxpbmspOworCQlyYl9lcmFzZSgmcHQtPm5vZGUs
ICZwYXJlbnQtPnB0X3RyZWUpOwogCX0KKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5s
b2NrLCBmbGFncyk7CiAKIAlzeW5jX3RpbWVsaW5lX3B1dChwYXJlbnQpOwogCWRtYV9mZW5jZV9m
cmVlKGZlbmNlKTsKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
