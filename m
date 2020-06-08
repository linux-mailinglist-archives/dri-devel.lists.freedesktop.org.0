Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA971F23FE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CAA6E9B1;
	Mon,  8 Jun 2020 23:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DEE6E9B1;
 Mon,  8 Jun 2020 23:18:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4375820823;
 Mon,  8 Jun 2020 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658330;
 bh=nDJ5aA8yDvrtA35YXgEoanLshtxLTVoWR9hrb1QTiLY=;
 h=From:To:Cc:Subject:Date:From;
 b=2T4PPlxkwCQQyhVVHugx/bCig6Pc4MNb6wn15szWKgNZYs+9B8auoRetiwDoNuMS1
 JudeGVmYVRlLd/EisB8beElfwHo0dO5p/EDioadLXfNiC0VSKxI+cLrp24UES2fFAi
 PXpyYpBznr1zlCD1MPPz1viYNIxzc/igjGuG1CSw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 001/175] drm/amdgpu: fix and cleanup
 amdgpu_gem_object_close v4
Date: Mon,  8 Jun 2020 19:15:54 -0400
Message-Id: <20200608231848.3366970-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgODJjNDE2YjEzY2I3ZDIyYjk2ZWMwODg4YjI5NmE0OGRmZjhhMDllYiBdCgpU
aGUgcHJvYmxlbSBpcyB0aGF0IHdlIGNhbid0IGFkZCB0aGUgY2xlYXIgZmVuY2UgdG8gdGhlIEJP
CndoZW4gdGhlcmUgaXMgYW4gZXhjbHVzaXZlIGZlbmNlIG9uIGl0IHNpbmNlIHdlIGNhbid0Cmd1
YXJhbnRlZSB0aGUgdGhlIGNsZWFyIGZlbmNlIHdpbGwgY29tcGxldGUgYWZ0ZXIgdGhlCmV4Y2x1
c2l2ZSBvbmUuCgpUbyBmaXggdGhpcyByZWZhY3RvciB0aGUgZnVuY3Rpb24gYW5kIGFsc28gYWRk
IHRoZSBleGNsdXNpdmUKZmVuY2UgYXMgc2hhcmVkIHRvIHRoZSByZXN2IG9iamVjdC4KCnYyOiBm
aXggd2FybmluZwp2MzogYWRkIGV4Y2wgZmVuY2UgYXMgc2hhcmVkIGluc3RlYWQKdjQ6IHNxdWFz
aCBpbiBmaXggZm9yIGZlbmNlIGhhbmRsaW5nIGluIGFtZGdwdV9nZW1fb2JqZWN0X2Nsb3NlCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClJldmlld2VkLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDQzICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKaW5kZXggOGNlYjQ0OTI1OTQ3Li41ZmE1MTU4
ZDE4ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTE2MSwx
NiArMTYxLDE3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosCiAKIAlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkgdm1fcGQ7CiAJc3Ry
dWN0IGxpc3RfaGVhZCBsaXN0LCBkdXBsaWNhdGVzOworCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
ID0gTlVMTDsKIAlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKIAlzdHJ1Y3Qgd3dfYWNx
dWlyZV9jdHggdGlja2V0OwogCXN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhOwotCWludCByOwor
CWxvbmcgcjsKIAogCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsKIAlJTklUX0xJU1RfSEVBRCgmZHVw
bGljYXRlcyk7CiAKIAl0di5ibyA9ICZiby0+dGJvOwotCXR2Lm51bV9zaGFyZWQgPSAxOworCXR2
Lm51bV9zaGFyZWQgPSAyOwogCWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7CiAKIAlhbWRncHVf
dm1fZ2V0X3BkX2JvKHZtLCAmbGlzdCwgJnZtX3BkKTsKQEAgLTE3OCwyOCArMTc5LDM0IEBAIHZv
aWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJ
ciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAmZHVwbGlj
YXRlcywgZmFsc2UpOwogCWlmIChyKSB7CiAJCWRldl9lcnIoYWRldi0+ZGV2LCAibGVha2luZyBi
byB2YSBiZWNhdXNlICIKLQkJCSJ3ZSBmYWlsIHRvIHJlc2VydmUgYm8gKCVkKVxuIiwgcik7CisJ
CQkid2UgZmFpbCB0byByZXNlcnZlIGJvICglbGQpXG4iLCByKTsKIAkJcmV0dXJuOwogCX0KIAli
b192YSA9IGFtZGdwdV92bV9ib19maW5kKHZtLCBibyk7Ci0JaWYgKGJvX3ZhICYmIC0tYm9fdmEt
PnJlZl9jb3VudCA9PSAwKSB7Ci0JCWFtZGdwdV92bV9ib19ybXYoYWRldiwgYm9fdmEpOwotCi0J
CWlmIChhbWRncHVfdm1fcmVhZHkodm0pKSB7Ci0JCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9
IE5VTEw7CisJaWYgKCFib192YSB8fCAtLWJvX3ZhLT5yZWZfY291bnQpCisJCWdvdG8gb3V0X3Vu
bG9jazsKIAotCQkJciA9IGFtZGdwdV92bV9jbGVhcl9mcmVlZChhZGV2LCB2bSwgJmZlbmNlKTsK
LQkJCWlmICh1bmxpa2VseShyKSkgewotCQkJCWRldl9lcnIoYWRldi0+ZGV2LCAiZmFpbGVkIHRv
IGNsZWFyIHBhZ2UgIgotCQkJCQkidGFibGVzIG9uIEdFTSBvYmplY3QgY2xvc2UgKCVkKVxuIiwg
cik7Ci0JCQl9CisJYW1kZ3B1X3ZtX2JvX3JtdihhZGV2LCBib192YSk7CisJaWYgKCFhbWRncHVf
dm1fcmVhZHkodm0pKQorCQlnb3RvIG91dF91bmxvY2s7CiAKLQkJCWlmIChmZW5jZSkgewotCQkJ
CWFtZGdwdV9ib19mZW5jZShibywgZmVuY2UsIHRydWUpOwotCQkJCWRtYV9mZW5jZV9wdXQoZmVu
Y2UpOwotCQkJfQotCQl9CisJZmVuY2UgPSBkbWFfcmVzdl9nZXRfZXhjbChiby0+dGJvLmJhc2Uu
cmVzdik7CisJaWYgKGZlbmNlKSB7CisJCWFtZGdwdV9ib19mZW5jZShibywgZmVuY2UsIHRydWUp
OworCQlmZW5jZSA9IE5VTEw7CiAJfQorCisJciA9IGFtZGdwdV92bV9jbGVhcl9mcmVlZChhZGV2
LCB2bSwgJmZlbmNlKTsKKwlpZiAociB8fCAhZmVuY2UpCisJCWdvdG8gb3V0X3VubG9jazsKKwor
CWFtZGdwdV9ib19mZW5jZShibywgZmVuY2UsIHRydWUpOworCWRtYV9mZW5jZV9wdXQoZmVuY2Up
OworCitvdXRfdW5sb2NrOgorCWlmICh1bmxpa2VseShyIDwgMCkpCisJCWRldl9lcnIoYWRldi0+
ZGV2LCAiZmFpbGVkIHRvIGNsZWFyIHBhZ2UgIgorCQkJInRhYmxlcyBvbiBHRU0gb2JqZWN0IGNs
b3NlICglbGQpXG4iLCByKTsKIAl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0LCAm
bGlzdCk7CiB9CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
