Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F374434757
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 14:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C256189248;
	Tue,  4 Jun 2019 12:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3E89248;
 Tue,  4 Jun 2019 12:53:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 16788413-1500050 
 for multiple; Tue, 04 Jun 2019 13:53:27 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] dma-buf: Discard old fence_excl on retrying get_fences_rcu
 for realloc
Date: Tue,  4 Jun 2019 13:53:23 +0100
Message-Id: <20190604125323.21396-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604123947.20713-1-chris@chris-wilson.co.uk>
References: <20190604123947.20713-1-chris@chris-wilson.co.uk>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgaGF2ZSB0byBkcm9wIHRoZSBzZXFjb3VudCAmIHJjdSBsb2NrIHRvIHBlcmZvcm0gYSBr
cmVhbGxvYywgd2UKaGF2ZSB0byByZXN0YXJ0IHRoZSBsb29wLiBJbiBkb2luZyBzbywgYmUgY2Fy
ZWZ1bCBub3QgdG8gbG9zZSB0cmFjayBvZgp0aGUgYWxyZWFkeSBhY3F1aXJlZCBleGNsdXNpdmUg
ZmVuY2UuCgpGaXhlczogZmVkZjU0MTMyZDI0ICgiZG1hLWJ1ZjogUmVzdGFydCByZXNlcnZhdGlv
bl9vYmplY3RfZ2V0X2ZlbmNlc19yY3UoKSBhZnRlciB3cml0ZXMiKSAjdjQuMTAKU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQpUaGlzLCB0aGlzIGlzIHYyLiBOb3QgdGhlIG9s
ZCBicmFuY2g7IHJlbWVtYmVyIHRvIGNoZWNrIHRoZSBnaXQKc2VuZC1lbWFpbCBiZWZvcmUgaGl0
dGluZyBlbnRlci4KLUNocmlzCi0tLQogZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5j
CmluZGV4IDRkMzJlMmM2Nzg2Mi4uNDQ0N2UxM2QxZTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Rt
YS1idWYvcmVzZXJ2YXRpb24uYworKysgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwpA
QCAtMzY1LDYgKzM2NSwxMCBAQCBpbnQgcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9mZW5jZXNfcmN1
KHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKIAkJCQkJICAgR0ZQX05PV0FJVCB8IF9f
R0ZQX05PV0FSTik7CiAJCQlpZiAoIW5zaGFyZWQpIHsKIAkJCQlyY3VfcmVhZF91bmxvY2soKTsK
KworCQkJCWRtYV9mZW5jZV9wdXQoZmVuY2VfZXhjbCk7CisJCQkJZmVuY2VfZXhjbCA9IE5VTEw7
CisKIAkJCQluc2hhcmVkID0ga3JlYWxsb2Moc2hhcmVkLCBzeiwgR0ZQX0tFUk5FTCk7CiAJCQkJ
aWYgKG5zaGFyZWQpIHsKIAkJCQkJc2hhcmVkID0gbnNoYXJlZDsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
