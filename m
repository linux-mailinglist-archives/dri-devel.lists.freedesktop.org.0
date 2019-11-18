Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9310F1008B3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE976E5DA;
	Mon, 18 Nov 2019 15:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1346E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:52:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-36RRjbanMkukgOfvnwB_ig-1; Mon, 18 Nov 2019 10:51:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BDBF10753FA;
 Mon, 18 Nov 2019 15:51:58 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9D1600CD;
 Mon, 18 Nov 2019 15:51:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
Date: Mon, 18 Nov 2019 16:51:32 +0100
Message-Id: <20191118155134.30468-11-hdegoede@redhat.com>
In-Reply-To: <20191118155134.30468-1-hdegoede@redhat.com>
References: <20191118155134.30468-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 36RRjbanMkukgOfvnwB_ig-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574092323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IlXp4Nrol9LvfB7Vg+xlJ7mtmQI8wwsyrBeS7uJbubg=;
 b=ctBm4fs2g1C5peY97Jgn81S2r5fgwrsg0lZ5S2UGgo6ELus4vWHcNIRu0hR6JUepxCPGWq
 9ldoIy3k3zY7fW6XM3Pc+1/2H2iKaYaLKpONREU/OPrhT1rnFaOvKNQcmpmO/k3dBkCK3E
 G0q+xTkkA7SXF3j+6coptMoVRp1tsHY=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBvbmx5IHNldHRpbmcgbW9kZS0+c3BlY2lmaWVkIG9uIGZhbHNlIG9uIGFuIGVh
cmx5IGV4aXQgYW5kCmxlYXZpbmcgZS5nLiBtb2RlLT5icHBfc3BlY2lmaWVkIGFuZCBtb2RlLT5y
ZWZyZXNoX3NwZWNpZmllZCBhcyBpcywKbGV0cyBiZSBjb25zaXN0ZW50IGFuZCBqdXN0IHplcm8g
b3V0IHRoZSBlbnRpcmUgcGFzc2VkIGluIHN0cnVjdCBhdAp0aGUgdG9wIG9mIGRybV9tb2RlX3Bh
cnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCkKCkNoYW5nZXMgaW4gdjM6Ci1Ecm9wICJt
b2RlLT5zcGVjaWZpZWQgPSBmYWxzZTsiIGxpbmUgaW5zdGVhZCBvZiB0aGUgInJldHVybiBmYWxz
ZTsiIChvb3BzKQogVGhpcyBjcmFzaGVyIHdhcyByZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDUgKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jCmluZGV4IGJlYjc2NGVmZTZiMy4uMmE0ZWI2MTlkN2FkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
CkBAIC0xNzQ1LDEyICsxNzQ1LDExIEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5l
X2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCiAJY2hhciAqYnBwX2VuZF9w
dHIgPSBOVUxMLCAqcmVmcmVzaF9lbmRfcHRyID0gTlVMTDsKIAlpbnQgaSwgbGVuLCByZXQ7CiAK
KwltZW1zZXQobW9kZSwgMCwgc2l6ZW9mKCptb2RlKSk7CiAJbW9kZS0+cGFuZWxfb3JpZW50YXRp
b24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9VTktOT1dOOwogCi0JaWYgKCFtb2RlX29w
dGlvbikgewotCQltb2RlLT5zcGVjaWZpZWQgPSBmYWxzZTsKKwlpZiAoIW1vZGVfb3B0aW9uKQog
CQlyZXR1cm4gZmFsc2U7Ci0JfQogCiAJbmFtZSA9IG1vZGVfb3B0aW9uOwogCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
