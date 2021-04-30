Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B7370388
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 00:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2676F5FA;
	Fri, 30 Apr 2021 22:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0871A6F5FA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619822090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pLPFkif6Bc1G5AuiGH/FaebyEZLmCnW8ksg8zeS6jOM=;
 b=Oa7FPiIf7knU5n0YohJOXs9YQgusRa0rTzDQGn5wJwQY497EdyGK2SueLtlELhr0la8vep
 p6WcJOWKwczNm2DNKuK5tDrZmCYH+Ih8fyiTZso0k9EqI3MOddUoq8NiziUQ79cAMARy/h
 hMvg+8Lg/6oUl7ArZLo3MQZ0KGo5nGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Vh_UcPDqPU2gws_TFRposg-1; Fri, 30 Apr 2021 18:34:46 -0400
X-MC-Unique: Vh_UcPDqPU2gws_TFRposg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD7B501F3;
 Fri, 30 Apr 2021 22:34:44 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-36.rdu2.redhat.com
 [10.10.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00F415D755;
 Fri, 30 Apr 2021 22:34:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: Handle zeroed port counts in
 drm_dp_read_downstream_info()
Date: Fri, 30 Apr 2021 18:34:27 -0400
Message-Id: <20210430223428.10514-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgdGhlIERQIHNwZWNpZmljYXRpb24gaXNuJ3QgZW50aXJlbHkgY2xlYXIgb24gaWYgdGhp
cyBzaG91bGQgYmUKYWxsb3dlZCBvciBub3QsIHNvbWUgYnJhbmNoIGRldmljZXMgcmVwb3J0IGhh
dmluZyBkb3duc3RyZWFtIHBvcnRzIHByZXNlbnQKd2hpbGUgYWxzbyByZXBvcnRpbmcgYSBkb3du
c3RyZWFtIHBvcnQgY291bnQgb2YgMC4gU28gdG8gYXZvaWQgYnJlYWtpbmcKdGhvc2UgZGV2aWNl
cywgd2UgbmVlZCB0byBoYW5kbGUgdGhpcyBpbiBkcm1fZHBfcmVhZF9kb3duc3RyZWFtX2luZm8o
KS4KClNvLCB0byBkbyB0aGlzIHdlIGFzc3VtZSB0aGVyZSdzIG5vIGRvd25zdHJlYW0gcG9ydCBp
bmZvIHdoZW4gdGhlCmRvd25zdHJlYW0gcG9ydCBjb3VudCBpcyAwLgoKU2lnbmVkLW9mZi1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KVGVzdGVkLWJ5OiBKw6lyw7RtZSBkZSBCcmV0
YWduZSA8amVyb21lLmRlYnJldGFnbmVAZ21haWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8zNDE2CkZpeGVzOiAzZDM3MjFj
Y2IxOGEgKCJkcm0vaTkxNS9kcDogRXh0cmFjdCBkcm1fZHBfcmVhZF9kb3duc3RyZWFtX2luZm8o
KSIpCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4xMCsKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggY2I1NmQ3NGU5ZDM4Li4yN2M4
YzViZGY3ZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtNjgyLDcgKzY4MiwxNCBAQCBp
bnQgZHJtX2RwX3JlYWRfZG93bnN0cmVhbV9pbmZvKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJ
ICAgICEoZHBjZFtEUF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5UXSAmIERQX0RXTl9TVFJNX1BPUlRf
UFJFU0VOVCkpCiAJCXJldHVybiAwOwogCisJLyogU29tZSBicmFuY2hlcyBhZHZlcnRpc2UgaGF2
aW5nIDAgZG93bnN0cmVhbSBwb3J0cywgZGVzcGl0ZSBhbHNvIGFkdmVydGlzaW5nIHRoZXkgaGF2
ZSBhCisJICogZG93bnN0cmVhbSBwb3J0IHByZXNlbnQuIFRoZSBEUCBzcGVjIGlzbid0IGNsZWFy
IG9uIGlmIHRoaXMgaXMgYWxsb3dlZCBvciBub3QsIGJ1dCBzaW5jZQorCSAqIHNvbWUgYnJhbmNo
ZXMgZG8gaXQgd2UgbmVlZCB0byBoYW5kbGUgaXQgcmVnYXJkbGVzcy4KKwkgKi8KIAlsZW4gPSBk
cm1fZHBfZG93bnN0cmVhbV9wb3J0X2NvdW50KGRwY2QpOworCWlmICghbGVuKQorCQlyZXR1cm4g
MDsKKwogCWlmIChkcGNkW0RQX0RPV05TVFJFQU1QT1JUX1BSRVNFTlRdICYgRFBfREVUQUlMRURf
Q0FQX0lORk9fQVZBSUxBQkxFKQogCQlsZW4gKj0gNDsKIAotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
