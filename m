Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A21473B3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 23:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6426E14F;
	Thu, 23 Jan 2020 22:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777D86E14F;
 Thu, 23 Jan 2020 22:21:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 19988068-1500050 
 for multiple; Thu, 23 Jan 2020 22:21:13 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Release filp before global lock
Date: Thu, 23 Jan 2020 22:21:12 +0000
Message-Id: <20200123222112.26840-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122155637.496291-1-chris@chris-wilson.co.uk>
References: <20200122155637.496291-1-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZpbGUgaXMgbm90IHBhcnQgb2YgdGhlIGdsb2JhbCBkcm0gcmVzb3VyY2UgYW5kIGNhbiBi
ZSByZWxlYXNlZApwcmlvciB0byB0YWtlIHRoZSBnbG9iYWwgbXV0ZXggdG8gZHJvcCB0aGUgb3Bl
bl9jb3VudCAoYW5kIHBvdGVudGlhbGx5CmNsb3NlKSB0aGUgZHJtIGRldmljZS4gQXMgdGhlIGds
b2JhbCBtdXRleCBpcyBpbmRlZWQgZ2xvYmFsLCBub3Qgb25seQp3aXRoaW4gdGhlIGRldmljZSBi
dXQgYWNyb3NzIGRldmljZXMsIGEgc2xvdyBmaWxlIHJlbGVhc2UgbWVjaGFuaXNtIGNhbgpib3R0
bGVuZWNrIHRoZSBlbnRpcmUgc3lzdGVtLgoKSG93ZXZlciwgaW5zaWRlIGRybV9jbG9zZV9oZWxw
ZXIoKSB0aGVyZSBhcmUgYSBudW1iZXIgb2YgZGV2LT5kcml2ZXIKY2FsbGJhY2tzIHRoYXQgdGFr
ZSB0aGUgZHJtX2RldmljZSBhcyB0aGUgZmlyc3QgcGFyYW1ldGVyLi4uIFdvcnJ5aW5nbHkKc29t
ZSBvZiB0aG9zZSBjYWxsYmFja3MgbWF5IGJlIChpbXBsaWNpdGx5KSBkZXBlbmRpbmcgb24gdGhl
IGdsb2JhbAptdXRleC4KCnYyOiBEcm9wIHRoZSBkZWJ1ZyBtZXNzYWdlIGZvciB0aGUgb3Blbi1j
b3VudCwgaXQncyBpbmNsdWRlZCB3aXRoIHRoZQpkcm1fZmlsZV9mcmVlKCkgZGVidWcgbWVzc2Fn
ZSAtLSBhbmQgZm9yIGdvb2QgbWVhc3VyZSBtYWtlIHRoYXQgdXAgYXMKcmVhZGluZyBvdXRzaWRl
IG9mIHRoZSBtdXRleC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgfCA4ICsrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
aWxlLmMKaW5kZXggOTJkMTY3MjRmOTQ5Li43NzdiNDUwODcwYTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmlsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCkBA
IC0yMjAsNyArMjIwLDcgQEAgdm9pZCBkcm1fZmlsZV9mcmVlKHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSkKIAlEUk1fREVCVUcoInBpZCA9ICVkLCBkZXZpY2UgPSAweCVseCwgb3Blbl9jb3VudCA9ICVk
XG4iLAogCQkgIHRhc2tfcGlkX25yKGN1cnJlbnQpLAogCQkgIChsb25nKW9sZF9lbmNvZGVfZGV2
KGZpbGUtPm1pbm9yLT5rZGV2LT5kZXZ0KSwKLQkJICBkZXYtPm9wZW5fY291bnQpOworCQkgIFJF
QURfT05DRShkZXYtPm9wZW5fY291bnQpKTsKIAogCWlmIChkcm1fY29yZV9jaGVja19mZWF0dXJl
KGRldiwgRFJJVkVSX0xFR0FDWSkgJiYKIAkgICAgZGV2LT5kcml2ZXItPnByZWNsb3NlKQpAQCAt
NDM4LDEyICs0MzgsMTAgQEAgaW50IGRybV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0
cnVjdCBmaWxlICpmaWxwKQogCXN0cnVjdCBkcm1fbWlub3IgKm1pbm9yID0gZmlsZV9wcml2LT5t
aW5vcjsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbWlub3ItPmRldjsKIAotCW11dGV4X2xv
Y2soJmRybV9nbG9iYWxfbXV0ZXgpOwotCi0JRFJNX0RFQlVHKCJvcGVuX2NvdW50ID0gJWRcbiIs
IGRldi0+b3Blbl9jb3VudCk7Ci0KIAlkcm1fY2xvc2VfaGVscGVyKGZpbHApOwogCisJbXV0ZXhf
bG9jaygmZHJtX2dsb2JhbF9tdXRleCk7CisKIAlpZiAoIS0tZGV2LT5vcGVuX2NvdW50KQogCQlk
cm1fbGFzdGNsb3NlKGRldik7CiAKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
