Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69951BFB82
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 00:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04D26EE21;
	Thu, 26 Sep 2019 22:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43A6EE2D;
 Thu, 26 Sep 2019 22:52:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE359300603C;
 Thu, 26 Sep 2019 22:52:02 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97851600C1;
 Thu, 26 Sep 2019 22:52:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu/dm/mst: Use ->atomic_best_encoder
Date: Thu, 26 Sep 2019 18:51:05 -0400
Message-Id: <20190926225122.31455-4-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-1-lyude@redhat.com>
References: <20190926225122.31455-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 26 Sep 2019 22:52:02 +0000 (UTC)
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIHN1cHBvc2VkIHRvIGJlIGF0b21pYyBhZnRlciBhbGwuIFdlJ2xsIG5lZWQgdGhpcyBp
biBhIG1vbWVudCBmb3IKdGhlIG5leHQgY29tbWl0LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMgICAgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5k
ZXggYTM5OGRkZDFmMzA2Li5kOTExM2NlMGJlMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBA
IC0yNDMsMTcgKzI0MywxNyBAQCBzdGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgc3Ry
dWN0IGRybV9lbmNvZGVyICpkbV9tc3RfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCitzdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICoKK2RtX21zdF9hdG9taWNf
YmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCisJCQkgICBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubmVjdG9yX3N0YXRlKQogewotCXN0cnVjdCBhbWRn
cHVfZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcihjb25uZWN0b3IpOwotCi0JcmV0dXJuICZhbWRncHVfZG1fY29ubmVjdG9yLT5tc3RfZW5j
b2Rlci0+YmFzZTsKKwlyZXR1cm4gJnRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKS0+
bXN0X2VuY29kZXItPmJhc2U7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfZnVuY3MgZG1fZHBfbXN0X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmdl
dF9tb2RlcyA9IGRtX2RwX21zdF9nZXRfbW9kZXMsCiAJLm1vZGVfdmFsaWQgPSBhbWRncHVfZG1f
Y29ubmVjdG9yX21vZGVfdmFsaWQsCi0JLmJlc3RfZW5jb2RlciA9IGRtX21zdF9iZXN0X2VuY29k
ZXIsCisJLmF0b21pY19iZXN0X2VuY29kZXIgPSBkbV9tc3RfYXRvbWljX2Jlc3RfZW5jb2RlciwK
IH07CiAKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
