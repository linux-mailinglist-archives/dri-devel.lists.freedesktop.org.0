Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B957CD8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E486E5D2;
	Thu, 27 Jun 2019 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47156E580;
 Thu, 27 Jun 2019 02:05:32 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 1A7CE3E898;
 Thu, 27 Jun 2019 02:05:31 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: jcrouse@codeaurora.org,
	robdclark@chromium.org,
	seanpaul@chromium.org
Subject: [PATCH] drm/msm: correct NULL pointer dereference in context_init
Date: Wed, 26 Jun 2019 22:05:15 -0400
Message-Id: <20190627020515.5660-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1561601132;
 bh=9jlj6K/wCzudyHU/TvWT/fg1kMUL3abjYYgFk/BVctU=;
 h=From:To:Cc:Subject:Date:From;
 b=apeq8g6oJvoKBVl5xTxxuA5ZW9+h3DphDig2/d6lpZNPeiSaHjcSWs2i7biL8c9Km
 AXFFAXosWud+H0IilGshKMmDo5ndoB8BuY2xY3JZTHcbRqNjXvkFiwgtT85FyS5GCj
 dR3tLcGOStH6czxxnUfb+3fptT7iYlPdeqq9uyMs=
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@linux.ie, hoegsberg@google.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29ycmVjdCBhdHRlbXB0ZWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGNvbnRleHRfaW5p
dCgpIHdoZW4KcnVubmluZyB3aXRob3V0IGFuIElPTU1VLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+CkZpeGVzOiAyOTViMjJhZTU5NmMgKCJkcm0v
bXNtOiBQYXNzIHRoZSBNTVUgZG9tYWluIGluZGV4IGluIHN0cnVjdCBtc21fZmlsZV9wcml2YXRl
IikKLS0tClRoZSBubyBJT01NVSBjYXNlIHNlZW1zIGxpa2UgZnVuY3Rpb25hbGl0eSB0aGF0IHdl
IG1heSB3YW50IHRvIGtlZXAKYmFzZWQgb24gdGhpcyBjb21tZW50OgpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2EzeHhfZ3B1LmMjTDUyMwpPbmNlIEkgZ2V0IHRoZSBtc204OTc0IGludGVyY29ubmVjdCBkcml2
ZXIgZG9uZSwgSSdtIGdvaW5nIHRvIGxvb2sgaW50bwp3aGF0IG5lZWRzIHRvIGJlIGRvbmUgdG8g
Z2V0IHRoZSBJT01NVSB3b3JraW5nIG9uIHRoZSBOZXh1cyA1LgoKQWx0ZXJuYXRpdmVseSwgZm9y
IGRldmVsb3BtZW50IHB1cnBvc2VzLCBtYXliZSB3ZSBjb3VsZCBoYXZlIGEgTk9PUApJT01NVSBk
cml2ZXIgdGhhdCB3b3VsZCBhbGxvdyB1cyB0byByZW1vdmUgdGhlc2UgTlVMTCBjaGVja3MgdGhh
dCBhcmUKc3ByaW5rbGVkIHRocm91Z2hvdXQgdGhlIGNvZGUuIEkgaGF2ZW4ndCBsb29rZWQgaW50
byB0aGlzIGluIGRldGFpbC4KVGhvdWdodHM/CgogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2Rydi5jCmluZGV4IDQ1MWJkNDUwODc5My4uODMwNDdjYjJjNzM1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuYwpAQCAtNjE5LDcgKzYxOSw3IEBAIHN0YXRpYyBpbnQgY29udGV4dF9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKIAogCW1z
bV9zdWJtaXRxdWV1ZV9pbml0KGRldiwgY3R4KTsKIAotCWN0eC0+YXNwYWNlID0gcHJpdi0+Z3B1
LT5hc3BhY2U7CisJY3R4LT5hc3BhY2UgPSBwcml2LT5ncHUgPyBwcml2LT5ncHUtPmFzcGFjZSA6
IE5VTEw7CiAJZmlsZS0+ZHJpdmVyX3ByaXYgPSBjdHg7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
