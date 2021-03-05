Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172032E6BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B356EB6E;
	Fri,  5 Mar 2021 10:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1450E6E18E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:51:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 24023334-1500050 
 for multiple; Fri, 05 Mar 2021 10:51:16 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Fix confusion of dynamic dma-buf vs dynamic
 attachment
Date: Fri,  5 Mar 2021 10:51:14 +0000
Message-Id: <20210305105114.26338-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGM1NDU3ODFlMWM1NSAoImRtYS1idWY6IGRvYyBwb2xpc2ggZm9yIHBpbi91bnBpbiIp
IGRpc2FncmVlcyB3aXRoCnRoZSBpbnRyb2R1Y3Rpb24gb2YgZHluYW1pc20gaW4gY29tbWl0OiBi
YjQyZGY0NjYyYTQgKCJkbWEtYnVmOiBhZGQKZHluYW1pYyBETUEtYnVmIGhhbmRsaW5nIHYxNSIp
IHJlc3VsdGluZyBpbiB3YXJuaW5nIHNwZXcgb24KaW1wb3J0aW5nIGRtYS1idWYuIFNpbGVuY2Ug
dGhlIHdhcm5pbmcgZnJvbSB0aGUgbGF0dGVyIGJ5IG9ubHkgcGlubmluZwp0aGUgYXR0YWNobWVu
dCBpZiB0aGUgYXR0YWNobWVudCByYXRoZXIgdGhhbiB0aGUgZG1hYnVmIGlzIHRvIGJlCmR5bmFt
aWMuCgpGaXhlczogYmI0MmRmNDY2MmE0ICgiZG1hLWJ1ZjogYWRkIGR5bmFtaWMgRE1BLWJ1ZiBo
YW5kbGluZyB2MTUiKQpGaXhlczogYzU0NTc4MWUxYzU1ICgiZG1hLWJ1ZjogZG9jIHBvbGlzaCBm
b3IgcGluL3VucGluIikKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuNysKLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
IHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMKaW5kZXggZjI2NGI3MGMzODNlLi4wOWY1YWU0NTg1MTUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYwpAQCAtNzU4LDggKzc1OCw4IEBAIGRtYV9idWZfZHluYW1pY19hdHRhY2goc3RydWN0
IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRldmljZSAqZGV2LAogCSAgICBkbWFfYnVmX2lzX2R5
bmFtaWMoZG1hYnVmKSkgewogCQlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKIAotCQlpZiAoZG1hX2J1
Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkgewotCQkJZG1hX3Jlc3ZfbG9jayhhdHRhY2gt
PmRtYWJ1Zi0+cmVzdiwgTlVMTCk7CisJCWlmIChkbWFfYnVmX2F0dGFjaG1lbnRfaXNfZHluYW1p
YyhhdHRhY2gpKSB7CisJCQlkbWFfcmVzdl9sb2NrKGRtYWJ1Zi0+cmVzdiwgTlVMTCk7CiAJCQly
ZXQgPSBkbWFfYnVmX3BpbihhdHRhY2gpOwogCQkJaWYgKHJldCkKIAkJCQlnb3RvIGVycl91bmxv
Y2s7CkBAIC03NzIsOCArNzcyLDkgQEAgZG1hX2J1Zl9keW5hbWljX2F0dGFjaChzdHJ1Y3QgZG1h
X2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQlyZXQgPSBQVFJfRVJSKHNndCk7
CiAJCQlnb3RvIGVycl91bnBpbjsKIAkJfQotCQlpZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0dGFj
aC0+ZG1hYnVmKSkKLQkJCWRtYV9yZXN2X3VubG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7CisJ
CWlmIChkbWFfYnVmX2F0dGFjaG1lbnRfaXNfZHluYW1pYyhhdHRhY2gpKQorCQkJZG1hX3Jlc3Zf
dW5sb2NrKGRtYWJ1Zi0+cmVzdik7CisKIAkJYXR0YWNoLT5zZ3QgPSBzZ3Q7CiAJCWF0dGFjaC0+
ZGlyID0gRE1BX0JJRElSRUNUSU9OQUw7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
